<?php

require_once './Config/config.php';

class ProductosModel {
    private $db;

    public function __construct(){
        $this->db = new PDO("mysql:host=" . MYSQL_HOST . ";dbname=" . MYSQL_DB . ";charset=utf8", MYSQL_USER, MYSQL_PASS);
    }

    public function getProductos(){
        $query = $this->db->prepare('SELECT * FROM productos');
        $query->execute(); // Ejecutar la consulta
        return $query->fetchAll(PDO::FETCH_OBJ); // Retornar todos los productos como un arreglo asociativo
    }
    
    public function getProductosId($id_productos){
        $query = $this->db->prepare('SELECT * FROM productos WHERE IDProducto = ?');
        $query->execute([$id_productos]);
        
        // Devolver el primer resultado, que debe ser la película con ese ID
        return $query->fetch(PDO::FETCH_OBJ);
    }
}