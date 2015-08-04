# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0026_auto_20150723_1231'),
    ]

    operations = [
        migrations.AddField(
            model_name='polling',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2015, 7, 23, 10, 32, 39, 58611, tzinfo=utc), verbose_name=b'data', auto_now_add=True),
            preserve_default=False,
        ),
    ]
