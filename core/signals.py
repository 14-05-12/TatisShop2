from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Lote # Cambia 'Lote' por el nombre de tu modelo de embarques

@receiver(post_save, sender=Lote)
def actualizar_stock_por_lote(sender, instance, created, **kwargs):
    if created: # Solo si el lote es nuevo
        producto = instance.producto
        producto.stock += instance.cantidad # Suma la cantidad que llegó
        producto.save()