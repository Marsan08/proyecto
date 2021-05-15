<%-- Document : insertar Created on : 11-mar-2021, 0:59:15 Author : Mar --%>

<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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


        <h1> INSERTAR PARCELA </h1>

        <form action=" controlador" method="post">
            <input type="hidden" name="todo" value="ejecutarpinsert">
            <table>
                <thead>
                    <tr>
                        <th>HECTAREAS</th>
                        <th>PROPIETARIO DE LA PARCELA</th>
                        <th>TIPO PARCELA</th>
                        <th>ESTADO DE LA PARCELA</th>
                        <th>REFERENCIA DE LA PARCELA</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="hectareas"></td>
                        <td>
                            <p name="idpropietario" value='<%= idpropietario%>'>

                                <%= usuario%>

                            </p>
                        </td>
                          <td>
                            <select name="idtipoparcela">
                                <%

                                    //CERRAMOS LA CONSULTA ANTERIOR
                                    

                                    //CREAMOS UNA CONSULTA QUE SAQUE LOS ESTADOS COMO EN EL TIPO DE PARCELA
                                    Connection conn2 = controladores.Toolbox.Conexion();
                                    
                                    Statement stmt2 = conn2.createStatement();

                                    String sqlStr = "SELECT * FROM tipoparcela";

                                    System.out.println("La consulta sql es " + sqlStr);

                                    ResultSet rset = stmt2.executeQuery(sqlStr);

                                    //MIENTRAS HAYA ESTADOS SE SACAN (SE SACA EL NOMBRE Y SE GUARDA EL VALOR)
                                    while (rset.next()) {
                                %>

                                <option value='<%=rset.getInt("idtipoparcela")%>'> <%=rset.getString("nombretipo")%>

                                </option>

                                <% } rset.close();
                                    stmt2.close();
                                    conn2.close();
%>
                            </select>
                        </td>
                        
                        <td>
                            <select name="idestado">
                                <%

                                    //CERRAMOS LA CONSULTA ANTERIOR
                                    

                                    //CREAMOS UNA CONSULTA QUE SAQUE LOS ESTADOS COMO EN EL TIPO DE PARCELA
                                    Connection conn = controladores.Toolbox.Conexion();
                                    
                                    Statement stmt = conn.createStatement();

                                    String sqlStr3 = "SELECT * FROM estado";

                                    System.out.println("La consulta sql es " + sqlStr3);

                                    ResultSet rset3 = stmt.executeQuery(sqlStr3);

                                    //MIENTRAS HAYA ESTADOS SE SACAN (SE SACA EL NOMBRE Y SE GUARDA EL VALOR)
                                    while (rset3.next()) {
                                %>

                                <option value='<%=rset3.getInt("idestado")%>'> <%=rset3.getString("nombrestado")%>

                                </option>

                                <% }    rset3.close();
                                    stmt.close();
                                    conn.close();
%>
                            </select>
                        </td>
                        <td>
                        <input type="text" name="referencia">
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
        <% }else { %>
        <h1>NO TIENES ACCESO</h1>
        <a href="index.jsp">Inicio</a>
        <% }
} else { %>
        <h1>NO TIENES ACCESO</h1>
        <a href="index.jsp">Inicio</a>
        <% }%>
    </body>

</html>