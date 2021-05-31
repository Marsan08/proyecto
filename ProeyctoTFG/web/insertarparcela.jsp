<%-- Document : insertar Created on : 11-mar-2021, 0:59:15 Author : Mar --%>

<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/css.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin="" />
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
        crossorigin=""></script>

        <style>
            #mapa{
                height: 15vh;
                width: 20vw;
            }


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

            String usuario = (String) session.getAttribute("usuario");
            String contra = (String) session.getAttribute("contra");

            if ((Boolean) session.getAttribute("usuarioValido")) {
                if (controladores.Toolbox.rol(usuario, contra) == 1) {

                    int iduser = controladores.Toolbox.idUser(usuario);

                    int idpropietario = controladores.Toolbox.idProp(iduser);

                    ClasesBD.EstadoBD.cargarEstados();
                    ClasesBD.TipoBD.cargarTipos();


        %>



        <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Bienvenido <%=usuario%></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="menu.jsp">Inicio</a></li>
                    <li class="active"><a href="menuparcela.jsp">Parcelas</a></li>
                    <li><a href="menuespecies.jsp">Especies</a></li>
                    <li><a href="menuanimales.jsp">Animales</a></li>
                    <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
                    <li><a href="menusuarios.jsp">Usuarios</a></li>
                </ul>
                <ul
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

                        <h1 style="margin-top: 70px;">Insertar parcela</h1>

                        <form action=" controlador" method="post">
                            <input type="hidden" name="todo" value="ejecutarpinsert">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>HECTAREAS</th>
                                        <th>PROPIETARIO DE LA PARCELA</th>
                                        <th>TIPO PARCELA</th>
                                        <th>ESTADO DE LA PARCELA</th>
                                        <th>REFERENCIA DE LA PARCELA</th>
                                        <th>UBICACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="hectareas"></td>
                                        <td>
                                            <p>

                                                <%= usuario%>

                                            </p>
                                        </td>
                                        <td>
                                            <select name="idtipoparcela">
                                                <%

                                                    //CERRAMOS LA CONSULTA ANTERIOR
                                                    //CREAMOS UNA CONSULTA QUE SAQUE LOS ESTADOS COMO EN EL TIPO DE PARCELA
                                                    for (int i = 0; i < ClasesBD.TipoBD.tiposSize(); i++) {

                                                        out.println("<option value=" + ClasesBD.TipoBD.getId(i) + "> " + ClasesBD.TipoBD.getNombre(i) + "</option>");

                                                    }

                                                    //MIENTRAS HAYA ESTADOS SE SACAN (SE SACA EL NOMBRE Y SE GUARDA EL VALOR)

                                                %>



                                                <%
                                                %>
                                            </select>
                                        </td>

                                        <td>
                                            <select name="idestado">
                                                <%                                                    //CERRAMOS LA CONSULTA ANTERIOR
                                                    //CREAMOS UNA CONSULTA QUE SAQUE LOS ESTADOS COMO EN EL TIPO DE PARCELA
                                                    for (int i = 0; i < ClasesBD.EstadoBD.estadosSize(); i++) {

                                                        out.println("<option value=" + ClasesBD.EstadoBD.getId(i) + "> " + ClasesBD.EstadoBD.getNombre(i) + "</option>");

                                                    }
                                                %>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" name="referencia">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="insermenu" style="    display: flex;
                                 justify-content: center;
                                 align-items: center;
                                 flex-direction: row;
                                 align-content: center;
                                 flex-wrap: wrap;
                                 width: 100%;">
                                <div id="mapa"></div>
                                <input type="hidden" value="" name="cordX">
                                <input type="hidden" value="" name="cordY">
                                <input type="submit" name="enviar" value="Aceptar e insertar" class="boton">

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
    <% } else { %>
    <h1>NO TIENES ACCESO</h1>
    <a href="index.jsp">Inicio</a>
    <% }
    } else { %>
    <h1>NO TIENES ACCESO</h1>
    <a href="index.jsp">Inicio</a>
    <% }%>
    <script >
        var mymap = L.map('mapa').setView([51.505, -0.09], 13);
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
            maxZoom: 18,
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1,
            accessToken: 'your.mapbox.access.token'
        }).addTo(mymap);
    </script>
</body>

</html>