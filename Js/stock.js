"use strict";

const BASE_PATH = window.location.pathname.split("/").slice(0, -2).join("/"); // Ajusta el nivel según la estructura
const BASE_URL = `${window.location.origin}${BASE_PATH}/ControlStockPetshop/api/`;

let btnProductos = document.getElementById("productos").addEventListener("click", getAllProductos);
let btnProveedores = document.getElementById("proveedores").addEventListener("click", getAllProveedores);
let productos = [];
let proveedores = [];
let todasLasMarcas = new Set(); // Almacenará todas las marcas disponibles.


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

        // Actualizar el conjunto de todas las marcas (solo al cargar todos los productos)
        if (marcas.length === 0) {
            productos.forEach(producto => {
                if (producto.Marca) {
                    todasLasMarcas.add(producto.Marca);
                }
            });
        }

        // Mostrar marcas y productos
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

// Vínculo del formulario con el evento submit
document.getElementById("formAgregarProducto").addEventListener("submit", async function(event) {
    event.preventDefault(); // Prevenir el comportamiento por defecto (recarga de la página)

    // Crear el objeto producto con los valores del formulario
    const producto = {
        Nombre: document.getElementById("nombreProducto").value,
        Marca: document.getElementById("marcaProducto").value,
        Tipo: document.getElementById("tipoProducto").value,
        Precio: document.getElementById("precioProducto").value,
        Descripcion: document.getElementById("descripcionProducto").value
    };

    // Enviar los datos al servidor para agregar el producto
    try {
        const response = await fetch(BASE_URL + "productos", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(producto)
        });

        if (!response.ok) {
            throw new Error("Error al agregar el producto");
        }

        // Obtener la respuesta del servidor (producto agregado)
        const nuevoProducto = await response.json();

        // Agregar el nuevo producto al array de productos (si lo tienes)
        productos.push(nuevoProducto);

        // Mostrar los productos actualizados
        showProductos();

        // Resetear el formulario después de agregar el producto
        document.getElementById("formAgregarProducto").reset();

    } catch (error) {
        console.error("Error al agregar el producto:", error);
    }
});



// Mostrar el formulario de agregar producto cuando se haga clic en "Agregar Productos"
document.getElementById('agregarProductos').addEventListener('click', function() {
    // Mostrar el formulario de agregar producto
    document.getElementById('formularioAgregarProducto').style.display = 'block';
});

// Ocultar el formulario cuando se haga clic en "Cancelar"
document.getElementById('cancelarAgregar').addEventListener('click', function() {
    // Ocultar el formulario de agregar producto
    document.getElementById('formularioAgregarProducto').style.display = 'none';
});



function showMarcas(marcasSeleccionadas = []) {
    let div = document.getElementById("filtrosMarca");
    div.innerHTML = "";

    // Crear la fila de marcas
    let marcasHTML = `<div class="row contenedor-filtro"> <h1>Filtros</h1>`;
    
    todasLasMarcas.forEach(marca => {
        const isSelected = marcasSeleccionadas.includes(marca); // Verificar si está seleccionada
        marcasHTML += `
        <div class="col-md-3 mb-3 contenedor-marcas">
            <div class="marca ${isSelected ? 'seleccionada' : ''}" id="marca-${marca}" data-marca="${marca}">
                <input type="checkbox" class="form-check-input" value="${marca}" id="checkbox-${marca}" ${isSelected ? "checked" : ""} style="display: none;">
                <span class="marca-nombre">${marca}</span>
            </div>
        </div>`;
    });

    marcasHTML += `</div>`; // Cerrar la fila

    div.innerHTML = marcasHTML;

    // Agregar eventos para alternar el estado del checkbox y la clase
    document.querySelectorAll('.marca').forEach(element => {
        element.addEventListener('click', () => {
            const checkbox = element.querySelector('input[type="checkbox"]');
            checkbox.checked = !checkbox.checked; // Alternar el estado del checkbox
            element.classList.toggle('seleccionada', checkbox.checked); // Alternar clase seleccionada
            filterProductosByMarca(); // Filtrar productos
        });
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
    if (confirm) {
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
            <div class="col-md-2"><strong>Nombre</strong></div>
            <div class="col-md-2"><strong>Precio</strong></div> 
            <div class="col-md-3"><strong>Descripcion</strong></div>
            <div class="col-md-2"><strong>Acciones</strong></div>  <!-- Nueva columna para los botones -->
        </div>
    `;
    div.innerHTML += encabezados;

    // Recorrer productos y crear filas con botones de eliminar y modificar
    productos.forEach(producto => {
        let html = `
        <div class="row mb-3 text-center contenedor-productos">
            <div class="col-md-3 productos">${producto.Marca || 'Marca no disponible'}</div>
            <div class="col-md-2 productos">${producto.Nombre || 'Stock no disponible'}</div>
            <div class="col-md-2 productos">${producto.Precio ? `$${producto.Precio}` : 'Precio no disponible'}</div>
            <div class="col-md-3 productos">${producto.Descripcion || 'Tipo no disponible'}</div>
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
        document.getElementById("modificar_nombreProducto").value = producto.Nombre;
        document.getElementById("modificar_marcaProducto").value = producto.Marca;
        document.getElementById("modificar_tipoProducto").value = producto.Tipo;
        document.getElementById("modificar_precioProducto").value = producto.Precio;
        document.getElementById("modificar_descripcionProducto").value = producto.Descripcion;
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
    const nombre = document.getElementById("modificar_nombreProducto").value;
    const marca = document.getElementById("modificar_marcaProducto").value;
    const tipo = document.getElementById("modificar_tipoProducto").value;
    const precio = document.getElementById("modificar_precioProducto").value;
    const descripcion = document.getElementById("modificar_descripcionProducto").value;

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
                Descripcion: descripcion,
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
        Descripcion: document.getElementById("descripcionProducto").value,
        Tipo: document.getElementById("tipoProducto").value,
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

getAllProductos();
