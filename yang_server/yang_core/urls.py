from rest_framework import routers
from .views import LectureViewSet, HomeworkViewSet

from . import views

router = routers.DefaultRouter()
router.register('lectures', LectureViewSet)
router.register('homeworks', HomeworkViewSet)
