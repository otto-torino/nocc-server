# coding=utf-8
from django.test import TestCase
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

from rest_framework.test import APIClient
from rest_framework.authtoken.models import Token

from noccapp.managers import DoctorManager
from noccapp.models.actors import Doctor, Patient

import datetime

class DoctorManagerTest(TestCase):
    """
    Test the Doctor Manager class
    """
    def setUp(self):
        self.u1 = User.objects.create(username='gino')
        self.u2 = User.objects.create(username='pino')
        self.u3 = User.objects.create(username='rino')
        doctor_surgeon = Doctor.objects.create(user=self.u1, firstname='Gino', lastname='Pino', is_surgeon=True)
        doctor_oncologist = Doctor.objects.create(user=self.u2, firstname='Cippo', lastname='Lippo', is_surgeon=True, is_oncologist=True)
        doctor_radiotherapist = Doctor.objects.create(user=self.u3, firstname='Gianni', lastname='Pinotto', is_radiotherapist=True)

    def test_surgeons_count_works(self):
        """check surgeons num"""
        self.assertEqual(Doctor.objects.surgeons().count(), 2)

    def test_oncologist_count_works(self):
        """check surgeons num"""
        self.assertEqual(Doctor.objects.oncologists().count(), 1)

    def test_radiotherapist_count_works(self):
        """check radiotherapists num"""
        self.assertEqual(Doctor.objects.radiotherapists().count(), 1)

class PatientModelTest(TestCase):
    """
    Test the Patient Model Class
    """
    def setUp(self):
        self.u1 = User.objects.create(username='gino')
        doctor_surgeon = Doctor.objects.create(user=self.u1, firstname='Gino', lastname='Pino', is_surgeon=True)

    def test_patient_cant_be_a_doctor(self):
        """check that a created patient can't be associated to an user which is already a doctor"""
        patient = Patient.objects.create(user=self.u1, sex=Patient.MALE_SEX, birth_date=datetime.date(2000, 01, 01), birth_place='Capri', firstname='Lino', lastname='Banfi')
        with self.assertRaises(ValidationError):
            patient.clean()

class PatientViewsetTest(TestCase):

    def setUp(self):
        self.u1 = User.objects.create(username='surgeon')
        self.u2 = User.objects.create(username='oncologist')
        doctor_surgeon = Doctor.objects.create(user=self.u1, firstname='Gino', lastname='Pino', is_surgeon=True)
        doctor_oncologist = Doctor.objects.create(user=self.u2, firstname='Cippo', lastname='Lippo', is_surgeon=False, is_oncologist=True)

    def test_patient_create(self):
        """
        """
        client = APIClient()
        token = Token.objects.get(user__username='surgeon')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        new_patient = {
            'firstname': 'Luca',
            'lastname': 'Ginelli',
            'sex': 1,
            'cf': 'BGGSGT88G23G674G',
            'birth_date': '1988-05-12',
            'birth_place': 'Milano',
            'address': 'Via Roma 43',
            'city': 'Torino',
            'phone': '8988',
            'email': 'luca@yahoo.com'
        }
        response = client.post('/nocc/api/v1/patients/', new_patient, format='json')
        self.assertEqual(response.status_code, 201)

    def test_patients_viewset_denied_to_non_surgeon(self):
        """
        If a user attempts to add a contact to its user receives 200
        """
        client = APIClient()
        token = Token.objects.get(user__username='oncologist')
        client.credentials(HTTP_AUTHORIZATION='Token ' + token.key)
        response = client.post('/nocc/api/v1/patients/', content_type='application/json')
        self.assertEqual(response.status_code, 403)
