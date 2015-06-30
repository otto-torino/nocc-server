# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0011_auto_20150527_1301'),
    ]

    operations = [
        migrations.CreateModel(
            name='DoctorContactAvailabilityException',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateField(verbose_name=b'data')),
                ('doctor_contact', models.ForeignKey(verbose_name=b'contatto', to='noccapp.DoctorContact')),
            ],
            options={
                'ordering': ('-date',),
                'verbose_name': 'eccezione disponibilit\xe0',
                'verbose_name_plural': 'eccezioni disponibilit\xe0',
            },
        ),
    ]
