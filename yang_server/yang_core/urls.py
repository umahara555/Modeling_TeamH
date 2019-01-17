from rest_framework import routers
from .views import UserViewSet

from . import views

router = routers.DefaultRouter()
router.register('users', UserViewSet)
