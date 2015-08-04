# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0037_followup_type'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='case',
            options={'ordering': ('-last_edit_date',), 'verbose_name': 'caso clinico', 'verbose_name_plural': 'casi clinici'},
        ),
        migrations.AlterField(
            model_name='case',
            name='last_edit_date',
            field=models.DateTimeField(auto_now=True, verbose_name=b'ultima modifica'),
        ),
        migrations.AlterField(
            model_name='case',
            name='status',
            field=models.IntegerField(verbose_name=b'stato', choices=[(1, b'aperto'), (2, b'dottori associati'), (3, b'proposte terapeutiche'), (4, b'proposte terapeutiche accettate'), (5, b'inizio'), (6, b'completo'), (7, b'rivalutazione'), (8, b'proposte terapeutiche rivalutazione'), (9, b'proposte terapeutiche rivalutazione accettate'), (10, b'inizio rivalutazione'), (11, b'fine rivalutazione'), (12, b'terapia adiuvante'), (13, b'proposte terapeutiche terapia adiuvante'), (14, b'proposte terapeutiche terapia adiuvante accettate'), (15, b'inizio terapia adiuvante'), (16, b'fine terapia adiuvante'), (17, b'fine'), (18, b'FU finale completato'), (19, b'recidiva'), (20, b'chiuso')]),
        ),
    ]
