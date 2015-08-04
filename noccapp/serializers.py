# coding=utf-8
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.models import User
from django.core.mail import send_mail

from rest_framework import serializers

from noccapp.models.actors import Doctor, Patient, DoctorContact, DoctorContactAvailabilityException, Hospital
from noccapp.models.cases import Case, Examination, ExaminationAttachment, Guideline, TherapeuticProposal, TherapeuticProposalSection
from noccapp.models.cases import Polling, FollowUp

class UserSerializer(serializers.ModelSerializer):
    """
    User serializer
    """
    is_doctor = serializers.SerializerMethodField('is_doctor_fn')
    is_surgeon = serializers.SerializerMethodField('is_surgeon_fn')
    is_patient = serializers.SerializerMethodField('is_patient_fn')

    def is_surgeon_fn(self, user):
        try:
            return user.doctor.is_surgeon
        except Doctor.DoesNotExist:
            return False

    def is_doctor_fn(self, user):
        try:
            return user.doctor is not None
        except Doctor.DoesNotExist:
            return False

    def is_patient_fn(self, user):
        try:
            return user.patient is not None
        except Patient.DoesNotExist:
            return False

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'is_surgeon', 'is_doctor', 'is_patient', )

class HospitalSerializer(serializers.ModelSerializer):
    """
    Hospitals serializer
    """
    class Meta:
        model = Hospital
        fields = ('id', 'name', )

class DoctorSerializer(serializers.ModelSerializer):
    """
    Doctor serializer
    """
    user = UserSerializer(read_only=True)
    class Meta:
        model = Doctor
        fields = ('id', 'user', 'firstname', 'lastname', 'email', 'created_at', 'updated_at',
                  'is_surgeon', 'is_oncologist', 'is_radiotherapist', 'cv', 'photo', )
        read_only_fields = ('created_at', 'updated_at',)

class DoctorContactSerializer(serializers.ModelSerializer):
    """
    Doctors' contacts serializer
    The hospital_obj field is a readonly field which exposes an expanded form of the hospital relation
    """

    doctor = DoctorSerializer(read_only=True, required=False)
    get_monday_display = serializers.SerializerMethodField('get_monday_display_fn')
    get_tuesday_display = serializers.SerializerMethodField('get_tuesday_display_fn')
    get_wednesday_display = serializers.SerializerMethodField('get_wednesday_display_fn')
    get_thursday_display = serializers.SerializerMethodField('get_thursday_display_fn')
    get_friday_display = serializers.SerializerMethodField('get_friday_display_fn')
    get_saturday_display = serializers.SerializerMethodField('get_saturday_display_fn')
    get_sunday_display = serializers.SerializerMethodField('get_sunday_display_fn')
    exceptions = serializers.SerializerMethodField('exceptions_fn')
    hospital_obj = HospitalSerializer(source='hospital', read_only=True, many=False, required=False)

    class Meta:
        model = DoctorContact
        fields = ('id', 'doctor', 'description', 'hospital', 'hospital_obj', 'phone', 'email', 'exceptions', 
                  'monday', 'get_monday_display',
                  'tuesday', 'get_tuesday_display',
                  'wednesday', 'get_wednesday_display',
                  'thursday', 'get_thursday_display',
                  'friday', 'get_friday_display',
                  'saturday', 'get_saturday_display',
                  'sunday', 'get_sunday_display')

    def get_validation_exclusions(self, *args, **kwargs):
        """
        doctor is filled with the authenticated user
        """
        exclusions = super(DoctorContactSerializer, self).get_validation_exclusions()

        return exclusions + ['doctor']

    def get_monday_display_fn(self, instance):
        return instance.get_monday_display()

    def get_tuesday_display_fn(self, instance):
        return instance.get_tuesday_display()

    def get_wednesday_display_fn(self, instance):
        return instance.get_wednesday_display()

    def get_thursday_display_fn(self, instance):
        return instance.get_thursday_display()

    def get_friday_display_fn(self, instance):
        return instance.get_friday_display()

    def get_saturday_display_fn(self, instance):
        return instance.get_saturday_display()

    def get_sunday_display_fn(self, instance):
        return instance.get_sunday_display()

    def exceptions_fn(self, instance):
        return [x.date for x in instance.exceptions.all()]

class DoctorContactAvailabilityExceptionSerializer(serializers.ModelSerializer):
    """
    Doctor Contact Availability Exception serializer
    """

    class Meta:
        model = DoctorContactAvailabilityException
        fields = ('id', 'doctor_contact', 'date',)

