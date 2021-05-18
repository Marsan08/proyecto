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
        
        <link href="css.css" rel="stylesheet">
        
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="width: auto">

        <%
        if (controladores.Toolbox.rol(usuario, contra) == 1) {
%>

      

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="menu.jsp">Inicio</a></li>
      <li><a href="menuparcela.jsp">Parcelas</a></li>
      <li><a href="menuespecies.jsp">Especies</a></li>
      <li><a href="menuanimales.jsp">Animales</a></li>
      <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
      <li><a href="menusuarios.jsp">Usuarios</a></li>
    </ul>
    <ul
  </div>
</nav>

  
<div class="container-fluid text-center" style="margin-top: 100px">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
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
                        <p class="lead">En este lugar puedes ver tus parcelas, asi como borrarlas y/o modificarlas.</p>
                        <form action="controlador" method="post" id="gestionparcelas">

                            <p> Gestionar parcelas </p>

                            <input type="hidden" value="gestionparcelas" name="todo" />
                            <input type="submit" value="Parcelas">


                        </form>

                    </div>
                    <div class="col-md-5 ">
                        <img class="featurette-image img-responsive center-block" src="img/parcela.jpg" alt="Generic placeholder image">
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
                        <img class="featurette-image img-responsive center-block" src="img/especies.jpg" alt="Generic placeholder image">
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
                        <img class="featurette-image img-responsive center-block" src="img/jornalero.jpg" alt="Generic placeholder image">
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
                            <input type="submit" value="Animales">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/cabra.jpg" alt="Generic placeholder image">
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
                            <input type="submit" value="Plantaciones">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/plantacion.jpg" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <hr class="featurette-divider">

             
            </div>
    </div>
    <div class="col-sm-2 sidenav" >
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
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
  

<% } else if (controladores.Toolbox.rol(usuario, contra) == 2) {
%>


   
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="menu.jsp">Inicio</a></li>
      <li><a href="menuparcela.jsp">Parcelas</a></li>
      <li><a href="menuespecies.jsp">Especies</a></li>
      <li><a href="menuanimales.jsp">Animales</a></li>
      <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
      <li><a href="menusuarios.jsp">Usuarios</a></li>
    </ul>
    <ul
  </div>
</nav>

  
<div class="container-fluid text-center" style="margin-top: 100px">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
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
                        <p class="lead">En este lugar puedes ver la parcela que administras y cambiar el estado de esta.</p>
                        <form action="controlador" method="post" id="gestionparcelas">

                            <p> Gestionar parcelas </p>

                            <input type="hidden" value="gestionparcelas" name="todo" />
                            <input type="submit" value="Parcelas">


                        </form>

                    </div>
                    <div class="col-md-5 ">
                        <img class="featurette-image img-responsive center-block" src="img/parcela.jpg" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Gestionar especies </h2>
                        <p class="lead">Aquí puedes gestionar las especies con las que quieres trabajar en tu parcela.</p>
                        <form action="controlador" method="post" id="gestionespecies">

                            <p> Gestionar especies </p>

                            <input type="hidden" value="gestionespecies" name="todo" />
                            <input type="submit" value="Especies">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/especies.jpg" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Gestionar usuarios </h2>
                        <p class="lead">Aquí puedes ver, borrar y crear jornaleros y asignarlos a tu parcela.</p>
                        <form action="controlador" method="post" id="gestionusuarios">
                            <p> Gestionar usuarios </p>

                            <input type="hidden" value="gestionusuarios" name="todo" />
                            <input type="submit" value="Usuarios">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/jornalero.jpg" alt="Generic placeholder image">
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
                            <input type="submit" value="Animales">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/cabra.jpg" alt="Generic placeholder image">
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
                            <input type="submit" value="Plantaciones">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/plantacion.jpg" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <hr class="featurette-divider">

             
            </div>
    </div>
    <div class="col-sm-2 sidenav" >
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
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
  


<% } else if (controladores.Toolbox.rol(usuario, contra) == 3) {%>


<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bienvenido <%=user%></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="menu.jsp">Inicio</a></li>
      <li><a href="menuparcela.jsp">Parcela</a></li>
      <li><a href="menuanimales.jsp">Animales</a></li>
      <li><a href="menuplantaciones.jsp">Plantaciones</a></li>
     
    </ul>
    <ul
  </div>
</nav>

  
<div class="container-fluid text-center" style="margin-top: 100px">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
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
                            <input type="submit" value="Parcelas">


                        </form>

                    </div>
                    <div class="col-md-5 ">
                        <img class="featurette-image img-responsive center-block" src="img/parcela.jpg" alt="Generic placeholder image">
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
                            <input type="submit" value="Animales">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/cabra.jpg" alt="Generic placeholder image">
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
                            <input type="submit" value="Plantaciones">


                        </form>
                    </div>
                    <div class="col-md-5">
                        <img class="featurette-image img-responsive center-block" src="img/plantacion.jpg" alt="Generic placeholder image">
                    </div>
                </div>

                <hr class="featurette-divider">

                <hr class="featurette-divider">

             
            </div>
    </div>
    <div class="col-sm-2 sidenav" >
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
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




<% }
                        } else { %>



    <h1>El usuario no es valido.</h1>
    <a href="index.jsp">Inicio</a>

</body>




</html>


<% }%>