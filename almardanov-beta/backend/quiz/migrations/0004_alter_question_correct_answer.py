# Generated by Django 4.1.2 on 2023-03-04 19:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0003_alter_question_correct_answer'),
    ]

    operations = [
        migrations.AlterField(
            model_name='question',
            name='correct_answer',
            field=models.CharField(choices=[('1', 'Answer 1'), ('2', 'Answer 2'), ('3', 'Answer 3'), ('4', 'Answer 4')], default='1', max_length=1, verbose_name='Correct Answer'),
        ),
    ]