<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS boots -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- CSS custom -->
<link rel="stylesheet" href="css/styles.css"> 
<!-- JavaScript Bundle with Popper boots -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/script.js"></script>

<?php include("funciones.php");?>

    <title>LOGIN</title>
</head>
<body>
    <h1 class="display-4 d-flex justify-content-center">login de nuevo usuario</h1>

    <div class="row justify-content-md-center">

    <form id="formulario_login" method="POST" action="validar_login.php" class="needs-validation col-6" novalidate>
  
    <div class="mb-1">
        <label for="email_usuario" class="form-label">Email de usuario</label>
        <input type="email" class="form-control" id="email_usuario" name="email_usuario" aria-describedby="email_usuario_help" required>
        <div id="email_usuario_help" class="form-text">Introduzca su email</div>
        <div class="invalid-feedback">
            Por favor introduce tu email
        </div>
    </div>

    <div class="mb-1">
        <label for="password_usuario" class="form-label">Contraseña de usuario</label>
        <input type="password" class="form-control" id="password_usuario" name="password_usuario" aria-describedby="password_usuario_help" required>
        <div id="password_usuario_help" class="form-text">Introduzca su contraseña</div>
        <div class="invalid-feedback">
            Por favor introduce tu contraseña
        </div>
    </div>

    <button type="submit" class="btn btn-outline-dark">Enviar</button>
    </form>
    </div> 

</body>
</html>