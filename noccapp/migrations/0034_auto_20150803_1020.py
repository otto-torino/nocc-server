# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('noccapp', '0033_examination_follow_up'),
    ]

    operations = [
        migrations.AlterField(
            model_name='case',
            name='status',
            field=models.IntegerField(verbose_name=b'stato', choices=[(1, b'aperto'), (2, b'dottori associati'), (3, b'proposte terapeutiche'), (4, b'proposte terapeutiche accettate'), (5, b'inizio'), (6, b'completo'), (7, b'rivalutazione'), (8, b'proposte terapeutiche rivalutazione'), (9, b'proposte terapeutiche rivalutazione accettate'), (10, b'inizio rivalutazione'), (11, b'fine rivalutazione'), (12, b'terapia adiuvante'), (13, b'proposte terapeutiche terapia adiuvante'), (14, b'proposte terapeutiche terapia adiuvante accettate'), (15, b'inizio terapia adiuvante'), (16, b'fine terapia adiuvante'), (23, b'fine'), (24, b'FU finale'), (25, b'FU finale, esami'), (26, b'FU finale, accettato'), ((27,), b'fine FU finale'), (28, b'recidiva'), (29, b'chiuso')]),
        ),
        migrations.AlterField(
            model_name='followup',
            name='status',
            field=models.IntegerField(verbose_name=b'stato', choices=[(0, b'in accettazione'), (1, b'accettato'), (2, b'rifiutato'), (3, b'chiuso')]),
        ),
        migrations.AlterField(
            model_name='therapeuticproposal',
            name='type',
            field=models.IntegerField(verbose_name=b'tipologia', choices=[(1, b'iniziale'), (2, b'rivalutazione'), (3, b'terapia adiuvante')]),
        ),
    ]
