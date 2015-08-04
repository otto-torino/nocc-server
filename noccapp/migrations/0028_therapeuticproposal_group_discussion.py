# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0027_polling_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='therapeuticproposal',
            name='group_discussion',
            field=models.BooleanField(default=False, verbose_name=b'discussione di gruppo'),
        ),
    ]
