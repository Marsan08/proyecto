<%-- 
    Document   : insertarespecies
    Created on : 07-may-2021, 12:47:42
    Author     : Mar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            session = request.getSession();
            String sessionId = session.getId();
            if ((Boolean) session.getAttribute("usuarioValido")) {
                String user = (String) session.getAttribute("usuario");
                String pass = (String) session.getAttribute("contra");

                if ((controladores.Toolbox.rol(user, pass) == 1)) {
        %>

        <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="menu.jsp">Inicio</a></li>
                    <li><a href="menuparcela.jsp">Parcelas</a></li>
                    <li><a href="menuespecies.jsp">Especies</a></li>
                    <li class="active"><a href="menuanimales.jsp">Animales</a></li>
                    <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
                    <li><a href="menusuario.jsp">Usuarios</a></li>
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

                        <h1 style="margin-top: 70px;">Insertar plantacion</h1>

                        <form action=" controlador" method="post">
                            <input type="hidden" name="todo" value="inserplantacion">
                            <div id="tablasinsert" style="
                                 display: flex;
                                 justify-content: space-between;
                                 align-content: center;
                                 flex-direction: row;

                                 ">


                                <div style="margin: 5px;">

                                    <h3> Especie de la plantación </h3>
                                    <table class="table table-hover">                <thead>
                                            <tr>

                                                <th>Nombre especie</th>     
                                                <th>Seleccionar especie</th>


                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <%
                                                ClasesBD.EAgricolaBD.cargarEAgricola();

                                                for (int i = 0; i < ClasesBD.EAgricolaBD.EAgricolaSize(); i++) {

                                                    out.println("<tr>");
                                                    out.println("<td>" + ClasesBD.EAgricolaBD.getNombrePorEspecie(ClasesBD.EAgricolaBD.getIdEagricola(i)) + "</td>");
                                                    out.println("<td><input type='radio' name='idespecie' value=" + ClasesBD.EAgricolaBD.getIdEagricola(i) + "></td>");
                                                    out.println("</tr>");

                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>

                                <div style="margin: 5px;">
                                    <h3>Parcela de la plantacion</h3>

                                    <table class="table table-hover">
                                        <thead>
                                        <thead>
                                            <tr>
                                                <th>Referencia de la parcela</th>
                                                <th>Seleccionar parcela</th>

                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <%
                                                int iduser = ClasesBD.UsuarioBD.idUser(user);
                                                int idpropietario = ClasesBD.PropietarioBD.idProp(iduser);
                                                ClasesBD.PropietarioBD.cargarPAgricola(idpropietario);

                                                for (int i = 0; i < ClasesBD.PropietarioBD.pagricolaSize(); i++) {
                         

                                                    int idpagricola = ClasesBD.PropietarioBD.getIdpagricola(i);
                                                    int idagricola = ClasesBD.PropietarioBD.getIdagricola(i);

                                                    //out.println(ClasesBD.PAgricolaBD.buscarAgricola(idagricola));
                                                    out.println("<tr>");
                                                    out.println("<td>" + ClasesBD.ParcelaBD.sacarReferencia(idagricola) + "</td>");
                                                    out.println("<td> <input type='radio' name='idparcela' value=" + ClasesBD.PropietarioBD.getIdpagricola(i) + "> </td>");
                                                    out.println("</tr>");

                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>

                                <div style="margin: 5px;">
                                    <h3>Fecha plantacion</h3>

                                    <table class="table table-hover">
                                        <thead>
                                        <thead>
                                            <tr>

                                                <th>Fecha de plantacion</th>

                                            </tr>
                                        </thead>

                                        <tbody> 
                                            <tr>
                                                <td>
                                                    <input type="date" name="fecha"> 
                                                </td>
                                            </tr>


                                        </tbody>
                                    </table>

                                </div>
                            </div>

                            <div class="insermenu" style="    display: flex;
                                 justify-content: center;
                                 align-items: center;
                                 flex-direction: row;
                                 align-content: center;
                                 flex-wrap: wrap;
                                 width: 100%;">
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


    <% } else if (controladores.Toolbox.rol(user, pass) == 2) {%>





    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="menu.jsp">Inicio</a></li>
                <li  ><a href="menuparcela.jsp">Parcela</a></li>
                <li class="active"><a href="menuanimales.jsp">Animales</a></li>
                <li><a href="menuplantaciones.jsp">Plantaciones</a></li>

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

                    <h1 style="margin-top: 70px;">Insertar animal</h1>

                    <form action=" controlador" method="post">
                        <input type="hidden" name="todo" value="inserplantacion">
                        <div id="tablasinsert" style="
                             display: flex;
                             justify-content: space-between;
                             align-content: center;
                             flex-direction: row;

                             ">

                            <div style="margin: 5px;">

                                <h3>Especie de la plantación</h3>
                                <table class="table table-hover">                <thead>
                                        <tr>

                                            <th>Nombre especie</th>     
                                            <th>Seleccionar especie</th>


                                        </tr>
                                    </thead>
                                    <tbody> 
                                        <%
                                            ClasesBD.EAgricolaBD.cargarEAgricola();

                                            for (int i = 0; i < ClasesBD.EAgricolaBD.EAgricolaSize(); i++) {

                                                out.println("<tr>");
                                                out.println("<td>" + ClasesBD.EAgricolaBD.getNombrePorEspecie(ClasesBD.EAgricolaBD.getIdEagricola(i)) + "</td>");
                                                out.println("<td><input type='radio' name='idespecie' value=" + ClasesBD.EAgricolaBD.getIdEagricola(i) + "></td>");
                                                out.println("</tr>");

                                            }
                                        %>

                                    </tbody>
                                </table>
                            </div>


                            <div style="margin: 5px;">
                                <h3>Parcela de la plantacion</h3>

                                <table class="table table-hover">
                                    <thead>
                                    <thead>
                                        <tr>
                                            <th>Referencia de la parcela</th>
                                            <th>Seleccionar parcela</th>

                                        </tr>
                                    </thead>
                                    <tbody> 
                                        <%
                                            int iduser = ClasesBD.UsuarioBD.idUser(user);
                                            int idjornalero = ClasesBD.JornaleroBD.idJornalero(iduser);
                                            ClasesBD.JornaleroBD.cargarPAgricola(idjornalero);

                                            for (int i = 0; i < ClasesBD.JornaleroBD.parcelasAgricolasSize(); i++) {

                                                int idpagricola = ClasesBD.JornaleroBD.sacarIdParcelaDeAgricola(idjornalero);
                                                int idagricola = ClasesBD.JornaleroBD.getIdAparcela(i);

                                                //out.println(ClasesBD.PAgricolaBD.buscarAgricola(idagricola));
                                                out.println("<tr>");
                                                out.println("<td>" + ClasesBD.ParcelaBD.sacarReferencia(idpagricola) + "</td>");
                                                out.println("<td> <input type='radio' name='idparcela' value=" + ClasesBD.PAgricolaBD.buscarAgricola(idagricola) + "> </td>");
                                                out.println("</tr>");
                                                
                                            }

                                        %> 
                                    </tbody>
                                </table>
                            </div>

                            <div style="margin: 5px;">
                                <h3>Fecha plantacion</h3>

                                <table class="table table-hover">
                                    <thead>
                                    <thead>
                                        <tr>

                                            <th>Fecha de plantacion</th>

                                        </tr>
                                    </thead>

                                    <tbody> 
                                        <tr>

                                            <td> <input type="date"  name="fecha"> </td>

                                        </tr>


                                    </tbody>
                                </table>

                            </div>
                        </div>

                        <div class="insermenu" style="    display: flex;
                             justify-content: center;
                             align-items: center;
                             flex-direction: row;
                             align-content: center;
                             flex-wrap: wrap;
                             width: 100%;">
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

<h1>NO TIENES PERMISOS</h1>
<a href="index.jsp">Inicio</a>

<% }
} else { %>

<% }%>
</body>
</html>
