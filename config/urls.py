from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # 1. Panel de Administración de Django
    path('admin/', admin.site.urls),
    
    # 2. Conexión con las rutas de tu tienda (App Core)
    path('', include('core.urls')), 
]

# Esto permite que Django encuentre las fotos de los productos en tu computadora
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)