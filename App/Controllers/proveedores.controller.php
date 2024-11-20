<?php

require_once './App/Models/proveedores.model.php';
require_once './App/Views/json.view.php';

class ProveedoresController {
    private $model;
    private $view;

    public function __construct(){
        $this->model = new ProveedoresModel();
        $this->view = new JSONView();
    }

    public function proveedor($req, $res){
        $proveedores = $this->model->getProveedores();
        return $this->view->response($proveedores); 
    }

    public function proveedorId($req, $res){
        $id_proveedor = $req->params->id;
        $proveedor = $this->model->getProveedorId($id_proveedor);
        
        if (!$proveedor){
            return $this->view->response("Proveedor no encontrado", 404);
        }
        
        return $this->view->response($proveedor);
    }

    public function agregar($req, $res){
        $body = $req->body;

        if (empty($body['NombreProveedor']) || empty($body['Contacto']) || empty($body['Direccion'])) {
            return $this->view->response('Faltan datos para agregar el proveedor', 400);
        }

        $nombreProveedor = $body['NombreProveedor'];
        $contacto = $body['Contacto'];
        $direccion = $body['Direccion'];

        $idProveedor = $this->model->insertProveedor($nombreProveedor, $contacto, $direccion);

        return $this->view->response("Proveedor agregado con éxito, ID: $idProveedor", 201);
    }

    public function modificar($req, $res){
        $id_proveedor = $req->params->id;
        $body = $req->body;

        $proveedor = $this->model->getProveedorId($id_proveedor);
        
        if (!$proveedor){
            return $this->view->response("Proveedor no encontrado", 404);
        }

        // Validación de los campos obligatorios
        if (empty($body['NombreProveedor']) || empty($body['Contacto']) || empty($body['Direccion'])) {
            return $this->view->response('Faltan datos para modificar el proveedor', 400);
        }

        $nombreProveedor = $body['NombreProveedor'];
        $contacto = $body['Contacto'];
        $direccion = $body['Direccion'];

        // Llamar al modelo para actualizar el proveedor
        $this->model->updateProveedor($id_proveedor, $nombreProveedor, $contacto, $direccion);
        
        // Retornar el proveedor actualizado
        $proveedor = $this->model->getProveedorId($id_proveedor);
        return $this->view->response($proveedor);
    }

    public function borrar($req, $res){
        $id_proveedor = $req->params->id;
        $proveedor = $this->model->getProveedorId($id_proveedor);
        
        if (!$proveedor){
            return $this->view->response("Proveedor no encontrado", 404);
        }

        // Llamar al modelo para eliminar el proveedor
        $this->model->deleteProveedor($id_proveedor);

        return $this->view->response("Proveedor eliminado correctamente");
    }
}
