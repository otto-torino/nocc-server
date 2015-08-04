# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0031_followup_suggestion'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='examination',
            name='follow_up',
        ),
    ]
