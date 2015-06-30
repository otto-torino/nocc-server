import json

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import ensure_csrf_cookie

from rest_framework import status, views
from rest_framework.response import Response
from rest_framework.authtoken.models import Token

from noccapp.models.actors import Doctor, Patient
from noccapp.serializers import DoctorSerializer, UserSerializer

class LoginView(views.APIView):
    """
    Doctors and Patients authentication.
    Checks if the provided credentials correspond to an user associated with a doctor or a patient.
    """

    def post(self, request, format='json'):

        data = request.data

        username = data.get('username', None)
        password = data.get('password', None)

        user = authenticate(username=username, password=password)

        if user is not None:
            has_patient = False
            has_doctor = False
            try:
                has_patient = (user.patient is not None)
            except Patient.DoesNotExist:
                pass

            try:
                has_doctor = (user.doctor is not None)
            except Doctor.DoesNotExist:
                pass

            if user.is_active and (has_patient or has_doctor):

                serialized = UserSerializer(user)
                token, created = Token.objects.get_or_create(user=user)
                return Response({
                    'token': token.key,
                    'user': serialized.data
                })
            else:
                return Response({
                    'status': 'Unauthorized',
                    'message': 'This account has been disabled.'
                }, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({
                'status': 'Unauthorized',
                'message': 'Username/password combination invalid.'
            }, status=status.HTTP_401_UNAUTHORIZED)

class LogoutView(views.APIView):
    """
    Doctors and Patients unauthentication.
    If the requests arrives from an authenticated client performs a logout
    """
    def post(self, request, format='json'):
        return Response({
            'status': 'OK',
            'message': 'Logout succedeed.'
        }, status=status.HTTP_200_OK)
