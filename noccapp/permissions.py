from rest_framework import permissions


class IsProfileOwner(permissions.BasePermission):
    """
    Checks if if the user is the owner of the profile
    """
    def has_object_permission(self, request, view, profile):
        if request.user:
            return profile == request.user
        return False

class IsDoctorProfileOwner(permissions.BasePermission):
    """
    Checks if if the user is the owner of the profile
    """
    def has_object_permission(self, request, view, profile):
        if request.user:
            return profile.user == request.user
        return False

class IsContactOwner(permissions.BasePermission):
    """
    Checks if if the user is the owner of the profile contact
    """
    def has_object_permission(self, request, view, contact):
        if request.user:
            return contact.doctor.user == request.user
        return False

class IsExceptionOwner(permissions.BasePermission):
    """
    Checks if if the user is the owner of the profile contact exception
    """
    def has_object_permission(self, request, view, exception):
        if request.user:
            return exception.doctor_contact.doctor.user == request.user
        return False

class IsCasePatient(permissions.BasePermission):
    """
    Checks if if the user is the patient of the case
    """
    def has_object_permission(self, request, view, case):
        if request.user:
            return case.patient == request.user
        return False

class IsCaseDoctor(permissions.BasePermission):
    """
    Checks if if the user is a doctor for the case
    """
    def has_object_permission(self, request, view, case):
        if request.user and (case.surgeon == request.user or case.oncologist == request.user or case.radiotherapist == request.user or request.user in case.observers):
            return True
        return False

class IsCaseSurgeon(permissions.BasePermission):
    """
    Checks if if the user is the surgeon for this case
    """
    def has_object_permission(self, request, view, case):
        if request.user:
            return case.surgeon == request.user
        return False

class IsSurgeon(permissions.BasePermission):
    """
    Checks if if the user is a surgeon and the case is inserted
    """
    def has_object_permission(self, request, view, case):
        if request.user and request.user.doctor.is_surgeon and not case.id:
            return True
        return False
