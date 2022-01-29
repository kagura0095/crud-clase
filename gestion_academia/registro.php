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

    <title>Registro</title>
</head>
<body>
    <h1 class="display-4 d-flex justify-content-center">Registro de nuevo usuario</h1>

    <h4 class="display-7 text-muted d-flex justify-content-center">Todos los campos son obligatorios</h4>

    <div class="row justify-content-md-center">

    <form id="formulario_registro" method="POST" action="validar_registro.php" class="needs-validation col-6" novalidate>
    <div class="mb-1">
        <label for="nombre_usuario" class="form-label">Nombre de usuario</label>
        <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" aria-describedby="nombre_usuario_help" required>
        <div id="nombre_usuario_help" class="form-text">Introduzca su nombre</div>
        <div class="invalid-feedback">
            Por favor introduce tu nombre
        </div>
    </div>

    <div class="mb-1">
        <label for="apellido1_usuario" class="form-label">Primer apellido de usuario</label>
        <input type="text" class="form-control" id="apellido1_usuario" name="apellido1_usuario" aria-describedby="apellido1_usuario_help" required>
        <div id="apellido1_usuario_help" class="form-text">Introduzca su primer apellido</div>
        <div class="invalid-feedback">
            Por favor introduce tu nombre
        </div>
    </div>

    <div class="mb-1">
        <label for="apellido2_usuario" class="form-label">Segundo apellido de usuario</label>
        <input type="text" class="form-control" id="apellido2_usuario" name="apellido2_usuario" aria-describedby="apellido2_usuario_help">
        <div id="apellido2_usuario_help" class="form-text">Introduzca su segundo apellido</div>
    </div>

    <div class="mb-1">
        <label for="email_usuario" class="form-label">Email de usuario</label>
        <input type="email" class="form-control" id="email_usuario" name="email_usuario" aria-describedby="email_usuario_help" required>
        <div id="email_usuario_help" class="form-text">Introduzca su email</div>
        <div class="invalid-feedback">
            Por favor introduce tu email
        </div>
    </div>

    <div class="mb-1">
        <label for="telefono_usuario" class="form-label">Teléfono de usuario</label>
        <input type="number" class="form-control" id="telefono_usuario" name="telefono_usuario"  aria-describedby="telefono_usuario_help" required>
        <div id="telefono_usuario_help" class="form-text">Introduzca su teléfono</div>
        <div class="invalid-feedback">
            Por favor introduce tu telefono
        </div>
    </div>

    <div class="mb-1">
        <label for="dni_usuario" class="form-label">DNI de usuario</label>
        <input type="text" class="form-control" id="dni_usuario"  name="dni_usuario" aria-describedby="dni_usuario_help" required>
        <div id="dni_usuario_help" class="form-text">Introduzca su DNI</div>
        <div class="invalid-feedback">
            Por favor introduce tu DNI
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

    <div class="mb-1">
        <label for="passwordr_usuario" class="form-label">Repita su contraseña</label>
        <input type="password" class="form-control" id="passwordr_usuario" name="passwordr_usuario" aria-describedby="passwordr_usuario_help" required>
        <div id="passwordr_usuario_help" class="form-text">Las contraseñas deben coincidir</div>
        <div class="invalid-feedback">
            Las contraseñas deben coincidir
        </div>
    </div>

    <button type="submit" class="btn btn-outline-dark">Enviar</button>
    </form>
    </div> 

    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        //dni validate
        if(!nif(document.getElementById("dni_usuario").value)) {
            event.preventDefault()
          event.stopPropagation()
          document.getElementById("dni_usuario").value = "";
        }

        //password validate
        if (document.getElementById("password_usuario").value != document.getElementById("passwordr_usuario").value) {
          event.preventDefault()
          event.stopPropagation()
          document.getElementById("password_usuario").value="";
          document.getElementById("passwordr_usuario").value="";
        } 

        //validate all the form
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
       
        form.classList.add('was-validated')
      }, false)
    })
})()
    </script>
</body>
</html>