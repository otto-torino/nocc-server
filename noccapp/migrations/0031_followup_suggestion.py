# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0030_auto_20150729_1439'),
    ]

    operations = [
        migrations.AddField(
            model_name='followup',
            name='suggestion',
            field=models.TextField(null=True, verbose_name=b'suggerimento date', blank=True),
        ),
    ]
