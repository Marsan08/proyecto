 
<%-- 
    Document   : pagina de error
    Created on : 14/05/2021
    Author     : Mar
--%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<!-- PRINCIPIO DEL PROGRAMA INDEX

En está página se comprueba que el usuario ingresa los datos adecuadamente, 
los datos introducidos en el formulario de login van al principio del controlador donde se realiza la verificación 
sobre la base de datos con los métodos creados en el Toolbox de validacion y de encriptado de contraseña.


Se han utilizado estilos de Boostrap además de ingresar algunos estilos manualmente para un mejor diseño de la página.

-->
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/carousel/">

    <title>Gestiona tu parcela</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    
    <link href="css/css.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;400&display=swap" rel="stylesheet">
</head>
<%      
        //Aquí se inicia la sesion y se restablecen por si acaso los valores de estado (que nos servirá para navegar por el controlador) y de usuario valido.
        session = request.getSession();
        String sessionId = session.getId();
        session.setAttribute("estado", "autenticado");
        session.setAttribute("usuarioValido", false);
    %>
    
    <body id="error" style="display: flex; align-content: center; align-items: center; justify-content: center;">
        <header></header>
        

        <div id="inicio" style="display: flex; align-content: center; align-items: center; justify-content: center;">
            
            <h2> No puedes entrar aquí </h2>
            
            <p> ¡Vaya! Has intentado entrar en una página a la que no tienes acceso.
                <br>
                <br>
                Por seguridad si tenía una sesión iniciada se ha cerrado y debe volver a iniciarla. </p>
            <form action="index.jsp">
                
            <input type="submit" class="boton" value=" Inicio ">
            
            </form>
        </div> 
     

        
        <!-- /.container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
        <script>
            window.jQuery || document.write('<script src="js/vendor/jquery.min.js"><\/script>')
        </script>
        <script src="dist/js/bootstrap.min.js"></script>
        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        <script src="assets/js/vendor/holder.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>
    </body>

</html>