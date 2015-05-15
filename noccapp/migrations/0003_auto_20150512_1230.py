# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0002_auto_20150512_1138'),
    ]

    operations = [
        migrations.CreateModel(
            name='DoctorContact',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('phone', models.CharField(max_length=32, verbose_name=b'telefono')),
                ('email', models.EmailField(max_length=64, verbose_name=b'email')),
            ],
            options={
                'verbose_name': 'contatto',
                'verbose_name_plural': 'contatti',
            },
        ),
        migrations.CreateModel(
            name='Hospital',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=255, verbose_name=b'nome')),
            ],
            options={
                'ordering': ('name',),
                'verbose_name': 'ospedale',
                'verbose_name_plural': 'ospedali',
            },
        ),
        migrations.AlterModelOptions(
            name='doctor',
            options={'ordering': ('lastname', 'firstname'), 'verbose_name': 'medico', 'verbose_name_plural': 'medici'},
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='doctor',
            field=models.ForeignKey(verbose_name=b'medico', to='noccapp.Doctor'),
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='hospital',
            field=models.ForeignKey(verbose_name=b'ospedale', to='noccapp.Hospital'),
        ),
        migrations.AddField(
            model_name='doctor',
            name='contacts',
            field=models.ManyToManyField(to='noccapp.Hospital', through='noccapp.DoctorContact'),
        ),
    ]
