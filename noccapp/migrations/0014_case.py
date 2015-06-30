# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0013_auto_20150527_1455'),
    ]

    operations = [
        migrations.CreateModel(
            name='Case',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('status', models.IntegerField(verbose_name=b'stato', choices=[(1, b'aperto'), (2, b'dottori associati'), (3, b'proposte terapeutiche'), (4, b'proposte terapeutiche accettate'), (5, b'inizio'), (6, b'richiesto FU'), (7, b'accettata proposta FU'), (8, b'fine FU'), (9, b'completo'), (10, b'rivalutazione'), (11, b'proposte terapeutiche rivalutazione'), (12, b'proposte terapeutiche rivalutazione accettate'), (13, b'inizio rivalutazione'), (14, b'fine rivalutazione'), (15, b'terapia adiuvante'), (16, b'proposte terapeutiche terapia adiuvante'), (17, b'proposte terapeutiche terapia adiuvante accettate'), (18, b'inizio terapia adiuvante'), (19, b'terapia adiuvante richiesto FU'), (20, b'terapia adiuvante accettata proposta FU'), (21, b'terapia adiuvante fine FU'), (22, b'fine terapia adiuvante'), (23, b'fine'), (24, b'FU finale'), (25, b'FU finale, esami'), (26, b'FU finale, accettato'), ((27,), b'fine FU finale'), (28, b'recidiva'), (29, b'chiuso')])),
                ('oncologist_status', models.IntegerField(verbose_name=b'status oncologo', choices=[(0, b'in attesa di accettazione'), (1, b'accettato'), (2, b'rifiutato')])),
                ('radiotherapist_status', models.IntegerField(verbose_name=b'status radioterapista', choices=[(0, b'in attesa di accettazione'), (1, b'accettato'), (2, b'rifiutato')])),
                ('insertion_date', models.DateTimeField(auto_now_add=True, verbose_name=b'inserimento')),
                ('last_edit_date', models.DateTimeField(auto_now_add=True, verbose_name=b'ultima modifica')),
                ('observers', models.ManyToManyField(related_name='observer_cases', verbose_name=b'osservatori', to='noccapp.Doctor')),
                ('oncologist', models.ForeignKey(related_name='oncologist_cases', verbose_name=b'oncologo', to='noccapp.Doctor')),
                ('patient', models.ForeignKey(verbose_name=b'paziente', to='noccapp.Patient')),
                ('radiotherapist', models.ForeignKey(related_name='radiotherapist_cases', verbose_name=b'radioterapista', to='noccapp.Doctor')),
                ('relapse', models.ForeignKey(verbose_name=b'recidiva', blank=True, to='noccapp.Case', null=True)),
                ('surgeon', models.ForeignKey(verbose_name=b'chirurgo', to='noccapp.Doctor')),
            ],
        ),
    ]
