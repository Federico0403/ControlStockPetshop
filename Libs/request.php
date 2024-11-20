<?php
class request{
    public $body= null;
    public $params=null;
    public $query=null;

    public function __construct(){
        try {
            $this->body = json_decode(file_get_contents('php://input'), true); // Cambia a true para un array asociativo
        } catch (Exception $e) {
            $this->body= null;
        }
        $this->query = (object) $_GET;
    }
}