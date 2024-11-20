<?php

require_once './Libs/response.php';
require_once './Libs/route.php';
require_once './App/Controllers/auth.controller.php';
require_once './App/Controllers/movimientosStock.controller.php';
require_once './App/Controllers/productos.controller.php';
require_once './App/Controllers/proveedores.controller.php';
require_once './App/Middlewares/jwt.auth.middleware.php';
require_once './Config/config.php';

// Definir base_url para direcciones y base tag
define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$router = new Router();
$router->addMiddleware(new JWTAuthMiddleware());

// Productos
$router->addRoute('productos', 'GET', 'ProductosController', 'productos');  // Ver todos los productos
$router->addRoute('productos/:id', 'GET', 'ProductosController', 'productosId');  // Ver producto por ID
$router->addRoute('productos', 'POST', 'ProductosController', 'agregar');  // Agregar un nuevo producto
$router->addRoute('productos/:id', 'PUT', 'ProductosController', 'modificar');  // Modificar producto
$router->addRoute('productos/:id', 'DELETE', 'ProductosController', 'borrar');  // Borrar producto

// Proveedores
$router->addRoute('proveedores', 'GET', 'ProveedorController', 'proveedor');  // Ver todos los proveedores
$router->addRoute('proveedores/:id', 'GET', 'ProveedorController', 'proveedorId');  // Ver proveedor por ID
$router->addRoute('proveedores', 'POST', 'ProveedorController', 'agregar');  // Agregar nuevo proveedor
$router->addRoute('proveedores/:id', 'PUT', 'ProveedorController', 'modificar');  // Modificar proveedor
$router->addRoute('proveedores/:id', 'DELETE', 'ProveedorController', 'borrar');  // Borrar proveedor

$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
// En un futuro, puedes agregar rutas para Movimientos de Stock

