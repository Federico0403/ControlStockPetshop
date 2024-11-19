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
| `StockActual` | `INT`               | Cantidad disponible en el inventario.                        |
| `StockMinimo` | `INT`               | Cantidad mínima antes de necesitar reposición.                |
| `Descripción` | `TEXT`              | Detalles opcionales del producto.                            |
| `FechaAlta`   | `DATE`              | Fecha de ingreso del producto al sistema.                    |

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

## 3. Tabla: MovimientosStock
Registra entradas, salidas y ajustes en el inventario.

| Campo           | Tipo                | Descripción                                                   |
|------------------|---------------------|---------------------------------------------------------------|
| `IdMovimiento`   | PK, único           | Identificador único del movimiento.                          |
| `IdProducto`     | FK (`Productos.IdProducto`) | Producto afectado por el movimiento.                      |
| `TipoMovimiento` | `ENUM` (`entrada`, `salida`) | Tipo de movimiento realizado.                               |
| `Cantidad`       | `INT`               | Número de unidades involucradas en el movimiento.            |
| `FechaMovimiento`| `DATETIME`          | Fecha y hora del movimiento.                                 |
| `Usuario`        | `VARCHAR` (opcional)| Persona responsable del movimiento.                          |

---

### Notas
- Las relaciones clave entre tablas están definidas por claves foráneas (`FK`).
- Todos los valores numéricos como `Precio` usan el formato `DECIMAL(10,2)` para manejar decimales de manera precisa.
- Las fechas usan el formato `DATE` o `DATETIME` según la necesidad.

---

¡Listo para implementar y escalar! 🚀
