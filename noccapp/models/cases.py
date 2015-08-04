# coding=utf-8
import os

from django.db import models
from django.conf import settings
from django.core.exceptions import ValidationError

from private_media.storages import PrivateMediaStorage

from noccapp.models.actors import Patient, Doctor, DoctorContact

class Case(models.Model):
    """
    Clinical Case
    """

    INITIAL_THERAPEUTIC_PROPOSALS_LIMIT = 2
    REVALUATION_THERAPEUTIC_PROPOSALS_LIMIT = 1
    ADJUVANT_THERAPEUTIC_PROPOSALS_LIMIT = 1

    # Case status
    OPEN_STATUS = 1
    DR_ASSOC_STATUS = 2
    PROPOSALS_STATUS = 3
    PROPOSALS_ACCEPTED_STATUS = 4
    STARTED_STATUS = 5
    COMPLETED_STATUS = 6
    REVAL_STATUS = 7
    REVAL_PROPOSALS_STATUS = 8
    REVAL_PROPOSALS_ACCEPTED_STATUS = 9
    REVAL_STARTED_STATUS = 10
    REVAL_ENDED_STATUS = 11
    ADJ_STATUS = 12
    ADJ_PROPOSALS_STATUS = 13
    ADJ_PROPOSALS_ACCEPTED_STATUS = 14
    ADJ_STARTED_STATUS = 15
    ADJ_ENDED_STATUS = 16
    ENDED_STATUS = 17
    FINAL_FU_ENDED = 18
    RELAPSE_STATUS = 19
    CLOSED_STATUS = 20

    STATUS_CHOICES = (
        (OPEN_STATUS, 'aperto'),
        (DR_ASSOC_STATUS, 'dottori associati'),
        (PROPOSALS_STATUS, 'proposte terapeutiche'),
        (PROPOSALS_ACCEPTED_STATUS, 'proposte terapeutiche accettate'),
        (STARTED_STATUS, 'inizio'),
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
        (ADJ_ENDED_STATUS, 'fine terapia adiuvante'),
        (ENDED_STATUS, 'fine'),
        (FINAL_FU_ENDED, 'FU finale completato'),
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
    last_edit_date = models.DateTimeField(verbose_name='ultima modifica', auto_now=True)

    class Meta:
        verbose_name = 'caso clinico'
        verbose_name_plural = 'casi clinici'
        ordering = ('-last_edit_date',)

    def __unicode__(self):
        return self.description

    def can_change_status(self, status):
        """
        Checks if the status can be changed to the given value
        """

        # stato 2 (radiotherapist and oncologist accepted case)
        if(status > 1):
            if not (self.oncologist_status == Case.ACCEPTED_STATUS and self.radiotherapist_status == Case.ACCEPTED_STATUS):
                return False
        # stato 3 (proposals inserted by surgeon)
        if(status > 2):
            if not bool(TherapeuticProposal.objects.filter(case=self, type=TherapeuticProposal.INITIAL).count() > (Case.INITIAL_THERAPEUTIC_PROPOSALS_LIMIT - 1)):
                return False
        # stato 4 (initial therapeutic proposal accepted)
        if(status > 3):
            if not TherapeuticProposal.objects.filter(case=self, type=TherapeuticProposal.INITIAL, status=TherapeuticProposal.STATUS_ACCEPTED).count() == 1:
                return False

        # stato 5 (as status 4)
        if(status > 4):
            pass

        # stato 6 (end of therapy)
        if(status > 5):
            if FollowUp.objects.filter(case=self, type=FollowUp.INITIAL).exclude(status=FollowUp.FINALIZED_STATUS).count():
                return False
            if status == 6:
                tp = TherapeuticProposal.objects.get(case=self, type=TherapeuticProposal.INITIAL, status=TherapeuticProposal.STATUS_ACCEPTED)
                if tp.need_revaluation:
                    return False

        # stato 7 (revaluation)
        if(status > 6 and status < 12):
            pass

        # stato 8 (revaluation proposal)
        if(status > 7 and status < 12):
            if not bool(TherapeuticProposal.objects.filter(case=self, type=TherapeuticProposal.REVALUATION).count() > (Case.REVALUATION_THERAPEUTIC_PROPOSALS_LIMIT - 1)):
                return False

        # stato 9 (revaluation proposal accepted)
        if(status > 8 and status < 12):
            if not TherapeuticProposal.objects.filter(case=self, type=TherapeuticProposal.REVALUATION, status=TherapeuticProposal.STATUS_ACCEPTED).count() == 1:
                return False

        # stato 10 (revaluation started)
        if(status > 9 and status < 12):
            pass # as status 9

        # stato 11 (revaluation started)
        if(status > 10 and status < 12):
            pass

        # stato 11 (adjuvant)
        if(status > 11 and status < 17):
            pass

        # stato 13 (adjuvant proposal)
        if(status > 12 and status < 17):
            if not bool(TherapeuticProposal.objects.filter(case=self, type=TherapeuticProposal.ADJUVANT).count() > (Case.ADJUVANT_THERAPEUTIC_PROPOSALS_LIMIT - 1)):
                return False

        # stato 14 (adjuvant proposal accepted)
        if(status > 13 and status < 17):
            if not TherapeuticProposal.objects.filter(case=self, type=TherapeuticProposal.ADJUVANT, status=TherapeuticProposal.STATUS_ACCEPTED).count() == 1:
                return False

        # stato 15 (adjuvant started)
        if(status > 14 and status < 17):
            pass # as status 13

        # stato 16 (end of adjuvant)
        if(status > 15 and status < 17):
            if FollowUp.objects.filter(case=self, type=FollowUp.ADJUVANT).exclude(status=FollowUp.FINALIZED_STATUS).count():
                return False

        # stato 17 (ended)
        if(status > 16):
            pass

        # stato 18 (final follow up ended)
        if(status > 17):
            if FollowUp.objects.filter(case=self, type=FollowUp.FINAL).exclude(status=FollowUp.FINALIZED_STATUS).count():
                return False

        return True


    def save(self, *args, **kwargs):
        """
        Check status value before saving, check that conditions for the change are respected
        """
        if not self.can_change_status(self.status):
            raise ValidationError(u'Non esistono i requisiti per modificare lo status')
        else:
            super(Case, self).save(*args, **kwargs)


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
    follow_up = models.ForeignKey('FollowUp', blank=True, null=True)
    revaluation = models.BooleanField('rivalutazione', default=False)

    class Meta:
        verbose_name = 'esame clinico'
        verbose_name_plural = 'esami clinici'

    def __unicode__(self):
        return '%s- %s' % (str(self.date), self.description)

def set_examination_attachment_folder(instance, filename):
    """
    Path to the upload folder for examination's attachments
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

def set_guideline_folder(instance, filename):
    """
    Path to the upload folder for guidelines
    """
    return '/'.join([settings.MEDIA_GUIDELINES, filename])

class Guideline(models.Model):
    title = models.CharField('titolo', max_length=255)
    file = models.FileField('file', upload_to=set_guideline_folder, blank=False, null=False)

    class Meta:
        verbose_name = 'linea guida'
        verbose_name_plural = 'linee guida'

    def __unicode__(self):
        return self.title

class TherapeuticProposal(models.Model):
    """
    Therapeutic Proposal
    """
    INITIAL = 1
    REVALUATION = 2
    ADJUVANT = 3

    TYPE_CHOICES = (
        (INITIAL, 'iniziale'),
        (REVALUATION, 'rivalutazione'),
        (ADJUVANT, 'terapia adiuvante'),
    )

    STATUS_WAITING = 1
    STATUS_ACCEPTED = 2
    STATUS_REFUSED = 3

    STATUS_CHOICES = (
        (STATUS_WAITING, 'in attesa di votazione'),
        (STATUS_ACCEPTED, 'accettata'),
        (STATUS_REFUSED, 'rifiutata'),
    )

    case = models.ForeignKey(Case, verbose_name="caso clinico")
    type = models.IntegerField('tipologia', choices=TYPE_CHOICES)
    date = models.DateField('data', auto_now_add=True)
    title = models.CharField('titolo', max_length=255)
    description = models.TextField('descrizione', blank=True, null=True)
    priority = models.IntegerField(u'priorità')
    need_revaluation = models.BooleanField('richiede rivalutazione', default=False)
    guidelines = models.ManyToManyField(Guideline, verbose_name='linee guida', blank=True)
    status = models.IntegerField('status', choices=STATUS_CHOICES)
    group_discussion = models.BooleanField('discussione di gruppo', default=False)
    # @TODO add revaluation, adjuvant, group discussion not mandatory, default None

    class Meta:
        verbose_name = 'proposta terapeutica'
        verbose_name_plural = 'proposte terapeutiche'
        ordering = ('priority', )

    def __unicode__(self):
        return '%s - %s' % (str(self.case), self.title)

    def save(self, *args, **kwargs):
        """
        Override save method in order to set as refused the status of other tps (same case and type) when status of the one saved is accepted
        """

        if self.id and self.status == TherapeuticProposal.STATUS_ACCEPTED:
            TherapeuticProposal.objects.filter(case=self.case, type=self.type).exclude(id=self.id).update(status=TherapeuticProposal.STATUS_REFUSED)

        return super(TherapeuticProposal, self).save(*args, **kwargs)

class TherapeuticProposalSection(models.Model):
    """
    Therapeutic Proposal Section
    Each Therapeutic Proposal is made of more sections, each one is dispensed from a doctor (doctor contact) in the centre
    tied to the chosen contact
    """
    therapeutic_proposal = models.ForeignKey(TherapeuticProposal, verbose_name='proposta terapeutica', related_name='sections')
    dispenser = models.ForeignKey(DoctorContact, verbose_name='dispensatore')
    text = models.TextField('testo')

    class Meta:
        verbose_name = 'sezione proposta terapeutica'
        verbose_name_plural = 'sezioni proposta terapeutica'

    def __unicode__(self):
        return '%s - %s' % (str(self.therapeutic_proposal), str(self.dispenser.doctor))

class Polling(models.Model):
    """
    Polling
    Doctors have to vote for therapeutic proposals
    """
    therapeutic_proposal = models.ForeignKey(TherapeuticProposal, verbose_name='proposta terapeutica', related_name='votes')
    doctor_contact = models.ForeignKey(DoctorContact, verbose_name='dispensatore')
    date = models.DateTimeField('data', auto_now_add=True)
    vote = models.BooleanField('voto', default=False)

    class Meta:
        verbose_name = 'voto proposta terapeutica'
        verbose_name_plural = 'voti proposte terapeutiche'

    def __unicode__(self):
        return '%s - %s - %s' % (str(self.therapeutic_proposal), str(self.doctor_contact.doctor), 'si' if self.vote else 'no')

    def save(self, *args, **kwargs):
        """
        Override save method in order to implement a unique together condition between therapeutic_proposal and doctor_contact
        I'm not using django Meta unique_together property since will not fit so good with DRF in the sense that DRF will give
        you a mandatory field error if the doctor_contact is not provided even if it is marked as required False. The 
        doctor_contact field is set automatically from the request user
        """
        if not self.id and Polling.objects.filter(therapeutic_proposal=self.therapeutic_proposal, doctor_contact=self.doctor_contact).count():
            raise ValidationError(u'un medico può votare una sola volta una proposta terapeutica')
        else:
            return super(Polling, self).save(*args, **kwargs)

class FollowUp(models.Model):
    """
    Follow Up
    @TODO add final and adjuvant fields
    """

    INITIAL = 1
    ADJUVANT = 2
    FINAL = 3

    TYPE_CHOICES = (
        (INITIAL, 'iniziale'),
        (ADJUVANT, 'terapia adiuvante'),
        (FINAL, 'finale'),
    )

    TO_BE_ACCEPTED_STATUS = 0
    ACCEPTED_STATUS = 1
    REFUSED_STATUS = 2
    FINALIZED_STATUS = 3

    STATUS_CHOICES = (
        (TO_BE_ACCEPTED_STATUS, 'in accettazione'),
        (ACCEPTED_STATUS, 'accettato'),
        (REFUSED_STATUS, 'rifiutato'),
        (FINALIZED_STATUS, 'chiuso'),
    )

    case = models.ForeignKey(Case, verbose_name="caso clinico")
    doctor_contact = models.ForeignKey(DoctorContact, verbose_name='dispensatore')
    type = models.IntegerField('tipologia', choices=TYPE_CHOICES)
    text = models.TextField('descrizione')
    date = models.DateTimeField('data', auto_now=False, auto_now_add=False)
    status = models.IntegerField('stato', choices=STATUS_CHOICES)
    suggestion = models.TextField('suggerimento date', blank=True, null=True)

    class Meta:
        verbose_name = 'Follow Up'
        verbose_name_plural = 'Follow Up'

    def __unicode__(self):
        return 'Follow Up %s richiesto da %s' % (str(self.case), str(self.doctor_contact.doctor))
