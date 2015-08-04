# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0028_therapeuticproposal_group_discussion'),
    ]

    operations = [
        migrations.AlterField(
            model_name='case',
            name='observers',
            field=models.ManyToManyField(related_name='observer_cases', null=True, verbose_name=b'osservatori', to='noccapp.Doctor', blank=True),
        ),
    ]
