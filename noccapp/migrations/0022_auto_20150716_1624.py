# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0021_remove_examinationattachment_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='examinationattachment',
            name='examination',
            field=models.ForeignKey(related_name='attachments', to='noccapp.Examination'),
        ),
    ]
