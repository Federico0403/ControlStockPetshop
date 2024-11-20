<?php

require_once './Config/config.php';

class ProductosModel {
    private $db;

    public function __construct(){
        $this->db = new PDO("mysql:host=" . MYSQL_HOST . ";dbname=" . MYSQL_DB . ";charset=utf8", MYSQL_USER, MYSQL_PASS);
    }

    public function getProductos(){
        $query = $this->db->prepare('SELECT * FROM productos');
    }

}