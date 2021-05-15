<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css.css" rel="stylesheet" type="text/css">
        
    </head>

    <%
        session = request.getSession();
        String sessionId = session.getId();
        session.setAttribute("estado", "autenticado");
        session.setAttribute("usuarioValido", false);
    %>
    <body>
        <header></header>
        <div><h1>Bienvenido a Gestiona tu parcela</h1></div>

        <div id="inicio">

            <h3> Iniciar sesi&oacute;n </h3>
            <form action="controlador" method="post" class="form">
                <p>Nombre de usuario </p>
                <input type="text" name="user">
                <p>Contraseña </p>
                <input type="password" name="pass">
                <br>
                <br>
                <input type="submit" name="Enviar" value="Enviar" class="boton">
                <div id="pie"><p>Si no puede iniciar sesi&oacute;n por favor contacte con su administrador o propietario.</p> </div>
            </form>
        </div>
        <footer> <p>PONER ENLACES DE INTERES O POLITICAS DE PRIVACIDAD
            </p></footer>
    </body>
</html>
