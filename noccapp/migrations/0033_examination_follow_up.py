# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0032_remove_examination_follow_up'),
    ]

    operations = [
        migrations.AddField(
            model_name='examination',
            name='follow_up',
            field=models.ForeignKey(blank=True, to='noccapp.FollowUp', null=True),
        ),
    ]
