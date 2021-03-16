from django.contrib import admin
from .models import KalendarzPs
from .models import Skocznie
from .models import Zawodnicy
from .models import Sedziowie

# Register your models here.

admin.site.register(KalendarzPs)
admin.site.register(Skocznie)
admin.site.register(Zawodnicy)
admin.site.register(Sedziowie)
