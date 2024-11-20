<?php

require_once './Libs/response.php';
require_once './Libs/route.php';
require_once './App/Controllers/auth.controller.php';
require_once './App/Controllers/movimientosStock.controller.php';
require_once './App/Controllers/productos.controller.php';
require_once './App/Controllers/proveedores.controller.php';
require_once './App/Middlewares/jwt.auth.middleware.php';
require_once './Config/config.php';

//base_url para direcciones y base tag
define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$router = new Router();
$router->addMiddleware(new JWTAuthMiddleware());

// De Productos, Proveedores y Stock, Debere hacer un:
// Ver  / Ver por id
// Agregar  / Editar(Modificiar)
// Borrar

// Ver Productos
$router->addRoute('productos', 'GET', 'ProductosController', 'productos');
// Ver por id
$router->addRoute('productos/:id', 'GET', 'ProductosController', 'productosId');
// Agregar
$router->addRoute('productos', 'GET', 'ProductosController', 'agregar');
// Modificar
$router->addRoute('productos', 'GET', 'ProductosController', 'modificar');
// Borrar
$router->addRoute('productos', 'GET', 'ProductosController', 'borrar');


// Ver Proveedores
$router->addRoute('productos', 'GET', 'ProveedorController', 'proveedor');
// Ver por id
$router->addRoute('productos/:id', 'GET', 'ProveedorController', 'proveedorId');
// Agregar
$router->addRoute('productos', 'GET', 'ProveedorController', 'agregar');
// Modificar
$router->addRoute('productos', 'GET', 'ProveedorController', 'modificar');
// Borrar
$router->addRoute('productos', 'GET', 'ProveedorController', 'borrar');

// en un futuro Movimientos stock






