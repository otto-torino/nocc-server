# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0012_doctorcontactavailabilityexception'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='doctorcontactavailabilityexception',
            unique_together=set([('doctor_contact', 'date')]),
        ),
    ]
