<%-- 
    Document   : menu
    Created on : 10-mar-2021, 23:25:05
    Author     : Mar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    session = request.getSession();

    String user = request.getParameter("user");
    String pass = request.getParameter("pass");
    session.setAttribute("usuario", user);
    session.setAttribute("contra", pass);
    String usuario = (String) session.getAttribute("usuario");
    String contra = (String) session.getAttribute("contra");
    session.getAttribute("contra");
    if ((Boolean) session.getAttribute("usuarioValido")) {
        if (controladores.Toolbox.rol(usuario, contra) == 1) {
%>
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
        <link href="css/carousel.css" rel="stylesheet">
        <link href="css.css" rel="stylesheet">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>


    <body>

        <div class="navbar-wrapper">
            <div class="container">

                <nav class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><p>Bienvenido propietario <%= user%></p></li>
                                <li class="active"><a href="menu.jsp">Inicio</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Páginas <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="menuparcela.jsp">Parcelas</a></li>
                                        <li><a href="menuespecie.jsp">Especies</a></li>
                                        <li><a href="#">Animales</a></li>
                                        <li><a href="#">Plantaciones</a></li>
                                        <li><a href="menusuario">Usuarios</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li class="dropdown-header">Otros</li>
                                        
                                        <li><a href="#">Salir</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
       
<div class="container">
  <h2>Carousel Example</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="img/carrusel1.jpg" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>

      <div class="item">
        <img src="img/carrusel2.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
         
        </div>
      </div>
    
      <div class="item">
        <img src="img/carrusel3.jpg" alt="New York" style="width:100%;">
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
                    <div class="col-md-7 col-md-push-5">
                        <h2 class="featurette-heading">Gestionar parcelas</h2>
                        <p class="lead">En este lugar puedes ver tus parcelas, asi como borrarlas y/o modificarlas.</p>
                        <form action="controlador" method="post" id="gestionparcelas">

                            <p> Gestionar parcelas </p>

                            <input type="hidden" value="gestionparcelas" name="todo" />
                            <input type="submit" value="Parcelas">


                        </form>

                    </div>
                    <div class="col-md-5 col-md-pull-7">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Gestionar especies </h2>
                        <p class="lead">Aquí puedes gestionar las especies con las que quieres trabajar en tus parcelas.</p>
                        <form action="controlador" method="post" id="gestionespecies">

                            <p> Gestionar especies </p>

                            <input type="hidden" value="gestionespecies" name="todo" />
                            <input type="submit" value="Especies">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Gestionar usuarios </h2>
                        <p class="lead">Aquí puedes ver, borrar y crear usuarios decidiendo el rol que tienen y en que parcela van a trabajar.</p>
                        <form action="controlador" method="post" id="gestionusuarios">
                            <p> Gestionar usuarios </p>

                            <input type="hidden" value="gestionusuarios" name="todo" />
                            <input type="submit" value="Usuarios">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <footer>
                    <p class="pull-right"><a href="#">Back to top</a></p>
                    <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
                </footer>

            </div>
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
    </body>

</html>

<% } else if (controladores.Toolbox.rol(usuario, contra) == 2) {
%>

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
        <link href="css/carousel.css" rel="stylesheet">
    </head>


    <body>

        <div class="navbar-wrapper">
            <div class="container">

                <nav class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand"><p>Bienvenido adminitrador<%= user%></p></a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li class="dropdown-header">Nav header</li>
                                        <li><a href="#">Separated link</a></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="first-slide" src="img/carrusel1.jpg" alt="First slide">

                </div>
                <div class="item">
                    <img class="second-slide" src="img/carrusel2.jpg" alt="Second slide">


                </div>
                <div class="item">
                    <img class="third-slide" src="img/carrusel3.jpg" alt="Third slide">


                </div>
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- /.carousel -->


            <!-- Marketing messaging and featurettes
          ================================================== -->
            <!-- Wrap the rest of the page in another container to center all the content. -->

            <div class="container marketing">


                <!-- START THE FEATURETTES -->

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7 col-md-push-5">
                        <h2 class="featurette-heading">Gestionar parcelas</h2>
                        <p class="lead">Aquí puedes cambiar el estado de las parcelas que administras</p>
                        <form action="controlador" method="post" id="gestionparcelas">

                            <p> Gestionar parcelas </p>

                            <input type="hidden" value="gestionparcelas" name="todo" />
                            <input type="submit" value="Parcelas">


                        </form>

                    </div>
                    <div class="col-md-5 col-md-pull-7">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Gestionar especies </h2>
                        <p class="lead">Aquí puedes gestionar las especies, además de los animales o plantaciones que estén relacionado con ellas</p>
                        <form action="controlador" method="post" id="gestionespecies">

                            <p> Gestionar especies </p>

                            <input type="hidden" value="gestionespecies" name="todo" />
                            <input type="submit" value="Especies">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Gestionar usuarios </h2>
                        <p class="lead">Aquí puedes ver, borrar y crear jornaleros y darles de alta para que trabajen en la parcela que administras.</p>
                        <form action="controlador" method="post" id="gestionusuarios">
                            <p> Gestionar usuarios </p>

                            <input type="hidden" value="gestionusuarios" name="todo" />
                            <input type="submit" value="Usuarios">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <footer>
                    <p class="pull-right"><a href="#">Back to top</a></p>
                    <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
                </footer>

            </div>
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
    </body>

</html>



<% } else if (controladores.Toolbox.rol(usuario, contra) == 3) {%>


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
        <link href="css/carousel.css" rel="stylesheet">
    </head>


    <body>

        <div class="navbar-wrapper">
            <div class="container">

                <nav class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand"><p>Bienvenido adminitrador<%= user%></p></a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li class="dropdown-header">Nav header</li>
                                        <li><a href="#">Separated link</a></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="first-slide" src="img/carrusel1.jpg" alt="First slide">

                </div>
                <div class="item">
                    <img class="second-slide" src="img/carrusel2.jpg" alt="Second slide">


                </div>
                <div class="item">
                    <img class="third-slide" src="img/carrusel3.jpg" alt="Third slide">


                </div>
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- /.carousel -->


            <!-- Marketing messaging and featurettes
          ================================================== -->
            <!-- Wrap the rest of the page in another container to center all the content. -->

            <div class="container marketing">


                <!-- START THE FEATURETTES -->

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7 col-md-push-5">
                        <h2 class="featurette-heading">Gestionar parcelas</h2>
                        <p class="lead">Aquí puedes cambiar el estado de las parcelas en las que trabajas</p>
                        <form action="controlador" method="post" id="gestionparcelas">

                            <p> Gestionar parcelas </p>

                            <input type="hidden" value="gestionparcelas" name="todo" />
                            <input type="submit" value="Parcelas">


                        </form>

                    </div>
                    <div class="col-md-5 col-md-pull-7">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Gestionar especies </h2>
                        <p class="lead">Aquí puedes gestionar las especies, además de los animales o plantaciones que estén relacionado con ellas</p>
                        <form action="controlador" method="post" id="gestionespecies">

                            <p> Gestionar especies </p>

                            <input type="hidden" value="gestionespecies" name="todo" />
                            <input type="submit" value="Especies">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                    </div>
                </div>

              
       

                <hr class="featurette-divider">

                <footer>
                    <p class="pull-right"><a href="#">Back to top</a></p>
                    <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
                </footer>

            </div>
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
    </body>

</html>




<%
                    } else {%>


<html>

    <body>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de acceso</title>

    </head>

    <h1>No tienes permisos.</h1>
    <a href="index.jsp">Inicio</a>

    <!-- FOOTER -->
    <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>

</div>
<!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script>
window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
</script>
<script src="../../dist/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../../assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>



<% }
                        } else { %>

<html>

    <body>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de acceso</title>

    </head>

    <h1>El usuario no es valido.</h1>
    <a href="index.jsp">Inicio</a>

</body>




</html>


<% }%>