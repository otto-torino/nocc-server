import json
import datetime

from django.test import TestCase
from django.contrib.auth.models import User

from rest_framework.test import APIClient
from rest_framework.authtoken.models import Token

from noccapp.models.actors import Doctor, Hospital, DoctorContact, DoctorContactAvailabilityException

class ProfileTest(TestCase):

    def setUp(self):
        u1 = User.objects.create_user(id=1, username='gino', password='pino', )
        u2 = User.objects.create_user(id=2, username='abidibo', password='abidibo')
        u3 = User.objects.create_user(id=3, username='lino', password='banfi')
        u4 = User.objects.create_user(id=4, username='mimmo', password='pello')

        self.doctor_surgeon = Doctor.objects.create(id=1, user=u1, firstname='Gino', lastname='Pino', is_surgeon=True)
        self.doctor_surgeon_2 = Doctor.objects.create(id=2, user=u3, firstname='Lino', lastname='Banfi', is_surgeon=True)
        self.doctor_not_surgeon = Doctor.objects.create(id=3, user=u4, firstname='Mimmo', lastname='Pello', is_surgeon=False, is_oncologist=True)

        self.hospital = Hospital.objects.create(id=1, name='Molinette')

        self.contact = DoctorContact.objects.create(id=1, doctor=self.doctor_surgeon, hospital=self.hospital, phone='666', email='gino@pino.it')
        self.contact2 = DoctorContact.objects.create(id=2, doctor=self.doctor_surgeon_2, hospital=self.hospital, phone='333', email='gino@pino.it')

        exception = DoctorContactAvailabilityException.objects.create(doctor_contact=self.contact, date=datetime.date.today())
        exception2 = DoctorContactAvailabilityException.objects.create(doctor_contact=self.contact2, date=datetime.date.fromordinal(datetime.date.today().toordinal()-1))

    def test_profile_list_gives_401(self):
        """
        Unauthenticated users can't retrieve doctors profiles
        """
        response = self.client.get('/nocc/api/v1/doctors/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 401)

    def test_profile_detail_from_non_authenticated_gives_401(self):
        """
        Accessing user profile from non authenticated client returns 401
        For security reasons, only the profile owner can read its data
        """
        response = self.client.get('/nocc/api/v1/doctors/gino/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 401)

    def test_profile_detail_from_user_gives_200(self):
        """
        Accessing user profile from authenticated user returns 200
        """
        client = APIClient()
        token = Token.objects.get(user__username='abidibo')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/doctors/gino/', {}, content_type='application/json')
        self.assertEqual(response.status_code, 200)

    def test_profile_cant_be_created(self):
        """
        Creating a new doctor causes 405, method not allowed
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.post('/nocc/api/v1/doctors/gino/', '{"user": 1, "firstname": "Ginetto", "lastname": "Pinetto"}', content_type='application/json')
        self.assertEqual(response.status_code, 405)

    def test_profile_updates_correctly(self):
        """
        Accessing user profile from the owner user succeed
        Every user can access its profile data
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.put('/nocc/api/v1/doctors/gino/', '{"firstname": "Ginetto", "lastname": "Pinetto"}', content_type='application/json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.get('firstname'), 'Ginetto')

    def test_doctor_contacts_url_param(self):
        """
        Passing the doctor id to the GET API url retrieves only doctor's related contacts
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/doctors/' + str(self.doctor_surgeon.user.username) + '/contacts/', content_type='application/json')
        self.assertEqual(len(response.data), 1)

    def test_doctor_contacts_post_doctor_auto_added(self):
        """
        When creating a contact the doctor filed is filled with the curently logged in user
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.post('/nocc/api/v1/doctors/' + str(self.doctor_surgeon.id) + '/contacts/', '{"doctor": "1000", "hospital": "1", "phone": "222", "email": "dd@dd.it"}', content_type='application/json')
        data = json.loads(response.content)
        self.assertEqual(data.get('doctor').get('user').get('id'), self.doctor_surgeon.id)

    def test_doctor_contacts_exceptions_post_another_contact(self):
        """
        If a user attempts to add a contact to another user receives 403
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.post('/nocc/api/v1/doctors/' + str(self.doctor_surgeon.id) + '/contacts/' + str(self.contact.id) + '/exceptions/', '{"doctor_contact": "2", "date": "2015-07-19"}', content_type='application/json')
        self.assertEqual(response.status_code, 403)

    def test_doctor_contacts_exceptions_post_own_contact(self):
        """
        If a user attempts to add a contact to its user receives 200
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.post('/nocc/api/v1/doctors/' + str(self.doctor_surgeon.id) + '/contacts/' + str(self.contact.id) + '/exceptions/', '{"doctor_contact": "1", "date": "2015-07-19"}', content_type='application/json')
        self.assertEqual(response.status_code, 201)
