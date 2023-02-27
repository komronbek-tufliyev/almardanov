from django.contrib.auth.models import BaseUserManager
from django.utils.translation import gettext_lazy as _

class UserManager(BaseUserManager):
    use_in_migrations = True
    
    def _create_user(self, username:str, password: str=None, **extra_fields):
        """Create and save user with the given email and password
        Args:
            email (str): _description_
            password (str, optional): _description_. Defaults to None.

        Raises:
            ValueError: _description_
        """
        if not username:
            raise ValueError(_('The username must be set'))
        username = self.model.normalize_username(username)
        user = self.model(username=username, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user
    
    def create_user(self, username:str=None, password:str=None, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)

        return self._create_user(username, password, **extra_fields)
    
    def create_superuser(self, username:str=None, password:str=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True'))
        
        return self._create_user(username, password, **extra_fields)

    