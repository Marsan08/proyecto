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
 * Alternativa a controlador con switch
 *
 * @author Mar
 */
public class controlador2 extends HttpServlet {

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
            String user = "", sqlStr = "", nextPage;
            int state, idestado;
            Connection conn = null;
            Statement stmt = null;
            switch (estado) {
                case "autenticado":

                    user = request.getParameter("user");
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
                    break;

                case "gestionparcelas":
                    break;
                case "verplantaciones":
                    break;
                case "verparcelas":
                    break;
                case "verespecies":
                    break;
                case "verusuarios":
                    break;
                case "borrar":
                    break;
                case "modificar":
                    break;
                case "ejecutarpinsert":

                    int hectareas = Integer.parseInt(request.getParameter("hectareas"));
                    user = (String) session.getAttribute("usuario");
                    int iduser = controladores.Toolbox.idUser(user);
                    int idpropietario = controladores.Toolbox.idProp(iduser);
                    idestado = Integer.parseInt(request.getParameter("idestado"));
                    int idtipoparcela = Integer.parseInt(request.getParameter("idtipoparcela"));
                    int referencia = Integer.parseInt(request.getParameter("referencia"));

                    try {
                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "insert into parcela(hectareas, idpropietario, idestado, idtipoparcela, referencia) values(" + hectareas + ", " + idpropietario + ", " + idestado + ", " + idtipoparcela + ", " + referencia + ");";
                        state = stmt.executeUpdate(sqlStr);

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

                    if (idtipoparcela == 1) {
                        try {
                            conn = controladores.Toolbox.Conexion();
                            stmt = conn.createStatement();
                            sqlStr = "insert into pagricola(idparcela, referencia) values(" + idparcela + ", " + referencia + ");";
                            state = stmt.executeUpdate(sqlStr);

                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    } else if (idtipoparcela == 2) {
                        try {
                            conn = controladores.Toolbox.Conexion();
                            stmt = conn.createStatement();
                            sqlStr = "insert into pganadera(idparcela, referencia) values(" + idparcela + ", " + referencia + ");";
                            state = stmt.executeUpdate(sqlStr);

                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }
                    estado = "gestionparcelas";
                    break;

                case "ejecutarbparcela":
                    try {
                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "delete from pagricola where idparcela=" + Integer.parseInt(request.getParameter("idparcela")) + ";";
                        state = stmt.executeUpdate(sqlStr);

                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    try {
                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "delete from pganadera where idparcela=" + Integer.parseInt(request.getParameter("idparcela")) + ";";
                        state = stmt.executeUpdate(sqlStr);

                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    try {

                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "delete from parcela where idparcela=" + Integer.parseInt(request.getParameter("idparcela")) + ";";
                        state = stmt.executeUpdate(sqlStr);

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
                    break;

                case "ejecutarbespecie":
                    try {
                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "delete from eagricola where idespecie=" + Integer.parseInt(request.getParameter("idespecie")) + ";";
                        state = stmt.executeUpdate(sqlStr);

                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    try {
                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "delete from eganadera where idespecie=" + Integer.parseInt(request.getParameter("idespecie")) + ";";
                        state = stmt.executeUpdate(sqlStr);

                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    conn = controladores.Toolbox.Conexion();
                    stmt = conn.createStatement();
                    sqlStr = "delete from especie where idespecie=" + Integer.parseInt(request.getParameter("idespecie")) + ";";
                    state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }

                    estado = "gestionespecies";
                    break;

                case "ejecutariusuario":
                    String idusuario = request.getParameter("idusuario");
                    String nombre = request.getParameter("nombre");
                    String email = request.getParameter("email");
                    String dni = request.getParameter("dni");
                    int telefono = Integer.parseInt(request.getParameter("telefono"));
                    String contrasena = request.getParameter("contrasena");
                    int idrol = Integer.parseInt(request.getParameter("idrol"));

                    try {

                        conn = controladores.Toolbox.Conexion();// Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                        stmt = conn.createStatement();// Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                        sqlStr = "insert into usuario(nombre, email, dni, telefono, idrol, contraseña) values('" + nombre + "', '" + email + "', '" + dni + "', " + telefono + ", " + idrol + ", '" + contrasena + "');";
                        state = stmt.executeUpdate(sqlStr);

                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    int idespecifico = Integer.parseInt(request.getParameter("idespecifico"));
                    idparcela = Integer.parseInt(request.getParameter("idparcela"));

                    if (idrol == 2) {//admin
                        try {

                            conn = controladores.Toolbox.Conexion();// Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                            stmt = conn.createStatement();// Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                            sqlStr = "insert into admin(idjornalero, idparcela, idusuario, nombre) values('" + idespecifico + "', '" + idparcela + "', '" + idusuario + "', " + nombre + "');";
                            state = stmt.executeUpdate(sqlStr);

                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    } else {
                        try {
                            if (idrol == 3) {//jornalero
                                conn = controladores.Toolbox.Conexion();// Paso 3: Crear sentencias SQL, utilizando objetos de tipo Statement
                                stmt = conn.createStatement();// Paso 4: Ejecutar las sentencias SQL a traves de los objetos Statement
                                sqlStr = "insert into jornalero(idjornalero, idparcela, idusuario, nombre) values('" + idespecifico + "', '" + idparcela + "', '" + idusuario + "', " + nombre + "');";
                                state = stmt.executeUpdate(sqlStr);

                                if (stmt != null) {
                                    stmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }
                    estado = "menu";
                    break;

                case "insertanimal":

                    char sexo = request.getParameter("sexo").charAt(0);
                    int idespecie = Integer.parseInt(request.getParameter("idespecie"));
                    idparcela = Integer.parseInt(request.getParameter("idparcela"));

                    conn = controladores.Toolbox.Conexion();
                    stmt = conn.createStatement();
                    sqlStr = "insert into animal(sexo, ideganadera, idparcela) values('" + sexo + "' , " + idespecie + ", " + idparcela + ");";
                    state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                    estado = "irinsertanimal";
                    break;

                case "ejecutarbusuario":

                    try {
                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "delete from usuario where nombre='" + request.getParameter("nombreusuario") + "';";
                        state = stmt.executeUpdate(sqlStr);

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
                    break;

                case "insertespecie":

                    nombre = request.getParameter("nombre");
                    int idtipo = Integer.parseInt(request.getParameter("idtipo"));
                    try {
                        conn = controladores.Toolbox.Conexion();
                        stmt = conn.createStatement();
                        sqlStr = "insert into especie (nombreespecie, tipo) values ( '" + nombre + "' , " + idtipo + ");";
                        state = stmt.executeUpdate(sqlStr);

                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    idespecie = controladores.Toolbox.idespecie(nombre);

                    if (idtipo == 1) {

                        try {
                            conn = controladores.Toolbox.Conexion();

                            stmt = conn.createStatement();

                            sqlStr = "insert into eagricola(idespecie, nombreespecie) values(" + idespecie + ", '" + nombre + "');";
                            state = stmt.executeUpdate(sqlStr);

                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    } else if (idtipo == 2) {

                        try {
                            conn = controladores.Toolbox.Conexion();
                            stmt = conn.createStatement();
                            sqlStr = "insert into eganadera(idespecie, nombreespecie) values(" + idespecie + ", '" + nombre + "');";
                            state = stmt.executeUpdate(sqlStr);

                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }

                    estado = "gestionespecies";
                    break;

                case "ejecutarUpdateParcela":

                    idestado = Integer.parseInt(request.getParameter("idestado"));
                    idparcela = (Integer) session.getAttribute("idparcela");

                    conn = controladores.Toolbox.Conexion();
                    stmt = conn.createStatement();
                    sqlStr = "UPDATE `parcela` SET `idestado`=" + idestado + " WHERE idparcela = " + idparcela + ";";
                    state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }

                    estado = "gestionparcelas";
                    break;

                case "cerrar":
                default:
                    session.invalidate();
                    session = request.getSession(true);
                    estado = null;
                    break;
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
