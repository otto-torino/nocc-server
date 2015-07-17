from django.conf.urls import patterns, include, url

from rest_framework.routers import DefaultRouter
from rest_framework.authtoken.views import obtain_auth_token

from noccapp import views

router = DefaultRouter()
router.register(r'doctors/(?P<user__username>[^/.]+)/contacts/(?P<contact_id>\d+)/exceptions', views.profile.DoctorContactAvailabilityExceptionCRuDView)
router.register(r'doctors/(?P<user__username>[^/.]+)/contacts', views.profile.DoctorContactViewSet)
router.register(r'doctors', views.profile.DoctorcRUdView)
router.register(r'hospitals', views.profile.HospitalViewSet)
router.register(r'patients', views.profile.PatientViewSet)
router.register(r'cases/(?P<case_id>\d+)/examinations', views.case.ExaminationViewSet)
router.register(r'cases', views.case.CaseViewSet)

urlpatterns = [
    url(r'api/v1/auth/login/$', views.authentication.LoginView.as_view(), name='noccapp-auth-login'),
    url(r'api/v1/auth/logout/$', views.authentication.LogoutView.as_view(), name='noccapp-auth-logout'),
    url(r'^api/v1/api-token-auth/', obtain_auth_token),
    url(r'^api/v1/', include(router.urls))
]
