# coding=utf-8
from django.db import models
from django.core.exceptions import ValidationError
from django.conf import settings
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

from rest_framework.authtoken.models import Token

from noccapp.managers.actors import DoctorManager

@receiver(post_save, sender=User)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    """
    Generate a new token when system users are created
    Tokens are used for the server-client authentication
    Client have to provide the right token to obtain authentication
    rights while consuming the API
    """
    if created:
        Token.objects.create(user=instance)

class Hospital(models.Model):
    """
    Hospitals
    """
    name = models.CharField('nome', max_length=255)

    class Meta:
        verbose_name = 'ospedale'
        verbose_name_plural = 'ospedali'
        ordering = ('name',)

    def __unicode__(self):
        return self.name

def set_cv_folder(instance, filename):
    """
    Path to the upload folder for doctors' cv
    """
    return '/'.join([settings.MEDIA_DOCTOR_CV, filename])

def set_photo_folder(instance, filename):
    """
    Path to the upload folder for doctors' photos
    """
    return '/'.join([settings.MEDIA_DOCTOR_PHOTO, filename])

def validate_doctor_user(user):
    """
    Doctors user validation
    Doctors can't be also patients
    """
    if user.patient:
        raise ValidationError('%s is already a patient' % user)

class Doctor(models.Model):
    """
    Doctors
    """
    user = models.OneToOneField(User, verbose_name='utente', related_name='doctor')
    firstname = models.CharField('nome', max_length=128)
    lastname = models.CharField('cognome', max_length=128)
    is_surgeon = models.BooleanField('chirurgo', default=False)
    is_oncologist = models.BooleanField('oncologo', default=False)
    is_radiotherapist = models.BooleanField('radioterapista', default=False)
    cv = models.FileField('cv', upload_to=set_cv_folder, blank=True, null=True)
    photo = models.ImageField('photo', upload_to=set_photo_folder, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    contacts = models.ManyToManyField(Hospital, through='DoctorContact')

    # extended manager
    objects = DoctorManager()

    class Meta:
        verbose_name = 'medico'
        verbose_name_plural = 'medici'
        ordering = ('lastname', 'firstname',)

    def __unicode__(self):
        return '%s %s' % (self.firstname, self.lastname)

class DoctorContact(models.Model):
    """
    Contacts of doctors in hospitals
    """
    NO_AVAILABILITY = 0
    MORNING_AVAILABILITY = 1
    AFTERNOON_AVAILABILITY = 2
    ALLDAY_AVAILABILITY = 3
    AVAILABILITY_CHOICES = (
        (NO_AVAILABILITY, 'nessuna'),
        (MORNING_AVAILABILITY, 'mattino'),
        (AFTERNOON_AVAILABILITY, 'pomeriggio'),
        (ALLDAY_AVAILABILITY, 'mattino e pomeriggio'),
    )
    doctor = models.ForeignKey(Doctor, verbose_name = 'medico')
    hospital = models.ForeignKey(Hospital, verbose_name = 'ospedale')
    description = models.TextField('descrizione', blank=True, null=True)
    phone = models.CharField('telefono', max_length=32)
    email = models.EmailField('email', max_length=64)
    monday = models.IntegerField('disponibilità lunedì', choices=AVAILABILITY_CHOICES, default=NO_AVAILABILITY)
    tuesday = models.IntegerField('disponibilità martedì', choices=AVAILABILITY_CHOICES, default=NO_AVAILABILITY)
    wednesday = models.IntegerField('disponibilità mercoledì', choices=AVAILABILITY_CHOICES, default=NO_AVAILABILITY)
    thursday = models.IntegerField('disponibilità giovedì', choices=AVAILABILITY_CHOICES, default=NO_AVAILABILITY)
    friday = models.IntegerField('disponibilità venerdì', choices=AVAILABILITY_CHOICES, default=NO_AVAILABILITY)
    saturday = models.IntegerField('disponibilità sabato', choices=AVAILABILITY_CHOICES, default=NO_AVAILABILITY)
    sunday = models.IntegerField('disponibilità domenica', choices=AVAILABILITY_CHOICES, default=NO_AVAILABILITY)

    class Meta:
        verbose_name = 'contatto'
        verbose_name_plural = 'contatti'

    def __unicode__(self):
        return 'contatto %s ospedale %s' % (str(self.doctor), str(self.hospital))

class DoctorContactAvailabilityException(models.Model):
    doctor_contact = models.ForeignKey(DoctorContact, verbose_name='contatto')
    date = models.DateField('data', auto_now=False, auto_now_add=False)

    class Meta:
        unique_together = ('doctor_contact', 'date',)
        verbose_name = 'eccezione disponibilità'
        verbose_name_plural = 'eccezioni disponibilità'
        ordering = ('-date', )

    def __unicode__(self):
        return str(self.date)

def validate_patient_user(user):
    """
    Patients user validation
    Patients can't be also doctors
    """
    if user.doctor:
        raise ValidationError('%s is already a doctor' % user)

class Patient(models.Model):
    """
    Patients
    """
    MALE_SEX = 1
    FEMALE_SEX = 2
    SEX_CHOICES = (
        (MALE_SEX, 'm'),
        (FEMALE_SEX, 'f'),
    )

    user = models.OneToOneField(User, verbose_name='utente', related_name='patient')
    firstname = models.CharField('nome', max_length=128)
    lastname = models.CharField('cognome', max_length=128)
    sex = models.IntegerField('sesso', choices = SEX_CHOICES)
    cf = models.CharField('codice fiscale', max_length=16)
    birth_date = models.DateField('data di nascita')
    birth_place = models.CharField('luogo di nascita', max_length=128)
    address = models.CharField('indirizzo', max_length=128, blank=True, null=True)
    city = models.CharField('città', max_length=128, blank=True, null=True)
    phone = models.CharField('telefono', max_length=128, blank=True, null=True)
    email = models.EmailField('email', max_length=128, blank=True, null=True)

    class Meta:
        verbose_name = 'paziente'
        verbose_name_plural = 'pazienti'
        ordering = ('lastname', 'firstname',)

    def __unicode__(self):
        return '%s %s' % (self.firstname, self.lastname)

    def clean(self):
        """
        Check that user is not already a doctor
        """
        if self.user.doctor:
            raise ValidationError('User can\'t be a doctor')
