# Generated by Django 2.1.3 on 2019-01-17 11:00

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.EmailField(max_length=256)),
                ('name', models.CharField(max_length=256)),
                ('password', models.CharField(max_length=256)),
                ('token', models.CharField(max_length=256)),
            ],
        ),
    ]
