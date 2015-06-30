# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import noccapp.models.actors


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0008_auto_20150520_1715'),
    ]

    operations = [
        migrations.AddField(
            model_name='doctor',
            name='photo',
            field=models.ImageField(upload_to=noccapp.models.actors.set_photo_folder, null=True, verbose_name=b'photo', blank=True),
        ),
    ]
