<%@page import="java.sql.*" %>  

<%-- 
    Document   : menu usuario
    Created on : 14/05/2021
    Author     : Mar
--%>

<%
    session = request.getSession();
    String sessionId = session.getId();
    String user = (String) session.getAttribute("usuario");
    String pass = (String) session.getAttribute("contra");
    if ((Boolean) session.getAttribute("usuarioValido")) {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Men� usuarios</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/css.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */ 
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }

            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {height: 450px}

            /* Set gray background color and 100% height */
            .sidenav {
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height:auto;} 
            }
        </style>
    </head>

    <body>

        <%
            if (controladores.Toolbox.rol(user, pass) == 1) {

                int idusuario = ClasesBD.UsuarioBD.idUser(user);
        %>

        <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="menu.jsp">Inicio</a></li>
                    <li><a href="menuparcela.jsp">Parcelas</a></li>
                    <li><a href="menuespecie.jsp">Especies</a></li>
                    <li><a href="menuanimales.jsp">Animales</a></li>
                    <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
                    <li class="active"><a href="menusuario.jsp">Usuarios</a></li>
                    <li><a href="menutrabaja.jsp">Asignar</a></li>
                </ul>
                <ul class="salir" style="float: right; margin: 10px; ">
                    <li><form method="post" action="controlador"><input type="submit" name="todo" value="Cerrar" class="salir" style="-webkit-border-radius:20px;
                                                                        -webkit-border-radius: 20px;
                                                                        -moz-border-radius: 20px;
                                                                        color: #FFFFFF;
                                                                        padding: 10px;
                                                                        border-style-hover: solid;
                                                                        border-width-hover: 1;
                                                                        background-color: #e67e7e;
                                                                        border: none;"></li></form>
                </ul>
            </div>
        </nav>

        <div class="container-fluid text-center" style="margin-top: 100px; background-color: rgba(255, 255, 255, 0.8); padding: 30px;">    
            <div class="row content">

                <div class="col-sm-8 text-left"> 

                    <div class="container" >

                        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">

                                <div class="item active">
                                    <img src="img/carrusel1.jpg" alt="Campo" style="width:100%;">
                                    <div class="carousel-caption">

                                    </div>
                                </div>

                                <div class="item">
                                    <img src="img/carrusel2.jpg" alt="Vacas" style="width:100%;">
                                    <div class="carousel-caption">

                                    </div>
                                </div>

                                <div class="item">
                                    <img src="img/carrusel3.jpg" alt="Vacas" style="width:100%;">
                                    <div class="carousel-caption">

                                    </div>
                                </div>

                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Anterior</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Siguiente</span>
                            </a>
                        </div>
                    </div>
                    <div class="centrar">
                        <div class="centrartabla">

                            <h1 style="margin-top: 70px;">Usuarios</h1>
                            <br>

                            <div class="insermenu" style="    display: flex;
                                 justify-content: space-between;
                                 align-items: center;
                                 flex-direction: row;
                                 align-content: center;
                                 flex-wrap: wrap;
                                 width: 100%;
                                 margin: 5px; ">

                                <form action="controlador" method="post" id="irinsertarusuario">

                                    <input type="hidden" value="irinsertarusuario" name="todo"/>
                                    <input type="submit" value="Insertar otro usuario" class="boton">

                                </form>

                                <form action='controlador' method='post'>
                                    <input type='hidden' value='modificarusuario' name='todo'>
                                    <input type='hidden' name='idusuario' value="<%=idusuario%>">
                                    <input type='submit' name='modificarusuario' value='Modificar mi contrase�a' class='boton'>
                                </form>

                                <form action="controlador" method="post">

                                    <input type="hidden" value="menu" name="todo">
                                    <input type="submit" value="Men� principal" class="boton">
                                </form>


                            </div>


                            <br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>

                                        <th>Nombre de usuario</th>
                                        <th>Correo electr�nico</th>
                                        <th>DNI</th>
                                        <th>Tel�fono</th>
                                        <th>Tipo de usuario</th>
                                        <th>Modificar contrase�a</th>
                                        <th>Modificar datos</th>

                                        <th>Borrar</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                    <%
                                        ClasesBD.UsuarioBD.cargarUsuarios();

                                        for (int i = 0; i < ClasesBD.UsuarioBD.UsuariosSize(); i++) {

                                            out.println("<tr>");
                                            out.println("<td>" + ClasesBD.UsuarioBD.nombreuser(i) + "</td>");
                                            out.println("<td>" + ClasesBD.UsuarioBD.email(i) + "</td>");
                                            out.println("<td>" + ClasesBD.UsuarioBD.dniuser(i) + "</td>");
                                            out.println("<td>" + ClasesBD.UsuarioBD.telefono(i) + "</td>");
                                            out.println("<td>" + ClasesBD.UsuarioBD.sacarNombreRol(ClasesBD.UsuarioBD.idrol(i)) + "</td>");
                                            out.println("<td><form action='controlador' method='post'><input type='hidden' value='modificarcontra' name='todo'><input type='hidden' name='idusuario' value=" + ClasesBD.UsuarioBD.idusuario(i) + "><input type='submit' name='modificarcontra' value='Modificar contrase�a' class='boton'></form></td>");
                                            out.println("<td><form action='controlador' method='post'><input type='hidden' value='modificardatos' name='todo'><input type='hidden' name='idusuario' value=" + ClasesBD.UsuarioBD.idusuario(i) + "><input type='submit' name='modificardatos' value='Modificar datos' class='boton'></form></td>");
                                            out.println("<td><form action='controlador' method='post'><input type='hidden' value='ejecutarbusuario' name='todo'><input type='hidden' name='idusuario' value=" + ClasesBD.UsuarioBD.idusuario(i) + "><input type='submit' name='borrarusuario' value='Borrar' class='boton'></form></td>");
                                            out.println("</tr>");
                                        }

                                    %>


                                </tbody>
                            </table>






                        </div>
                    </div>
                </div>



            </div>
        </div>


        <footer style="color: black;
                margin: 50px;
                background-color: rgba(255, 255, 255, 0.65);
                width: 50%;
                height: 5%;
                font-size: small; height: 100px;display: flex;flex-direction: column;flex-wrap: nowrap;align-content: center;justify-content: space-between;align-items: center;color: black;padding: 20px;background-color: #ffffffc7;"">

            <p>  Gestiona tu parcela es una p�gina creada para ayudar a la gesti�n de las parcelas agricoganaderas. </p>

            <p class="pull-right"><a href="#">Arriba</a></p>

        </footer>  


        <% } else {%>


        <META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">


        <% }
        } else { %>


        <META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">

    </body>




</html>


<% }%>
