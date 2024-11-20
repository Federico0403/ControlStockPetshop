"use strict";

const BASE_PATH = window.location.pathname.split("/").slice(0, -2).join("/"); // Ajusta el nivel según la estructura
const BASE_URL = `${window.location.origin}${BASE_PATH}/ControlStockPetshop/api/`;

let btnProductos = document.getElementById("productos").addEventListener("click", getAllProductos);
let btnProveedores = document.getElementById("proveedores").addEventListener("click", getAllProveedores);
let btnMovimientos = document.getElementById("movimientos").addEventListener("click", getAllMovimientos);
let productos = [];
let proveedores = [];
let movimientos = [];

async function getAllProductos() {
    try {
        const response = await fetch(BASE_URL + "productos");
        if (!response.ok) {
            throw new Error("Error al obtener los productos");
        }
        productos = await response.json();
        console.log(productos);  // Verifica los datos recibidos
        showMarcas();
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

function showMarcas() {
    let div = document.getElementById("filtrosMarca");
    div.innerHTML = "";

    console.log("Productos:", productos);  // Verifica si 'productos' tiene datos

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
                <input class="form-check-input" type="checkbox" value="${marca}" id="marca-${marca}">
                <label class="form-check-label" for="marca-${marca}">
                    ${marca}
                </label>
            </div>
        </div>`;
    });

    marcasHTML += `</div>`;  // Cerrar la fila

    div.innerHTML = marcasHTML;
}



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
        </div>
    `;
    div.innerHTML += encabezados;

    // Recorrer productos y crear filas
    productos.forEach(producto => {
        let html = `
        <div class="row mb-3 text-center">
            <div class="col-md-3">${producto.Marca || 'Marca no disponible'}</div>
            <div class="col-md-2">${producto.StockActual || 'Stock no disponible'}</div>
            <div class="col-md-2">${producto.Precio ? `$${producto.Precio}` : 'Precio no disponible'}</div>
            <div class="col-md-3">${producto.Tipo || 'Tipo no disponible'}</div>
        </div>
        `;
        div.innerHTML += html;
    });

    div.innerHTML += `<p class="mt-3 text-center"><small>Mostrando ${productos.length} Productos</small></p>`;
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
