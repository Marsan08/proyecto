<%--
    Document   : menu
    Created on : 10-mar-2021, 23:25:05
    Author     : Mar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    //En el menu principal se toman las variables de sesion usuario y contraseña
    //Tambien se verifica que la variable de sesion usuarioValido es true, esto significa que el usuario se encuenta dentro de la base de datos
    session = request.getSession();
    String sessionId = session.getId();
    String usuario = (String) session.getAttribute("usuario");
    String contra = (String) session.getAttribute("contra");
    if ((Boolean) session.getAttribute("usuarioValido")) {
%>

<!-- PAGINA DE MENU

Este archivo es común para los tres roles, en los cuales se toman el mismo head donde se referencian los estilos
A lo largo de la pagina se realiza una validacion por rol de los usuarios por la funcion rol() creada en el Toolbox
Los usuarios se separan por roles para tener distintos menús dado que no todos tienen las mismas funcionalidades


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
            //Aqui se comprueba si el usuario y la contraseña introducida se corresponden con el rol 1 que seria el de propietario de las parcelas
            if (controladores.Toolbox.rol(usuario, contra) == 1) {
        %>

        <!-- barra de navegacion fija creada con Boostrap que tiene como active la pagina de inicio que es en la que nos encontramos-->

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="menu.jsp">Bienvenido <%=usuario%></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="menu.jsp">Inicio</a></li>
                    <li><a href="menuparcela.jsp">Parcelas</a></li>
                    <li><a href="menuespecie.jsp">Especies</a></li>
                    <li><a href="menuanimales.jsp">Animales</a></li>
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
                            <!-- indicadores -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>

                            <!-- Imagenes del carrousel -->
                            <div class="carousel-inner">

                                <div class="item active">
                                    <img  src="img/carrusel1.jpg" alt="Campo" style="width:100%;">
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

                            <!-- Controles de el carrousel -->
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


                    <div class="container marketing">


                        <!-- MENU CON IMAGENES Y REFERENCIADO LOS INPUT PARA DAR VALOR AL PARAMETRO TODO -->

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar parcelas</h2>
                                <p class="lead">En este lugar puedes ver tus parcelas, asi como borrarlas y/o modificarlas.</p>
                                <form action="controlador" method="post" id="gestionparcelas">

                                    <input type="hidden" value="gestionparcelas" name="todo" />
                                    <input type="submit" value="Parcelas" class="boton">

                                </form>

                            </div>
                            <div class="col-md-5 ">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/parcela.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar especies </h2>
                                <p class="lead">Aquí puedes gestionar las especies con las que quieres trabajar en tus parcelas.</p>
                                <form action="controlador" method="post" id="gestionespecies">

                                    <input type="hidden" value="gestionespecies" name="todo" />
                                    <input type="submit" value="Especies" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/especies.jpg" alt="Generic placeholder image">
                            </div>
                        </div>


                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar animales </h2>
                                <p class="lead"> Aquí puedes insertar o eliminar animales. </p>
                                <form action="controlador" method="post" id="gestionanimal">


                                    <input type="hidden" value="gestionanimal" name="todo" />
                                    <input type="submit" value="Animales" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/cabra.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar plantaciones </h2>
                                <p class="lead"> Aquí puedes insertar o modificar plantaciones. </p>
                                <form action="controlador" method="post" id="gestionplantaciones">


                                    <input type="hidden" value="gestionplantaciones" name="todo" />
                                    <input type="submit" value="Plantaciones" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/plantacion.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar usuarios </h2>
                                <p class="lead">Aquí puedes ver, borrar y crear jornaleros además de modificar sus datos y tu contraseña.</p>
                                <form action="controlador" method="post" id="gestionusuarios">


                                    <input type="hidden" value="gestionusuarios" name="todo" />
                                    <input type="submit" value="Usuarios" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/jornalero.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar la asignacion de jornaleros </h2>
                                <p class="lead">Aquí puedes controlar en que parcelas trabajan los jornaleros.</p>
                                <form action="controlador" method="post" id="gestionusuarios">


                                    <input type="hidden" value="desasignarparcela" name="todo" />
                                    <input type="submit" value="Asignar" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/jornalero2.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <hr class="featurette-divider">


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

        <!-- /.container -->


        <!-- Bootstrap core JavaScript
================================================== -->
        <!-- Placed at the end of the documenst so the pages load faster -->
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
        <script>
            window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
        </script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        <script src="js/vendor/holder.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>


        <% // EL ROL 2 FUNCIONA IGUAL QUE EL 1 CON LA DIFERENCIA DE QUE SOLO TIENE COMO MENU PARCELAS, ANIMALES Y PLANTACIONES

        } else if (controladores.Toolbox.rol(usuario, contra) == 2) {

            int idusuario = ClasesBD.UsuarioBD.idUser(usuario);%>


        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="menu.jsp">Bienvenido <%=usuario%></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="menu.jsp">Inicio</a></li>
                    <li><a href="menuparcela.jsp">Parcela</a></li>
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


        <div class="container-fluid text-center"  style="margin-top: 100px; background-color: rgba(255, 255, 255, 0.8); padding: 30px;">
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


                    <!-- Marketing messaging and featurettes
                  ================================================== -->
                    <!-- Wrap the rest of the page in another container to center all the content. -->

                    <div class="container marketing">


                        <!-- START THE FEATURETTES -->

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar parcelas</h2>
                                <p class="lead">En este lugar puedes ver la parcela en la que trabajas, asi como modificar el estado de esta.</p>
                                <form action="controlador" method="post" id="gestionparcelas">

                                    <p> Gestionar parcelas </p>

                                    <input type="hidden" value="gestionparcelas" name="todo" />
                                    <input type="submit" value="Parcelas" class="boton">


                                </form>

                            </div>
                            <div class="col-md-5 ">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/parcela.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">



                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar animales </h2>
                                <p class="lead"> Aquí puedes insertar o eliminar animales. </p>
                                <form action="controlador" method="post" id="gestionanimal">
                                    <p> Gestionar animales </p>

                                    <input type="hidden" value="gestionanimal" name="todo" />
                                    <input type="submit" value="Animales" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/cabra.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Gestionar plantaciones </h2>
                                <p class="lead"> Aquí puedes insertar o modificar plantaciones. </p>
                                <form action="controlador" method="post" id="gestionplantaciones">
                                    <p> Gestionar plantaciones </p>

                                    <input type="hidden" value="gestionplantaciones" name="todo" />
                                    <input type="submit" value="Plantaciones" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/plantacion.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">Cambiar mi contraseña </h2>
                                <p class="lead">Aquí puedes cambiar tu contraseña en el caso de que te hayas olvidado de ella.</p>
                                <form action="controlador" method="post" id="modificarusuario">

                                    <input type="hidden" value="<%= idusuario%>" name="idusuario"/>
                                    <input type="hidden" value="modificarusuario" name="todo" />
                                    <input type="submit" value="Contraseña" class="boton">


                                </form>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-responsive center-block imgmenu" src="img/jornalero.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <hr class="featurette-divider">


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

        <!-- /.container -->


        <!-- Bootstrap core JavaScript
================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
        <script>
            window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
        </script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        <script src="js/vendor/holder.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>


        <%
    } else {%>


        <META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">

        <% }
    } else { %>

        <META HTTP-EQUIV="REFRESH" CONTENT="1;error.jsp">




        <% }%>

    </body>




</html>
