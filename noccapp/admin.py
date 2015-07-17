from django.contrib import admin
from noccapp.models.actors import Doctor, Hospital, DoctorContact, Patient
from noccapp.models.cases import Case, Examination, ExaminationAttachment

"""
Actors
"""
class HospitalAdmin(admin.ModelAdmin):
  list_display = ('name', )

admin.site.register(Hospital, HospitalAdmin)

class DoctorContactInline(admin.TabularInline):
    model = DoctorContact
    extra = 1

class DoctorAdmin(admin.ModelAdmin):
  list_display = ('user', 'firstname', 'lastname', )
  inlines = [DoctorContactInline, ]

admin.site.register(Doctor, DoctorAdmin)

class DoctorContactAdmin(admin.ModelAdmin):
  list_display = ('doctor', 'hospital', 'phone', 'email', )

admin.site.register(DoctorContact, DoctorContactAdmin)

class PatientAdmin(admin.ModelAdmin):
  list_display = ('user', 'firstname', 'lastname', 'email', )

admin.site.register(Patient, PatientAdmin)

"""
Cases
"""
class CaseAdmin(admin.ModelAdmin):
  list_display = ('patient', 'description', 'insertion_date', 'last_edit_date', )

admin.site.register(Case, CaseAdmin)

class ExaminationAdmin(admin.ModelAdmin):
  list_display = ('case', 'description', 'date', 'text', )

admin.site.register(Examination, ExaminationAdmin)

class ExaminationAttachmentAdmin(admin.ModelAdmin):
  list_display = ('examination', 'insertion_date', 'file', )

admin.site.register(ExaminationAttachment, ExaminationAttachmentAdmin)
