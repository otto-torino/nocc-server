# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import noccapp.models.actors


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Doctor',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('firstname', models.CharField(max_length=128, verbose_name=b'nome')),
                ('lastname', models.CharField(max_length=128, verbose_name=b'cognome')),
                ('is_surgeon', models.BooleanField(verbose_name=b'chirurgo')),
                ('is_oncologist', models.BooleanField(verbose_name=b'oncologo')),
                ('is_radiotherapist', models.BooleanField(verbose_name=b'radioterapista')),
                ('cv', models.FileField(upload_to=noccapp.models.actors.set_cv_folder, verbose_name=b'cv')),
                ('user', models.ForeignKey(verbose_name=b'utente', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ('lastname', 'firstname'),
                'verbose_name': 'dottore',
                'verbose_name_plural': 'dottori',
            },
        ),
        migrations.CreateModel(
            name='Patient',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('firstname', models.CharField(max_length=128, verbose_name=b'nome')),
                ('lastname', models.CharField(max_length=128, verbose_name=b'cognome')),
                ('sex', models.IntegerField(max_length=1, verbose_name=b'sesso', choices=[(1, b'm'), (2, b'f')])),
                ('cf', models.CharField(max_length=16, verbose_name=b'codice fiscale')),
                ('birth_date', models.DateField(verbose_name=b'data di nascita')),
                ('birth_place', models.CharField(max_length=128, verbose_name=b'luogo di nascita')),
                ('address', models.CharField(max_length=128, null=True, verbose_name=b'indirizzo', blank=True)),
                ('city', models.CharField(max_length=128, null=True, verbose_name=b'citt\xc3\xa0', blank=True)),
                ('phone', models.CharField(max_length=128, null=True, verbose_name=b'telefono', blank=True)),
                ('email', models.EmailField(max_length=128, null=True, verbose_name=b'email', blank=True)),
                ('user', models.ForeignKey(verbose_name=b'utente', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ('lastname', 'firstname'),
                'verbose_name': 'paziente',
                'verbose_name_plural': 'pazienti',
            },
        ),
    ]
