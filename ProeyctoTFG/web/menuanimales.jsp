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

            String sqlStr = "SELECT * FROM animal INNER JOIN pganadera ON animal.idparcela = pganadera.idpganadera INNER JOIN eganadera ON animal.ideganadera = eganadera.ideganadera;";
            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
        <h1>Animales</h1>
        <table border="1" width="2" cellspacing="2" cellpadding="2">
            <thead>
                <tr>

                    <th>Sexo del animal</th>
                    <th>Especie del animal</th>
                    <th>Referencia de la parcela</th>
                    <th>Borrar</th>


                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {
                %>
                <tr>

                    <td><%=rset.getString("sexo")%></td>
                    <td><%=rset.getString("eganadera.nombreespecie")%></td>
                    <td><%=rset.getString("pganadera.referencia")%></td>

                    <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbanimal" name="todo"><input type="hidden" value='<%=rset.getInt("idanimal")%>' name="idanimal"><input type="submit" value="Borrar"></form></td>


                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

        <form action="controlador" method="post" id="irinsertanimal">

            <input type="hidden" value="irinsertanimal" name="todo"/>
            <input type="submit" value="Insertar un animal">

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
            
            int pganadera = controladores.Toolbox.pganadera(idparcela);

            String sqlStr = "SELECT * FROM animal INNER JOIN pganadera ON animal.idparcela = pganadera.idpganadera INNER JOIN eganadera ON animal.ideganadera = eganadera.ideganadera WHERE animal.idparcela = " + pganadera +";";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
        <h1>Animales</h1>
       <table border="1" width="2" cellspacing="2" cellpadding="2">
            <thead>
                <tr>

                    <th>Sexo del animal</th>
                    <th>Especie del animal</th>
                    <th>Referencia de la parcela</th>
                    <th>Borrar</th>


                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {
                %>
                <tr>

                    <td><%=rset.getString("sexo")%></td>
                    <td><%=rset.getString("eganadera.nombreespecie")%></td>
                    <td><%=rset.getString("pganadera.referencia")%></td>

                    <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbanimal" name="todo"><input type="hidden" value='<%=rset.getInt("idanimal")%>' name="idanimal"><input type="submit" value="Borrar"></form></td>


                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

      

        <form action="controlador" method="post" id="irinsertanimal">

            <input type="hidden" value="irinsertanimal" name="todo"/>
            <input type="submit" value="Insertar un animal">

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



<% }else if (controladores.Toolbox.rol(user, pass) == 3) {
%>

        <header> <p>Bienvenido administrador <%= user%> </p><div><nav>AQUI VIENE EL NAVEGADOR</nav></div></header>


        <%
            Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            
            int iduser = controladores.Toolbox.idUser(user);
            
            int idparcela = controladores.Toolbox.parcelaJornalero(iduser);
            
            int pganadera = controladores.Toolbox.pganadera(idparcela);

            String sqlStr = "SELECT * FROM animal INNER JOIN pganadera ON animal.idparcela = pganadera.idpganadera INNER JOIN eganadera ON animal.ideganadera = eganadera.ideganadera WHERE animal.idparcela = " + pganadera +";";

            System.out.println("La consulta sql es " + sqlStr);

            ResultSet rset = stmt.executeQuery(sqlStr);
        %>
        <h1>Animales</h1>
       <table border="1" width="2" cellspacing="2" cellpadding="2">
            <thead>
                <tr>

                    <th>Sexo del animal</th>
                    <th>Especie del animal</th>
                    <th>Referencia de la parcela</th>
                    <th>Borrar</th>


                </tr>
            </thead>
            <tbody> 
                <%
                    while (rset.next()) {
                %>
                <tr>

                    <td><%=rset.getString("sexo")%></td>
                    <td><%=rset.getString("eganadera.nombreespecie")%></td>
                    <td><%=rset.getString("pganadera.referencia")%></td>

                    <td><form action="controlador" method="post"><input type="hidden" value="ejecutarbanimal" name="todo"><input type="hidden" value='<%=rset.getInt("idanimal")%>' name="idanimal"><input type="submit" value="Borrar"></form></td>


                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

      

        <form action="controlador" method="post" id="irinsertanimal">

            <input type="hidden" value="irinsertanimal" name="todo"/>
            <input type="submit" value="Insertar un animal">

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



<% } }else { %>


    <h1>El usuario no es valido.</h1>
    <a href="index.jsp">Inicio</a>

</body>




</html>


<% }%>
