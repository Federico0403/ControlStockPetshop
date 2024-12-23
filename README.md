# Esquema de Base de Datos - Control de Stock para Petshop

## 1. Tabla: Productos
Esta tabla almacena la información de los productos disponibles en la petshop.

| Campo         | Tipo                | Descripción                                                   |
|---------------|---------------------|---------------------------------------------------------------|
| `IdProducto`  | PK, único, autoincremental | Identificador único del producto.                          |
| `Nombre`      | `VARCHAR`           | Nombre del producto.                                          |
| `Marca`       | `VARCHAR`           | Marca del producto.                                           |
| `Tipo`        | `ENUM` o `VARCHAR`  | Tipo de producto (ej.: alimentación, juguetes, medicinas, etc.). |
| `Precio`      | `DECIMAL(10,2)`     | Precio del producto.                                          |
| `Descripción` | `TEXT`              | Detalles opcionales del producto.                            |

---

## 2. Tabla: Proveedores
Información de los proveedores asociados a los productos.

| Campo           | Tipo                | Descripción                                                   |
|------------------|---------------------|---------------------------------------------------------------|
| `IdProveedor`    | PK, único           | Identificador único del proveedor.                           |
| `NombreProveedor`| `VARCHAR`           | Nombre del proveedor.                                         |
| `Contacto`       | `VARCHAR`           | Información de contacto (correo, teléfono, etc.).             |
| `Dirección`      | `VARCHAR`           | Dirección del proveedor.                                      |

---


### Notas
- Las relaciones clave entre tablas están definidas por claves foráneas (`FK`).
- Todos los valores numéricos como `Precio` usan el formato `DECIMAL(10,2)` para manejar decimales de manera precisa.
- Las fechas usan el formato `DATE` o `DATETIME` según la necesidad.

---

¡Listo para implementar y escalar! 🚀
