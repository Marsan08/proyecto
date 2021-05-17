<%-- 
    Document   : modificaparcela
    Created on : 09-may-2021, 22:31:31
    Author     : Luis
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session = request.getSession();

    String user = (String) session.getAttribute("usuario");
    String pass = (String) session.getAttribute("contra");
    String sessionId = session.getId();
    if ((Boolean) session.getAttribute("usuarioValido")) {


%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>

        <%        if (controladores.Toolbox.rol(user, pass) == 1) {


        %>



        <%  
            
           
                       int idplantacion = (Integer) session.getAttribute("idplantacion");
                       Date fplantacion = (Date) session.getAttribute("fplantacion");
                       String nombrespecie = (String) session.getAttribute("nombrespecie");
                       int referencia = (Integer) session.getAttribute("referencia");

        %>

        <h1>Modificar estado de la parcela</h1> 
        <form action="controlador" method="POST">
            <input type="hidden" name="todo" value="ejecutarUpdatePlantacion">
            <table border="1" width="2" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>

                        <th>Id de la plantacion</th>
                        <th>Fecha de plantacion</th>
                        <th>Fecha de recogida</th>
                        <th>Nombre de la especie plantada</th>
                        <th>Referencia</th>
                        

                </thead>
                <tbody> 

                    <tr>

                        <td><%=idplantacion%></td>
                        <td><%=fplantacion%></td>
                        <td><input type="date" name="fecha"/></td>
                        <td><%=nombrespecie%></td>
                        <td><%=referencia%></td>
                     
                        
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Cambiar estado">

        </form>
        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Menú principal">
        </form>


        <% } else if (controladores.Toolbox.rol(user, pass) == 2) {


        %>


        <%  
            
           
                       int idplantacion = (Integer) session.getAttribute("idplantacion");
                       Date fplantacion = (Date) session.getAttribute("fplantacion");
                       String nombrespecie = (String) session.getAttribute("nombrespecie");
                       int referencia = (Integer) session.getAttribute("referencia");

        %>

        <h1>Modificar estado de la parcela</h1> 
        <form action="controlador" method="POST">
            <input type="hidden" name="todo" value="ejecutarUpdatePlantacion">
            <table border="1" width="2" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>

                        <th>Id de la plantacion</th>
                        <th>Fecha de plantacion</th>
                        <th>Fecha de recogida</th>
                        <th>Nombre de la especie plantada</th>
                        <th>Referencia</th>
                        

                </thead>
                <tbody> 

                    <tr>

                        <td><%=idplantacion%></td>
                        <td><%=fplantacion%></td>
                        <td><input type="Date" name="frecogida"/></td>
                        <td><%=nombrespecie%></td>
                        <td><%=referencia%></td>
                     
                        
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Cambiar estado">

        </form>
        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Menú principal">
        </form>



        <% } else if (controladores.Toolbox.rol(user, pass) == 3) {


        %>

        <%  
            
           
                       int idplantacion = (Integer) session.getAttribute("idplantacion");
                       Date fplantacion = (Date) session.getAttribute("fplantacion");
                       String nombrespecie = (String) session.getAttribute("nombrespecie");
                       int referencia = (Integer) session.getAttribute("referencia");

        %>

        <h1>Modificar estado de la parcela</h1> 
        <form action="controlador" method="POST">
            <input type="hidden" name="todo" value="ejecutarUpdatePlantacion">
            <table border="1" width="2" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>

                        <th>Id de la plantacion</th>
                        <th>Fecha de plantacion</th>
                        <th>Fecha de recogida</th>
                        <th>Nombre de la especie plantada</th>
                        <th>Referencia</th>
                        

                </thead>
                <tbody> 

                    <tr>

                        <td><%=idplantacion%></td>
                        <td><%=fplantacion%></td>
                        <td><input type="date" name="fecha"/></td>
                        <td><%=nombrespecie%></td>
                        <td><%=referencia%></td>
                     
                        
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Cambiar estado">

        </form>
        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="todo">
            <input type="submit" value="Menú principal">
        </form>




        <% }
        %>

    </body>

</html>

<%
} else { %>


<h1>NO TIENES ACCESO</h1>
<a href="index.jsp">Inicio</a>



<% }%>

