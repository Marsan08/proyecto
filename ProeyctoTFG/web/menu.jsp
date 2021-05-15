<%-- 
    Document   : menu
    Created on : 10-mar-2021, 23:25:05
    Author     : Mar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%
        session = request.getSession();
       
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        session.setAttribute("usuario", user);
        session.setAttribute("contra", pass);
        String usuario = (String) session.getAttribute("usuario");
        String contra = (String)session.getAttribute("contra");
        session.getAttribute("contra");
        if((Boolean)session.getAttribute("usuarioValido")){  
            if(controladores.Toolbox.rol(usuario, contra) == 1){
    %>
    <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Menú</title>
                </head>
        
            <body>
                <h1>Bienvenido propietario <%= user %></h1>

                <form action="controlador" method="post" id="gestionparcelas">
        
                    <p> Gestionar parcelas </p>
                   
                    <input type="hidden" value="gestionparcelas" name="todo"/>
                    <input type="submit" value="Parcelas">
                   
        
                </form>
        
                <form action="controlador" method="post" id="gestionespecies">
        
                    <p> Gestionar especies </p>
                   
                    <input type="hidden" value="gestionespecies" name="todo"/>
                    <input type="submit" value="Especies">
                   
        
                </form>
                
                <form action="controlador" method="post" id="gestionusuarios">
        
                    <p> Gestionar usuarios </p>
                   
                    <input type="hidden" value="gestionusuarios" name="todo"/>
                    <input type="submit" value="Usuarios">
                   
        
                </form>
        
                <form action="controlador" method="post" class="salir">
        
                   
                    <input type="hidden" value="salir" name="todo"/>
                    <input type="submit" value="Salir">
                   
        
                </form>
                
            </body>
        
            </html>

        
        <% } else if(controladores.Toolbox.rol(usuario, contra) == 2){  
            %>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Menú</title>
                </head>
        
            <body>
                <h1>Bienvenido adminitrador <%= user %></h1>
                
                <form action="controlador" method="post" id="gestionusuarios">
        
                    <p> Gestionar usuarios </p>
                   
                    <input type="hidden" value="gestionusuarios" name="todo"/>
                    <input type="submit" value="ver">
                   
        
                </form>
        
                <form action="controlador" method="post" id="gestionparcelas">
        
                    <p> Gestionar parcelas </p>
                   
                    <input type="hidden" value="gestionparcelas" name="todo"/>
                    <input type="submit" value="ver">
                   
        
                </form>
        
                <form action="controlador" method="post" id="gestionespecies">
        
                    <p> Gestionar especies </p>
                   
                    <input type="hidden" value="gestionespecies" name="todo"/>
                    <input type="submit" value="Especies">
                   
        
                </form>
        
                <form action="controlador" method="post" class="salir">
        
                   
                    <input type="hidden" value="salir" name="todo"/>
                    <input type="submit" value="Salir">
                   
        
                </form>
                
            </body>
        
            </html>
        
                
            <% } else if(controladores.Toolbox.rol(usuario, contra)==3) { %>
            
            
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Menú</title>
                </head>
        
            <body>
                <h1>Bienvenido jornalero <%= user %></h1>
                
                <%-- 
   EL JORNALERO ELIMINA Y AÑADE ANIMALES
                CREA Y MODIFICA PLANTACIONES
                VE LAS ESPECIES
                MODIFICA EL ESTADO DE SU PARCELA
                CAMBIA SU CONTRASEÑA
--%>
        
                
            </body>
        
            </html>
            
            
            <%
} else {%>
                
    
    <html>

        <body>

            <head>

                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Error de acceso</title>

            </head>
    
            <h1>No tienes permisos.</h1>
            <a href="index.jsp">Inicio</a>
        
            </body>
            
            
            

    </html>
    
    
    <% } } else { %>
    
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
        
        
        <% } %>
        
        
 
