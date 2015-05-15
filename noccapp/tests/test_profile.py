import json

from django.test import TestCase
from django.contrib.auth.models import User

from rest_framework.test import APIRequestFactory
from rest_framework.test import APIClient

from noccapp.models.actors import Doctor

class ProfileTest(TestCase):

    def setUp(self):
        u1 = User.objects.create_user(username='gino', password='pino', )
        u2 = User.objects.create_user(username='abidibo', password='abidibo')
        doctor_surgeon = Doctor.objects.create(user=u1, firstname='Gino', lastname='Pino', is_surgeon=True)

    def test_profile_list_gives_404(self):
        """
        Accessing the list url API returns 404
        For security reasons, noone can fetch user profiles
        """
        response = self.client.get('/nocc/api/v1/auth/profile/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 404)

    def test_profile_detail_from_non_authenticated_gives_403(self):
        """
        Accessing user profile from non authenticated client returns 403
        For security reasons, only the profile owner can read its data
        """
        response = self.client.get('/nocc/api/v1/auth/profile/gino/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 403)

    def test_profile_detail_from_other_user_gives_403(self):
        """
        Accessing user profile from other authenticated user returns 403
        For security reasons, only the profile owner can read its data
        """
        client = APIClient()
        client.login(username='abidibo', password='abidibo')
        response = self.client.get('/nocc/api/v1/auth/profile/gino/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 403)

    def test_profile_detail_from_owner_gives_200(self):
        """
        Accessing user profile from the owner user succeed
        Every user can access its profile data
        """
        client = APIClient()
        client.login(username='gino', password='pino')
        response = client.get('/nocc/api/v1/auth/profile/gino/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 200)
