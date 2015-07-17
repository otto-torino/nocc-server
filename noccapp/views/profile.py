# coding=utf-8
from django.contrib.auth.models import User

from rest_framework import permissions, viewsets, mixins, status
from rest_framework.response import Response
from rest_framework.authtoken.models import Token

from noccapp.models.actors import Doctor, DoctorContact, DoctorContactAvailabilityException, Hospital, Patient
from noccapp.permissions import IsDoctorProfileOwner, IsDoctor, IsContactOwner, IsExceptionContactOwner, IsExceptionOwner, IsSurgeon
from noccapp.serializers import DoctorSerializer, UserSerializer, DoctorContactSerializer, HospitalSerializer, DoctorContactAvailabilityExceptionSerializer, PatientSerializer

class DoctorcRUdView(mixins.RetrieveModelMixin,
                     mixins.UpdateModelMixin,
                     mixins.ListModelMixin,
                     viewsets.GenericViewSet):
    """
    Doctors' profiles get and update
    Doctors can be retrieved by type (oncologist, radiotherapist, surgeon)
    """
    lookup_field = 'user__username'
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

    def get_permissions(self):
        """
        Authenticated users may read
        Only profile owners may update their profiles
        """
        if self.request.method in permissions.SAFE_METHODS:
            return (permissions.IsAuthenticated(),)
        else:
            return (permissions.IsAuthenticated(), IsDoctorProfileOwner(),)

    def get_queryset(self):
        """
        Looks for type param in order to retrieve only oncologists|radiotherapists|surgeons
        """
        queryset = Doctor.objects.all()
        type = self.request.query_params.get('type', None)

        if type == 'oncologist':
            queryset = queryset.filter(is_oncologist=True)
        elif type == 'radiotherapist':
            queryset = queryset.filter(is_radiotherapist=True)
        elif type == 'surgeon':
            queryset = queryset.filter(is_surgeon=True)

        return queryset

class DoctorContactViewSet(viewsets.ModelViewSet):
    """
    Doctors' Contact CRUD
    The doctor username is provided by url (user__username)
    """
    lookup_field = 'id'
    queryset = DoctorContact.objects.all()
    serializer_class = DoctorContactSerializer

    def get_permissions(self):
        """
        Authenticated users may retrieve contacts
        Only doctors may create and update their own contacts
        """
        if self.request.method in permissions.SAFE_METHODS:
            return (permissions.IsAuthenticated(),)

        if self.request.method == 'POST':
            # doctor can only add his contacts because doctor field is filled automatically, see perform_create
            return (permissions.IsAuthenticated(), IsDoctor(),)

        return (permissions.IsAuthenticated(), IsContactOwner(),)

    def get_queryset(self):
        return DoctorContact.objects.filter(doctor__user__username=self.kwargs['user__username'])

    def perform_create(self, serializer):
        """
        Authenticated doctor is automatically set as the value of the doctor field
        """
        instance = serializer.save(doctor=self.request.user.doctor)

        return super(DoctorContactViewSet, self).perform_create(serializer)

    def delete(self, request, pk, format=None):
        contact = self.get_object(pk)
        contact.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class DoctorContactAvailabilityExceptionCRuDView(mixins.CreateModelMixin,
                                                 mixins.ListModelMixin,
                                                 mixins.DestroyModelMixin,
                                                 viewsets.GenericViewSet):
    """
    Doctors' availability exceptions CRuD
    contact_id parameter is provided through url
    """
    lookup_field = 'id'
    queryset = DoctorContactAvailabilityException.objects.all()
    serializer_class = DoctorContactAvailabilityExceptionSerializer

    def get_permissions(self):
        """
        Only authenticated users may read exceptions
        Only contact owner may create exceptions
        Only exception owner can update / delete exception
        When posting an exception the doctor_contact field must be provided,
        then the IsContactOwner permission checks that such contact belongs to
        the authenticated user
        """
        if self.request.method in permissions.SAFE_METHODS:
            return (permissions.IsAuthenticated(),)

        if self.request.method == 'POST':
            return (permissions.IsAuthenticated(), IsExceptionContactOwner(),)

        return (permissions.IsAuthenticated(), IsExceptionOwner(),)

class HospitalViewSet(viewsets.ModelViewSet):
    """
    Hospital CRUD
    """
    lookup_field = 'id'
    queryset = Hospital.objects.all()
    serializer_class = HospitalSerializer

    def get_permissions(self):
        """
        Only authenticated users may retrieve a list of hospitals
        """
        return (permissions.IsAuthenticated(), )

class PatientViewSet(viewsets.ModelViewSet):
    """
    Patient CRUD
    """
    lookup_field = 'id'
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

    def get_permissions(self):
        """
        Only surgeons can create, update, delete and retrieve a list of patients
        """
        return (permissions.IsAuthenticated(), IsSurgeon())
