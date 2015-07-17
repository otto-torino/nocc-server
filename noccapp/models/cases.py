# coding=utf-8
import os

from django.db import models
from django.conf import settings

from private_media.storages import PrivateMediaStorage

from noccapp.models.actors import Patient, Doctor, DoctorContact

class Case(models.Model):
    """
    Clinical Case
    """

    # Case status
    OPEN_STATUS = 1
    DR_ASSOC_STATUS = 2
    PROPOSALS_STATUS = 3
    PROPOSALS_ACCEPTED_STATUS = 4
    STARTED_STATUS = 5
    FU_STATUS = 6
    FU_ACCEPTED_STATUS = 7
    FU_ENDED_STATUS = 8
    COMPLETED_STATUS = 9
    REVAL_STATUS = 10
    REVAL_PROPOSALS_STATUS = 11
    REVAL_PROPOSALS_ACCEPTED_STATUS = 12
    REVAL_STARTED_STATUS = 13
    REVAL_ENDED_STATUS = 14
    ADJ_STATUS = 15
    ADJ_PROPOSALS_STATUS = 16
    ADJ_PROPOSALS_ACCEPTED_STATUS = 17
    ADJ_STARTED_STATUS = 18
    ADJ_FU_STATUS = 19
    ADJ_FU_ACCEPTED_STATUS = 20
    ADJ_FU_ENDED_STATUS = 21
    ADJ_ENDED_STATUS = 22
    ENDED_STATUS = 23
    FIN_FU_STATUS = 24
    FIN_FU_EXAMS_STATUS = 25
    FIN_FU_ACCEPTED_STATUS = 26
    FIN_FU_ENDED_STATUS = 27,
    RELAPSE_STATUS = 28
    CLOSED_STATUS = 29

    STATUS_CHOICES = (
        (OPEN_STATUS, 'aperto'),
        (DR_ASSOC_STATUS, 'dottori associati'),
        (PROPOSALS_STATUS, 'proposte terapeutiche'),
        (PROPOSALS_ACCEPTED_STATUS, 'proposte terapeutiche accettate'),
        (STARTED_STATUS, 'inizio'),
        (FU_STATUS, 'richiesto FU'),
        (FU_ACCEPTED_STATUS, 'accettata proposta FU'),
        (FU_ENDED_STATUS, 'fine FU'),
        (COMPLETED_STATUS, 'completo'),
        (REVAL_STATUS, 'rivalutazione'),
        (REVAL_PROPOSALS_STATUS, 'proposte terapeutiche rivalutazione'),
        (REVAL_PROPOSALS_ACCEPTED_STATUS, 'proposte terapeutiche rivalutazione accettate'),
        (REVAL_STARTED_STATUS, 'inizio rivalutazione'),
        (REVAL_ENDED_STATUS, 'fine rivalutazione'),
        (ADJ_STATUS, 'terapia adiuvante'),
        (ADJ_PROPOSALS_STATUS, 'proposte terapeutiche terapia adiuvante'),
        (ADJ_PROPOSALS_ACCEPTED_STATUS, 'proposte terapeutiche terapia adiuvante accettate'),
        (ADJ_STARTED_STATUS, 'inizio terapia adiuvante'),
        (ADJ_FU_STATUS, 'terapia adiuvante richiesto FU'),
        (ADJ_FU_ACCEPTED_STATUS, 'terapia adiuvante accettata proposta FU'),
        (ADJ_FU_ENDED_STATUS, 'terapia adiuvante fine FU'),
        (ADJ_ENDED_STATUS, 'fine terapia adiuvante'),
        (ENDED_STATUS, 'fine'),
        (FIN_FU_STATUS, 'FU finale'),
        (FIN_FU_EXAMS_STATUS, 'FU finale, esami'),
        (FIN_FU_ACCEPTED_STATUS, 'FU finale, accettato'),
        (FIN_FU_ENDED_STATUS, 'fine FU finale'),
        (RELAPSE_STATUS, 'recidiva'),
        (CLOSED_STATUS, 'chiuso'),
    )

    # Oncologist and Radiotherapist status
    TO_BE_ACCEPTED_STATUS = 0
    ACCEPTED_STATUS = 1
    REFUSED_STATUS = 2

    ONCOLOGIST_STATUS = (
        (TO_BE_ACCEPTED_STATUS, 'in attesa di accettazione'),
        (ACCEPTED_STATUS, 'accettato'),
        (REFUSED_STATUS, 'rifiutato'),
    )

    RADIOTHERAPIST_STATUS = (
        (TO_BE_ACCEPTED_STATUS, 'in attesa di accettazione'),
        (ACCEPTED_STATUS, 'accettato'),
        (REFUSED_STATUS, 'rifiutato'),
    )

    description = models.TextField('descrizione')
    relapse = models.ForeignKey('self', verbose_name = 'recidiva', blank=True, null=True)
    status = models.IntegerField('stato', choices=STATUS_CHOICES)
    patient = models.ForeignKey(Patient, verbose_name = 'paziente')
    surgeon_contact = models.ForeignKey(DoctorContact, verbose_name = 'chirurgo', limit_choices_to={'doctor__is_surgeon': True})
    oncologist_contact = models.ForeignKey(DoctorContact, verbose_name = 'oncologo', limit_choices_to={'doctor__is_oncologist': True}, related_name='oncologist_cases', blank=True, null=True)
    oncologist_status = models.IntegerField('status oncologo', choices=ONCOLOGIST_STATUS, blank=True, null=True)
    radiotherapist_contact = models.ForeignKey(DoctorContact, verbose_name = 'radioterapista', limit_choices_to={'doctor__is_radiotherapist': True}, related_name='radiotherapist_cases', blank=True, null=True)
    radiotherapist_status = models.IntegerField('status radioterapista', choices=RADIOTHERAPIST_STATUS, blank=True, null=True)
    observers = models.ManyToManyField(Doctor, verbose_name='osservatori', related_name="observer_cases", blank=True, null=True)
    insertion_date = models.DateTimeField(verbose_name='inserimento', auto_now=False, auto_now_add=True)
    last_edit_date = models.DateTimeField(verbose_name='ultima modifica', auto_now_add=True)

    class Meta:
        verbose_name = 'caso clinico'
        verbose_name_plural = 'casi clinici'

    def __unicode__(self):
        return self.description


