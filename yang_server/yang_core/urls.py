from rest_framework import routers
from .views import TaskViewSet

from . import views

router = routers.DefaultRouter()
router.register('tasks', TaskViewSet)
