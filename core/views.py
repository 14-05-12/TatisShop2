from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse
from django.views.decorators.cache import never_cache
from django.contrib.admin.views.decorators import staff_member_required
from django.db import transaction
from django.views.decorators.cache import never_cache
from django.contrib.auth.decorators import login_required
# Modelos consolidados
from .models import Producto, Categoria, Pedido, DetallePedido, Favorito, Reseña, Lote, Proveedor

# ==========================================
# 1. SECCIÓN PÚBLICA (INICIO Y CATÁLOGO)
# ==========================================

def inicio(request):
    """Página de bienvenida con redirección automática para admin."""
    if request.user.is_authenticated and request.user.is_staff:
        return redirect('dashboard_admin')

    productos_recientes = Producto.objects.all().order_by('-id_producto')[:4]
    return render(request, 'inicio.html', {'productos': productos_recientes})

def productos(request):
    """Catálogo general con búsqueda y filtros."""
    query_set = Producto.objects.all()
    categorias = Categoria.objects.all()
    
    busqueda = request.GET.get('q')
    if busqueda:
        busqueda = busqueda.strip()
        query_set = query_set.filter(nombre__icontains=busqueda)
    
    categoria_nombre = request.GET.get('categoria')
    if categoria_nombre:
        query_set = query_set.filter(id_categoria__nombre__iexact=categoria_nombre)
    
    favs_user = []
    if request.user.is_authenticated:
        favs_user = Favorito.objects.filter(usuario=request.user).values_list('producto_id', flat=True)
    
    return render(request, 'productos.html', {
        'productos': query_set,
        'categorias': categorias,
        'categoria_actual': categoria_nombre,
        'favs_user': favs_user,
        'busqueda': busqueda
    })

def detalle_producto(request, producto_id):
    """Ficha técnica del producto."""
    producto = get_object_or_404(Producto, id_producto=producto_id)
    reseñas = Reseña.objects.filter(producto=producto).order_by('-fecha')
    
    es_favorito = False
    if request.user.is_authenticated:
        es_favorito = Favorito.objects.filter(usuario=request.user, producto=producto).exists()

    return render(request, 'detalle_producto.html', {
        'producto': producto,
        'reseñas': reseñas,
        'es_favorito': es_favorito
    })

# ==========================================
# 2. SISTEMA DE CARRITO (SESIONES)
# ==========================================

def agregar_al_carrito(request, producto_id):
    producto = get_object_or_404(Producto, id_producto=producto_id)
    
    if (getattr(producto, 'stock', 0) or 0) <= 0:
        messages.error(request, f"Lo sentimos, {producto.nombre} está agotado.")
        return redirect('productos')

    if 'carrito' not in request.session:
        request.session['carrito'] = {}
    
    carrito = request.session['carrito']
    talla = request.POST.get('talla', 'M')
    try:
        cantidad = int(request.POST.get('cantidad', 1))
    except ValueError:
        cantidad = 1
    
    item_id = f"{producto_id}_{talla}"

    if item_id in carrito:
        carrito[item_id]['cantidad'] += cantidad
    else:
        carrito[item_id] = {
            'producto_id': producto.id_producto,
            'nombre': producto.nombre,
            'precio': float(producto.precio),
            'talla': talla,
            'cantidad': cantidad,
            'imagen': producto.imagen.url if producto.imagen else ''
        }
    
    request.session.modified = True
    messages.success(request, f"{producto.nombre} añadido.")
    return redirect('carrito')

def carrito(request):
    carrito_data = request.session.get('carrito', {})
    for item in carrito_data.values():
        item['subtotal'] = float(item['precio']) * int(item['cantidad'])
    
    total = sum(float(item['precio']) * int(item['cantidad']) for item in carrito_data.values())
    return render(request, 'carrito.html', {'carrito': carrito_data, 'total': total})

