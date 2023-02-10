from django.contrib.auth.models import BaseUserManager
from django.utils.translation import gettext_lazy as _

class UserManager(BaseUserManager):
    use_in_migrations = True
    
    def _create_user(self, email:str, password: str=None, **extra_fields):
        """Create and save user with the given email and password
        Args:
            email (str): _description_
            password (str, optional): _description_. Defaults to None.

        Raises:
            ValueError: _description_
        """
        if not email:
            raise ValueError(_('User must have a valid email'))
        email = self.normalize_email(email=email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user
    
    def create_user(self, email:str=None, password:str=None, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)

        return self._create_user(email, password, **extra_fields)
    
    def create_superuser(self, email:str=None, password:str=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True'))
        
        return self._create_user(email, password, **extra_fields)

    