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
        if((Boolean)session.getAttribute("usuarioValido")){  
        String user = (String) session.getAttribute("usuario");
        String pass = (String) session.getAttribute("contra");

            if((controladores.Toolbox.rol(user, pass) == 1) || (controladores.Toolbox.rol(user, pass) == 2)){
    %>
    <body>
        <%
            Connection conn = controladores.Toolbox.Conexion();
            //Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
            Statement stmt = conn.createStatement();
            //String sqlStr = "select * from libros where autor= "
            //        + "'" + request.getParameter("autor") + "'";
            String sqlStr = "SELECT * FROM especie";
            //PARA DEPURACIÓN
            System.out.println("La consulta sql es " + sqlStr);
            //Ejecutar la sentencia SQL a través de los objetos Statement 
            ResultSet rset = stmt.executeQuery(sqlStr);
    %>
        <h1>ESTA ES LA PAGINA DE INSERTAR ESPECIES</h1>
        <form action="controlador" method="post">
            <input type="hidden" name="todo" value="insertespecie">
            <table>
                <thead>
                    <tr>
                        <th>nombre especie</th>
                        <th>tipo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="nombre"></td>
                        <td>
                <select name="idtipo">
                    <option value="1">Agricola</option>
                    <option value="2">Ganadera</option>
                </select>
                </td>
                    </tr>
                            <%     
                                
                                  //Cierre de recursos 
                rset.close();
                stmt.close();
                conn.close();
            
            %>
            
             
             </tbody>
        </table>

        <%
              
            
        %>
                               
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
    
    <% } %>
    </body>
</html>
