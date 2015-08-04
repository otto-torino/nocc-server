# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0025_auto_20150723_1146'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='polling',
            name='date',
        ),
        migrations.AlterField(
            model_name='case',
            name='observers',
            field=models.ManyToManyField(related_name='observer_cases', verbose_name=b'osservatori', to='noccapp.Doctor', blank=True),
        ),
        migrations.AlterField(
            model_name='therapeuticproposal',
            name='guidelines',
            field=models.ManyToManyField(to='noccapp.Guideline', verbose_name=b'linee guida', blank=True),
        ),
    ]
