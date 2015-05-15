from django.contrib import admin
from noccapp.models.actors import Doctor, Hospital, DoctorContact, Patient

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

admin.site.register(Patient)
