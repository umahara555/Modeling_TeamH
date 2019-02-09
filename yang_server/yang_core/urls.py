from rest_framework import routers
from .views import UserViewSet, LectureViewSet

from . import views

router = routers.DefaultRouter()
router.register('users', UserViewSet, basename='user')
router.register('lectures', LectureViewSet, basename='lecture')
