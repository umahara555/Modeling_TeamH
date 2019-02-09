# Generated by Django 2.1.3 on 2019-02-09 14:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('yang_core', '0008_userlecture'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserHomework',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('state', models.CharField(choices=[('未着手', '未着手'), ('処理中', '処理中'), ('完了', '完了')], default='未着手', max_length=3)),
                ('homework_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='yang_core.Homework')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='yang_core.User')),
            ],
        ),
    ]
