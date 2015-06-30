import datetime

from django.test import TestCase
from django.contrib.auth.models import User

from rest_framework.test import APIClient
from rest_framework.authtoken.models import Token

from noccapp.models.actors import Doctor, Patient
from noccapp.models.cases import Case

class CaseViewsetTest(TestCase):

    def setUp(self):
        self.u1 = User.objects.create(username='gino')
        self.u2 = User.objects.create(username='pino')
        self.u3 = User.objects.create(username='rino')
        self.u4 = User.objects.create(username='patient')
        self.u5 = User.objects.create(username='gino2')
        self.u6 = User.objects.create(username='pino2')
        self.u7 = User.objects.create(username='rino2')

        doctor_surgeon = Doctor.objects.create(user=self.u1, firstname='Gino', lastname='Pino', is_surgeon=True)
        doctor_oncologist = Doctor.objects.create(user=self.u2, firstname='Cippo', lastname='Lippo', is_surgeon=True, is_oncologist=True)
        doctor_radiotherapist = Doctor.objects.create(user=self.u3, firstname='Gianni', lastname='Pinotto', is_radiotherapist=True)

        doctor_surgeon2 = Doctor.objects.create(user=self.u5, firstname='Gino2', lastname='Pino', is_surgeon=True)
        doctor_oncologist2 = Doctor.objects.create(user=self.u6, firstname='Cippo2', lastname='Lippo', is_surgeon=True, is_oncologist=True)
        doctor_radiotherapist2 = Doctor.objects.create(user=self.u7, firstname='Gianni2', lastname='Pinotto', is_radiotherapist=True)

        patient = Patient.objects.create(user=self.u4, firstname='Lucio', lastname='Dalla', sex=Patient.MALE_SEX, birth_date=datetime.datetime.now())

        case1 = Case.objects.create(status=Case.OPEN_STATUS, patient=patient, surgeon=doctor_surgeon, oncologist=doctor_oncologist, oncologist_status=Case.ACCEPTED_STATUS, radiotherapist=doctor_radiotherapist, radiotherapist_status=Case.ACCEPTED_STATUS)
        case2 = Case.objects.create(status=Case.OPEN_STATUS, patient=patient, surgeon=doctor_surgeon2, oncologist=doctor_oncologist2, oncologist_status=Case.ACCEPTED_STATUS, radiotherapist=doctor_radiotherapist, radiotherapist_status=Case.ACCEPTED_STATUS)

    def test_case_list_from_non_authenticated_gives_401(self):
        """
        Accessing cases list from non authenticated client returns 403
        """
        response = self.client.get('/nocc/api/v1/case/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 401)

    def test_case_list_from_patient(self):
        """
        Accessing cases list from patient returns only patient cases
        if no role query param is provided, no results are returned
        """
        client = APIClient()
        token = Token.objects.get(user__username='patient')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/case/', {}, content_type='application/json') # blank data dictionary
        # no params in the GET -> no results
        self.assertEqual(len(response.data), 0)
        # patient param
        response = client.get('/nocc/api/v1/case/', {'role': 'patient'}, content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 2)

    def test_case_list_from_oncologist(self):
        """
        Accessing cases list from oncologist returns only doctor's cases
        """
        client = APIClient()
        token = Token.objects.get(user__username='pino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/case/', {'role': 'doctor'}, content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 1)

    def test_case_list_from_radiotherapist(self):
        """
        Accessing cases list from radiotherapist returns only doctor's cases
        """
        client = APIClient()
        token = Token.objects.get(user__username='rino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/case/', {'role': 'doctor'}, content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 2)

    def test_case_list_from_surgeon(self):
        """
        Accessing cases list from surgeon returns only doctor's cases
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/case/', {'role': 'surgeon'}, content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 1)


