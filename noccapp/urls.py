from django.conf.urls import patterns, include, url

from rest_framework.routers import DefaultRouter

from noccapp import views

router = DefaultRouter()
router.register(r'profile', views.ProfileViewSet)

urlpatterns = [
    url(r'^api/v1/auth/', include(router.urls)),
    url(r'api/v1/auth/login/$', views.LoginView.as_view(), name='noccapp-auth-login'),
    url(r'api/v1/auth/logout/$', views.LogoutView.as_view(), name='noccapp-auth-logout'),
]
