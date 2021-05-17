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
        <title>Inserta usuario</title>
    </head>
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
        <% } 
        else { if(controladores.Toolbox.rol(usuario, contra) == 2){
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

                                    String sqlStr = "SELECT * FROM rol where idrol=3";

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
        <% }}
        } else { %>
        <h1>NO TIENES ACCESO</h1>
        <a href="index.jsp">Inicio</a>
        <% }%>
    </body>

</html>