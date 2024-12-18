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
        // Comprobar si se ha pasado el parámetro de marca en la URL
        if (isset($_GET['marca']) && !empty($_GET['marca'])) {
            $marcas = explode(",", $_GET['marca']);  // Convierte las marcas en un array
            // Obtener productos filtrados por marca
            $productos = $this->model->getProductosByMarca($marcas);
        } else {
            // Si no hay filtro, obtener todos los productos
            $productos = $this->model->getProductos();
        }
    
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
        if (empty($body['Nombre']) || empty($body['Marca']) || empty($body['Precio']) || empty($body['Descripcion']) ||
            empty($body['Tipo'])) {
            
            return $this->view->response('Faltan campos obligatorios', 400);
        }
    
        // Obtener los valores del body de la petición
        $nombre = $body['Nombre'];
        $marca = $body['Marca'];
        $precio = $body['Precio'];
        $descripcion = $body['Descripcion'];
        $tipo = $body['Tipo'];
    
        // Llamar al modelo para insertar el producto
        $idProducto = $this->model->insertProducto($nombre, $marca, $precio, $descripcion, $tipo);
    
        if ($idProducto) {
            return $this->view->response("Producto agregado con éxito con ID: $idProducto", 201);
        } else {
            return $this->view->response('Error al agregar el producto', 500);
        }
    }
    
    

    public function modificar($req, $res) {
        $body = $req->body;
        $id_producto = $req->params->id;
    
        // Validar los datos
        if (empty($body['Nombre']) || empty($body['Marca']) || empty($body['Tipo']) || 
            empty($body['Precio'])||
            empty($body['Descripcion'])) {
            return $this->view->response('Faltan campos obligatorios', 400);
        }
    
        // Llamar al modelo para actualizar el producto
        $this->model->updateProductos($id_producto, $body['Nombre'], $body['Marca'], $body['Tipo'], $body['Precio'], 
                                       $body['Descripcion']);
    
        // Obtener el producto actualizado
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