# core/context_processors.py
from .models import Categoria

def lista_categorias(request):
    return {
        'categorias_globales': Categoria.objects.all()
    }