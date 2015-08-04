# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import noccapp.models.actors
import private_media.storages
import noccapp.models.cases


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0022_auto_20150716_1624'),
    ]

    operations = [
        migrations.AddField(
            model_name='doctor',
            name='email',
            field=models.EmailField(default='', max_length=255, verbose_name=b'email'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='doctor',
            name='cv',
            field=models.FileField(storage=private_media.storages.PrivateMediaStorage(), upload_to=noccapp.models.actors.set_cv_folder, null=True, verbose_name=b'cv', blank=True),
        ),
        migrations.AlterField(
            model_name='doctor',
            name='photo',
            field=models.ImageField(storage=private_media.storages.PrivateMediaStorage(), upload_to=noccapp.models.actors.set_photo_folder, null=True, verbose_name=b'photo', blank=True),
        ),
        migrations.AlterField(
            model_name='examinationattachment',
            name='file',
            field=models.FileField(upload_to=noccapp.models.cases.set_examination_attachment_folder, storage=private_media.storages.PrivateMediaStorage(), verbose_name=b'file'),
        ),
    ]
