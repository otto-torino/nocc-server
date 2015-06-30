from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.models import User
from django.core.mail import send_mail

from rest_framework import serializers

from noccapp.models.actors import Doctor, Patient, DoctorContact, DoctorContactAvailabilityException, Hospital
from noccapp.models.cases import Case

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

class DoctorContactSerializer(serializers.ModelSerializer):
    """
    Doctors' contacts serializer
    The hospital_obj field is a readonly field which exposes an expanded form of the hospital relation
    """

    get_monday_display = serializers.SerializerMethodField('get_monday_display_fn')
    get_tuesday_display = serializers.SerializerMethodField('get_tuesday_display_fn')
    get_wednesday_display = serializers.SerializerMethodField('get_wednesday_display_fn')
    get_thursday_display = serializers.SerializerMethodField('get_thursday_display_fn')
    get_friday_display = serializers.SerializerMethodField('get_friday_display_fn')
    get_saturday_display = serializers.SerializerMethodField('get_saturday_display_fn')
    get_sunday_display = serializers.SerializerMethodField('get_sunday_display_fn')
    hospital_obj = HospitalSerializer(source='hospital', read_only=True, many=False, required=False)
    class Meta:
        model = DoctorContact
        fields = ('id', 'doctor', 'description', 'hospital', 'hospital_obj', 'phone', 'email', 
                  'monday', 'get_monday_display',
                  'tuesday', 'get_tuesday_display',
                  'wednesday', 'get_wednesday_display',
                  'thursday', 'get_thursday_display',
                  'friday', 'get_friday_display',
                  'saturday', 'get_saturday_display',
                  'sunday', 'get_sunday_display')

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

class DoctorContactAvailabilityExceptionSerializer(serializers.ModelSerializer):
    """
    Doctor Contact Availability Exception serializer
    """
    class Meta:
        model = DoctorContactAvailabilityException
        fields = ('id', 'doctor_contact', 'date',)

class DoctorSerializer(serializers.ModelSerializer):
    """
    Doctor serializer
    """
    user = UserSerializer(read_only=True)
    class Meta:
        model = Doctor
        fields = ('id', 'user', 'firstname', 'lastname', 'created_at', 'updated_at',
                  'is_surgeon', 'is_oncologist', 'is_radiotherapist', 'cv', 'photo', )
        read_only_fields = ('created_at', 'updated_at',)

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
    surgeon = DoctorSerializer(read_only=True, required=False)
    oncologist_obj = DoctorSerializer(source='oncologist', read_only=True, required=False)
    radiotherapist_obj = DoctorSerializer(source='radiotherapist', read_only=True, required=False)
    patient_obj = PatientSerializer(source='patient', read_only=True)
    get_status_display = serializers.SerializerMethodField('get_status_display_fn')

    class Meta:
        model = Case
        fields = ('id', 'relapse', 'status', 'get_status_display', 'patient', 'patient_obj', 'description', 'surgeon', 'oncologist', 'oncologist_obj', 'oncologist_status', 'radiotherapist', 'radiotherapist_obj', 'radiotherapist_status', 'observers', 'insertion_date', 'last_edit_date')

    def get_status_display_fn(self, instance):
        return instance.get_status_display()

    def create(self, validated_data):
        """
        When creating a new case the patient must be notified
        """
        case = super(CaseSerializer, self).create(validated_data)
        send_mail('Nocc - Creazione caso clinico', "E' stato creato un nuovo caso clinico che la vede come paziente", 'noreply@nocc.it', [case.patient.email], fail_silently=False)
        return case
