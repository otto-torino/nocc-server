# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0020_auto_20150714_1709'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='examinationattachment',
            name='name',
        ),
    ]
