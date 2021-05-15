<%@page import="java.sql.*" %>  
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
        if (controladores.Toolbox.rol(user, pass) == 1) {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
    </head>

    <body>
        <header><p>Bienvenido propietario <%= user%> </p><div><nav>AQUI VIENE EL NAVEGADOR</nav></div></header>


        <%
           Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM especie INNER JOIN tipoespecie ON especie.tipo = tipoespecie.idtipo + tipoespecie.nombre";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
        <h1>Especies</h1>
        <table border="1" width="2" cellspacing="2" cellpadding="2">
            <thead>
                <tr>

                    <th>Nombre especie</th>
                    <th>Tipo de especie</th>
                    <th>Borrar</th>
             
                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {


                %>
                <tr>
                    
                    <td><%=rset.getString("nombreespecie")%></td>
                    <td><%=rset.getString("tipoespecie.nombre")%></td>
             
                                <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbespecie" name="todo"><input type="hidden" value='<%=rset.getInt("idespecie")%>' name="idespecie"><input type="submit" value="Borrar"></form></td>

                </tr>

                <%

                    }
                %>
            </tbody>
        </table>
            
            <form action="controlador" method="post" id="irinsertespecie">
        
                    
                   
                    <input type="hidden" value="irinsertespecie" name="todo"/>
                    <input type="submit" value="Insertar otra especie">
                   
        
                </form>
            
            
        <%
            //Cierre de recursos 
            rset.close();
            stmt.close();
            conn.close();

        %>


        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="menu">
            <input type="submit" value="MENU">
        </form>


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
        <header><p>Bienvenido administrador <%= user%> </p><div><nav>AQUI VIENE EL NAVEGADOR</nav></div></header>


        <%
           Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM especie INNER JOIN tipoespecie ON especie.tipo = tipoespecie.idtipo + tipoespecie.nombre";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
        <h1>Especies</h1>
        <table border="1" width="2" cellspacing="2" cellpadding="2">
            <thead>
                <tr>

                    <th>Nombre especie</th>
                    <th>Tipo de especie</th>
                    <th>Borrar</th>
             
                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {


                %>
                <tr>
                    
                    <td><%=rset.getString("nombreespecie")%></td>
                    <td><%=rset.getString("tipoespecie.nombre")%></td>
             
                    <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbespecie" name="todo"><input type="hidden" value='<%=rset.getInt("idespecie")%>' name="idespecie"><input type="submit" value="Borrar"></form></td>

                </tr>

                <%

                    }
                %>
            </tbody>
        </table>
            
            <form action="controlador" method="post" id="irinsertespecie">
        
                    
                   
                    <input type="hidden" value="irinsertespecie" name="todo"/>
                    <input type="submit" value="Insertar otra especie">
                   
        
                </form>
            
            
        <%
            //Cierre de recursos 
            rset.close();
            stmt.close();
            conn.close();

        %>


        <form action="controlador" method="post">

            <input type="hidden" value="menu" name="menu">
            <input type="submit" value="MENU">
        </form>


    </body>

</html>


<% }
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
