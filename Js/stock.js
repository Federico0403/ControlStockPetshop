"use strict";

const BASE_PATH = window.location.pathname.split("/").slice(0, -2).join("/"); // Ajusta el nivel según la estructura
const BASE_URL = `${window.location.origin}${BASE_PATH}/ControlStockPetshop/api/`;

let btnProductos = document.getElementById("productos").addEventListener("click", getAllProductos);
let btnProveedores = document.getElementById("proveedores").addEventListener("click", getAllProveedores);
let btnMovimientos = document.getElementById("movimientos").addEventListener("click", getAllMovimientos);
let productos = [];
let proveedores = [];
let movimientos = [];

async function getAllProductos(marcas = []) {
    try {
        // Guardar los valores seleccionados de los checkboxes
        const marcasSeleccionadas = Array.from(document.querySelectorAll('input[type="checkbox"]:checked')).map(checkbox => checkbox.value);
        
        // Construir la URL con los parámetros de marcas seleccionadas
        let url = BASE_URL + "productos";
        if (marcas.length > 0) {
            url += "?marca=" + marcas.join(",");
        }

        const response = await fetch(url);
        if (!response.ok) {
            throw new Error("Error al obtener los productos");
        }
        productos = await response.json();
        showMarcas(marcasSeleccionadas); // Pasar las marcas seleccionadas al actualizar la vista
        showProductos();
    } catch (error) {
        console.log(error);
    }
}



async function getAllProveedores() {
    try {
        const response = await fetch(BASE_URL + "proveedores");
        if (!response.ok) {
            throw new Error("Error al obtener los proveedores");
        }
        proveedores = await response.json();
        showProveedores();
    } catch (error) {
        console.log(error);
    }
}

async function getAllMovimientos() {
    try {
        const response = await fetch(BASE_URL + "movimientos");
        if (!response.ok) {
            throw new Error("Error al obtener los movimientos");
        }
        movimientos = await response.json();
        showMovimientos();
    } catch (error) {
        console.log(error);
    }
}

function showMarcas(marcasSeleccionadas = []) {
    let div = document.getElementById("filtrosMarca");
    div.innerHTML = "";

    let marcasUnicas = new Set();

    productos.forEach(producto => {
        if (producto.Marca) {
            marcasUnicas.add(producto.Marca);
        }
    });

    // Crear una fila para las marcas
    let marcasHTML = `<div class="row">`;

    marcasUnicas.forEach(marca => {
        marcasHTML += `
        <div class="col-md-3 mb-3"> <!-- Cada marca en una columna con espacio -->
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="${marca}" id="marca-${marca}"
                ${marcasSeleccionadas.includes(marca) ? "checked" : ""}>  <!-- Mantener seleccionadas las marcas filtradas -->
                <label class="form-check-label" for="marca-${marca}">
                    ${marca}
                </label>
            </div>
        </div>`;
    });

    marcasHTML += `</div>`;  // Cerrar la fila

    div.innerHTML = marcasHTML;

    // Añadir evento a los checkboxes para filtrar productos por marca
    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
        checkbox.addEventListener('change', filterProductosByMarca);
    });
}


function filterProductosByMarca() {
    // Obtener todas las marcas seleccionadas
    let marcasSeleccionadas = [];
    document.querySelectorAll('input[type="checkbox"]:checked').forEach(checkbox => {
        marcasSeleccionadas.push(checkbox.value);
    });

    // Llamar a getAllProductos con las marcas seleccionadas
    getAllProductos(marcasSeleccionadas);
}

async function eliminarProducto(idProducto) {
    if (confirm){
        try {
            const response = await fetch(`${BASE_URL}productos/${idProducto}`, {
                method: "DELETE"
            });

            if (!response.ok) {
                throw new Error("Error al eliminar el producto");
            }

            // Si la eliminación fue exitosa, volver a cargar los productos
            getAllProductos();  // Volver a cargar los productos después de eliminar
        } catch (error) {
            console.error("Error al eliminar producto:", error);
        }
    }
}

