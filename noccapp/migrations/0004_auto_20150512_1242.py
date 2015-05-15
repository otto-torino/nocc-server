# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0003_auto_20150512_1230'),
    ]

    operations = [
        migrations.AddField(
            model_name='doctor',
            name='created_at',
            field=models.DateTimeField(default=datetime.datetime(2015, 5, 12, 10, 42, 9, 245741, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='doctor',
            name='updated_at',
            field=models.DateTimeField(default=datetime.datetime(2015, 5, 12, 10, 42, 16, 13290, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
    ]
