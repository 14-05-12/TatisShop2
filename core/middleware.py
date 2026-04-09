from django.contrib.sessions.models import Session
from django.conf import settings
from django.contrib.auth import logout

class OneSessionPerUserMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.user.is_authenticated:
            # Obtenemos la clave de sesión actual del usuario
            current_session_key = request.user.usuario_perfil.session_key # Necesitas un campo en tu modelo Perfil
            
            if current_session_key and current_session_key != request.session.session_key:
                # Si la sesión grabada es distinta a la actual, cerramos la anterior
                Session.objects.filter(session_key=current_session_key).delete()
            
            # Actualizamos la nueva sesión como la única activa
            perfil = request.user.usuario_perfil
            perfil.session_key = request.session.session_key
            perfil.save()

        return self.get_response(request)