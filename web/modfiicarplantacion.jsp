<%-- 
    Document   : modificaparcela
    Created on : 09-may-2021, 22:31:31
    Author     : Luis
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session = request.getSession();

    String user = (String) session.getAttribute("usuario");
    String pass = (String) session.getAttribute("contra");
    String sessionId = session.getId();
    if ((Boolean) session.getAttribute("usuarioValido")) {


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar plantación</title>
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

        <%        if (controladores.Toolbox.rol(user, pass) == 1) {
                int idplantacion = Integer.parseInt(request.getParameter("idplantacion"));

                session.setAttribute("idplantacion", idplantacion);
        %>


        <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="menu.jsp">Bienvenido <%=user%></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="menu.jsp">Inicio</a></li>
                    <li><a href="menuparcela.jsp">Parcelas</a></li>
                    <li><a href="menuespecie.jsp">Especies</a></li>
                    <li><a href="menuanimales.jsp">Animales</a></li>
                    <li class="active"><a href="menuplantaciones.jsp">Plantaciones</a></li>
                    <li><a href="menusuario.jsp">Usuarios</a></li>
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
                        <form action="controlador" method="POST" id="modificarplantacion">
                            <input type="hidden" name="todo" value="ejecutarUpdatePlantacion">
                            <h1 style="margin-top: 70px;">Modificar esta parcela</h1>
                            <br>
                            <table class="table table-hover">

                                <thead>
                                    <tr>

                                        <th>Fecha de plantacion</th>
                                        <th>Fecha de recogida</th>
                                        <th>Nombre de la especie plantada</th>
                                        <th>Referencia</th>


                                </thead>
                                <tbody> 

                                    <%
                                        out.println("<tr>");
                                        out.println("<td id='fplantacion' value=" + ClasesBD.PlantacionBD.sacarFPlantacion(idplantacion) + ">" + ClasesBD.PlantacionBD.sacarFPlantacion(idplantacion) + "</td>");
                                        out.println("<td><input type='date' name='frecogida' value=" + ClasesBD.PlantacionBD.sacarFRecogida(idplantacion) + " id='frecogida'></td>");
                                        out.println("<td>" + ClasesBD.EAgricolaBD.getIdnombre(ClasesBD.PlantacionBD.sacarEspecie(idplantacion)) + "</td>");

                                        int idparcela = ClasesBD.PAgricolaBD.sacarIdparcela(ClasesBD.PlantacionBD.sacarAgricola(idplantacion));

                                        out.println("<td>" + ClasesBD.ParcelaBD.sacarReferencia(idparcela) + "</td>");
                                        out.println("</tr>");
                                    %>
                                </tbody>
                            </table>
                            <div class="insermenu" style="    display: flex;
                                 justify-content: center;
                                 align-items: center;
                                 flex-direction: row;
                                 align-content: center;
                                 flex-wrap: wrap;
                                 width: 100%;">
                                <div id="divmplantacion"><input type="submit" name="enviar" value="Aceptar y cambiar" class="boton"></div>
                            </div>
                        </form>

                        <form action="controlador" method="post">

                            <input type="hidden" value="menu" name="todo">
                            <input type="submit" value="Menú principal" class="boton">
                        </form>

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
    font-size: small;">
            <p class="pull-right"><a href="#">Arriba</a></p>
            <p>  Gestiona tu parcela es una página creada para ayudar a la gestión de las parcelas agricoganaderas. </p>
        </footer>

    <% } else if (controladores.Toolbox.rol(user, pass) == 2) {

        int idplantacion = Integer.parseInt(request.getParameter("idplantacion"));

        session.setAttribute("idplantacion", idplantacion);

    %>

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="menu.jsp">Inicio</a></li>
                <li class="active" ><a href="menuparcela.jsp">Parcela</a></li>
                <li><a href="menuanimales.jsp">Animales</a></li>
                <li><a href="menuplantaciones.jsp">Plantaciones</a></li>

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
                    <form action="controlador" method="POST">
                        <input type="hidden" name="todo" value="ejecutarUpdatePlantacion">
                        <h1 style="margin-top: 70px;">Modificar esta parcela</h1>
                        <br>
                        <table class="table table-hover">

                            <thead>
                                <tr>

                                    <th>Fecha de plantacion</th>
                                    <th>Fecha de recogida</th>
                                    <th>Nombre de la especie plantada</th>
                                    <th>Referencia</th>


                            </thead>
                            <tbody> 

                                <%
                                    out.println("<tr>");
                                    out.println("<td id='fplantacion' value=" + ClasesBD.PlantacionBD.sacarFPlantacion(idplantacion) + ">" + ClasesBD.PlantacionBD.sacarFPlantacion(idplantacion) + "</td>");
                                    out.println("<td><input type='date' name='frecogida' value=" + ClasesBD.PlantacionBD.sacarFRecogida(idplantacion) + " id='frecogida'></td>");
                                    out.println("<td>" + ClasesBD.EAgricolaBD.getIdnombre(ClasesBD.PlantacionBD.sacarEspecie(idplantacion)) + "</td>");

                                    int idparcela = ClasesBD.PAgricolaBD.sacarIdparcela(ClasesBD.PlantacionBD.sacarAgricola(idplantacion));

                                    out.println("<td>" + ClasesBD.ParcelaBD.sacarReferencia(idparcela) + "</td>");
                                    out.println("</tr>");
                                %>
                            </tbody>
                        </table>
                        <div class="insermenu" style="    display: flex;
                             justify-content: center;
                             align-items: center;
                             flex-direction: row;
                             align-content: center;
                             flex-wrap: wrap;
                             width: 100%;">
                            <input type="submit" name="enviar" value="Aceptar y cambiar" class="boton">
                        </div>
                    </form>

                    <form action="controlador" method="post">

                        <input type="hidden" value="menu" name="todo">
                        <input type="submit" value="Menú principal" class="boton">
                    </form>

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
    font-size: small;">
            <p class="pull-right"><a href="#">Arriba</a></p>
            <p>  Gestiona tu parcela es una página creada para ayudar a la gestión de las parcelas agricoganaderas. </p>
        </footer>
<% } else{ %>


<META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">


<% }} else { %>


<META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">



<% }%>

<script type="module" src="js/validarModificarPlantacion.js"></script>

</body>

</html>
