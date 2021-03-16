"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from polls import views
from django.conf.urls import url


urlpatterns = [
    path('', views.home, name='home'),
    path('home/', views.home, name='home'),
    path('konkursy/', views.konkursy, name='konkursy'),
    path('skocznie/', views.skocznie, name='skocznie'),
    path('update/', views.update, name='update'),
    path('recent/', views.recent, name='recent'),
    path('browse/', views.browse, name='browse'),
    path('browse/longest/', views.longest, name='longest'),
    path('browse/longest/longest_chart/', views.longest_chart, name='longest_chart'),
    path('browse/positions/', views.positions, name='positions'),
    path('browse/general/', views.general, name='general'),
    path('browse/notes/', views.notes, name='notes'),
    path('browse/general/positions_chart/', views.positions_chart, name='positions_chart'),
    path('browse/positions/positions_per_comp_chart/', views.positions_per_comp_chart, name='positions_per_comp_chart'),
    path('browse/notes/notes_avg_chart/', views.notes_avg_chart, name='notes_avg_chart'),
    path('zawodnicy/', views.zawodnicy, name='zawodnicy'),
    path('zawodnicy_add/', views.zawodnicy_add, name='zawodnicy_add'),
    #url(r'^edit/(?P<id>\d+)/$', views.edit, name='edit'),
    path('edit_skok/<int:id>/', views.edit_skok, name='edit_skok'),
    path('delete_skok/<int:id>/', views.delete_skok, name='delete_skok'),
    path('delete_zawodnik/<int:id>/', views.delete_zawodnik, name='delete_zawodnik'),
    path('admin/', admin.site.urls),
]
