# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0029_auto_20150724_1516'),
    ]

    operations = [
        migrations.CreateModel(
            name='FollowUp',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('text', models.TextField(verbose_name=b'descrizione')),
                ('date', models.DateTimeField(verbose_name=b'data')),
                ('status', models.IntegerField(verbose_name=b'stato', choices=[(0, b'in accettazione'), (1, b'accettato'), (2, b'rifiutato')])),
                ('case', models.ForeignKey(verbose_name=b'caso clinico', to='noccapp.Case')),
                ('doctor_contact', models.ForeignKey(verbose_name=b'dispensatore', to='noccapp.DoctorContact')),
            ],
            options={
                'verbose_name': 'Follow Up',
                'verbose_name_plural': 'Follow Up',
            },
        ),
        migrations.AlterField(
            model_name='doctorcontactavailabilityexception',
            name='doctor_contact',
            field=models.ForeignKey(related_name='exceptions', verbose_name=b'contatto', to='noccapp.DoctorContact'),
        ),
    ]
