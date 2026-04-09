from django.urls import path
from . import views

urlpatterns = [
    # ==========================================
    # 1. SECCIÓN PÚBLICA (INICIO Y CATÁLOGO)
    # ==========================================
    path('', views.inicio, name='inicio'),
    path('productos/', views.productos, name='productos'),
    path('detalle/<int:producto_id>/', views.detalle_producto, name='detalle_producto'),
    
    # ==========================================
    # 2. SISTEMA DE CARRITO Y CHECKOUT
    # ==========================================
    path('carrito/', views.carrito, name='carrito'),
    path('agregar/<int:producto_id>/', views.agregar_al_carrito, name='agregar_al_carrito'),
    path('actualizar/<str:item_id>/', views.actualizar_carrito, name='actualizar_carrito'),
    path('eliminar/<str:item_id>/', views.eliminar_del_carrito, name='eliminar_del_carrito'),
    path('checkout/', views.checkout, name='checkout'),
    path('procesar-pago/', views.procesar_pago, name='procesar_pago'),

    # ==========================================
    # 3. AUTENTICACIÓN
    # ==========================================
    path('login/', views.login_view, name='login'),
    path('registro/', views.registro_view, name='registro'),
    path('logout/', views.logout_view, name='logout'),
    
    # ==========================================
    # 4. FAVORITOS Y RESEÑAS
    # ==========================================
    path('favoritos/', views.lista_favoritos, name='lista_favoritos'),
    path('favoritos/toggle/<int:id_producto>/', views.toggle_favorito, name='toggle_favorito'),
    path('producto/<int:producto_id>/resena/', views.agregar_reseña, name='agregar_reseña'),

    # ==========================================
    # 5. DASHBOARD Y ADMINISTRACIÓN (STAFF)
    # ==========================================
    path('dashboard-admin/', views.dashboard_admin, name='dashboard_admin'),
    path('admin-pedidos/', views.admin_pedidos, name='admin_pedidos'),
    
    # --- GESTIÓN DE PRODUCTOS ---
    path('admin-custom/nuevo-producto/', views.agregar_producto, name='agregar_producto'),
    
    # --- GESTIÓN DE PROVEEDORES ---
    path('admin-custom/nuevo-proveedor/', views.nuevo_proveedor, name='nuevo_proveedor'),
    path('admin-custom/editar-proveedor/<int:id_proveedor>/', views.editar_proveedor, name='editar_proveedor'),
    path('admin-custom/eliminar-proveedor/<int:id_proveedor>/', views.eliminar_proveedor, name='eliminar_proveedor'),

    # --- GESTIÓN DE LOTES / EMBARQUES ---
    path('admin-dashboard/nuevo-lote/', views.nuevo_lote, name='nuevo_lote'),
    path('admin-dashboard/recibir/<int:id_lote>/', views.marcar_recibido, name='marcar_recibido'),
    path('admin-dashboard/cancelar-lote/<int:id_lote>/', views.cancelar_embarque, name='cancelar_embarque'),

    #catagorias
path('dashboard/categoria/nueva/', views.nueva_categoria, name='nueva_categoria'),
path('admin-custom/categoria/eliminar/<int:id_categoria>/', views.eliminar_categoria, name='eliminar_categoria'),
path('admin-custom/producto/editar/<int:id_producto>/', views.editar_producto, name='editar_producto'),
]