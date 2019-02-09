from rest_framework import routers
from .views import UserViewSet, LectureViewSet, HomeworkViewSet, UserHomeworkViewSet

from . import views

router = routers.DefaultRouter()
router.register('users', UserViewSet, basename='user')
router.register('lectures', LectureViewSet, basename='lecture')
router.register('homeworks', HomeworkViewSet, basename='homework')
router.register('userlectures', UserHomeworkViewSet, basename='userlecture')
