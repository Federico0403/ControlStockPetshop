<?php

require_once './Config/config.php';

class ProveedoresModel {
    private $db;

    public function __construct(){
        $this->db = new PDO("mysql:host=" . MYSQL_HOST . ";dbname=" . MYSQL_DB . ";charset=utf8", MYSQL_USER, MYSQL_PASS);
    }

    public function getProveedores(){
        $query = $this->db->prepare('SELECT * FROM proveedor');
        $query->execute(); 
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }
    
    public function getProveedorId($id_proveedor){
        $query = $this->db->prepare('SELECT * FROM proveedor WHERE IDProveedor = ?');
        $query->execute([$id_proveedor]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function insertProveedor($nombreProveedor, $contacto, $direccion) {
        $query = $this->db->prepare(
            'INSERT INTO proveedor (NombreProveedor, Contacto, Direccion) 
            VALUES (?, ?, ?)'
        );
        $query->execute([$nombreProveedor, $contacto, $direccion]);
    
        return $this->db->lastInsertId();
    }
    
    public function updateProveedor($id_proveedor, $nombreProveedor, $contacto, $direccion) {
        $query = $this->db->prepare('UPDATE proveedor SET 
                                        NombreProveedor = ?, 
                                        Contacto = ?, 
                                        Direccion = ? 
                                      WHERE IDProveedor = ?');
        $query->execute([$nombreProveedor, $contacto, $direccion, $id_proveedor]);
    }

    public function deleteProveedor($id_proveedor){
        $query = $this->db->prepare('DELETE FROM proveedor WHERE IDProveedor = ?');
        $query->execute([$id_proveedor]);
    }
}
