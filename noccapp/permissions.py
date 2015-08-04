import os

from django.shortcuts import get_object_or_404
from django.http import Http404

from rest_framework import permissions
from rest_framework.authtoken.models import Token

from noccapp.models.actors import DoctorContact, Doctor
from noccapp.models.cases import Case, Examination, TherapeuticProposal

class MediaPermissions(object):
    """
    Access permission to all private media files
    Token key must be read from request object since this view is not routed by the rest framework
    """
    def has_read_permission(self, request, path):
        try:
            token_key = request.META['HTTP_AUTHORIZATION'].rsplit(' ', 1)[1]
            token = Token.objects.get(key=token_key)
            request.user = token.user
            res_folder = os.path.split(os.path.split(os.path.split(path)[0])[0])[0]
            if(res_folder == 'cases'):
                case_id = os.path.split(os.path.split(os.path.split(path)[0])[0])[1]
                case = Case.objects.get(id=case_id)
                permission = IsCasePatientOrDoctor(case_id)
                return permission.has_permission(request, None)
            elif(res_folder == 'doctors'):
                return request.user.is_authenticated()
            raise Http404('File not found')
        except:
            raise Http404('File not found')

class IsDoctorProfileOwner(permissions.BasePermission):
    """
    Checks if the user is the owner of the profile
    """
    """
    Now replaced with permission.IsAuthenticated()
    def has_permission(self, request, view):
        doctor = get_object_or_404(Doctor, user__username=view.kwargs['user__username'])
        if request.user and doctor.user == request.user:
            return True
        return False
    """

    def has_object_permission(self, request, view, profile):
        if request.user.is_authenticated():
            return profile.user == request.user
        return False

class IsDoctor(permissions.BasePermission):
    """
    Checks if the user is a doctor
    """
    def has_permission(self, request, view):
        try:
            if request.user.is_authenticated() and request.user.doctor:
                return True
            return False
        except:
            return False

class IsContactOwner(permissions.BasePermission):
    def has_object_permission(self, request, view, contact):
        if(request.user.is_authenticated()):
            return request.user == contact.doctor.user
        return False

class IsExceptionContactOwner(permissions.BasePermission):
    """
    Checks if the user is the owner of the profile contact
    The POST doctor_contact __doctor__user object is checked against the authenticated user
    """
    def has_permission(self, request, view):
        """
        Checks that POST 'doctor_contact' belongs to the authenticated user
        in order to prevent users from adding exception to other users contact
        """
        if request.user.is_authenticated():
            contact = DoctorContact.objects.get(id=request.data['doctor_contact'])
            return contact.doctor.user == request.user
        return False

class IsExceptionOwner(permissions.BasePermission):
    """
    Checks if if the user is the owner of the profile contact exception
    """
    def has_object_permission(self, request, view, exception):
        if request.user.is_authenticated():
            return exception.doctor_contact.doctor.user == request.user
        return False

class IsSurgeon(permissions.BasePermission):
    """
    Checks if the user is a surgeon
    """
    def has_permission(self, request, view):
        try:
            if request.user.is_authenticated() and request.user.doctor.is_surgeon:
                return True
            return False
        except:
            return False

    def has_object_permission(self, request, view, case):
        try:
            if request.user.is_authenticated() and request.user.doctor.is_surgeon:
                return True
            return False
        except Doctor.DoesNotExist:
            return False

class IsCaseSurgeon(permissions.BasePermission):
    """
    Checks if if the user is the surgeon for this case
    """
    def has_object_permission(self, request, view, case):
        if request.user.is_authenticated():
            return case.surgeon_contact.doctor.user == request.user
        return False

class IsCaseSurgeonOrOncologistOrRadiotherapist(permissions.BasePermission):
    """
    Checks if if the user is an oncologist or radiotherapist for this case
    Oncologist and Radiotherapist can only path the 'oncologist_status' and 'radiotherapist_status' fields
    """
    def has_object_permission(self, request, view, case):
        if request.user.is_authenticated():
            a = lambda x: x in ("oncologist_status", "radiotherapist_status")
            if bool(filter(a, request.data.keys())):
                return case.surgeon_contact.doctor.user == request.user or case.oncologist_contact.doctor.user == request.user or case.radiotherapist_contact.doctor.user == request.user
            return case.surgeon_contact.doctor.user == request.user
        return False