class PatientSerializer(serializers.ModelSerializer):
    """
    Patient serializer
    """
    user = UserSerializer(read_only=True, required=False)
    class Meta:
        model = Patient

    def create(self, validated_data):
        """
        When creating a patient a system user must be created
        """
        # create system user
        username = validated_data['lastname'].lower() + validated_data['firstname'][0].lower()
        password = User.objects.make_random_password(length=8)
        user = User.objects.create_user(username=username, password=password)
        patient = Patient.objects.create(
            firstname=validated_data['firstname'],
            lastname=validated_data['lastname'],
            sex=validated_data['sex'],
            cf=validated_data['cf'],
            birth_date=validated_data['birth_date'],
            birth_place=validated_data['birth_place'],
            address=validated_data['address'],
            city=validated_data['city'],
            phone=validated_data['phone'],
            email=validated_data['email'],
            user=user
        )
        send_mail('Nocc - Creazione profilo Paziente', ("E' stato creato un nuovo profilo paziente associato a questo indirizzo e-mail.\nusername: %s\npassword:%s" % (username, password)), 'noreply@nocc.it', [validated_data['email']], fail_silently=False)

        return patient

class CaseSerializer(serializers.ModelSerializer):
    """
    Case serializer
    """
    surgeon_contact_obj = DoctorContactSerializer(source='surgeon_contact', read_only=True, required=False)
    oncologist_contact_obj = DoctorContactSerializer(source='oncologist_contact', read_only=True, required=False)
    radiotherapist_contact_obj = DoctorContactSerializer(source='radiotherapist_contact', read_only=True, required=False)
    observers_obj = DoctorSerializer(source='observers', read_only=True, required=False, many=True)
    patient_obj = PatientSerializer(source='patient', read_only=True)
    get_status_display = serializers.SerializerMethodField('get_status_display_fn')

    class Meta:
        model = Case
        fields = ('id', 'relapse', 'status', 'get_status_display', 'patient', 'patient_obj', 'description', 'surgeon_contact', 'surgeon_contact_obj', 'oncologist_contact', 'oncologist_contact_obj', 'oncologist_status', 'radiotherapist_contact', 'radiotherapist_contact_obj', 'radiotherapist_status', 'observers', 'observers_obj', 'insertion_date', 'last_edit_date')

    def get_status_display_fn(self, instance):
        return instance.get_status_display()

    def create(self, validated_data):
        """
        When creating a new case the patient must be notified
        """
        case = super(CaseSerializer, self).create(validated_data)
        send_mail('Nocc - Creazione caso clinico', "E' stato creato un nuovo caso clinico che la vede come paziente", 'noreply@nocc.it', [case.patient.email], fail_silently=False)
        return case

    # @TODO create a class to centralize the email contents
    def update(self, instance, validated_data):
        request = self.context['request']
        oncologist_association = False
        radiotherapist_association = False
        observers_association = False
        oncologist_refusal = False
        radiotherapist_refusal = False
        oncologist_acceptance = False
        radiotherapist_acceptance = False

        started = False

        if(validated_data.get('oncologist_contact', None)):
            oncologist_association = True

        if(validated_data.get('radiotherapist_contact', None)):
            radiotherapist_association = True

        if(validated_data.get('observers', None) != None):
            observers_association = True
            # query set must be evaluated in order to freeze data before saving
            prev_observers = [d  for d in instance.observers.all()]

        if(instance.oncologist_contact != None and validated_data.get('oncologist_status', None) == Case.REFUSED_STATUS):
            oncologist_refusal = True

        if(instance.radiotherapist_contact != None and validated_data.get('radiotherapist_status', None) == Case.REFUSED_STATUS):
            radiotherapist_refusal = True

        if(instance.oncologist_contact != None and validated_data.get('oncologist_status', None) == Case.ACCEPTED_STATUS):
            oncologist_acceptance = True

        if(instance.radiotherapist_contact != None and validated_data.get('radiotherapist_status', None) == Case.ACCEPTED_STATUS):
            radiotherapist_acceptance = True

        if(validated_data.get('status', None) == Case.STARTED_STATUS):
            started = True

        case = super(CaseSerializer, self).update(instance, validated_data)

        if oncologist_association:
            case.oncologist_status = Case.TO_BE_ACCEPTED_STATUS
            case.save()
            send_mail('Nocc - Associazione medico oncologo', "E' stato associato come oncologo nel caso clinico %s" % case.description, 'noreply@nocc.it', [case.oncologist_contact.email], fail_silently=False)

        if radiotherapist_association:
            case.radiotherapist_status = Case.TO_BE_ACCEPTED_STATUS
            case.save()
            send_mail('Nocc - Associazione medico radioterapista', "E' stato associato come radioterapista nel caso clinico %s" % case.description, 'noreply@nocc.it', [case.radiotherapist_contact.email], fail_silently=False)

        if observers_association:
            for observer in validated_data['observers']:
                if observer not in prev_observers:
                    send_mail('Nocc - Associazione osservatore', "E' stato associato come osservatore nel caso clinico %s" % case.description, 'noreply@nocc.it', [observer.email], fail_silently=False)

            for observer in prev_observers:
                if observer not in validated_data['observers']:
                    send_mail('Nocc - Associazione osservatore', "E' stato rimosso come osservatore nel caso clinico %s" % case.description, 'noreply@nocc.it', [observer.email], fail_silently=False)

        if oncologist_refusal:
            send_mail('Nocc - Associazione medico oncologo', "L'oncologo %s %s ha rifiutato l'associazione al caso %s." % (request.user.doctor.firstname, request.user.doctor.lastname, case.description), 'noreply@nocc.it', [case.surgeon_contact.email], fail_silently=False)

        if oncologist_acceptance:
            send_mail('Nocc - Associazione medico oncologo', "L'oncologo %s %s ha accettato l'associazione al caso %s." % (request.user.doctor.firstname, request.user.doctor.lastname, case.description), 'noreply@nocc.it', [case.surgeon_contact.email], fail_silently=False)

        if radiotherapist_refusal:
            send_mail('Nocc - Associazione medico radioterapista', "Il radioterapista %s %s ha rifiutato l'associazione al caso %s." % (request.user.doctor.firstname, request.user.doctor.lastname, case.description), 'noreply@nocc.it', [case.surgeon_contact.email], fail_silently=False)

        if radiotherapist_acceptance:
            send_mail('Nocc - Associazione medico radioterapista', "Il radioterapista %s %s ha accettato l'associazione al caso %s." % (request.user.doctor.firstname, request.user.doctor.lastname, case.description), 'noreply@nocc.it', [case.surgeon_contact.email], fail_silently=False)

        if started:
            send_mail('Nocc - Avvio terapia', u"La terapia è stata avviata, può visionare la scheda terapeutica online.", 'noreply@nocc.it', [case.patient.email], fail_silently=False)


        return case