class Examination(models.Model):
    """
    Clinical examinations
    """
    ENDOSCOPY = 1
    TC = 2
    PET_TC = 3
    HISTOLOGICAL = 4
    COMORBID = 5
    HISTORY = 6


    TYPE_CHOICES = (
        (ENDOSCOPY, 'endoscopia'),
        (TC, 'TC'),
        (PET_TC, 'PET-TC'),
        (HISTOLOGICAL, 'esame istologico'),
        (COMORBID, 'comorbilità'),
        (HISTORY, 'anamnesi, note'),
    )

    case = models.ForeignKey(Case, verbose_name="caso clinico")
    description = models.CharField('descrizione', max_length=255)
    type = models.IntegerField('tipologia', choices=TYPE_CHOICES)
    date = models.DateField('data')
    text = models.TextField('referto')
    follow_up = models.BooleanField('follow up', default=False)
    revaluation = models.BooleanField('rivalutazione', default=False)

    class Meta:
        verbose_name = 'esame clinico'
        verbose_name_plural = 'esami clinici'

    def __unicode__(self):
        return '%s- %s' % (str(self.date), self.description)

def set_examination_attachment_folder(instance, filename):
    """
    Path to the upload folder for doctors' cv
    """
    #return '/'.join([settings.MEDIA_CASES, str(instance.examination.case.id), 'examinations', filename])
    return '/'.join([settings.PRIVATE_MEDIA_CASES, str(instance.examination.case.id), 'examinations', filename])

class ExaminationAttachment(models.Model):
    """
    Medical examination attachments
    """
    examination = models.ForeignKey(Examination, related_name='attachments')
    insertion_date = models.DateTimeField('inserimento', auto_now_add=True)
    file = models.FileField('file', upload_to=set_examination_attachment_folder, storage=PrivateMediaStorage(), blank=False, null=False)

    class Meta:
        verbose_name = 'allegato'
        verbose_name_plural = 'allegati'

    def __unicode__(self):
        return str(self.file)


