from django.db.models import Q

from rest_framework import permissions, viewsets, mixins, status
from rest_framework.decorators import detail_route, list_route
from rest_framework.response import Response
from rest_framework.settings import api_settings

from noccapp.models.cases import Case, Examination
from noccapp.serializers import CaseSerializer, ExaminationSerializer, ExaminationAttachmentSerializer
from noccapp.permissions import IsCaseSurgeon, IsSurgeon, IsCasePatientOrDoctor
from noccapp.permissions import IsExaminationSurgeon

class CaseViewSet(viewsets.ModelViewSet,
                  mixins.UpdateModelMixin,
                 ):
    """
    Case CRUD
    """
    lookup_field = 'id'
    queryset = Case.objects.all()
    serializer_class = CaseSerializer

    def get_permissions(self):
        """
        Patients can view their cases
        Doctors can view their cases
        Surgeons can create case
        Surgeons can update and delete their own cases
        """
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated()]

        if self.request.method == 'POST':
            return (IsSurgeon(),)

        #if self.request.method == 'PUT' or self.request.method == 'DELETE' or self.request.method == 'PATCH':
        return (permissions.IsAuthenticated(), IsCaseSurgeon(),)

    def get_queryset(self):
        """
        Should return a list of all the cases
        for the currently authenticated user.
        @todo default to patient
        """
        queryset = Case.objects.all()

        role = self.request.query_params.get('role', None)

        # patient
        if role == 'patient':
            queryset = queryset.filter(patient__user=self.request.user)

        # oncologist/radiotherapist
        if role == 'doctor':
            queryset = queryset.filter(Q(oncologist_contact__doctor__user=self.request.user) | Q(radiotherapist_contact__doctor__user=self.request.user))

        # surgeon
        if role == 'surgeon':
            queryset = queryset.filter(surgeon_contact__doctor__user=self.request.user)

        return queryset

class ExaminationViewSet(viewsets.ModelViewSet,
                         mixins.UpdateModelMixin,):
    """
    Examination CRUD
    """
    lookup_field = 'id'
    queryset = Examination.objects.all()
    serializer_class = ExaminationSerializer

    def get_permissions(self):
        """
        Patients can view their examinations
        Surgeons can create, update and delete examinations (of their cases)
        Other Doctors can view examinations (of their cases)
        """
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated(), IsCasePatientOrDoctor(self.kwargs['case_id'])]

        if self.request.method == 'POST':
            return (permissions.IsAuthenticated(), IsExaminationSurgeon(),)

        #if self.request.method == 'PUT' or self.request.method == 'DELETE' or self.request.method == 'PATCH':
        return (permissions.IsAuthenticated(), IsExaminationSurgeon(), )

    def get_queryset(self):
        """
        queryset returns only case's examinations
        """
        queryset = Examination.objects.filter(case__id=self.kwargs['case_id'])

        return queryset

    def get_success_headers(self, data):
        try:
            return {'Location': data[api_settings.URL_FIELD_NAME]}
        except (TypeError, KeyError):
            return {}

    @detail_route(methods=['post'], url_path="add-attachment")
    def add_attachment(self, request, case_id=None, id=None, pk=None):
        examination = self.get_object()
        serializer = ExaminationAttachmentSerializer(data=request.data)
        if(serializer.is_valid()):
            serializer.save()
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
        else:
            return Response(serializer.errors,
                            status=status.HTTP_400_BAD_REQUEST)
