from django.db.models import Q

from rest_framework import permissions, viewsets, mixins

from noccapp.models.cases import Case
from noccapp.serializers import CaseSerializer
from noccapp.permissions import IsCasePatient, IsCaseDoctor, IsCaseSurgeon, IsSurgeon

class CaseViewSet(viewsets.ModelViewSet):
    """
    Case CRUD
    """
    lookup_field = 'id'
    queryset = Case.objects.all()
    serializer_class = CaseSerializer

    def get_permissions(self):
        """
        Patients can view their cases
        Surgeons can create, update and delete cases
        Other Doctors can view their cases
        """
        if self.request.method == 'GET':
            return (permissions.IsAuthenticated(), IsCasePatient(), IsCaseDoctor())

        if self.request.method == 'POST':
            return (permissions.IsAuthenticated(), IsSurgeon())

        #if self.request.method == 'PUT' or self.request.method == 'DELETE' or self.request.method == 'PATCH':
        return (permissions.IsAuthenticated(), IsCaseSurgeon())

    def get_queryset(self):
        """
        This view should return a list of all the cases
        for the currently authenticated user.
        @todo default to patient
        """
        queryset = Case.objects.all()

        role = self.request.query_params.get('role', None)

        if role is None:
            return Case.objects.none()

        # patient
        if role == 'patient':
            queryset = queryset.filter(patient__user=self.request.user)

        # oncologist/radiotherapist
        if role == 'doctor':
            queryset = queryset.filter(Q(oncologist__user=self.request.user) | Q(radiotherapist__user=self.request.user))

        # surgeon
        if role == 'surgeon':
            queryset = queryset.filter(surgeon__user=self.request.user)

        return queryset

    def perform_create(self, serializer):
        instance = serializer.save(surgeon=self.request.user.doctor)

        return super(CaseViewSet, self).perform_create(serializer)
