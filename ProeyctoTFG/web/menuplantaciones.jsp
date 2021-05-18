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
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
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

        <header> <p>Bienvenido administrador <%= user%> </p><div><nav>AQUI VIENE EL NAVEGADOR</nav></div></header>


        <%
            Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            int iduser = controladores.Toolbox.idUser(user);

            int idparcela = controladores.Toolbox.parcelaAdmin(iduser);

            int pagricola = controladores.Toolbox.pagricola(idparcela);

            String sqlStr = "SELECT * FROM plantacion INNER JOIN pagricola ON plantacion.idparcela = pagricola.idpagricola INNER JOIN eagricola ON plantacion.ideagricola = eagricola.ideagricola WHERE plantacion.idparcela = " + pagricola + ";";

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



        <% } else if (controladores.Toolbox.rol(user, pass) == 3) {
        %>

        <header> <p>Bienvenido administrador <%= user%> </p><div><nav>AQUI VIENE EL NAVEGADOR</nav></div></header>


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
        <h1>Plantaciones</h1>
        <table border="1" width="2" cellspacing="2" cellpadding="2">
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