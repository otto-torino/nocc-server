# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0035_auto_20150803_1146'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='followup',
            name='adjuvant',
        ),
        migrations.RemoveField(
            model_name='followup',
            name='final',
        ),
    ]
