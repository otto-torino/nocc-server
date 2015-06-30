# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0014_case'),
    ]

    operations = [
        migrations.AddField(
            model_name='case',
            name='description',
            field=models.TextField(default='', verbose_name=b'descrizione'),
            preserve_default=False,
        ),
    ]