class GuidelineSerializer(serializers.ModelSerializer):
    """
    Guideline serializer
    """

    class Meta:
        model = Guideline
        fields = ('id', 'title', 'file',)

class TherapeuticProposalSectionSerializer(serializers.ModelSerializer):
    """
    Therapeutic Proposal Section serializer
    """

    section_type = serializers.SerializerMethodField('section_type_fn')

    class Meta:
        model = TherapeuticProposalSection
        fields = ('id', 'therapeutic_proposal', 'dispenser', 'text', 'section_type',)

    def section_type_fn(self, instance):
        if(instance.therapeutic_proposal.case.surgeon_contact == instance.dispenser):
            return 'surgeon'
        if(instance.therapeutic_proposal.case.oncologist_contact == instance.dispenser):
            return 'oncologist'
        if(instance.therapeutic_proposal.case.radiotherapist_contact == instance.dispenser):
            return 'radiotherapist'

class PollingSerializer(serializers.ModelSerializer):
    """
    Therapeutic Proposal Polling serializer
    """
    doctor_contact = DoctorContactSerializer(read_only=True, required=False)
    class Meta:
        model = Polling
        fields = ('id', 'therapeutic_proposal', 'doctor_contact', 'date', 'vote',)

    def get_validation_exclusions(self, *args, **kwargs):
        """
        doctor_contact is filled automatically
        """
        exclusions = super(PollingSerializer, self).get_validation_exclusions()

        return exclusions + ['doctor_contact']