// Luego el código para mostrar los productos
function showProductos() {
    let div = document.getElementById("contenedorMostrar");
    div.innerHTML = "";

    // Crear los encabezados
    let encabezados = `
        <div class="row mb-3 text-center">
            <div class="col-md-3"><strong>Marca</strong></div>
            <div class="col-md-2"><strong>Stock</strong></div>
            <div class="col-md-2"><strong>Precio</strong></div>
            <div class="col-md-3"><strong>Tipo</strong></div>
            <div class="col-md-2"><strong>Acciones</strong></div>  <!-- Nueva columna para los botones -->
        </div>
    `;
    div.innerHTML += encabezados;

    // Recorrer productos y crear filas con botones de eliminar y modificar
    productos.forEach(producto => {
        let html = `
        <div class="row mb-3 text-center">
            <div class="col-md-3">${producto.Marca || 'Marca no disponible'}</div>
            <div class="col-md-2">${producto.StockActual || 'Stock no disponible'}</div>
            <div class="col-md-2">${producto.Precio ? `$${producto.Precio}` : 'Precio no disponible'}</div>
            <div class="col-md-3">${producto.Tipo || 'Tipo no disponible'}</div>
            <div class="col-md-2">
                <button class="btn btn-warning btn-sm" onclick="modificarProducto(${producto.IDProducto})">Modificar</button>
                <button class="btn btn-danger btn-sm" onclick="eliminarProducto(${producto.IDProducto})">Eliminar</button>
            </div>
        </div>
        `;
        div.innerHTML += html;
    });

    div.innerHTML += `<p class="mt-3 text-center"><small>Mostrando ${productos.length} Productos</small></p>`;
}


// Mostrar el formulario de modificación y cargar los datos del producto
async function modificarProducto(idProducto) {
    // Mostrar el formulario de modificación
    document.getElementById("formularioModificar").style.display = "block";

    try {
        const response = await fetch(`${BASE_URL}productos/${idProducto}`);
        if (!response.ok) {
            throw new Error("Error al obtener el producto");
        }

        // Obtener los datos del producto
        const producto = await response.json();

        // Rellenar el formulario con los datos del producto
        document.getElementById("idProductoModificar").value = producto.IDProducto;
        document.getElementById("nombreProducto").value = producto.Nombre;
        document.getElementById("marcaProducto").value = producto.Marca;
        document.getElementById("tipoProducto").value = producto.Tipo;
        document.getElementById("precioProducto").value = producto.Precio;
        document.getElementById("stockActualProducto").value = producto.StockActual;
        document.getElementById("stockMinimoProducto").value = producto.StockMinimo;
        document.getElementById("descripcionProducto").value = producto.Descripcion;
        document.getElementById("fechaAltaProducto").value = producto.FechaAlta;
    } catch (error) {
        console.error("Error al cargar los datos del producto:", error);
    }
}

// Evento para cancelar la edición y ocultar el formulario
document.getElementById("cancelarModificar").addEventListener("click", function() {
    // Ocultar el formulario de modificación
    document.getElementById("formularioModificar").style.display = "none";
});

