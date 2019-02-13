from rest_framework import routers
from .views import UserViewSet, LectureViewSet, HomeworkViewSet, UserLectureViewSet,UserHomeworkViewSet, ThreadViewSet, ReplyViewSet

from . import views

router = routers.DefaultRouter()
router.register('users', UserViewSet, basename='user')
router.register('lectures', LectureViewSet, basename='lecture')
router.register('homeworks', HomeworkViewSet, basename='homework')
router.register('userlectures', UserLectureViewSet, basename='userlecture')
router.register('userhomeworks', UserHomeworkViewSet, basename='userhomework')
router.register('threads', ThreadViewSet, basename='thread')
router.register('replys', ReplyViewSet, basename='reply')
