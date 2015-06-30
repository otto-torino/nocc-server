import json

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User

from rest_framework import permissions, viewsets, mixins, status, views
from rest_framework.response import Response

from noccapp.models.actors import Doctor, Patient
from noccapp.permissions import IsProfileOwner
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

                login(request, user)

                serialized = UserSerializer(user)

                return Response(serialized.data)
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

        logout(request)
        return Response({
            'status': 'OK',
            'message': 'Logout succedeed.'
        }, status=status.HTTP_200_OK)

class ProfileViewSet(mixins.UpdateModelMixin,
                     mixins.RetrieveModelMixin,
                     viewsets.GenericViewSet):
    """
    Doctors' profiles get and update (cRUd)
    """
    lookup_field = 'username'
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_permissions(self):
        """
        Only authenticated users may access and update their own profiles
        """
        #return (permissions.IsAuthenticated(), IsProfileOwner(),)
        return (permissions.IsAuthenticated(),)

    """
    def create(self, request):
        serializer = self.serializer_class(data=request.data)

        if serializer.is_valid():
            Account.objects.create_user(**serializer.validated_data)

            return Response(serializer.validated_data, status=status.HTTP_201_CREATED)

        return Response({
            'status': 'Bad request',
            'message': 'Account could not be created with received data.'
        }, status=status.HTTP_400_BAD_REQUEST)
    """
