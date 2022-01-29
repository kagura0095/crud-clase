<?php

include("funciones.php");

// valida el usuario a traves de un token aleatorio y su email
$token = $_GET["token"];
$email_usuario = $_GET["email_usuario"];

$conexion_validacion = new conectar_db();

$query_validar_usuario = "UPDATE usuarios SET activo = 1 
WHERE email_usuario = '$email_usuario'
AND token = '$token'";

$consulta_validar_usuario = $conexion_validacion->consultar($query_validar_usuario);

if($conexion_validacion->contar_resultados()>0){
    header("location:login.php");
}else {
 echo "<h1>ERROR. Pongase en contacto con el sistema</h1>";
}