def actualizar_carrito(request, item_id):
    if request.method == 'POST':
        carrito = request.session.get('carrito', {})
        if item_id in carrito:
            nueva_cantidad = request.POST.get('cantidad')
            if nueva_cantidad and int(nueva_cantidad) > 0:
                carrito[item_id]['cantidad'] = int(nueva_cantidad)
                request.session.modified = True
                if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                    return JsonResponse({'status': 'success'})
            else:
                del carrito[item_id]
                request.session.modified = True
    return redirect('carrito')

def eliminar_del_carrito(request, item_id):
    carrito = request.session.get('carrito', {})
    if item_id in carrito:
        del carrito[item_id]
        request.session.modified = True
    return redirect('carrito')

# ==========================================
# 3. FAVORITOS Y RESEÑAS
# ==========================================

@login_required
def toggle_favorito(request, id_producto):
    producto = get_object_or_404(Producto, id_producto=id_producto)
    favorito, created = Favorito.objects.get_or_create(usuario=request.user, producto=producto)
    
    if not created:
        favorito.delete()
        mensaje, es_favorito = "Eliminado de favoritos", False
    else:
        mensaje, es_favorito = "Agregado a favoritos", True

    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return JsonResponse({'status': 'ok', 'mensaje': mensaje, 'es_favorito': es_favorito})
    return redirect(request.META.get('HTTP_REFERER', 'productos'))

@login_required
def lista_favoritos(request):
    mis_favoritos = Favorito.objects.filter(usuario=request.user).select_related('producto')
    return render(request, 'favoritos.html', {'favoritos': mis_favoritos})

@login_required
def agregar_reseña(request, producto_id):
    if request.method == 'POST':
        producto = get_object_or_404(Producto, id_producto=producto_id)
        Reseña.objects.create(
            producto=producto,
            usuario=request.user,
            comentario=request.POST.get('comentario'),
            calificacion=request.POST.get('calificacion')
        )
        messages.success(request, "Reseña guardada.")
    return redirect('detalle_producto', producto_id=producto_id)

# ==========================================
# 4. PAGOS (RESTA STOCK AUTOMÁTICA)
# ==========================================

@login_required(login_url='inicio')
def checkout(request):
    carrito_data = request.session.get('carrito', {})
    if not carrito_data:
        messages.warning(request, "Tu carrito está vacío.")
        return redirect('productos')
    total = sum(float(item['precio']) * int(item['cantidad']) for item in carrito_data.values())
    return render(request, 'checkout.html', {'carrito': carrito_data, 'total': total})

@login_required(login_url='inicio')
def procesar_pago(request):
    if request.method == 'POST':
        carrito_data = request.session.get('carrito', {})
        if not carrito_data: return redirect('productos')

        total_pago = sum(float(item['precio']) * int(item['cantidad']) for item in carrito_data.values())
        
        try:
            with transaction.atomic():
                nuevo_pedido = Pedido.objects.create(
                    usuario=request.user,
                    total=total_pago,
                    metodo_pago=f"Envío a: {request.POST.get('direccion')}",
                    estado='Completado'
                )

                for key, item in carrito_data.items():
                    producto = Producto.objects.select_for_update().get(id_producto=item['producto_id'])
                    cantidad_comprada = int(item['cantidad'])

                    stock_actual = getattr(producto, 'stock', 0) or 0
                    if stock_actual >= cantidad_comprada:
                        producto.stock = stock_actual - cantidad_comprada
                        producto.save()
                    else:
                        raise ValueError(f"Stock insuficiente para {producto.nombre}")

                    DetallePedido.objects.create(
                        pedido=nuevo_pedido,
                        producto=producto,
                        cantidad=cantidad_comprada,
                        precio_unitario=float(item['precio'])
                    )

                request.session['carrito'] = {}
                request.session.modified = True
                messages.success(request, "¡Compra exitosa! Stock actualizado.")
                return redirect('inicio')
                
        except Exception as e:
            messages.error(request, f"Error: {str(e)}")
            return redirect('carrito')

    return redirect('checkout')

# ==========================================
# 5. AUTENTICACIÓN
# ==========================================