class IsCasePatientOrDoctor(permissions.BasePermission):
    """
    Checks that the current user is tied somehow to the given case
    tied somehow means: surgeon or oncologist or radiotherapist or observer or patient
    """
    def __init__(self, case_id):
        self.case_id = case_id

    def has_permission(self, request, view):
        case = get_object_or_404(Case, id=self.case_id)

        if request.user.is_authenticated() and ((case.surgeon_contact.doctor.user == request.user or 
                             (case.oncologist_contact and case.oncologist_contact.doctor.user == request.user) or 
                             (case.radiotherapist_contact and case.radiotherapist_contact.doctor.user == request.user) or 
                             request.user in [o.user for o in case.observers.all()]) or 
                             case.patient.user == request.user):
            return True
        return False

class IsCaseDoctor(permissions.BasePermission):
    """
    Checks that the current user is a doctor for the given case
    """
    def __init__(self, case_id):
        self.case_id = case_id

    def has_permission(self, request, view):
        case = get_object_or_404(Case, id=self.case_id)

        if request.user.is_authenticated() and (case.surgeon_contact.doctor.user == request.user or 
                             (case.oncologist_contact and case.oncologist_contact.doctor.user == request.user) or 
                             (case.radiotherapist_contact and case.radiotherapist_contact.doctor.user == request.user)):
            return True
        return False

class IsExaminationSurgeon(permissions.BasePermission):
    """
    Checks if the user is the surgeon for this examination case
    """
    def has_permission(self, request, view):
        if request.method == 'POST' and request.user.is_authenticated():
            try:
                case = get_object_or_404(Case, id=request.data['case'])
                return case.surgeon_contact.doctor.user == request.user
            except:
                pass
            try:
                examination = get_object_or_404(Examination, id=view.kwargs['id'])
                return examination.case.surgeon_contact.doctor.user == request.user
            except:
                pass

            return False
        return True

    def has_object_permission(self, request, view, examination):
        if request.user.is_authenticated():
            case = examination.case
            return case.surgeon_contact.doctor.user == request.user
        return False

class IsTherapeuticProposalSurgeon(permissions.BasePermission):
    """
    Checks if the user is the surgeon for this therapeutic proposal case
    """
    def has_permission(self, request, view):
        if request.method == 'POST' and request.user.is_authenticated():
            try:
                case = get_object_or_404(Case, id=request.data['case'])
                return case.surgeon_contact.doctor.user == request.user
            except:
                pass
            try:
                therapeutic_proposal = get_object_or_404(TherapeuticProposal, id=view.kwargs['id'])
                return therapeutic_proposal.case.surgeon_contact.doctor.user == request.user
            except:
                pass

            return False
        return True

    def has_object_permission(self, request, view, therapeutic_proposal):
        if request.user.is_authenticated():
            case = therapeutic_proposal.case
            return case.surgeon_contact.doctor.user == request.user
        return False

class IsPollingDoctor(permissions.BasePermission):
    """
    Checks if the user is a doctor for this polling
    """
    def has_permission(self, request, view):
        if request.method == 'POST' and request.user.is_authenticated():
            try:
                therapeutic_proposal = get_object_or_404(TherapeuticProposal, id=request.data['therapeutic_proposal'])
                return therapeutic_proposal.case.oncologist_contact.doctor.user == request.user or therapeutic_proposal.case.radiotherapist_contact.doctor.user == request.user
            except:
                pass

            return False
        return True

    def has_object_permission(self, request, view, polling):
        if request.user.is_authenticated():
            case = polling.therapeutic_proposal.case
            return case.oncologist_contact.doctor.user == request.user or case.radiotherapist_contact.doctor.user == request.user
        return False

class IsFollowUpDoctor(permissions.BasePermission):
    """
    Checks if the user is a doctor for this followup
    POST (insert): oncologist or radiotherapist or surgeon
    PUT (edit): oncologist or radiotherapist or surgeon
    """
    def has_permission(self, request, view):
        if request.method == 'POST' and request.user.is_authenticated():
            try:
                case = get_object_or_404(Case, id=request.data['case'])
                return case.oncologist_contact.doctor.user == request.user or case.radiotherapist_contact.doctor.user == request.user or case.surgeon_contact.doctor.user
            except:
                pass

            return False
        return True

    def has_object_permission(self, request, view, followup):
        if request.user.is_authenticated():
            case = followup.case
            return case.oncologist_contact.doctor.user == request.user or case.radiotherapist_contact.doctor.user == request.user or case.surgeon_contact.doctor.user
        return False
