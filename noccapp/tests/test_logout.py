import json

from django.test import TestCase
from django.contrib.auth.models import User
from django.contrib.auth import SESSION_KEY

from rest_framework.test import APIClient

from noccapp.models.actors import Doctor

class LogoutTest(TestCase):

    def setUp(self):
        u1 = User.objects.create_user(username='gino', password='pino')
        u2 = User.objects.create_user(username='abidibo', password='abidibo')
        doctor_surgeon = Doctor.objects.create(user=u1, firstname='Gino', lastname='Pino', is_surgeon=True)

    def test_logout_surgeon_succeeded(self):
        """
        Existing doctor's logout causes session deletion
        """
        pass



