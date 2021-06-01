<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
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
        String usuario = (String) session.getAttribute("usuario");
        String contra = (String) session.getAttribute("contra");

        if ((Boolean) session.getAttribute("usuarioValido")) {
            if (controladores.Toolbox.rol(usuario, contra) == 1) {

                int iduser = controladores.Toolbox.idUser(usuario);

                int idpropietario = controladores.Toolbox.idProp(iduser);


    %>
    <body>


        <h1> INSERTA USUARIO </h1>

        <form action=" controlador" method="post">
            <input type="hidden" name="todo" value="ejecutarpinsert">
            <table>
                <thead>
                    <tr>
                        <th>ID USUARIO</th>
                        <th>NOMBRE</th>
                        <th>EMAIL</th>
                        <th>DNI</th>
                        <th>TELEFONO</th>
                        <th>IDROL</th>
                        <th>PASS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <label>idusuario
                                <input type="text" name="idusuario">
                            </label>
                        </td>
                        <td>
                            <label>nombre
                                <input type="text" name="nombre">
                            </label>
                        </td>
                        <td>
                            <label>email
                                <input type="text" name="email">
                            </label>
                        </td>
                        <td>
                            <label>dni
                                <input type="text" name="email">
                            </label>
                        </td>
                        <td>
                            <label>telefono
                                <input type="text" name="email">
                            </label>
                        </td>
                        <td>
                            <select name="idtipoparcela">
                                <%

                                    Connection conn = controladores.Toolbox.Conexion();

                                    Statement stmt= conn.createStatement();

                                    String sqlStr = "SELECT * FROM rol where idrol not in 1";

                                    ResultSet rset = stmt.executeQuery(sqlStr);

                                    while (rset.next()) {
                                %>

                                <option value='<%=rset.getInt("idrol")%>'> <%=rset.getString("nombre")%></option>

                                <% }
                                    rset.close();
                                    stmt.close();
                                    conn.close();
                                %>
                            </select>
                        </td>
                        <td>
                            <label>pass
                                <input type="text" name="pass">
                            </label>
                        </td>
                    </tr>
                </tbody>


            </table>
            <input type="submit" name="enviar" value="Enviar">
        </form>
        <form action="controlador" method="post">
            <input type="hidden" name="todo" value="menu">
            <input type="submit" name="enviar" value="Volver al menu">
        </form>
        <%  } else { %>
        
        
        
<% }
        } else { %>
        <h1>NO TIENES ACCESO</h1>
        <a href="index.jsp">Inicio</a>
        <% }%>
    </body>

</html>