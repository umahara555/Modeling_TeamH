# Generated by Django 2.1.3 on 2019-01-17 12:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('yang_core', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='token',
            field=models.CharField(max_length=32),
        ),
    ]
