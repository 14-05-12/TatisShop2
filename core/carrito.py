class Carrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        carrito = self.session.get("carrito")
        if not carrito:
            # Si no existe el carrito en la sesión, lo creamos como un diccionario vacío
            carrito = self.session["carrito"] = {}
        self.carrito = carrito

    def agregar(self, producto, talla="M"):
        # Usamos una combinación de ID y Talla como clave única
        # Esto permite tener el mismo producto en diferentes tallas en el carrito
        item_id = f"{producto.id_producto}_{talla}"
        
        if item_id not in self.carrito:
            self.carrito[item_id] = {
                "producto_id": producto.id_producto,
                "nombre": producto.nombre,
                "precio": str(producto.precio),
                "talla": talla,
                "cantidad": 1,
                "total": str(producto.precio),
                "imagen": producto.imagen.url if producto.imagen else ""
            }
        else:
            self.carrito[item_id]["cantidad"] += 1
            self.carrito[item_id]["total"] = str(
                float(self.carrito[item_id]["precio"]) * self.carrito[item_id]["cantidad"]
            )
        self.guardar_carrito()

    def guardar_carrito(self):
        """Actualiza la sesión para asegurar que los cambios se guarden en la base de datos"""
        self.session["carrito"] = self.carrito
        self.session.modified = True

    def eliminar(self, item_id):
        """Elimina un producto específico del carrito usando su identificador único"""
        if item_id in self.carrito:
            del self.carrito[item_id]
            self.guardar_carrito()

    def restar(self, item_id):
        """Resta una unidad a la cantidad de un producto"""
        if item_id in self.carrito:
            self.carrito[item_id]["cantidad"] -= 1
            if self.carrito[item_id]["cantidad"] < 1:
                self.eliminar(item_id)
            else:
                self.carrito[item_id]["total"] = str(
                    float(self.carrito[item_id]["precio"]) * self.carrito[item_id]["cantidad"]
                )
                self.guardar_carrito()

    def limpiar(self):
        """Vacía el carrito por completo (útil después de procesar un pago)"""
        self.session["carrito"] = {}
        self.session.modified = True