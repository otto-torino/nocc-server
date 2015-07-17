# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0017_auto_20150612_1049'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='case',
            name='oncologist',
        ),
        migrations.RemoveField(
            model_name='case',
            name='radiotherapist',
        ),
        migrations.RemoveField(
            model_name='case',
            name='surgeon',
        ),
    ]
