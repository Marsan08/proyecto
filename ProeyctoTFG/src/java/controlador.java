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
            //PRINCIPIO DEL CONTROLADOR, AQUI SE VERIFICA SI EL USUARIO EL VALIDO Y SI EL ATRIBUTO ESTADO TIENE ALGUN VALOR
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
                    
                    //INSERTAR PARCELA
                }  else if (estado.equals("ejecutarpinsert")) {

                    int hectareas = Integer.parseInt(request.getParameter("hectareas"));
                    String user = (String) session.getAttribute("usuario");
                    int iduser = controladores.Toolbox.idUser(user);
                    int idpropietario = controladores.Toolbox.idProp(iduser);
                    int idestado = Integer.parseInt(request.getParameter("idestado"));
                    int idtipoparcela = Integer.parseInt(request.getParameter("idtipoparcela"));
                    int referencia = Integer.parseInt(request.getParameter("referencia"));

                    try {
                        Connection conn = controladores.Toolbox.Conexion();

                        Statement stmt = conn.createStatement();

                        String sqlStr = "insert into parcela(hectareas, idpropietario, idestado, idtipoparcela, referencia) values(" + hectareas + ", " + idpropietario + ", " + idestado + ", " + idtipoparcela + ", " + referencia + ");";
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

                    int idparcela = controladores.Toolbox.idparcela(referencia);
                    
                    //SI EL TIPO DE PARCELA ES 1 POR TANTO ES AGRICOLA Y SE AÑADE EN PAGRICOLA
                    if (idtipoparcela == 1) {

                        try {
                            Connection conn2 = controladores.Toolbox.Conexion();

                            Statement stmt2 = conn2.createStatement();

                            String sqlStr2 = "insert into pagricola(idparcela, referencia) values(" + idparcela + ", " + referencia + ");";
                            int state2 = stmt2.executeUpdate(sqlStr2);

                            if (stmt2 != null) {
                                stmt2.close();
                            }
                            if (conn2 != null) {
                                conn2.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                        
                        //SI EL TIPO DE PARCELA ES 2 ES GANADERA Y POR TANTO SE AÑADE A PGANADERA
                    } else if (idtipoparcela == 2) {

                        try {
                            Connection conn2 = controladores.Toolbox.Conexion();

                            Statement stmt2 = conn2.createStatement();

                            String sqlStr2 = "insert into pganadera(idparcela, referencia) values(" + idparcela + ", " + referencia + ");";
                            int state2 = stmt2.executeUpdate(sqlStr2);

                            if (stmt2 != null) {
                                stmt2.close();
                            }
                            if (conn2 != null) {
                                conn2.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }
                    
                    //SE VUELVE AL MENUPARCELAS
                    estado = "gestionparcelas";
                    
                    //SE BORRA LA PARCEÑA
                } else if (estado.equals("ejecutarbparcela")) {

                    //PRIMERO SE INTENTA BORRAR LAS PARCELAS AGRICOLAS QUE TENGAN COMO IDPARCELA LA QUE QUEREMOS BORRAR
                    try {
                        Connection conn2 = controladores.Toolbox.Conexion();
                        Statement stmt2 = conn2.createStatement();
                        String sqlStr2 = "delete from pagricola where idparcela=" + Integer.parseInt(request.getParameter("idparcela")) + ";";
                        int state2 = stmt2.executeUpdate(sqlStr2);

                        if (stmt2 != null) {
                            stmt2.close();
                        }
                        if (conn2 != null) {
                            conn2.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    
                    //TAMBIEN SE INTENTA BORRAR LAS PARCELAS GANADERAS QUE TENGAN COMO IDPARCELA LA QUE QUEREMOS BORRAR
                    try {
                        Connection conn3 = controladores.Toolbox.Conexion();
                        Statement stmt3 = conn3.createStatement();
                        String sqlStr3 = "delete from pganadera where idparcela=" + Integer.parseInt(request.getParameter("idparcela")) + ";";
                        int state3 = stmt3.executeUpdate(sqlStr3);

                        if (stmt3 != null) {
                            stmt3.close();
                        }
                        if (conn3 != null) {
                            conn3.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    
                    //DESPUES DE BORRAR LA PARCELA EN PAGRICOLA O PGANADERA SE BORRA EN PARCELA DEBIDO A QUE HAY QUE HACER UN BORRADO EN CASCADA POR QUE TIENEN UNA REALCION PADRE HIJO
                    
                    try {
                        Connection conn = controladores.Toolbox.Conexion();
                        Statement stmt = conn.createStatement();
                        String sqlStr = "delete from parcela where idparcela=" + Integer.parseInt(request.getParameter("idparcela")) + ";";
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
                    //SE VUELVE A MENUPARCELA
                    estado = "gestionparcelas";
                    
                    //SE BORRA LA ESPECIE
                } else if (estado.equals("ejecutarbespecie")) {
                    
                    //PRIMERO SE INTENTA BORRAR LA ESPECIE AGRICOLA QUE TENGA COMO IDESPECIE LA ESPECIE QUE QUEREMOS BORRAR
                    try {
                        Connection conn2 = controladores.Toolbox.Conexion();
                        Statement stmt2 = conn2.createStatement();
                        String sqlStr2 = "delete from eagricola where idespecie=" + Integer.parseInt(request.getParameter("idespecie")) + ";";
                        int state2 = stmt2.executeUpdate(sqlStr2);

                        if (stmt2 != null) {
                            stmt2.close();
                        }
                        if (conn2 != null) {
                            conn2.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    //TAMBIEN SE INTENTA BORRAR LA ESPECIE GANADERA QUE TENGA COMO IDESPECIE LA QUE QUEREMOS BORRAR
                    try {
                        Connection conn3 = controladores.Toolbox.Conexion();
                        Statement stmt3 = conn3.createStatement();
                        String sqlStr3 = "delete from eganadera where idespecie=" + Integer.parseInt(request.getParameter("idespecie")) + ";";
                        int state3 = stmt3.executeUpdate(sqlStr3);

                        if (stmt3 != null) {
                            stmt3.close();
                        }
                        if (conn3 != null) {
                            conn3.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    
                    //POR ULTIMO SE BORRA LA ESPECIE DADO QUE TIENE UNA RELACION PADRE HIJO CON EGARCIOLA Y EGANADERA HAY BORRAR ANTES DE LA TABLA HIJO QUE DE LA PADRE
                    Connection conn = controladores.Toolbox.Conexion();
                    Statement stmt = conn.createStatement();
                    String sqlStr = "delete from especie where idespecie=" + Integer.parseInt(request.getParameter("idespecie")) + ";";
                    int state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                    //VUELVE A MENUESPECIE
                    estado = "gestionespecies";
                    //AÑADIR USUARIO
                } else if (estado.equals("ejercutariusuario")) {

                    String nombre = request.getParameter("nombre");
                    String email = request.getParameter("email");
                    String dni = request.getParameter("dni");
                    int telefono = Integer.parseInt(request.getParameter("telefono"));
                    String contrasena = request.getParameter("contrasena");
                    int idrol = Integer.parseInt(request.getParameter("idrol"));

                    try {
                        Connection conn = controladores.Toolbox.Conexion();
                        Statement stmt = conn.createStatement();
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
                    
                    //VUELVE A MENUSUARIO
                    estado = "gestionusuarios";
                    //INSERTA ANIMAL
                } else if (estado.equals("insertanimal")) {

                    char sexo = request.getParameter("sexo").charAt(0);
                    int idespecie = Integer.parseInt(request.getParameter("idespecie"));
                    int idparcela = Integer.parseInt(request.getParameter("idparcela"));

                    Connection conn = controladores.Toolbox.Conexion();

                    Statement stmt = conn.createStatement();
                    String sqlStr = "insert into animal(sexo, ideganadera, idparcela) values('" + sexo + "' , " + idespecie + ", " + idparcela + ");";
                    int state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                    
                    //VUELVE A MENUANIMAL
                    estado = "irinsertanimal";
                    
                    //BORRA USUARIOS
                } else if (estado.equals("ejecutarbusuario")) {
                    
                    try {
                        
                        Connection conn = controladores.Toolbox.Conexion();
                        
                        Statement stmt = conn.createStatement();
                        String sqlStr = "delete from usuario where nombre='" + request.getParameter("nombreusuario") + "';";
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
                    //VUELVE A MENUSUARIOS
                    estado = "gestionusuarios";
                    
                    //BORRAR ANIMAL
                } else if (estado.equals("ejecutarbanimal")) {

                    Connection conn = controladores.Toolbox.Conexion();
                    Statement stmt = conn.createStatement();
                    String sqlStr = "delete from animal where idanimal=" + Integer.parseInt(request.getParameter("idanimal")) + ";";
                    int state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                    
                    //VUELVE A MENUANIMALES
                    estado = "gestionanimal";

                    //INSERTAR ESPECIE
                } else if (estado.equals("insertespecie")) {

                    String nombre = request.getParameter("nombre");
                    int idtipo = Integer.parseInt(request.getParameter("idtipo"));

                    Connection conn = null;
                    Statement stmt = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String userName = "admin";
                        String password = "admin";
                        String url = "jdbc:mysql://localhost/gestionparcelas";
                        conn = DriverManager.getConnection(url, userName, password);
                        stmt = conn.createStatement();
                        String sqlStr = "insert into especie (nombreespecie, tipo) values ( '" + nombre + "' , " + idtipo + ");";
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

                    int idespecie = controladores.Toolbox.idespecie(nombre);

                    //SI EL TIPO DE LA ESPECIE ES AGRICOLA SE AÑADE EN EAGRICOLA
                    if (idtipo == 1) {

                        try {
                            Connection conn2 = controladores.Toolbox.Conexion();

                            Statement stmt2 = conn2.createStatement();

                            String sqlStr2 = "insert into eagricola(idespecie, nombreespecie) values(" + idespecie + ", '" + nombre + "');";
                            int state2 = stmt2.executeUpdate(sqlStr2);

                            if (stmt2 != null) {
                                stmt2.close();
                            }
                            if (conn2 != null) {
                                conn2.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                        //SI EL TIPO DE LA ESPECIE ES GANADERA SE AÑADE EN EGANADERA
                    } else if (idtipo == 2) {

                        try {
                            Connection conn2 = controladores.Toolbox.Conexion();

                            Statement stmt2 = conn2.createStatement();

                            String sqlStr2 = "insert into eganadera(idespecie, nombreespecie) values(" + idespecie + ", '" + nombre + "');";
                            int state2 = stmt2.executeUpdate(sqlStr2);

                            if (stmt2 != null) {
                                stmt2.close();
                            }
                            if (conn2 != null) {
                                conn2.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }
                    //VUELVE AL MENU GESTIONESPCIES
                    estado = "gestionespecies";
                    
                    //MODIFICAR PARCELA
                } else if (estado.equals("ejecutarUpdateParcela")) {

                    int idestado = Integer.parseInt(request.getParameter("idestado"));
                    int idparcela = (Integer) session.getAttribute("idparcela");

                    Connection conn = controladores.Toolbox.Conexion();
                    Statement stmt = conn.createStatement();
                    String sqlStr = "UPDATE `parcela` SET `idestado`=" + idestado + " WHERE idparcela = " + idparcela + ";";
                    int state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                    //VUELVE A MENUPARCELAS
                    estado = "gestionparcelas";
                } else if (estado.equals("cerrar")) {
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
