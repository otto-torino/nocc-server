import datetime

from django.test import TestCase
from django.contrib.auth.models import User

from rest_framework.test import APIClient
from rest_framework.authtoken.models import Token

from noccapp.models.actors import Doctor, DoctorContact, Patient, Hospital
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
        self.u8 = User.objects.create(username='patient2')

        molinette = Hospital.objects.create(name='Molinette')

        doctor_surgeon = Doctor.objects.create(user=self.u1, firstname='Gino', lastname='Pino', is_surgeon=True)
        doctor_surgeon_contact = DoctorContact.objects.create(doctor=doctor_surgeon, hospital=molinette, phone='65544', email='gino@pino.it')
        doctor_oncologist = Doctor.objects.create(user=self.u2, firstname='Cippo', lastname='Lippo', is_surgeon=True, is_oncologist=True)
        doctor_oncologist_contact = DoctorContact.objects.create(doctor=doctor_oncologist, hospital=molinette, phone='22544', email='cippo@lippo.it')
        doctor_radiotherapist = Doctor.objects.create(user=self.u3, firstname='Gianni', lastname='Pinotto', is_radiotherapist=True)
        doctor_radiotherapist_contact = DoctorContact.objects.create(doctor=doctor_radiotherapist, hospital=molinette, phone='211543', email='gianni@pinotto.it')

        doctor_surgeon2 = Doctor.objects.create(user=self.u5, firstname='Gino2', lastname='Pino', is_surgeon=True)
        doctor_surgeon2_contact = DoctorContact.objects.create(doctor=doctor_surgeon2, hospital=molinette, phone='6599544', email='gino2@pino.it')
        doctor_oncologist2 = Doctor.objects.create(user=self.u6, firstname='Cippo2', lastname='Lippo', is_surgeon=True, is_oncologist=True)
        doctor_oncologist2_contact = DoctorContact.objects.create(doctor=doctor_oncologist2, hospital=molinette, phone='2257744', email='cippo2@lippo.it')
        doctor_radiotherapist2 = Doctor.objects.create(user=self.u7, firstname='Gianni2', lastname='Pinotto', is_radiotherapist=True)
        doctor_radiotherapist2_contact = DoctorContact.objects.create(doctor=doctor_radiotherapist2, hospital=molinette, phone='2119963', email='gianni2@pinotto.it')

        patient = Patient.objects.create(user=self.u4, firstname='Lucio', lastname='Dalla', sex=Patient.MALE_SEX, birth_date=datetime.datetime.now())
        patient2 = Patient.objects.create(user=self.u8, firstname='Mimmo', lastname='Pello', sex=Patient.MALE_SEX, birth_date=datetime.datetime.now())

        case1 = Case.objects.create(id=1, status=Case.OPEN_STATUS, patient=patient, surgeon_contact=doctor_surgeon_contact, oncologist_contact=doctor_oncologist_contact, oncologist_status=Case.ACCEPTED_STATUS, radiotherapist_contact=doctor_radiotherapist_contact, radiotherapist_status=Case.ACCEPTED_STATUS)
        case2 = Case.objects.create(id=2, status=Case.OPEN_STATUS, patient=patient, surgeon_contact=doctor_surgeon2_contact, oncologist_contact=doctor_oncologist2_contact, oncologist_status=Case.ACCEPTED_STATUS, radiotherapist_contact=doctor_radiotherapist_contact, radiotherapist_status=Case.ACCEPTED_STATUS)
        case3 = Case.objects.create(id=3, status=Case.OPEN_STATUS, patient=patient2, surgeon_contact=doctor_surgeon2_contact, oncologist_contact=doctor_oncologist2_contact, oncologist_status=Case.ACCEPTED_STATUS, radiotherapist_contact=doctor_radiotherapist_contact, radiotherapist_status=Case.ACCEPTED_STATUS)

    def test_case_list_from_non_authenticated_gives_401(self):
        """
        Accessing cases list from non authenticated client returns 403
        """
        response = self.client.get('/nocc/api/v1/cases/', {}, content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 401)

    def test_case_list_from_patient(self):
        """
        Accessing cases list returns only authenticated patient's cases
        """
        client = APIClient()
        token = Token.objects.get(user__username='patient')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        # patient param
        response = client.get('/nocc/api/v1/cases/', content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 2)

    def test_patient_cant_read_others_cases(self):
        """
        If a patient user attempts to see someone else cases receives 404
        """
        client = APIClient()
        token = Token.objects.get(user__username='patient')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        # patient param
        response = client.get('/nocc/api/v1/cases/3/', content_type='application/json') # blank data dictionary
        self.assertEqual(response.status_code, 404)

    def test_case_list_from_oncologist(self):
        """
        Accessing cases list from oncologist returns only doctor's cases
        """
        client = APIClient()
        token = Token.objects.get(user__username='pino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/cases/', {'role': 'doctor'}, content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 1)

    def test_case_list_from_radiotherapist(self):
        """
        Accessing cases list from radiotherapist returns only doctor's cases
        """
        client = APIClient()
        token = Token.objects.get(user__username='rino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/cases/', {'role': 'doctor'}, content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 3)

    def test_case_list_from_surgeon(self):
        """
        Accessing cases list from surgeon returns only doctor's cases
        """
        client = APIClient()
        token = Token.objects.get(user__username='gino')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.get('/nocc/api/v1/cases/', {'role': 'surgeon'}, content_type='application/json') # blank data dictionary
        self.assertEqual(len(response.data), 1)


