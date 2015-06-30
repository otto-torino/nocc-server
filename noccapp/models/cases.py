# coding=utf-8
from django.db import models

from noccapp.models.actors import Patient, Doctor

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
    surgeon = models.ForeignKey(Doctor, verbose_name = 'chirurgo', limit_choices_to={'is_surgeon': True})
    oncologist = models.ForeignKey(Doctor, verbose_name = 'oncologo', limit_choices_to={'is_oncologist': True}, related_name='oncologist_cases', blank=True, null=True)
    oncologist_status = models.IntegerField('status oncologo', choices=ONCOLOGIST_STATUS, blank=True, null=True)
    radiotherapist = models.ForeignKey(Doctor, verbose_name = 'radioterapista', limit_choices_to={'is_radiotherapist': True}, related_name='radiotherapist_cases', blank=True, null=True)
    radiotherapist_status = models.IntegerField('status radioterapista', choices=RADIOTHERAPIST_STATUS, blank=True, null=True)
    observers = models.ManyToManyField(Doctor, verbose_name='osservatori', related_name="observer_cases", blank=True, null=True)
    insertion_date = models.DateTimeField(verbose_name='inserimento', auto_now=False, auto_now_add=True)
    last_edit_date = models.DateTimeField(verbose_name='ultima modifica', auto_now_add=True)
