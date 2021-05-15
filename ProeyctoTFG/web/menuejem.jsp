<%-- 
    Document   : menu
    Created on : 10-mar-2021, 23:25:05
    Author     : Mar
--%>

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
    %>
    <body>
        <h1>Esto es el menú</h1>
        
        <form action="controlador" method="post">
            
            <p> Ver todas las parcelas </p>
           
            
            <input type="hidden" value="verparcelas" name="todo"/>
            <input type="submit" value="ver">

        </form>
        
         <form action="controlador" method="post">
            
            <p> Ver todos los usuarios </p>
           
            
            <input type="hidden" value="verusuarios" name="todo"/>
            <input type="submit" value="ver">

        </form>
        
        <form action="controlador" method="post">
            
            <p> Ver todos las especies </p>
           
            
            <input type="hidden" value="verespecies" name="todo"/>
            <input type="submit" value="ver">

        </form>
        
        <form action="controlador" method="post">
            
            <p> Ver todos los animales </p>
           
            
            <input type="hidden" value="veranimales" name="todo"/>
            <input type="submit" value="ver">

        </form>
        
        <form action="controlador" method="post">
            
            <p> Ver todos las plantaciones </p>
           
            
            <input type="hidden" value="verplantaciones" name="todo"/>
            <input type="submit" value="ver">

        </form>
        
        <form action="controlador" method="post">
            
            <p> Ir a insertar parcela </p>
           
            
            <input type="hidden" value="insertarparcela" name="todo"/>
            <input type="submit" value="insertar">

        </form>
        <form action="controlador" method="post">
            
            <p> Ir a insertar usuario </p>
           
            
            <input type="hidden" value="insertarusuario" name="todo"/>
            <input type="submit" value="insertar">

        </form>
        <form action="controlador" method="post">
            
            <p> Ir a insertar animal </p>
           
            
            <input type="hidden" value="insertaranimal" name="todo"/>
            <input type="submit" value="insertar">

        </form>
        <form action="controlador" method="post">
            
            <p> Ir a insertar plantacion </p>
           
            
            <input type="hidden" value="insertarplantacion" name="todo"/>
            <input type="submit" value="insertar">

        </form>
        <form action="controlador" method="post">
            
            <p> Ir a insertar especie </p>
           
            
            <input type="hidden" value="insertarespecies" name="todo"/>
            <input type="submit" value="insertar">

        </form>
        
        
        
        <form action="controlador" method="post">
            
            <p> Ir a modificar.jsp </p>
            
            <input type="hidden" name="todo" value="modificar">
            <input type="submit" value="modificar">
            
        </form>
        
        <form action="controlador" method="post">
            
            <p> Ir a index.jsp </p>
            
            <input type="hidden" name="todo" value="index">
            <input type="submit" value="index">
            
        </form>
        
        <% } else { %>
    <h1>NO TIENES ACCESO</h1>
    <a href="index.jsp">Inicio</a>
    
    
    <% } %>
        
        
    </body>
</html>
