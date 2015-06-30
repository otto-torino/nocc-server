from django.conf.urls import patterns, include, url

from rest_framework.routers import DefaultRouter
from rest_framework.authtoken.views import obtain_auth_token

from noccapp import views

router = DefaultRouter()
router.register(r'doctor/profile/contacts/exceptions', views.profile.DoctorContactAvailabilityExceptionCRuDView)
router.register(r'doctor/profile/contacts', views.profile.DoctorContactViewSet)
router.register(r'doctor/profile', views.profile.DoctorcRUdView)
router.register(r'doctor', views.profile.DoctorListView)
router.register(r'hospital', views.profile.HospitalViewSet)
router.register(r'case', views.case.CaseViewSet)
router.register(r'patient', views.profile.PatientViewSet)

urlpatterns = [
    url(r'api/v1/auth/login/$', views.authentication.LoginView.as_view(), name='noccapp-auth-login'),
    url(r'api/v1/auth/logout/$', views.authentication.LogoutView.as_view(), name='noccapp-auth-logout'),
    url(r'^api/v1/api-token-auth/', obtain_auth_token),
    url(r'^api/v1/', include(router.urls))
]