class TherapeuticProposalSerializer(serializers.ModelSerializer):
    """
    Therapeutic Proposal serializer
    """

    status = serializers.IntegerField(required=False)
    sections = TherapeuticProposalSectionSerializer(read_only=True, many=True, required=False)
    guidelines_obj = GuidelineSerializer(source='guidelines', many=True, read_only=True, required=False)
    votes_obj = PollingSerializer(source='votes', many=True, read_only=True, required=False)

    class Meta:
        model = TherapeuticProposal
        fields = ('id', 'case', 'type', 'date', 'title', 'description', 'priority', 'need_revaluation', 'guidelines', 'guidelines_obj', 'status', 'group_discussion', 'sections', 'votes_obj',)

    def get_validation_exclusions(self, *args, **kwargs):
        """
        status is filled automatically
        """
        exclusions = super(TherapeuticProposalSerializer, self).get_validation_exclusions()

        return exclusions + ['status']

    def update(self, instance, validated_data):
        if(validated_data.get('status', None) == TherapeuticProposal.STATUS_ACCEPTED):
            send_mail('Nocc - Proposta terapeutica', "E' stata definita una proposta terapeutica.", 'noreply@nocc.it', [instance.case.patient.email], fail_silently=False)

        return super(TherapeuticProposalSerializer, self).update(instance, validated_data)

class FollowUpSerializer(serializers.ModelSerializer):
    """
    Follow Up serializer
    """

    status = serializers.IntegerField(required=False)
    doctor_contact = DoctorContactSerializer(read_only=True, required=False)

    class Meta:
        model = FollowUp
        fields = ('id', 'case', 'doctor_contact', 'type', 'text', 'date', 'status', 'suggestion', )

    def get_validation_exclusions(self, *args, **kwargs):
        """
        status is filled automatically
        """
        exclusions = super(TherapeuticProposalSerializer, self).get_validation_exclusions()

        return exclusions + ['status', 'doctor_contact']

    def create(self, validated_data):
        """
        When creating a new FollowUp the surgeon gets notified
        """
        followup = super(FollowUpSerializer, self).create(validated_data)

        send_mail('Nocc - Richiesta Follow Up', "E' stato richiesto un Follow Up per il caso %s da %s" % (str(followup.case), str(followup.doctor_contact.doctor)), 'noreply@nocc.it', [followup.case.surgeon_contact.email], fail_silently=False)
        return followup

    def update(self, instance, validated_data):
        if(validated_data.get('status', None) == FollowUp.REFUSED_STATUS):
            send_mail('Nocc - Follow Up', "Il chirurgo ha rifiutato il Follow Up per il caso %s nella data prevista." % str(instance.case), 'noreply@nocc.it', [instance.doctor_contact.email], fail_silently=False)

        if(validated_data.get('status', None) == FollowUp.TO_BE_ACCEPTED_STATUS):
            send_mail('Nocc - Follow Up', "E' stata richiesta una nuova data per il Follow Up per il caso %s da %s." % (str(instance.case), str(instance.doctor_contact.doctor)), 'noreply@nocc.it', [instance.case.surgeon_contact.email], fail_silently=False)

        if(validated_data.get('status', None) == FollowUp.ACCEPTED_STATUS):
            send_mail('Nocc - Follow Up', "Sono richiesti nuovi esami di Follow Up in data %s." % str(instance.date), 'noreply@nocc.it', [instance.case.patient.email], fail_silently=False)

        if(validated_data.get('status', None) == FollowUp.FINALIZED_STATUS):
            send_mail('Nocc - Follow Up', "Chiusura followup %s" % str(instance.text), 'noreply@nocc.it', [instance.case.patient.email], fail_silently=False)
            send_mail('Nocc - Follow Up', "Chiusura followup %s" % str(instance.text), 'noreply@nocc.it', [instance.doctor_contact.email], fail_silently=False)

        return super(FollowUpSerializer, self).update(instance, validated_data)

class ExaminationAttachmentSerializer(serializers.ModelSerializer):
    """
    Examination attachment serializer
    """
    class Meta:
        model = ExaminationAttachment
        fields = ('id', 'examination', 'insertion_date', 'file')

class ExaminationSerializer(serializers.ModelSerializer):
    """
    Examination serializer
    """

    attachments = ExaminationAttachmentSerializer(read_only=True, many=True, required=False)
    follow_up_obj = FollowUpSerializer(source='follow_up', read_only=True, many=False, required=False)
    get_type_display = serializers.SerializerMethodField('get_type_display_fn')

    class Meta:
        model = Examination
        fields = ('id', 'case', 'description', 'type', 'get_type_display', 'date', 'text', 'follow_up', 'follow_up_obj', 'revaluation', 'attachments')

    def get_type_display_fn(self, instance):
        return instance.get_type_display()