@never_cache
def login_view(request):
    if request.method == 'POST':
        u = request.POST.get('username')
        p = request.POST.get('password')
        user = authenticate(username=u, password=p)
        if user: 
            login(request, user)
            messages.success(request, f"Bienvenido {u}")
            if user.is_staff:
                return redirect('dashboard_admin')
            return redirect('inicio')
        else: 
            messages.error(request, "Error de acceso.")
    return redirect('inicio')

def registro_view(request):
    if request.method == 'POST':
        u = request.POST.get('username')
        e = request.POST.get('email')
        p = request.POST.get('password')
        if not User.objects.filter(username=u).exists():
            user = User.objects.create_user(u, e, p)
            login(request, user)
            messages.success(request, "Cuenta creada.")
            return redirect('inicio')
        else:
            messages.error(request, "Usuario ya existe.")
    return redirect('inicio')

def logout_view(request):
    logout(request)
    return redirect('inicio')

# ==========================================
# 6. DASHBOARD Y LOTES (SUMA STOCK AUTOMÁTICA)
# ==========================================

@staff_member_required
@never_cache
def dashboard_admin(request):
    context = {
        'clientes': User.objects.filter(is_staff=False).order_by('-date_joined'),
        'reseñas': Reseña.objects.all().order_by('-fecha'),
        'embarques': Lote.objects.all().order_by('-fecha_solicitud'),
        'productos': Producto.objects.all().order_by('-id_producto'),
        'categorias': Categoria.objects.all(),
        'pedidos_recientes': Pedido.objects.all().order_by('-id')[:10],
        'proveedores': Proveedor.objects.all(),
    }
    return render(request, 'admin_custom/dashboard.html', context)

@staff_member_required
def marcar_recibido(request, id_lote):
    lote = get_object_or_404(Lote, id_lote=id_lote)
    if lote.estado != 'ENTREGADO':
        lote.estado = 'ENTREGADO'
        lote.save()
        producto = lote.producto
        producto.stock = (getattr(producto, 'stock', 0) or 0) + lote.cantidad
        producto.save()
        messages.success(request, f"¡Stock sumado! +{lote.cantidad} pzas a {producto.nombre}.")
    return redirect('dashboard_admin')

@staff_member_required
def nuevo_lote(request):
    if request.method == 'POST':
        id_prod = request.POST.get('producto')
        id_prov = request.POST.get('proveedor')
        cantidad = int(request.POST.get('cantidad', 0))
        estado = request.POST.get('estado')
        producto = get_object_or_404(Producto, id_producto=id_prod)
        proveedor_inst = get_object_or_404(Proveedor, id_proveedor=id_prov)
        lote = Lote.objects.create(producto=producto, proveedor=proveedor_inst, cantidad=cantidad, estado=estado)
        if estado == 'ENTREGADO':
            producto.stock = (getattr(producto, 'stock', 0) or 0) + cantidad
            producto.save()
        messages.success(request, "Lote registrado.")
        return redirect('dashboard_admin')
    context = {'productos': Producto.objects.all(), 'proveedores': Proveedor.objects.all(), 'estados': Lote.ESTADOS}
    return render(request, 'admin_custom/nuevo_lote.html', context)

# ==========================================
# 7. PRODUCTOS, PROVEEDORES Y CATEGORÍAS
# ==========================================

@staff_member_required
def agregar_producto(request):
    if request.method == 'POST':
        categoria_id = request.POST.get('categoria')
        
        if not categoria_id:
            messages.error(request, "Por favor seleccione una categoría.")
            return render(request, 'admin_custom/agregar_producto.html', {'categorias': Categoria.objects.all()})

        cat = get_object_or_404(Categoria, id_categoria=categoria_id)
        
        Producto.objects.create(
            nombre=request.POST.get('nombre'),
            descripcion=request.POST.get('descripcion'),
            precio=request.POST.get('precio'),
            stock=int(request.POST.get('stock', 0)),
            id_categoria=cat,
            imagen=request.FILES.get('imagen')
        )
        messages.success(request, "Producto guardado con éxito.")
        return redirect('dashboard_admin')
    return render(request, 'admin_custom/agregar_producto.html', {'categorias': Categoria.objects.all()})

