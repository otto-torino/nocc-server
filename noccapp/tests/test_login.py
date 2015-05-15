import json

from django.test import TestCase
from django.contrib.auth.models import User

from rest_framework.test import APIRequestFactory
from rest_framework.test import APIClient

from noccapp.models.actors import Doctor

class LoginTest(TestCase):

    def setUp(self):
        u1 = User.objects.create_user(username='gino', password='pino')
        u2 = User.objects.create_user(username='abidibo', password='abidibo')
        doctor_surgeon = Doctor.objects.create(user=u1, firstname='Gino', lastname='Pino', is_surgeon=True)

    def test_login_view_fails_empty(self):
        """
        Login with empty credentials causes 401
        """
        response = self.client.post('/nocc/api/v1/auth/login/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 401)

    def test_login_not_doctor_nor_patient_fails(self):
        """
        Login of an existing user not associated with doctor nor patient causes 401
        """
        client = APIClient()
        response = client.post('/nocc/api/v1/auth/login/', {'username': 'abidibo', 'password': 'abidibo'}, format='json')
        self.assertEqual(response.status_code, 401)

    def test_login_surgeon_succeeded(self):
        """
        Existing doctor's login causes 200
        """
        client = APIClient()
        response = client.post('/nocc/api/v1/auth/login/', {'username': 'gino', 'password': 'pino'}, format='json')
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.content)
        self.assertEqual(data.get('doctor').get('firstname'), 'Gino')


