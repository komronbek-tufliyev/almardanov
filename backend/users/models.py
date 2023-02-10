from django.db import models
from django.core.validators import EmailValidator
from django.contrib.auth.models import AbstractBaseUser
from django.utils.translation import gettext_lazy as _

from .managers import UserManager

# Create your models here.

class CustomUser(AbstractBaseUser):
    name = models.CharField(max_length=150, null=True, blank=True, verbose_name=_('Full name'), help_text=_('John Doe'))
    email = models.EmailField(unique=True, max_length=250, verbose_name=_('Email'), help_text=_('johndoe@example.com'))
    
    objects = UserManager()

    REQUIRED_FIELDS = []
    USERNAME_FIELD = 'email'

