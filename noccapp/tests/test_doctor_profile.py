import json
import datetime

from django.test import TestCase
from django.contrib.auth.models import User

from rest_framework.test import APIClient
from rest_framework.authtoken.models import Token

from noccapp.models.actors import Doctor, Hospital, DoctorContact, DoctorContactAvailabilityException

class ProfileTest(TestCase):

    def setUp(self):
        u1 = User.objects.create_user(username='gino', password='pino', )
        u2 = User.objects.create_user(username='abidibo', password='abidibo')
        u3 = User.objects.create_user(username='lino', password='banfi')

        self.doctor_surgeon = Doctor.objects.create(user=u1, firstname='Gino', lastname='Pino', is_surgeon=True)
        doctor_surgeon_2 = Doctor.objects.create(user=u3, firstname='Lino', lastname='Banfi', is_surgeon=True)

        hospital = Hospital.objects.create(name='Molinette')

        self.contact = DoctorContact.objects.create(doctor=self.doctor_surgeon, hospital=hospital, phone='666', email='gino@pino.it')
        contact2 = DoctorContact.objects.create(doctor=doctor_surgeon_2, hospital=hospital, phone='333', email='gino@pino.it')

        exception = DoctorContactAvailabilityException.objects.create(doctor_contact=self.contact, date=datetime.date.today())
        exception2 = DoctorContactAvailabilityException.objects.create(doctor_contact=contact2, date=datetime.date.fromordinal(datetime.date.today().toordinal()-1))

    def test_profile_list_gives_404(self):
        """
        Accessing the list url API returns 404
        For security reasons, noone can fetch user profiles
        """
        response = self.client.get('/nocc/api/v1/doctor/profile/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 404)

    def test_profile_detail_from_non_authenticated_gives_401(self):
        """
        Accessing user profile from non authenticated client returns 401
        For security reasons, only the profile owner can read its data
        """
        response = self.client.get('/nocc/api/v1/doctor/profile/gino/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 401)

    def test_profile_detail_from_other_user_gives_403(self):
        """
        Accessing user profile from other authenticated user returns 403
        For security reasons, only the profile owner can read its data
        """
        client = APIClient()
        token = Token.objects.get(user__username='abidibo')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/doctor/profile/gino/', {}, content_type='application/json')
        self.assertEqual(response.status_code, 403)

    def test_profile_detail_from_owner_gives_200(self):
        """
        Accessing user profile from the owner user succeed
        Every user can access its profile data
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/doctor/profile/gino/', {}, content_type='application/json')
        self.assertEqual(response.status_code, 200)

    def test_profile_updates_correctly(self):
        """
        Accessing user profile from the owner user succeed
        Every user can access its profile data
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.put('/nocc/api/v1/doctor/profile/gino/', '{"firstname": "Ginetto", "lastname": "Pinetto"}', content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.get('firstname'), 'Ginetto')

    def test_doctor_contacts_url_param(self):
        """
        Passing the doctor id to the GET API url retrieves only doctor's related contacts
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/doctor/profile/contacts/', content_type='application/json')
        self.assertEqual(len(response.data), 2)
        response = client.get('/nocc/api/v1/doctor/profile/contacts/?doctor=' + str(self.doctor_surgeon.id), content_type='application/json')
        self.assertEqual(len(response.data), 1)

    def test_doctor_contacts_exceptions_url_param(self):
        """
        Passing the contact id to the GET API url retrieves only doctor's contact's related exceptions
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/doctor/profile/contacts/exceptions/', content_type='application/json')
        self.assertEqual(len(response.data), 2)
        response = client.get('/nocc/api/v1/doctor/profile/contacts/exceptions/?contact=' + str(self.contact.id), content_type='application/json')
        self.assertEqual(len(response.data), 1)
