# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0036_auto_20150803_1147'),
    ]

    operations = [
        migrations.AddField(
            model_name='followup',
            name='type',
            field=models.IntegerField(default=1, verbose_name=b'tipologia', choices=[(1, b'iniziale'), (2, b'terapia adiuvante'), (3, b'finale')]),
            preserve_default=False,
        ),
    ]
