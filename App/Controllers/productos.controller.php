<?php 

require_once './App/Models/productos.model.php';
require_once './App/Views/json.view.php';

class ProductosController{
    private $model;
    private $view;

    public function __construct(){
        $this->model = new ProductosModel();
        $this->view = new JSONView();
    }

    public function productos(){
        $productos = $this->model->getProductos();
        return $this->view->response($productos);
    }

    public function productosId($req, $res){
        $id_productos = $req->params->id;
        $productoId = $this->model->getProductosId($id_productos);
        $this->view->response($productoId);
    }

    public function agregar($req, $res) {
        $body = $req->body;
    
        // Asegúrate de que todos los campos estén presentes en el body
        if (empty($body['Nombre']) || empty($body['Marca']) || empty($body['Precio']) ||
            empty($body['StockActual']) || empty($body['StockMinimo']) || empty($body['Descripcion']) ||
            empty($body['Tipo']) || empty($body['FechaAlta'])) {
            
            return $this->view->response('Faltan campos obligatorios', 400);
        }
    
        // Obtener los valores del body de la petición
        $nombre = $body['Nombre'];
        $marca = $body['Marca'];
        $precio = $body['Precio'];
        $stockActual = $body['StockActual'];
        $stockMinimo = $body['StockMinimo'];
        $descripcion = $body['Descripcion'];
        $tipo = $body['Tipo'];
        $fechaAlta = $body['FechaAlta'];
    
        // Llamar al modelo para insertar el producto
        $idProducto = $this->model->insertProducto($nombre, $marca, $precio, $stockActual, $stockMinimo, $descripcion, $tipo, $fechaAlta);
    
        if ($idProducto) {
            return $this->view->response("Producto agregado con éxito con ID: $idProducto", 201);
        } else {
            return $this->view->response('Error al agregar el producto', 500);
        }
    }
    
    

    public function modificar($req, $res){
    
        $body = $req->body;
        $id_producto = $req->params->id;
    
        // Obtengo el producto específico por id
        $producto = $this->model->getProductosId($id_producto);
    
        if (!$producto) {
            return $this->view->response("No existe el producto con el id = $id_producto", 404);
        }
    
        // Validación de los campos del formulario
        if (empty($body['Nombre'])) {
            return $this->view->response('Falta completar el nombre del producto', 404);
        }
        if (empty($body['Marca'])) {
            return $this->view->response('Falta completar la marca del producto', 404);
        }
        if (empty($body['Tipo'])) {  // Asegurando que 'Tipo' sea enviado
            return $this->view->response('Falta completar el tipo del producto', 404);
        }
        if (empty($body['Precio'])) {
            return $this->view->response('Falta completar el precio del producto', 404);
        }
        if (empty($body['StockActual'])) {
            return $this->view->response('Falta completar la cantidad actual en stock', 404);
        }
        if (empty($body['StockMinimo'])) {
            return $this->view->response('Falta completar la cantidad mínima en stock', 404);
        }
        if (empty($body['Descripcion'])) {
            return $this->view->response('Falta completar la descripción del producto', 404);
        }
        if (empty($body['FechaAlta'])) {  // Asegurando que 'FechaAlta' esté presente
            return $this->view->response('Falta completar la fecha de alta del producto', 404);
        }
    
        // Obtengo los datos del formulario
        $nombre_producto = $body['Nombre'];
        $marca = $body['Marca'];
        $tipo = $body['Tipo'];
        $precio = $body['Precio'];
        $stock_actual = $body['StockActual'];
        $stock_minimo = $body['StockMinimo'];
        $descripcion = $body['Descripcion'];
        $fecha_alta = $body['FechaAlta'];  // Tomando la fecha desde el body
    
        // Llamo al modelo para actualizar los datos
        $this->model->updateProductos($id_producto, $nombre_producto, $marca, $tipo, $precio, $stock_actual, $stock_minimo, $descripcion, $fecha_alta);
    
        // Obtengo el producto actualizado
        $producto = $this->model->getProductosId($id_producto);
    
        return $this->view->response($producto);
    }

    public function borrar($req, $res){
        $id_producto = $req->params->id;
        $producto = $this->model->getProductosId($id_producto);
        
        if (!$producto) {
            return $this->view->response("No existe este producto", 404);
        }
    
        // Llamar al modelo para borrar el producto
        $this->model->cleanProducto($id_producto);
        
        return $this->view->response("Producto eliminado correctamente", 200);
    }
    
    
    
}