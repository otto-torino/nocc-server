# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import noccapp.models.cases


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0019_auto_20150709_1222'),
    ]

    operations = [
        migrations.CreateModel(
            name='Examination',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('description', models.CharField(max_length=255, verbose_name=b'descrizione')),
                ('type', models.IntegerField(verbose_name=b'tipologia', choices=[(1, b'endoscopia'), (2, b'TC'), (3, b'PET-TC'), (4, b'esame istologico'), (5, b'comorbilit\xc3\xa0'), (6, b'anamnesi, note')])),
                ('date', models.DateField(verbose_name=b'data')),
                ('text', models.TextField(verbose_name=b'referto')),
                ('follow_up', models.BooleanField(default=False, verbose_name=b'follow up')),
                ('revaluation', models.BooleanField(default=False, verbose_name=b'rivalutazione')),
            ],
            options={
                'verbose_name': 'esame clinico',
                'verbose_name_plural': 'esami clinici',
            },
        ),
        migrations.CreateModel(
            name='ExaminationAttachment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=255, verbose_name=b'descrizione')),
                ('insertion_date', models.DateTimeField(auto_now_add=True, verbose_name=b'inserimento')),
                ('file', models.FileField(upload_to=noccapp.models.cases.set_examination_attachment_folder, verbose_name=b'file')),
                ('examination', models.ForeignKey(to='noccapp.Examination')),
            ],
            options={
                'verbose_name': 'allegato',
                'verbose_name_plural': 'allegati',
            },
        ),
        migrations.AlterModelOptions(
            name='case',
            options={'verbose_name': 'caso clinico', 'verbose_name_plural': 'casi clinici'},
        ),
        migrations.AddField(
            model_name='examination',
            name='case',
            field=models.ForeignKey(verbose_name=b'caso clinico', to='noccapp.Case'),
        ),
    ]
