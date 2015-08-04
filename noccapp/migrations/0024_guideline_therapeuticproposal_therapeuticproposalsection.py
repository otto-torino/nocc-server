# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import noccapp.models.cases


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0023_auto_20150721_1051'),
    ]

    operations = [
        migrations.CreateModel(
            name='Guideline',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=255, verbose_name=b'titolo')),
                ('file', models.FileField(upload_to=noccapp.models.cases.set_guideline_folder, verbose_name=b'file')),
            ],
            options={
                'verbose_name': 'linea guida',
                'verbose_name_plural': 'linee guida',
            },
        ),
        migrations.CreateModel(
            name='TherapeuticProposal',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.IntegerField(verbose_name=b'tipologia', choices=[(1, b'iniziale'), (2, b'terapia adiuvante'), (3, b'rivalutazione')])),
                ('date', models.DateField(auto_now_add=True, verbose_name=b'data')),
                ('title', models.CharField(max_length=255, verbose_name=b'titolo')),
                ('description', models.TextField(null=True, verbose_name=b'descrizione', blank=True)),
                ('priority', models.IntegerField(verbose_name='priorit\xe0')),
                ('need_revaluation', models.BooleanField(default=False, verbose_name=b'richiede rivalutazione')),
                ('status', models.IntegerField(verbose_name=b'status', choices=[(1, b'in attesa di votazione'), (2, b'accettata'), (3, b'rifiutata')])),
                ('case', models.ForeignKey(verbose_name=b'caso clinico', to='noccapp.Case')),
                ('guidelines', models.ManyToManyField(to='noccapp.Guideline', null=True, verbose_name=b'linee guida', blank=True)),
            ],
            options={
                'verbose_name': 'proposta terapeutica',
                'verbose_name_plural': 'proposte terapeutiche',
            },
        ),
        migrations.CreateModel(
            name='TherapeuticProposalSection',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('text', models.TextField(verbose_name=b'testo')),
                ('dispenser', models.ForeignKey(verbose_name=b'dispensatore', to='noccapp.DoctorContact')),
                ('therapeutic_proposal', models.ForeignKey(verbose_name=b'proposta terapeutica', to='noccapp.TherapeuticProposal')),
            ],
            options={
                'verbose_name': 'sezione proposta terapeutica',
                'verbose_name_plural': 'sezioni proposta terapeutica',
            },
        ),
    ]
