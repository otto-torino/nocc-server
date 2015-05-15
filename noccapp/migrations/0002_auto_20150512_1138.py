# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='is_oncologist',
            field=models.BooleanField(default=False, verbose_name=b'oncologo'),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='is_radiotherapist',
            field=models.BooleanField(default=False, verbose_name=b'radioterapista'),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='is_surgeon',
            field=models.BooleanField(default=False, verbose_name=b'chirurgo'),
        ),
        migrations.AlterField(
            model_name='patient',
            name='sex',
            field=models.IntegerField(verbose_name=b'sesso', choices=[(1, b'm'), (2, b'f')]),
        ),
    ]
