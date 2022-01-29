<?php

include("funciones.php");

if($_POST) {
    // var_dump($_POST);
    $nombre_usuario = $_POST["nombre_usuario"];
    $apellido1_usuario = $_POST["apellido1_usuario"];
    $apellido2_usuario = $_POST["apellido2_usuario"];
    $email_usuario = $_POST["email_usuario"];
    $telefono_usuario = $_POST["telefono_usuario"];
    $dni_usuario = $_POST["dni_usuario"];
    $password_usuario = $_POST["password_usuario"];

    //Generar token
    $token = rand(1000000, 9999999);

    //conexion a la base de datos
    $conexion_registro = new conectar_db();

    //comprobar primero si usuario existe

    $query_insertar_usuario = "INSERT INTO usuarios (nombre_usuario, apellido1_usuario, apellido2_usuario, email_usuario,telefono_usuario, dni_usuario, password_usuario, tipo_usuario, activo, token)
    VALUES ('$nombre_usuario', '$apellido1_usuario', '$apellido2_usuario', '$email_usuario','$telefono_usuario', '$dni_usuario', '$password_usuario', 'usuario', 0, $token)";

    $consulta_insertar_usuario = $conexion_registro->consultar($query_insertar_usuario);
    
    //cerrar sesion
    $conexion_registro->cerrar();

    if($consulta_insertar_usuario) {
        header("location:activar_registro.php?token=$token&email_usuario=$email_usuario");
    }
}