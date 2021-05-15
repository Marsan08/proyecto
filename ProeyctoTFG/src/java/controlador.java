/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mar
 */
public class controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, InstantiationException, SQLException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession(true);
            String estado = (String) session.getAttribute("estado");
            if (request.getParameter("todo") != null) {
                estado = request.getParameter("todo");
            }
            System.out.println(estado);
            String nextPage;
            if (estado != null) {
                if (estado.equals("autenticado")) {
                    String user = request.getParameter("user");
                    String pass = request.getParameter("pass");
                    if (controladores.Toolbox.validacion(user, pass)) {
                        request.setAttribute("usuario", user);
                        estado = "menu";
                        session.setAttribute("usuarioValido", true);
                    } else {
                        session.invalidate();
                        session = request.getSession(true);
                        estado = null;
                    }
                } else if (estado.equals("veranimales") || estado.equals("verplataciones") || estado.equals("verparcelas") || estado.equals("ververespecies") || estado.equals("verusuarios") || estado.equals("borrar") || estado.equals("modificar")) {
                } else if (estado.equals("ejecutarpinsert")) {

                    int hectareas = Integer.parseInt(request.getParameter("hectareas"));
                    String user = (String) session.getAttribute("usuario");
                    int iduser = controladores.Toolbox.idUser(user);
                    int idpropietario = controladores.Toolbox.idProp(iduser);
                    int idestado = Integer.parseInt(request.getParameter("idestado"));
                    int idtipoparcela = Integer.parseInt(request.getParameter("idtipoparcela"));
                    int referencia = Integer.parseInt(request.getParameter("referencia"));

                    
                    try {
                        Connection conn = controladores.Toolbox.Conexion();
                        // Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                        Statement stmt = conn.createStatement();
                        // Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        String sqlStr = "insert into parcela(hectareas, idpropietario, idestado, idtipoparcela, referencia) values(" + hectareas + ", " + idpropietario + ", " + idestado + ", " + idtipoparcela + ", " + referencia + ");";
                        int state = stmt.executeUpdate(sqlStr);
                        
                      
                        // Cerramos el resto de recursos
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    estado = "gestionparcelas";
                } else if (estado.equals("ejecutarbparcela")) {
    
                    Connection conn = null;
                    Statement stmt = null;
                    try {
                        //Paso 1: Cargar el driver JDBC.
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        // Paso 2: Conectarse a la Base de Datos utilizando la clase Connection
                        String userName = "admin";
                        String password = "admin";
                        //URL de la base de datos(equipo, puerto, base de datos)
                        String url = "jdbc:mysql://localhost/gestionparcelas";
                        conn = DriverManager.getConnection(url, userName, password);
                        // Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                        stmt = conn.createStatement();
                        // Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        String sqlStr = "delete from parcela where idparcela="+ Integer.parseInt(request.getParameter("idparcela")) +";";
                        int state = stmt.executeUpdate(sqlStr);
                        
                        // Cerramos el resto de recursos
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    
                    

                    estado = "gestionparcelas";
                } else if (estado.equals("ejecutarbespecie")) {
    
                        Connection conn = controladores.Toolbox.Conexion();
                        // Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                        Statement stmt = conn.createStatement();
                        // Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        String sqlStr = "delete from especie where idespecie="+ Integer.parseInt(request.getParameter("idespecie") )+";";
                        int state = stmt.executeUpdate(sqlStr);
                        
                        // Cerramos el resto de recursos
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }


                    estado = "gestionespecies";
                } else if (estado.equals("ejercutariusuario")) {
                    
                    String nombre = request.getParameter("nombre");
                    String email = request.getParameter("email");
                    String dni = request.getParameter("dni");
                    int telefono = Integer.parseInt(request.getParameter("telefono"));
                    String contrasena = request.getParameter("contrasena");
                    int idrol = Integer.parseInt(request.getParameter("idrol"));
                    

                    Connection conn = null;
                    Statement stmt = null;
                    try {
                        //Paso 1: Cargar el driver JDBC.
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        // Paso 2: Conectarse a la Base de Datos utilizando la clase Connection
                        String userName = "admin";
                        String password = "admin";
                        //URL de la base de datos(equipo, puerto, base de datos)
                        String url = "jdbc:mysql://localhost/gestionparcelas";
                        conn = DriverManager.getConnection(url, userName, password);
                        // Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                        stmt = conn.createStatement();
                        // Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        String sqlStr = "insert into usuario(nombre, email, dni, telefono, idrol, contraseña) values('" + nombre + "', '" + email + "', '" + dni + "', " + telefono + ", " + idrol + ", '" + contrasena + "');";
                        int state = stmt.executeUpdate(sqlStr);
                        
                  
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    estado = "menu";
                } else if (estado.equals("ejecutarbusuario")) {
                      Connection conn = null;
                    Statement stmt = null;
                    try {
                        //Paso 1: Cargar el driver JDBC.
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        // Paso 2: Conectarse a la Base de Datos utilizando la clase Connection
                        String userName = "admin";
                        String password = "admin";
                        //URL de la base de datos(equipo, puerto, base de datos)
                        String url = "jdbc:mysql://localhost/gestionparcelas";
                        conn = DriverManager.getConnection(url, userName, password);
                        // Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                        stmt = conn.createStatement();
                        // Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        String sqlStr = "delete from usuario where nombre='"+ request.getParameter("nombreusuario") +"';";
                        int state = stmt.executeUpdate(sqlStr);
                        
                        // Cerramos el resto de recursos
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    

                    estado = "menu";

                } else if (estado.equals("insertespecie")) {

                    String nombre = request.getParameter("nombre");
                    int idtipo = Integer.parseInt(request.getParameter("idtipo"));

                    Connection conn = null;
                    Statement stmt = null;
                    try {
                        //Paso 1: Cargar el driver JDBC.
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        // Paso 2: Conectarse a la Base de Datos utilizando la clase Connection
                        String userName = "admin";
                        String password = "admin";
                        //URL de la base de datos(equipo, puerto, base de datos)
                        String url = "jdbc:mysql://localhost/gestionparcelas";
                        conn = DriverManager.getConnection(url, userName, password);
                        // Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                        stmt = conn.createStatement();
                        // Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        String sqlStr = "insert into especie (nombreespecie, tipo) values ( '" + nombre + "' , " + idtipo + ");";
                        int state = stmt.executeUpdate(sqlStr);

                        // Cerramos el resto de recursos
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    estado = "gestionespecies";
                } else if (estado.equals("ejecutarUpdateParcela")) {
                    
                    int idestado = Integer.parseInt(request.getParameter("idestado"));
                    int idparcela = (Integer) session.getAttribute("idparcela");
                    
                    Connection conn = controladores.Toolbox.Conexion();
                        // Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                       Statement stmt = conn.createStatement();
                        // Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        String sqlStr = "UPDATE `parcela` SET `idestado`="+ idestado + " WHERE idparcela = " + idparcela +";";
                        int state = stmt.executeUpdate(sqlStr);

                        // Cerramos el resto de recursos
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    

                    estado = "gestionparcelas";
                }
                
                else if (estado.equals("cerrar")) {
                    session.invalidate();
                    session = request.getSession(true);
                    estado = null;
                }
        }
            
            System.out.println(estado);
            session.setAttribute("estado", estado);
            nextPage = controladores.Toolbox.getNextPage(estado);
            ServletContext servletContext = getServletContext();
            RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(nextPage);
            requestDispatcher.forward(request, response);
        }   
    
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
