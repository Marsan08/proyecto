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
    

        <h1>ESTA ES LA PAGINA DE INSERTAR PLANTACIONES</h1>
        <form action="controlador" method="post">
            <input type="hidden" name="todo" value="inserplantacion">
            <%
                Connection conn = controladores.Toolbox.Conexion();

                Statement stmt = conn.createStatement();

                String sqlStr = "SELECT * FROM eagricola";

                System.out.println("La consulta sql es " + sqlStr);

                ResultSet rset = stmt.executeQuery(sqlStr);
            %>
            <h1>Especies</h1>
            <table border="1" width="2" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>

                        <th>Nombre especie</th>     
                        <th>Seleccionar especie</th>


                    </tr>
                </thead>
                <tbody> 
                    <%
                        while (rset.next()) {
                    %>
                    <tr>

                        <td><%=rset.getString("nombreespecie")%></td>
                        <td><input type="radio" name="idespecie" value="<%=rset.getInt("ideagricola")%>"></td>
                    </tr>

                    <%
                        }

                        conn.close();
                        stmt.close();
                        rset.close();
                    %>
                </tbody>
            </table>
            <%
                Connection conn2 = controladores.Toolbox.Conexion();

                Statement stmt2 = conn2.createStatement();

                String sqlStr2 = "SELECT * FROM pagricola";

                System.out.println("La consulta sql es " + sqlStr2);

                ResultSet rset2 = stmt2.executeQuery(sqlStr2);


            %> 
            <h1>Parcelas</h1>
            <table>
                <thead>
                    <tr>
                        <th>Referencia de la parcela</th>
                        <th>Seleccionar parcela</th>

                    </tr>
                </thead>
                <tbody> 
                    <%                    while (rset2.next()) {
                            session.setAttribute("idparcela", rset2.getInt("idparcela"));
                           
                    %>
                    <tr>

                      
                        <td><%=rset2.getInt("referencia")%></td>
                        <td><input type="radio" name="idparcela" value="<%=rset2.getInt("idpagricola")%>"></td>

                        

                    </tr>

                    <%

                        }

                        conn2.close();
                        rset2.close();
                        stmt2.close();

                    %>
                </tbody>
            </table>

            <table border="1" width="2" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>

                        <th>Fecha de plantacion</th>

                    </tr>
                </thead>

                <tbody> 
                    <tr>

                        <td><input type="date" name="fecha"/></td>

                    </tr>


                </tbody>
            </table>

   
<input type="submit" name="enviar" value="Enviar">
</form>
<form action="controlador" method="post">
    <input type="hidden" name="todo" value="menu">
    <input type="submit" name="enviar" value="Volver al menu">
</form>
                    <% } else if(controladores.Toolbox.rol(user, pass)==2) { %>

 

        <h1>ESTA ES LA PAGINA DE INSERTAR PLANTACIONES</h1>
        <form action="controlador" method="post">
            <input type="hidden" name="todo" value="inserplantacion">
            <%
                Connection conn = controladores.Toolbox.Conexion();

                Statement stmt = conn.createStatement();

                String sqlStr = "SELECT * FROM eagricola";

                System.out.println("La consulta sql es " + sqlStr);

                ResultSet rset = stmt.executeQuery(sqlStr);
            %>
            <h1>Especies</h1>
            <table border="1" width="2" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>

                        <th>Nombre especie</th>     
                        <th>Seleccionar especie</th>


                    </tr>
                </thead>
                <tbody> 
                    <%
                        while (rset.next()) {
                    %>
                    <tr>

                        <td><%=rset.getString("nombreespecie")%></td>
                        <td><input type="radio" name="idespecie" value="<%=rset.getInt("ideagricola")%>"></td>
                    </tr>

                    <%
                        }

                        conn.close();
                        stmt.close();
                        rset.close();
                    %>
                </tbody>
            </table>
            <%
                Connection conn2 = controladores.Toolbox.Conexion();

                Statement stmt2 = conn2.createStatement();
                
                int iduser = controladores.Toolbox.idUser(user);
                
                int idparcela = controladores.Toolbox.parcelaJornalero(iduser);

                String sqlStr2 = "SELECT * FROM pagricola WHERE idparcela = " + idparcela + ";";

                System.out.println("La consulta sql es " + sqlStr2);

                ResultSet rset2 = stmt2.executeQuery(sqlStr2);


            %> 
            <h1>Parcelas</h1>
            <table>
                <thead>
                    <tr>
                        <th>Referencia de la parcela</th>
                        <th>Seleccionar parcela</th>

                    </tr>
                </thead>
                <tbody> 
                    <%                    while (rset2.next()) {
                            session.setAttribute("idparcela", rset2.getInt("idparcela"));
                           
                    %>
                    <tr>

                      
                        <td><%=rset2.getInt("referencia")%></td>
                        <td><input type="radio" name="idparcela" value="<%=rset2.getInt("idpagricola")%>"></td>

                        

                    </tr>

                    <%

                        }

                        conn2.close();
                        rset2.close();
                        stmt2.close();

                    %>
                </tbody>
            </table>

            <table border="1" width="2" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>

                        <th>Fecha de plantacion</th>

                    </tr>
                </thead>

                <tbody> 
                    <tr>

                        <td><input type="date" name="fecha"/></td>

                    </tr>


                </tbody>
            </table>

   
<input type="submit" name="enviar" value="Enviar">
</form>
<form action="controlador" method="post">
    <input type="hidden" name="todo" value="menu">
    <input type="submit" name="enviar" value="Volver al menu">
</form>

<% } else  { %>

<h1>NO TIENES PERMISOS</h1>
<a href="index.jsp">Inicio</a>

<% }
    } else { %>

<% }%>
</body>
</html>
