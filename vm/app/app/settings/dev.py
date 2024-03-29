# coding: utf-8
from .local import *


DATABASES = {
    'default': {
        'ENGINE': "django.db.backends.postgresql_psycopg2",
        'NAME': "{{ pillar['postgresql_db'] }}",
        'USER': "{{ pillar['postgresql_user'] }}",
        'PASSWORD': "{{ pillar['postgresql_password'] }}",
    }
}

SECRET_KEY = 'some secret key'