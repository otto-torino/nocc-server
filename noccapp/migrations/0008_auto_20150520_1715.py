# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import noccapp.models.actors


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0007_auto_20150512_1544'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='cv',
            field=models.FileField(upload_to=noccapp.models.actors.set_cv_folder, null=True, verbose_name=b'cv', blank=True),
        ),
    ]
