# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0004_auto_20150512_1242'),
    ]

    operations = [
        migrations.AlterField(
            model_name='patient',
            name='user',
            field=models.ForeignKey(verbose_name=b'utente', to=settings.AUTH_USER_MODEL, unique=True),
        ),
    ]
