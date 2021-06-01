<%@page import="java.sql.*" %>  

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

        <header><p>Bienvenido propietario <%= user%> </p></header>


        <%
           Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM usuario INNER JOIN rol ON usuario.idrol = rol.idrol + rol.nombre";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>

        <table>
            <thead>
                <tr>

                    <th>Nombre de usuario</th>
                    <th>Correo electrónico</th>
                    <th>DNI</th>
                    <th>Teléfono</th>
                    <th>Tipo de usuario</th>
                    <th>Modificar</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {


                %>
                <tr>

                    <td><%=rset.getString("nombre")%></td>
                    <td><%=rset.getString("email")%></td>
                    <td><%=rset.getString("dni")%></td>
                    <td><%=rset.getInt("telefono")%></td>
                    <td><%=rset.getString("rol.nombre")%></td>
                    <td><form action="controlador" method="post">
                            <input type="hidden" name="idusuario" value="<%=rset.getString("idusuario")%>">
                            <input type="submit" name="modificarusuario" value="Modificar">
                        </form></td>
                    <td><form action="controlador" method="post"><input type="hidden" name="idusuario" value="<%=rset.getString("idusuario")%>">
                            <input type="submit" name="borrarusuario" value="borrar">
                        </form></td>

                </tr>

                <%

                    }
                %>
            </tbody>
        </table>

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
    <footer>PIE DE PAGINA</footer>





<% } else { %>


   

    <h1>No tienes permisos <%=  user%>  </h1>
    <a href="index.jsp">Inicio</a>



<%
}
} else { %>


    <h1>El usuario no es valido.</h1>
    <a href="index.jsp">Inicio</a>

</body>




</html>


<% }%>
