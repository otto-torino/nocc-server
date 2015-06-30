# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0015_case_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='case',
            name='oncologist',
            field=models.ForeignKey(related_name='oncologist_cases', verbose_name=b'oncologo', blank=True, to='noccapp.Doctor', null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='oncologist_status',
            field=models.IntegerField(blank=True, null=True, verbose_name=b'status oncologo', choices=[(0, b'in attesa di accettazione'), (1, b'accettato'), (2, b'rifiutato')]),
        ),
        migrations.AlterField(
            model_name='case',
            name='radiotherapist',
            field=models.ForeignKey(related_name='radiotherapist_cases', verbose_name=b'radioterapista', blank=True, to='noccapp.Doctor', null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='radiotherapist_status',
            field=models.IntegerField(blank=True, null=True, verbose_name=b'status radioterapista', choices=[(0, b'in attesa di accettazione'), (1, b'accettato'), (2, b'rifiutato')]),
        ),
    ]
