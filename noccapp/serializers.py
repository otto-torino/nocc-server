from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.models import User
from rest_framework import serializers

from noccapp.models.actors import Doctor, Patient

class DoctorSerializer(serializers.ModelSerializer):

    class Meta:
        model = Doctor
        fields = ('id', 'firstname', 'lastname', 'created_at', 'updated_at',
                  'is_surgeon', 'is_oncologist', 'is_radiotherapist', 'cv', ) #FIXME contacts
        read_only_fields = ('created_at', 'updated_at',)

class PatientSerializer(serializers.ModelSerializer):

    class Meta:
        model = Doctor

class UserSerializer(serializers.ModelSerializer):
    doctor = DoctorSerializer()
    patient = PatientSerializer()
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'doctor', 'patient', )
