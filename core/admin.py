from django.contrib import admin
from .models import Categoria, Producto, Lote, Pedido, DetallePedido, Reseña, Proveedor
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin

# Personalizar el título del panel
admin.site.site_header = "Panel Administrativo TatisShop"
admin.site.index_title = "Gestión de la Tienda"

# Ver Clientes (Usuarios)
admin.site.unregister(User) # Quitamos el default
@admin.register(User)
class ClienteAdmin(UserAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff')
    list_filter = ('is_staff', 'is_superuser')

# Ver y Editar Productos (Colecciones)
@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'id_categoria', 'precio', 'talla', 'color')
    list_editable = ('precio',) # Permite editar precio desde la lista
    search_fields = ('nombre',)
    list_filter = ('id_categoria', 'talla')

@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('id_categoria', 'nombre')

# Ver Reseñas
@admin.register(Reseña)
class ReseñaAdmin(admin.ModelAdmin):
    list_display = ('producto', 'usuario', 'calificacion', 'fecha')
    readonly_fields = ('fecha',)

# Ver Pedidos
class DetallePedidoInline(admin.TabularInline):
    model = DetallePedido
    extra = 0

@admin.register(Pedido)
class PedidoAdmin(admin.ModelAdmin):
    list_display = ('id', 'usuario', 'total', 'estado', 'fecha_creacion')
    list_filter = ('estado', 'fecha_creacion')
    inlines = [DetallePedidoInline]

# Inventario
admin.site.register(Lote)
admin.site.register(Proveedor)

# NOTA: Al no registrar el modelo 'Favorito' aquí, el Admin NO lo verá.