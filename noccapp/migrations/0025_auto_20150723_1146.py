# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0024_guideline_therapeuticproposal_therapeuticproposalsection'),
    ]

    operations = [
        migrations.CreateModel(
            name='Polling',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateField(auto_now_add=True, verbose_name=b'data')),
                ('vote', models.BooleanField(default=False, verbose_name=b'voto')),
                ('doctor_contact', models.ForeignKey(verbose_name=b'dispensatore', to='noccapp.DoctorContact')),
            ],
            options={
                'verbose_name': 'voto proposta terapeutica',
                'verbose_name_plural': 'voti proposte terapeutiche',
            },
        ),
        migrations.AlterModelOptions(
            name='therapeuticproposal',
            options={'ordering': ('priority',), 'verbose_name': 'proposta terapeutica', 'verbose_name_plural': 'proposte terapeutiche'},
        ),
        migrations.AlterField(
            model_name='therapeuticproposalsection',
            name='therapeutic_proposal',
            field=models.ForeignKey(related_name='sections', verbose_name=b'proposta terapeutica', to='noccapp.TherapeuticProposal'),
        ),
        migrations.AddField(
            model_name='polling',
            name='therapeutic_proposal',
            field=models.ForeignKey(related_name='votes', verbose_name=b'proposta terapeutica', to='noccapp.TherapeuticProposal'),
        ),
    ]
