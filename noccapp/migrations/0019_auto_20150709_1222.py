# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0018_auto_20150709_1220'),
    ]

    operations = [
        migrations.AddField(
            model_name='case',
            name='oncologist_contact',
            field=models.ForeignKey(related_name='oncologist_cases', verbose_name=b'oncologo', blank=True, to='noccapp.DoctorContact', null=True),
        ),
        migrations.AddField(
            model_name='case',
            name='radiotherapist_contact',
            field=models.ForeignKey(related_name='radiotherapist_cases', verbose_name=b'radioterapista', blank=True, to='noccapp.DoctorContact', null=True),
        ),
        migrations.AddField(
            model_name='case',
            name='surgeon_contact',
            field=models.ForeignKey(default=1, verbose_name=b'chirurgo', to='noccapp.DoctorContact'),
            preserve_default=False,
        ),
    ]
