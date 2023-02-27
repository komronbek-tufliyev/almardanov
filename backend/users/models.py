from django.db import models
from django.core.validators import EmailValidator
from django.contrib.auth.models import AbstractBaseUser
from django.utils.translation import gettext_lazy as _

from .managers import UserManager

# Create your models here.

class CustomUser(AbstractBaseUser):
    username = models.CharField(max_length=150, verbose_name=_('Username'), help_text=_('Username'), unique=True)
    name = models.CharField(max_length=150, verbose_name=_('Full name'), help_text=_('John Doe'))
    phone_number = models.CharField(max_length=15, null=True, blank=True, verbose_name=_('Phone number'), help_text=_('Phone number'))
    email = models.CharField(max_length=255, validators=[EmailValidator], verbose_name=_('Email'), help_text=_('Email'), unique=True, null=True, blank=True)
    is_active = models.BooleanField(default=True, verbose_name=_('Active'), help_text=_('Active'))
    is_staff = models.BooleanField(default=False, verbose_name=_('Staff'), help_text=_('Staff'))
    is_superuser = models.BooleanField(default=False, verbose_name=_('Superuser'), help_text=_('Superuser'))

    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)
    
    objects = UserManager()

    REQUIRED_FIELDS = ['name']
    USERNAME_FIELD = 'username'

    def __str__(self):
        return self.name
    
    def get_full_name(self):
        return self.name
    
    def get_short_name(self):
        return self.name
    
    def has_perm(self, perm, obj=None):
        return self.is_superuser
    
    def has_module_perms(self, app_label):
        return True
    
    class Meta:
        verbose_name = _('User')
        verbose_name_plural = _('Users')

        
    


