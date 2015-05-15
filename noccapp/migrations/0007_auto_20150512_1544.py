# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0006_auto_20150512_1527'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctor',
            name='user',
            field=models.OneToOneField(related_name='doctor', verbose_name=b'utente', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='patient',
            name='user',
            field=models.OneToOneField(related_name='patient', verbose_name=b'utente', to=settings.AUTH_USER_MODEL),
        ),
    ]
