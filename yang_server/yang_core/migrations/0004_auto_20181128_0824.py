# Generated by Django 2.1.3 on 2018-11-28 08:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('yang_core', '0003_homework_lecture'),
    ]

    operations = [
        migrations.CreateModel(
            name='User_Homework',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('state', models.BooleanField()),
            ],
        ),
        migrations.RenameField(
            model_name='homework',
            old_name='lecture',
            new_name='lecture_id',
        ),
        migrations.AddField(
            model_name='user_homework',
            name='homework_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='yang_core.Homework'),
        ),
        migrations.AddField(
            model_name='user_homework',
            name='user_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='yang_core.User'),
        ),
    ]
