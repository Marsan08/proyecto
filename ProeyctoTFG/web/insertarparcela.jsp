<%-- Document : insertar Created on : 11-mar-2021, 0:59:15 Author : Mar --%>

<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                <![endif]-->

        <!-- Custom styles for this template -->

        <link href="css/css.css" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body style="width: auto">

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
                                <input type="submit" name="enviar" value="Enviar" class="boton">

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
</body>

</html>