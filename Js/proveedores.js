

export function showProveedores() {
    // Limpiar los filtros de marcas antes de mostrar los proveedores
    let filtrosMarcaDiv = document.getElementById("filtrosMarca");
    filtrosMarcaDiv.innerHTML = "";

    let div = document.getElementById("contenedorMostrar");
    div.innerHTML = "";

    // Crear una fila para los proveedores
    let proveedoresHTML = `<div class="">`;

    proveedores.forEach(proveedor => {
        proveedoresHTML += ` 
        <div class="">
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