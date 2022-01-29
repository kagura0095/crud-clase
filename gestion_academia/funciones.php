<?php
class conectar_db{
    private $host = "localhost";
    private $usuario = "root";
    private $clave = "";
    private $db = "gestion_academia";
    public $conexion;
    
    public function __construct(){
        //El constructor lleva la conexión
        $this->conexion = new mysqli($this->host, $this->usuario, $this->clave, $this->db)
        or die(mysql_error());
        $this->conexion->set_charset("utf8");

    }

    //Consulta
    public function consultar($consulta){
        $resultado = $this->conexion->query($consulta) or die($this->conexion->error);
        if($resultado){
            return $resultado;
            // return $resultado->fetch_all(MYSQLI_ASSOC);
            return false;
        }
    }

    //contar resultados
    public function contar_resultados(){
        $resultado = $this->conexion->affected_rows;
        return $resultado;
    }
    
    //Cerrar
    public function cerrar(){
        $this->conexion->close();
    }
    
}
