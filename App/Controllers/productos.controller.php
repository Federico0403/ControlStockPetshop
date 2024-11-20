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
}