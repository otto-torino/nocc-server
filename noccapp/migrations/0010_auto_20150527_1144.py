# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0009_doctor_photo'),
    ]

    operations = [
        migrations.AddField(
            model_name='doctorcontact',
            name='friday',
            field=models.IntegerField(default=0, verbose_name=b'disponibilit\xc3\xa0 venerd\xc3\xac', choices=[(0, b'nessuna disponibilit\xc3\xa0'), (1, b'disponibilit\xc3\xa0 al mattino'), (2, b'disponibilit\xc3\xa0 al pomeriggio'), (3, b'disponibilit\xc3\xa0 mattino e pomeriggio')]),
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='monday',
            field=models.IntegerField(default=0, verbose_name=b'disponibilit\xc3\xa0 luned\xc3\xac', choices=[(0, b'nessuna disponibilit\xc3\xa0'), (1, b'disponibilit\xc3\xa0 al mattino'), (2, b'disponibilit\xc3\xa0 al pomeriggio'), (3, b'disponibilit\xc3\xa0 mattino e pomeriggio')]),
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='saturday',
            field=models.IntegerField(default=0, verbose_name=b'disponibilit\xc3\xa0 sabato', choices=[(0, b'nessuna disponibilit\xc3\xa0'), (1, b'disponibilit\xc3\xa0 al mattino'), (2, b'disponibilit\xc3\xa0 al pomeriggio'), (3, b'disponibilit\xc3\xa0 mattino e pomeriggio')]),
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='sunday',
            field=models.IntegerField(default=0, verbose_name=b'disponibilit\xc3\xa0 domenica', choices=[(0, b'nessuna disponibilit\xc3\xa0'), (1, b'disponibilit\xc3\xa0 al mattino'), (2, b'disponibilit\xc3\xa0 al pomeriggio'), (3, b'disponibilit\xc3\xa0 mattino e pomeriggio')]),
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='thursday',
            field=models.IntegerField(default=0, verbose_name=b'disponibilit\xc3\xa0 gioved\xc3\xac', choices=[(0, b'nessuna disponibilit\xc3\xa0'), (1, b'disponibilit\xc3\xa0 al mattino'), (2, b'disponibilit\xc3\xa0 al pomeriggio'), (3, b'disponibilit\xc3\xa0 mattino e pomeriggio')]),
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='tuesday',
            field=models.IntegerField(default=0, verbose_name=b'disponibilit\xc3\xa0 marted\xc3\xac', choices=[(0, b'nessuna disponibilit\xc3\xa0'), (1, b'disponibilit\xc3\xa0 al mattino'), (2, b'disponibilit\xc3\xa0 al pomeriggio'), (3, b'disponibilit\xc3\xa0 mattino e pomeriggio')]),
        ),
        migrations.AddField(
            model_name='doctorcontact',
            name='wednesday',
            field=models.IntegerField(default=0, verbose_name=b'disponibilit\xc3\xa0 mercoled\xc3\xac', choices=[(0, b'nessuna disponibilit\xc3\xa0'), (1, b'disponibilit\xc3\xa0 al mattino'), (2, b'disponibilit\xc3\xa0 al pomeriggio'), (3, b'disponibilit\xc3\xa0 mattino e pomeriggio')]),
        ),
    ]
