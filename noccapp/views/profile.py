# coding=utf-8
from django.contrib.auth.models import User

from rest_framework import permissions, viewsets, mixins, status
from rest_framework.response import Response
from rest_framework.authtoken.models import Token

from noccapp.models.actors import Doctor, DoctorContact, DoctorContactAvailabilityException, Hospital, Patient
from noccapp.permissions import IsDoctorProfileOwner, IsContactOwner, IsExceptionOwner, IsSurgeon
from noccapp.serializers import DoctorSerializer, UserSerializer, DoctorContactSerializer, HospitalSerializer, DoctorContactAvailabilityExceptionSerializer, PatientSerializer

class DoctorcRUdView(mixins.RetrieveModelMixin,
                     mixins.UpdateModelMixin,
                     viewsets.GenericViewSet):
    """
    Doctors' profiles get and update
    """
    lookup_field = 'user__username'
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

    def get_permissions(self):
        """
        Only authenticated users may access and update their own profiles
        """
        return (permissions.IsAuthenticated(), IsDoctorProfileOwner(),)

class DoctorListView(mixins.ListModelMixin,
                     viewsets.GenericViewSet):
    """
    Doctors' list
    """
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

    def get_permissions(self):
        """
        Only authenticated users may get such list
        """
        return (permissions.IsAuthenticated(), )

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
    Doctors' CRUD
    """
    lookup_field = 'id'
    queryset = DoctorContact.objects.all()
    serializer_class = DoctorContactSerializer

    def get_permissions(self):
        """
        Only authenticated users may access and update their own contacts
        """
        if self.request.method in permissions.SAFE_METHODS:
            return (permissions.IsAuthenticated(),)

        if self.request.method == 'POST':
            return (permissions.IsAuthenticated(),)

        return (permissions.IsAuthenticated(), IsContactOwner(),)

    def get_queryset(self):
        """
        Looks for doctor param in order to filter only contacts related to that user
        """
        queryset = DoctorContact.objects.all()
        doctor_id = self.request.query_params.get('doctor', None)
        if doctor_id is not None:
            queryset = queryset.filter(doctor__id=doctor_id)
        return queryset

    def delete(self, request, pk, format=None):
        contact = self.get_object(pk)
        contact.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


    """
    def get_serializer_class(self):

        if self.request.METHOD == 'GET':
            return self.get_serializer_class
        else:
            return super(DoctorContactViewSet, self).get_serializer_class()
    """

class DoctorContactAvailabilityExceptionCRuDView(mixins.CreateModelMixin,
                                                 mixins.ListModelMixin,
                                                 mixins.DestroyModelMixin,
                                                 viewsets.GenericViewSet):
    """
    Doctors' availability exceptions CRuD
    """
    lookup_field = 'id'
    queryset = DoctorContactAvailabilityException.objects.all()
    serializer_class = DoctorContactAvailabilityExceptionSerializer

    def get_permissions(self):
        """
        Only authenticated users may access and update their own profiles
        """
        return (permissions.IsAuthenticated(), IsExceptionOwner(),)

    def get_queryset(self):
        """
        Looks for contact param in order to filter only exception related to such contact
        """
        queryset = DoctorContactAvailabilityException.objects.all()
        contact_id = self.request.query_params.get('contact', None)
        if contact_id is not None:
            queryset = queryset.filter(doctor_contact__id=contact_id)
        return queryset


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
