<%@page import="java.sql.*" %>  
<%-- 
    Document   : menu animales
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
        <title>Menú animales</title>
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
                    <li class="active"><a href="menuanimales.jsp">Animales</a></li>
                    <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
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

                            <h1 style="margin-top: 70px;">Animales</h1>
                            <br>
                            <div class="insermenu" style="    display: flex;
                                 justify-content: space-between;
                                 align-items: center;
                                 flex-direction: row;
                                 align-content: center;
                                 flex-wrap: wrap;
                                 width: 50%">

                                <form action="controlador" method="post" id="irinsertanimal">

                                    <input type="hidden" value="irinsertanimal" name="todo"/>
                                    <input type="submit" value="Insertar un animal" class="boton">

                                </form>


                                <form action="controlador" method="post">

                                    <input type="hidden" value="menu" name="todo">
                                    <input type="submit" value="Menú principal" class="boton">
                                </form>

                            </div>
                            <br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>

                                        <th>Sexo del animal</th>
                                        <th>Especie del animal</th>
                                        <th>Número crotal del animal </th>
                                        <th>Referencia de la parcela</th>
                                        <th>Borrar</th>


                                    </tr>
                                </thead>
                                <tbody> 
                                    <%
                                        ClasesBD.AnimalBD.cargarAnimal();
                                        ClasesBD.ParcelaBD.cargarParcelas();
                                        ClasesBD.EGanaderaBD.cargarEGanadera();
                                        for (int i = 0; i < ClasesBD.AnimalBD.AnimalesSize(); i++) {
                                            int idparcela = ClasesBD.PGanaderaBD.sacarIdparcela(ClasesBD.AnimalBD.getIdparcela(i));

                                            out.println("<tr>");

                                            out.println("<td>" + ClasesBD.AnimalBD.getSexo(i) + "</td>");
                                            out.println("<td>" + ClasesBD.EGanaderaBD.getNombrePorEspecie(ClasesBD.AnimalBD.getIdeganadera(i)) + "</td>");
                                            out.println("<td>" + ClasesBD.AnimalBD.getIdCrotal(i) + "</td>");
                                            out.println("<td>" + ClasesBD.ParcelaBD.sacarReferencia(idparcela) + "</td>");
                                            out.println("<td><form action='controlador' method='post'><input type='hidden' value='ejecutarbanimal' name='todo'><input type='hidden' value=" + ClasesBD.AnimalBD.getId(i) + " name='idanimal'><input type='submit' value='Borrar' class='boton'></form></td>");
                                            out.print("</tr>");
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

            <p>  Gestiona tu parcela es una página creada para ayudar a la gestión de las parcelas agricoganaderas. </p>

            <p class="pull-right"><a href="#">Arriba</a></p>

        </footer>  


        <%
        } else if (controladores.Toolbox.rol(user, pass) == 2) {
        %>


        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="menu.jsp">Bienvenido <%=user%></a>
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

                            <h1 style="margin-top: 70px;">Animales</h1>
                            <br>
                            <div class="insermenu" style="    display: flex;
                                 justify-content: space-between;
                                 align-items: center;
                                 flex-direction: row;
                                 align-content: center;
                                 flex-wrap: wrap;
                                 width: 50%">

                                <form action="controlador" method="post" id="irinsertanimal">

                                    <input type="hidden" value="irinsertanimal" name="todo"/>
                                    <input type="submit" value="Insertar un animal" class="boton">

                                </form>


                                <form action="controlador" method="post">

                                    <input type="hidden" value="menu" name="todo">
                                    <input type="submit" value="Menú principal" class="boton">
                                </form>

                            </div>
                            <br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>

                                        <th>Sexo del animal</th>
                                        <th>Especie del animal</th>
                                        <th>Referencia de la parcela</th>
                                        <th>Borrar</th>


                                    </tr>
                                </thead>
                                <tbody> 
                                    <%
                                        ClasesBD.AnimalBD.cargarAnimal();
                                        ClasesBD.ParcelaBD.cargarParcelas();
                                        ClasesBD.EGanaderaBD.cargarEGanadera();

                                        int iduser = ClasesBD.UsuarioBD.idUser(user);
                                        int idjornalero = ClasesBD.JornaleroBD.idJornalero(iduser);
                                        ClasesBD.JornaleroBD.cargarPGanadera(idjornalero);
                                        ClasesBD.JornaleroBD.cargarAnimalesJornalero(idjornalero);

                                        for (int i = 0; i < ClasesBD.JornaleroBD.animalesSize(); i++) {

                                            //out.println(ClasesBD.JornaleroBD.idanimal(i)); 
                                            int idparcela = ClasesBD.PGanaderaBD.sacarIdparcela(ClasesBD.JornaleroBD.idparcela(i));
                                            out.println("<tr>");
                                            //out.println(ClasesBD.EGanaderaBD.getNombrePorEspecie(ClasesBD.AnimalBD.getIdeganadera(i)));
                                            out.println("<td>" + ClasesBD.JornaleroBD.sexoAnimal(i) + "</td>");
                                            out.println("<td>" + ClasesBD.EGanaderaBD.getNombrePorEspecie(ClasesBD.JornaleroBD.idespecie(i)) + "</td>");
                                            out.println("<td>" + ClasesBD.ParcelaBD.sacarReferencia(idparcela) + "</td>");
                                            out.println("<td><form action='controlador' method='post'><input type='hidden' value='ejecutarbanimal' name='todo'><input type='hidden' value=" + ClasesBD.JornaleroBD.idparcela(i) + " name='idanimal'><input type='submit' value='Borrar' class='boton'></form></td>");
                                            out.print("</tr>");
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

            <p>  Gestiona tu parcela es una página creada para ayudar a la gestión de las parcelas agricoganaderas. </p>

            <p class="pull-right"><a href="#">Arriba</a></p>

        </footer>  

        <%
        } else {%>

        <META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">

        <% }
        } else { %>

        <META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">

    </body>

</html>


<% }%>
