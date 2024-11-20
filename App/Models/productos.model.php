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

    public function insertProducto($nombre, $marca, $precio, $stockActual, $stockMinimo, $descripcion, $tipo, $fechaAlta) {
        // Inserta el producto en la base de datos
        $query = $this->db->prepare(
            'INSERT INTO productos (Nombre, Marca, Precio, StockActual, StockMinimo, Descripcion, Tipo, FechaAlta) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
        );
        $query->execute([$nombre, $marca, $precio, $stockActual, $stockMinimo, $descripcion, $tipo, $fechaAlta]);
    
        // Retorna el ID del producto insertado
        return $this->db->lastInsertId();
    }
    
    public function updateProductos($id_producto, $nombre_producto, $marca, $tipo, $precio, $stock_actual, $stock_minimo, $descripcion, $fecha_alta) {
        // Preparar la consulta para actualizar el producto
        $query = $this->db->prepare('UPDATE productos SET 
                                        Nombre = ?, 
                                        Marca = ?, 
                                        Tipo = ?, 
                                        Precio = ?, 
                                        StockActual = ?, 
                                        StockMinimo = ?, 
                                        Descripcion = ?, 
                                        FechaAlta = ? 
                                      WHERE IDProducto = ?');
    
        // Ejecutar la consulta con los parámetros correspondientes
        $query->execute([$nombre_producto, $marca, $tipo, $precio, $stock_actual, $stock_minimo, $descripcion, $fecha_alta, $id_producto]);
    }

    public function cleanProducto($id_producto){
        // Ejecutar el DELETE para eliminar el producto por su ID
        $query = $this->db->prepare('DELETE FROM productos WHERE IDProducto = ?');
        $query->execute([$id_producto]);
    }
    
    
}