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

function showProductos() {
    let div = document.getElementById("contenedorMostrar");
    div.innerHTML = "";
    productos.forEach(producto => {
        let html = ` 
        <div class="col-md-4 mb-4">
            <div class='card'>
                <div class='card-body'>
                    <h5 class='card-title'>
                        <a href='#' data-id='${producto.IDProducto}' class='text-decoration-none titulo text-danger btnDetail'>${producto.Nombre || 'Nombre no disponible'}</a>
                    </h5>
                    <p class='card-text'>Marca: ${producto.Marca || 'Marca no disponible'}</p>
                    <p class='card-text'>Stock Actual: ${producto.StockActual || 'Stock no disponible'}</p>
                    <p class='card-text'>Precio: ${producto.Precio || 'Precio no disponible'}</p>
                    <p class='card-text'>Tipo: ${producto.Tipo || 'Tipo no disponible'}</p>
                </div>
            </div>
        </div>`;
        div.innerHTML += html;
    });
    div.innerHTML += `<p class="mt-3 text-center"><small>Mostrando ${productos.length} Productos</small></p>`;
}



function showProveedores() {
    let div = document.getElementById("contenedorMostrar");
    div.innerHTML = "";
    proveedores.forEach(proveedor => {
        let html = ` 
        <div class="col-md-4 mb-4">
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
        div.innerHTML += html;
    });
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
