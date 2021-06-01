<%@page import="java.sql.*" %>  
<%@page import="java.sql.Date"%>
<%-- 
    Document   : menuespecies
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
            if (controladores.Toolbox.rol(user, pass) == 1) {
        %>

        <header><p>Bienvenido propietario <%= user%> </p><div><nav>AQUI VIENE EL NAVEGADOR</nav></div></header>


        <%
            Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM plantacion INNER JOIN pagricola ON plantacion.idparcela = pagricola.idpagricola INNER JOIN eagricola ON plantacion.ideagricola = eagricola.ideagricola";
            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
        <h1>Plantaciones</h1>
        <table border="1" width="2" cellspacing="2" cellpadding="2">
            <thead>
                <tr>

                    <th>Fecha de la plantacion</th>
                    <th>Fecha de recogida</th>
                    <th>Especie de la plantacion</th>
                    <th>Referencia de la parcela</th>
                    <th>Modificar</th>
                    <th>Borrar</th>



                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {


                %>
                <tr>

                    <td><%=rset.getDate("fplantacion")%></td>
                    <td><%=rset.getDate("frecogida")%></td>
                    <td><%=rset.getString("eagricola.nombreespecie")%></td>
                    <td><%=rset.getInt("pagricola.referencia")%></td>

                    <td><form action="controlador" method="post"><input type="hidden" value="modificarplantacion" name="todo"><input type="hidden" value='<%=rset.getInt("idplantacion")%>' name="idplantacion"><input type="submit" value="Borrar"></form></td>
                    <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbplantacion" name="todo"><input type="hidden" value='<%=rset.getInt("idplantacion")%>' name="idplantacion"><input type="submit" value="Borrar"></form></td>


                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

        <form action="controlador" method="post" id="irinsertarplantacion">

            <input type="hidden" value="irinsertarplantacion" name="todo"/>
            <input type="submit" value="Insertar una plantacion">

        </form>


        <%
            //Cierre de recursos 
            rset.close();
            stmt.close();
            conn.close();

        %>


        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Menú principal">
        </form>


        <% } else if (controladores.Toolbox.rol(user, pass) == 2) {
        %>

  
        <header> <p>Bienvenido administrador <%= user%> </p><div><nav>AQUI VIENE EL NAVEGADOR</nav></div></header><nav class="navbar navbar-inverse navbar-fixed-top">
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
         
        
        <%
            Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            int iduser = controladores.Toolbox.idUser(user);

            int idparcela = controladores.Toolbox.parcelaJornalero(iduser);

            int pagricola = controladores.Toolbox.pagricola(idparcela);

            String sqlStr = "SELECT * FROM plantacion INNER JOIN pagricola ON plantacion.idparcela = pagricola.idpagricola INNER JOIN eagricola ON plantacion.ideagricola = eagricola.ideagricola WHERE plantacion.idparcela = " + pagricola + ";";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
       <div class="centrar">
        <div class="centrartabla">
        
        <h1 style="margin-top: 70px;">Plantaciones</h1>
        <table class="table table-hover">


            <thead>
                <tr>

                    <th>Fecha de la plantacion</th>
                    <th>Fecha de recogida</th>
                    <th>Especie de la plantacion</th>
                    <th>Referencia de la parcela</th>
                    <th>Borrar</th>


                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {
                        
  session.setAttribute("idplantacion", rset.getInt("idplantacion"));
                        session.setAttribute("fplantacion", rset.getDate("fplantacion"));
                        session.setAttribute("nombrespecie", rset.getString("eagricola.nombreespecie"));
                        session.setAttribute("referencia", rset.getInt("pagricola.referencia"));
                        
                %>
                <tr>

                    <td><%=rset.getString("fplantacion")%></td>
                    <td><%=rset.getString("frecogida")%></td>
                    <td><%=rset.getString("eagricola.nombreespecie")%></td>
                    <td><%=rset.getInt("pagricola.referencia")%></td>

                    <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbplantacion" name="todo"><input type="hidden" value='<%=rset.getInt("idplantacion")%>' name="ejecutarbplantacion"><input type="submit" value="Borrar"></form></td>


                </tr>

                <%
                    }
                %>
            </tbody>
        </table>
        <form action="controlador" method="post" id="irinsertarplantacion">

            <input type="hidden" value="irinsertarplantacion" name="todo"/>
            <input type="submit" value="Insertar una plantacion">

        </form>



        <%
            //Cierre de recursos 
            rset.close();
            stmt.close();
            conn.close();

        %>

        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Menú principal">
        </form>



        <% }
        } else { %>


        <h1>El usuario no es valido.</h1>
        <a href="index.jsp">Inicio</a>

    </body>




</html>


<% }%>