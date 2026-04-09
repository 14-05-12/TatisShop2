from django.db import models
from django.contrib.auth.models import User

# --- 1. CATEGORÍAS (COLECCIONES) ---
class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombre = models.CharField(unique=True, max_length=100, blank=True, null=True)
    
    def __str__(self): 
        return self.nombre if self.nombre else "Sin Categoría"
    
    class Meta:
        managed = True
        db_table = 'categoria'
        verbose_name = "Colección / Categoría"
        verbose_name_plural = "Colecciones"

# --- 2. PROVEEDORES ---
class Proveedor(models.Model):
    id_proveedor = models.AutoField(primary_key=True)
    nombre_marca = models.CharField(max_length=100)
    contacto = models.CharField(max_length=100, blank=True, null=True, help_text="Nombre del representante")
    telefono = models.CharField(max_length=20, blank=True, null=True)
    email = models.EmailField(blank=True, null=True)
    direccion = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.nombre_marca
    
    class Meta:
        managed = True
        db_table = 'proveedor'
        verbose_name_plural = "Proveedores"

# --- 3. PRODUCTOS (ACTUALIZADO CON STOCK) ---
class Producto(models.Model):
    id_producto = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    talla = models.CharField(max_length=10, blank=True, null=True)
    color = models.CharField(max_length=50, blank=True, null=True)
    # --- CAMPO AGREGADO PARA SOLUCIONAR EL ERROR ---
    stock = models.IntegerField(default=0, verbose_name="Stock Actual") 
    # -----------------------------------------------
    id_categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, db_column='id_categoria', blank=True, null=True, verbose_name="Colección")
    imagen = models.ImageField(upload_to='productos/', null=True, blank=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nombre
    
    class Meta:
        managed = True
        db_table = 'producto'
        verbose_name_plural = "Productos (Catálogo)"

# --- 4. LOTES (INVENTARIO) ---
class Lote(models.Model):
    ESTADOS = [
        ('SOLICITADO', 'Solicitado'),
        ('EN_CAMINO', 'En Camino'),
        ('ENTREGADO', 'Entregado'),
        ('CANCELADO', 'Cancelado'),
    ]
    id_lote = models.AutoField(primary_key=True)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, db_column='id_producto', null=True)
    cantidad = models.IntegerField()
    proveedor = models.ForeignKey(Proveedor, on_delete=models.SET_NULL, db_column='id_proveedor', null=True)
    estado = models.CharField(max_length=20, choices=ESTADOS, default='SOLICITADO')
    fecha_solicitud = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"Lote {self.id_lote} - {self.producto.nombre if self.producto else 'S/P'}"

    class Meta:
        managed = True
        db_table = 'lote'
        verbose_name_plural = "Lotes e Inventario"

# --- 5. PEDIDOS ---
class Pedido(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="Cliente")
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    total = models.DecimalField(max_digits=10, decimal_places=2)
    metodo_pago = models.CharField(max_length=255)
    estado = models.CharField(max_length=20, default='Pendiente')

    def __str__(self):
        return f"Pedido {self.id} - {self.usuario.username}"
    
    class Meta:
        managed = True
        db_table = 'core_pedido'
        verbose_name_plural = "Pedidos de Clientes"

class DetallePedido(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, related_name='detalles')
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = True
        db_table = 'core_detallepedido'

# --- 6. RESEÑAS ---
class Reseña(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, related_name='reseñas')
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="Cliente")
    comentario = models.TextField()
    calificacion = models.IntegerField(default=5)
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.calificacion}★ - {self.producto.nombre}"
    
    class Meta:
        managed = True
        db_table = 'core_reseña'
        verbose_name_plural = "Reseñas de Productos"

# --- 7. FAVORITOS ---
class Favorito(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    fecha_agregado = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'favorito'
        unique_together = ('usuario', 'producto')