// Función para enviar los datos modificados del formulario
document.getElementById("formModificarProducto").addEventListener("submit", async function(event) {
    event.preventDefault();  // Evitar que el formulario se envíe de manera tradicional

    const idProducto = document.getElementById("idProductoModificar").value;
    const nombre = document.getElementById("nombreProducto").value;
    const marca = document.getElementById("marcaProducto").value;
    const tipo = document.getElementById("tipoProducto").value;
    const precio = document.getElementById("precioProducto").value;
    const stockActual = document.getElementById("stockActualProducto").value;
    const stockMinimo = document.getElementById("stockMinimoProducto").value;
    const descripcion = document.getElementById("descripcionProducto").value;
    const fechaAlta = document.getElementById("fechaAltaProducto").value;

    // Enviar la solicitud de modificación al servidor
    try {
        const response = await fetch(`${BASE_URL}productos/${idProducto}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                Nombre: nombre,
                Marca: marca,
                Tipo: tipo,
                Precio: precio,
                StockActual: stockActual,
                StockMinimo: stockMinimo,
                Descripcion: descripcion,
                FechaAlta: fechaAlta
            })
        });

        if (!response.ok) {
            throw new Error("Error al modificar el producto");
        }

        // Ocultar el formulario y recargar los productos
        document.getElementById("formularioModificar").style.display = "none";
        getAllProductos();  // Recargar los productos después de la modificación
    } catch (error) {
        console.error("Error al modificar el producto:", error);
    }
});


async function guardarModificaciones(idProducto) {
    const productoModificado = {
        Nombre: document.getElementById("nombreProducto").value,
        Marca: document.getElementById("marcaProducto").value,
        Precio: document.getElementById("precioProducto").value,
        StockActual: document.getElementById("stockActualProducto").value,
        StockMinimo: document.getElementById("stockMinimoProducto").value,
        Descripcion: document.getElementById("descripcionProducto").value,
        Tipo: document.getElementById("tipoProducto").value,
        FechaAlta: document.getElementById("fechaAltaProducto").value
    };

    try {
        const response = await fetch(`${BASE_URL}productos/${idProducto}`, {
            method: "PUT",  // Usamos PUT para modificar
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(productoModificado)
        });

        if (!response.ok) {
            throw new Error("Error al modificar el producto");
        }

        alert("Producto modificado con éxito");
        getAllProductos();  // Actualizamos la lista de productos después de la modificación
    } catch (error) {
        console.log(error);
    }
}

function showProveedores() {
    // Limpiar los filtros de marcas antes de mostrar los proveedores
    let filtrosMarcaDiv = document.getElementById("filtrosMarca");
    filtrosMarcaDiv.innerHTML = "";

    let div = document.getElementById("contenedorMostrar");
    div.innerHTML = "";

    // Crear una fila para los proveedores
    let proveedoresHTML = `<div class="row">`;

    proveedores.forEach(proveedor => {
        proveedoresHTML += ` 
        <div class="col-md-3 mb-4"> <!-- Cada proveedor en una columna con espacio -->
            <div class='card'>
                <div class='card-body'>
                    <h5 class='card-title'>
                        <a href='#' data-id='${proveedor.IDProveedor}' class='text-decoration-none titulo text-danger btnDetail'>${proveedor.NombreProveedor || 'Nombre no disponible'}</a>
                    </h5>
                    <p class='card-text'>Contacto: ${proveedor.Contacto || 'Contacto no disponible'}</p>
                    <p class='card-text'>Dirección: ${proveedor.Direccion || 'Dirección no disponible'}</p>
                </div>
            </div>
        </div>`;
    });

    proveedoresHTML += `</div>`;  // Cerrar la fila

    div.innerHTML = proveedoresHTML;

    // Mostrar la cantidad de proveedores
    div.innerHTML += `<p class="mt-3 text-center"><small>Mostrando ${proveedores.length} Proveedores</small></p>`;
}

function showMovimientos() {
    let div = document.getElementById("contenedorMostrar");
    div.innerHTML = "";
    movimientos.forEach(movimiento => {
        let html = ` 
        <div class="col-md-4 mb-4">
            <div class='card'>
                <div class='card-body'>
                    <h5 class='card-title'>
                        <a href='#' data-id='${movimiento.id_producto}' class='text-decoration-none titulo text-danger btnDetail'>${movimiento.nombre_producto}</a>
                    </h5>
                    <p class='card-text'>Fecha: ${movimiento.fecha}</p>
                    <p class='card-text'>Cantidad: ${movimiento.cantidad}</p>
                    <p class='card-text'>Tipo: ${movimiento.tipo}</p>
                </div>
            </div>
        </div>`;
        div.innerHTML += html;
    });
    div.innerHTML += `<p class="mt-3 text-center"><small>Mostrando ${movimientos.length} Movimientos</small></p>`;
}

getAllProductos(); 
