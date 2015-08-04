import os

from django.db.models import Q
from django.http import Http404, HttpResponseForbidden
from django.shortcuts import get_object_or_404

from rest_framework import permissions, viewsets, mixins, status
from rest_framework.decorators import detail_route, list_route
from rest_framework.response import Response
from rest_framework.settings import api_settings

from noccapp.models.cases import Case, Examination, ExaminationAttachment, Guideline, TherapeuticProposal, TherapeuticProposalSection
from noccapp.models.cases import Polling, FollowUp
from noccapp.serializers import CaseSerializer, ExaminationSerializer, ExaminationAttachmentSerializer, GuidelineSerializer, TherapeuticProposalSerializer
from noccapp.serializers import TherapeuticProposalSectionSerializer, PollingSerializer, FollowUpSerializer
from noccapp.permissions import IsCaseSurgeon, IsSurgeon, IsCasePatientOrDoctor, IsCaseSurgeonOrOncologistOrRadiotherapist
from noccapp.permissions import IsExaminationSurgeon, IsTherapeuticProposalSurgeon, IsCaseDoctor, IsPollingDoctor, IsFollowUpDoctor

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
        Doctors can view their cases
        Surgeons can create case
        Surgeons can update and delete their own cases
        """
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated()]

        if self.request.method == 'POST':
            return (IsSurgeon(),)

        if self.request.method == 'PATCH':
            return (IsCaseSurgeonOrOncologistOrRadiotherapist(),)

        #if self.request.method == 'PUT' or self.request.method == 'DELETE' or self.request.method == 'PATCH':
        return (permissions.IsAuthenticated(), IsCaseSurgeon(),)

    def get_queryset(self):
        """
        Should return a list of all the cases
        for the currently authenticated user.
        """
        queryset = Case.objects.filter(Q(patient__user=self.request.user) | Q(oncologist_contact__doctor__user=self.request.user) | Q(radiotherapist_contact__doctor__user=self.request.user) | Q(surgeon_contact__doctor__user=self.request.user))

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

    @detail_route(methods=['get'], url_path="get-relapse")
    def get_relapse(self, request, id=None, pk=None):
        """
        Gets the tied relapse
        """
        try:
            relapse = Case.objects.get(relapse__id=id)
            serializer = CaseSerializer(relapse)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Case.DoesNotExist:
            return Response(None, status=status.HTTP_200_OK)

class ExaminationViewSet(viewsets.ModelViewSet):
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

    @detail_route(methods=['delete'], url_path="delete-attachment")
    def delete_attachment(self, request, case_id=None, id=None, pk=None):
        attachment_id = self.request.query_params.get('attachment_id', None)
        attachment = ExaminationAttachment.objects.get(id=attachment_id)
        #filepath = attachment.file.path
        attachment.delete()
        #if os.path.isfile(filepath):
        #    os.remove(filepath)
        return Response(status=status.HTTP_204_NO_CONTENT)

class GuidelineViewSet(viewsets.ModelViewSet):
    """
    Guidelines CRUD
    """
    lookup_field = 'id'
    queryset = Guideline.objects.all()
    serializer_class = GuidelineSerializer

    def get_permissions(self):
        """
        Patients and doctors can view guidelines
        Surgeons can create/update/delete guidelines
        """
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated()]

        return (permissions.IsAuthenticated(), IsSurgeon(),)

class TherapeuticProposalViewset(viewsets.ModelViewSet):
    """
    Therapeutic Proposals CRUD
    """
    lookup_field = 'id'
    queryset = TherapeuticProposal.objects.all()
    serializer_class = TherapeuticProposalSerializer

    def get_permissions(self):
        """
        Patients and doctors can view proposals
        Surgeons can create/update proposals
        """

        if self.request.method == 'GET':
            return [permissions.IsAuthenticated(), IsCasePatientOrDoctor(self.kwargs['case_id'])]

        if self.request.method == 'POST':
            return (permissions.IsAuthenticated(), IsTherapeuticProposalSurgeon(),)

        return (permissions.IsAuthenticated(), IsTherapeuticProposalSurgeon(),)

    def get_queryset(self):
        """
        queryset returns only case's therapeutic proposals
        """
        queryset = TherapeuticProposal.objects.filter(case__id=self.kwargs['case_id'])

        type = self.request.query_params.get('type', None)

        # initial
        if type is not None:
            queryset = queryset.filter(type=type)

        return queryset

    def perform_create(self, serializer):
        """
        Status is waiting by default
        """
        instance = serializer.save(status=TherapeuticProposal.STATUS_WAITING)

        return super(TherapeuticProposalViewset, self).perform_create(serializer)

    @list_route(methods=['get'], url_path="get-initial-accepted")
    def get_initial_accepted(self, request, case_id=None):
        """
        Retrieves the initial accepted therapeutic proposal
        """
        try:
            tp = TherapeuticProposal.objects.get(type=TherapeuticProposal.INITIAL, case__id=case_id, status=TherapeuticProposal.STATUS_ACCEPTED)
            serializer = TherapeuticProposalSerializer(tp)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except TherapeuticProposal.DoesNotExist:
            return Response(None, status=status.HTTP_200_OK)

    @list_route(methods=['get'], url_path="get-revaluation-accepted")
    def get_revaluation_accepted(self, request, case_id=None):
        """
        Retrieves the revaluation accepted therapeutic proposal
        """
        try:
            tp = TherapeuticProposal.objects.get(type=TherapeuticProposal.REVALUATION, case__id=case_id, status=TherapeuticProposal.STATUS_ACCEPTED)
            serializer = TherapeuticProposalSerializer(tp)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except TherapeuticProposal.DoesNotExist:
            return Response(None, status=status.HTTP_200_OK)

    @list_route(methods=['get'], url_path="get-adjuvant-accepted")
    def get_adjuvant_accepted(self, request, case_id=None):
        """
        Retrieves the adjuvant accepted therapeutic proposal
        """
        try:
            tp = TherapeuticProposal.objects.get(type=TherapeuticProposal.ADJUVANT, case__id=case_id, status=TherapeuticProposal.STATUS_ACCEPTED)
            serializer = TherapeuticProposalSerializer(tp)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except TherapeuticProposal.DoesNotExist:
            return Response(None, status=status.HTTP_200_OK)

    @detail_route(methods=['post'], url_path="add-section")
    def add_section(self, request, case_id=None, id=None, pk=None):
        """
        Adds a therapeutic proposal section
        """
        serializer = TherapeuticProposalSectionSerializer(data=request.data)
        if(serializer.is_valid()):
            serializer.save()
            headers = self.get_success_headers(serializer.data)
            tp = TherapeuticProposal.objects.get(id=serializer.data.get('therapeutic_proposal'))
            serializer_tp = TherapeuticProposalSerializer(tp);
            return Response(serializer_tp.data, status=status.HTTP_201_CREATED, headers=headers)
        else:
            return Response(serializer.errors,
                            status=status.HTTP_400_BAD_REQUEST)

    @detail_route(methods=['put'], url_path="update-section")
    def update_section(self, request, case_id=None, id=None, pk=None):
        """
        Adds a therapeutic proposal section
        """
        section_id = self.request.query_params.get('section_id', None)
        section = TherapeuticProposalSection.objects.get(id=section_id)
        serializer = TherapeuticProposalSectionSerializer(section, data=request.data)
        if(serializer.is_valid()):
            serializer.save()
            headers = self.get_success_headers(serializer.data)
            tp = TherapeuticProposal.objects.get(id=serializer.data.get('therapeutic_proposal'))
            serializer_tp = TherapeuticProposalSerializer(tp);
            return Response(serializer_tp.data, status=status.HTTP_200_OK, headers=headers)
        else:
            return Response(serializer.errors,
                            status=status.HTTP_400_BAD_REQUEST)

    @detail_route(methods=['delete'], url_path="delete-section")
    def delete_section(self, request, case_id=None, id=None, pk=None):
        section_id = self.request.query_params.get('section_id', None)
        section = TherapeuticProposalSection.objects.get(id=section_id)
        serializer_tp = TherapeuticProposalSerializer(section.therapeutic_proposal);
        section.delete()
        return Response(serializer_tp.data, status=status.HTTP_200_OK)

class PollingView(mixins.CreateModelMixin,
                  mixins.ListModelMixin,
                  viewsets.GenericViewSet):
    """
    Therapeutic Proposals Polling CRud
    """
    lookup_field = 'id'
    queryset = Polling.objects.all()
    serializer_class = PollingSerializer

    def get_permissions(self):
        """
        Surgeons can view votes
        Doctors can create and view votes
        """
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated(), IsCaseDoctor(self.kwargs['case_id'])]

        return (permissions.IsAuthenticated(), IsPollingDoctor(),)

    def get_queryset(self):
        """
        queryset returns only therapeutic proposal's polling
        """
        queryset = Polling.objects.filter(therapeutic_proposal__id=self.kwargs['tp_id'])

        return queryset

    def perform_create(self, serializer):
        """
        doctor_contact is set automatically
        """
        tp_id = self.request.data.get('therapeutic_proposal')
        tp = TherapeuticProposal.objects.get(id=tp_id)

        if tp.case.oncologist_contact.doctor.user.id == self.request.user.id:
            dc = tp.case.oncologist_contact
        elif tp.case.radiotherapist_contact.doctor.user.id == self.request.user.id:
            dc = tp.case.radiotherapist_contact
        else:
            raise HttpResponseForbidden()

        instance = serializer.save(doctor_contact=dc)

        return super(PollingView, self).perform_create(serializer)

class FollowUpViewSet(viewsets.ModelViewSet):
    """
    Guidelines CRUD
    """
    lookup_field = 'id'
    queryset = FollowUp.objects.all()
    serializer_class = FollowUpSerializer

    def get_permissions(self):
        """
        Patients and doctors can view followup
        Doctors and Surgeons can create/update/delete followup
        """
        if self.request.method == 'GET':
            return [permissions.IsAuthenticated(), IsCasePatientOrDoctor(self.kwargs['case_id'])]

        if self.request.method == 'POST':
            return (permissions.IsAuthenticated(), IsFollowUpDoctor(),)

        return (permissions.IsAuthenticated(), IsFollowUpDoctor(), )

    def get_queryset(self):
        """
        queryset returns only case's follow up
        type filter
        status filter
        """
        queryset = FollowUp.objects.filter(case__id=self.kwargs['case_id'])

        status = self.request.query_params.get('status', None)
        status__not = self.request.query_params.get('status__not', None)
        type = self.request.query_params.get('type', None)

        # type
        if type is not None:
            queryset = queryset.filter(type=type)

        # status
        if status is not None:
            queryset = queryset.filter(status__in=status.split('-'))

        if status__not is not None:
            queryset = queryset.exclude(status__in=status__not.split('-'))

        return queryset

    def perform_create(self, serializer):
        """
        doctor_contact and status are set automatically
        """
        case_id = self.request.data.get('case')
        case = Case.objects.get(id=case_id)

        if case.oncologist_contact.doctor.user.id == self.request.user.id:
            dc = case.oncologist_contact
        elif case.radiotherapist_contact.doctor.user.id == self.request.user.id:
            dc = case.radiotherapist_contact
        elif case.surgeon_contact.doctor.user.id == self.request.user.id:
            dc = case.surgeon_contact
        else:
            return HttpResponseForbidden()

        # surgeon
        if self.request.data['type'] == FollowUp.FINAL:
            instance = serializer.save(doctor_contact=dc, status=FollowUp.ACCEPTED_STATUS)
        else:
            instance = serializer.save(doctor_contact=dc, status=FollowUp.TO_BE_ACCEPTED_STATUS)

        return super(FollowUpViewSet, self).perform_create(serializer)