@staff_member_required
def editar_producto(request, id_producto):
    """Vista boutique para editar productos existentes."""
    producto = get_object_or_404(Producto, id_producto=id_producto)
    categorias = Categoria.objects.all()

    if request.method == 'POST':
        categoria_id = request.POST.get('categoria')
        cat = get_object_or_404(Categoria, id_categoria=categoria_id)
        
        # Actualización de campos
        producto.nombre = request.POST.get('nombre')
        producto.descripcion = request.POST.get('descripcion')
        producto.precio = request.POST.get('precio')
        producto.stock = int(request.POST.get('stock', 0))
        producto.id_categoria = cat
        
        # Actualización de imagen solo si se sube una nueva
        if request.FILES.get('imagen'):
            producto.imagen = request.FILES.get('imagen')
            
        producto.save()
        messages.success(request, f"Producto '{producto.nombre}' actualizado correctamente.")
        return redirect('dashboard_admin')

    return render(request, 'admin_custom/editar_producto.html', {
        'producto': producto,
        'categorias': categorias
    })

@staff_member_required
def nuevo_proveedor(request):
    if request.method == 'POST':
        Proveedor.objects.create(
            nombre_marca=request.POST.get('nombre_marca'),
            contacto=request.POST.get('contacto'),
            telefono=request.POST.get('telefono'),
            email=request.POST.get('email'),
            direccion=request.POST.get('direccion')
        )
        return redirect('dashboard_admin')
    return render(request, 'admin_custom/nuevo_proveedor.html')

@staff_member_required
def editar_proveedor(request, id_proveedor):
    prov = get_object_or_404(Proveedor, id_proveedor=id_proveedor)
    if request.method == 'POST':
        prov.nombre_marca = request.POST.get('nombre_marca')
        prov.contacto = request.POST.get('contacto')
        prov.telefono = request.POST.get('telefono')
        prov.email = request.POST.get('email')
        prov.save()
        return redirect('dashboard_admin')
    return render(request, 'admin_custom/editar_proveedor.html', {'proveedor': prov})

@staff_member_required
def eliminar_proveedor(request, id_proveedor):
    get_object_or_404(Proveedor, id_proveedor=id_proveedor).delete()
    return redirect('dashboard_admin')

@staff_member_required
def cancelar_embarque(request, id_lote):
    lote = get_object_or_404(Lote, id_lote=id_lote)
    lote.estado = 'CANCELADO'
    lote.save()
    messages.warning(request, f"Lote #{lote.id_lote} cancelado.")
    return redirect('dashboard_admin')

@staff_member_required
def admin_pedidos(request):
    pedidos = Pedido.objects.all().order_by('-id') 
    return render(request, 'admin_custom/admin_pedidos.html', {'pedidos': pedidos})

@staff_member_required
def nueva_categoria(request):
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        if nombre:
            Categoria.objects.create(nombre=nombre)
            messages.success(request, f"Categoría '{nombre}' creada exitosamente.")
            return redirect('dashboard_admin')
        else:
            messages.error(request, "El nombre de la categoría es obligatorio.")
    return render(request, 'admin_custom/nueva_categoria.html')

@staff_member_required
def eliminar_categoria(request, id_categoria):
    categoria = get_object_or_404(Categoria, id_categoria=id_categoria)
    nombre = categoria.nombre
    if categoria.producto_set.exists():
        messages.error(request, f"No se puede eliminar '{nombre}' porque tiene productos asociados.")
    else:
        categoria.delete()
        messages.success(request, f"Categoría '{nombre}' eliminada.")
    return redirect('dashboard_admin')

@login_required
@never_cache
def perfil_usuario(request):
    return render(request, 'perfil.html')