# Generated by Django 4.1.2 on 2023-03-04 19:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0002_alter_question_correct_answer'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='correct_answer',
            field=models.CharField(choices=[('1', None), ('2', None), ('3', None), ('4', None)], default='1', max_length=1, verbose_name='Correct Answer'),
        ),
    ]
