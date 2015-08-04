# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0034_auto_20150803_1020'),
    ]

    operations = [
        migrations.AddField(
            model_name='followup',
            name='adjuvant',
            field=models.BooleanField(default=False, verbose_name=b'terapia adiuvante'),
        ),
        migrations.AddField(
            model_name='followup',
            name='final',
            field=models.BooleanField(default=False, verbose_name=b'finale'),
        ),
    ]
