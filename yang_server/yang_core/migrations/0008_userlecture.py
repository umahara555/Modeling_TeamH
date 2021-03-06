# Generated by Django 2.1.3 on 2019-02-09 14:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('yang_core', '0007_auto_20190209_1323'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserLecture',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lecture_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='yang_core.Lecture')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='yang_core.User')),
            ],
        ),
    ]
