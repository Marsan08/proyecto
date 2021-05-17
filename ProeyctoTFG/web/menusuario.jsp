<%@page import="java.sql.*" %>  

<%
    session = request.getSession();
    String sessionId = session.getId();
    String user = (String) session.getAttribute("usuario");
    String pass = (String) session.getAttribute("contra");
    if ((Boolean) session.getAttribute("usuarioValido")) {
        if (controladores.Toolbox.rol(user, pass) == 1) {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
    </head>

    <body>
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
            <input type="submit" value="MENU">
        </form>

    <footer>PIE DE PAGINA</footer>

    </body>

</html>


<% } else if (controladores.Toolbox.rol(user, pass) == 2) {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
    </head>

    <body>
        <header><p>Bienvenido adminitrador <%= user%> </p></header>


        <%
            Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM usuario INNER JOIN rol ON usuario.idrol = rol.idrol + rol.nombre WHERE usurario.idrol NOT IN 1";

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
            <input type="submit" value="Volver al menú">
        </form>

    <footer>PIE DE PAGINA</footer>

    </body>

</html>

<% } else if(controladores.Toolbox.rol(user, pass)== 3){%>


<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de acceso</title>

    </head>
    
    <boby>
        
        <header><P>Bienvenido jornalero <%=user%></p> </header>

    <h1>No tienes permisos <%=  user%>  </h1>
    <a href="index.jsp">Inicio</a>
    
    <footer>PIE DE PAGINA</footer>

</body>




</html>


<% } else { %>

<html>

    <body>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de acceso</title>

    </head>

    <h1>No tienes permisos <%=  user%>  </h1>
    <a href="index.jsp">Inicio</a>

</body>




</html>



<%
}
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
