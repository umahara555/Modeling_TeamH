from rest_framework import routers
from .views import LectureViewSet, HomeworkViewSet, UserViewSet, UserHomeworkViewSet, ThreadViewSet, ReplyViewSet

from . import views

router = routers.DefaultRouter()
router.register('lectures', LectureViewSet)
router.register('homeworks', HomeworkViewSet)
router.register('Users', UserViewSet)
router.register('userhomeworks', UserHomeworkViewSet)
router.register('threads', ThreadViewSet)
router.register('replys', ReplyViewSet)
