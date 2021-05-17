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
        <title>JSP Page</title>
    </head>
    <%
        session = request.getSession();
        String sessionId = session.getId();
        if ((Boolean) session.getAttribute("usuarioValido")) {
            String user = (String) session.getAttribute("usuario");
            String pass = (String) session.getAttribute("contra");

            if ((controladores.Toolbox.rol(user, pass) == 1) || (controladores.Toolbox.rol(user, pass) == 2) || (controladores.Toolbox.rol(user, pass) == 2)) {
    %>
    <body>

        <h1>ESTA ES LA PAGINA DE INSERTAR ANIMALES</h1>
        <form action="controlador" method="post">
            <input type="hidden" name="todo" value="insertanimal">
            <%
                Connection conn = controladores.Toolbox.Conexion();

                Statement stmt = conn.createStatement();

                String sqlStr = "SELECT * FROM eganadera";

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
                        <td><%=rset.getString("tipoespecie.nombre")%></td>
                        <td><input type="radio" name="idespecie" value="<%=rset.getInt("idespecie")%>"></td>
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

                String sqlStr2 = "SELECT * FROM parcela INNER JOIN propietario ON parcela.idpropietario = propietario.idpropietario INNER JOIN tipoparcela ON parcela.idtipoparcela = tipoparcela.idtipoparcela + tipoparcela.nombretipo INNER JOIN estado ON parcela.idestado = estado.idestado + estado.nombrestado ;";

                System.out.println("La consulta sql es " + sqlStr2);

                ResultSet rset2 = stmt2.executeQuery(sqlStr2);


            %> 
            <h1>Parcelas</h1>
            <table>
                <thead>
                    <tr>

                        <th>ID de la parcela</th>
                        <th>Hectáreas de la parcela</th>
                        <th>ID propietario</th>
                        <th>ID estado</th>
                        <th>Tipo de parcela</th>
                        <th>Referencia</th>
                        <th>Seleccionar parcela</th>

                    </tr>
                </thead>
                <tbody> 
                    <%                    while (rset2.next()) {
                            session.setAttribute("idparcela", rset2.getInt("idparcela"));
                           
                    %>
                    <tr>

                        <td><%=rset2.getInt("idparcela")%></td>
                        <td><%=rset2.getInt("hectareas")%></td>
                        <td><%=rset2.getString("propietario.nombre")%></td>
                        <td><%=rset2.getString("estado.nombrestado")%></td>
                        <td><%=rset2.getString("tipoparcela.nombretipo")%></td>
                        <td><%=rset2.getInt("referencia")%></td>
                        <td><input type="radio" name="idparcela" value="<%=rset2.getInt("idparcela")%>"></td>

                        

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

                        <th>Sexo</th>

                    </tr>
                </thead>

                <tbody> 
                    <tr>

                        <td><input type="text" name="sexo"></input></td>

                    </tr>


                </tbody>
            </table>

        </tr>
    </tbody>
</table>
<input type="submit" name="enviar" value="Enviar">
</form>
<form action="controlador" method="post">
    <input type="hidden" name="todo" value="menu">
    <input type="submit" name="enviar" value="Volver al menu">
</form>
<% } else { %>

<h1>NO TIENES PERMISOS</h1>
<a href="index.jsp">Inicio</a>

<% }
    } else { %>

<% }%>
</body>
</html>
