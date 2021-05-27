/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;

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
            throws ServletException, IOException, ClassNotFoundException, InstantiationException, SQLException, ParseException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //PRINCIPIO DEL CONTROLADOR, AQUI SE VERIFICA SI EL USUARIO EL VALIDO Y SI EL ATRIBUTO ESTADO TIENE ALGUN VALOR
            HttpSession session = request.getSession(true);

            //Se obtiene la variable estado, esta nos permite navegar por el controlador
            String estado = (String) session.getAttribute("estado");

            //Aquí se verifica que el parametro todo es distinto de null, si es así se se da como valor a estado todo,
            //por tanto cada vez que queramos cambiar de pagina igualamos el parametro a la referencia que tiene en el Toolbox.nextPage();
            if (request.getParameter("todo") != null) {
                estado = request.getParameter("todo");
            }

            //Se imprime la variable estado para sacar por consola su valor
            System.out.println(estado);
            String nextPage;

            //Se inicializa la variable nextPage que será el resultado de la navegación
            //si el estado no es negativo se verifican los posibles valores de estado para poder ejecutar las funciones correspondientes
            if (estado != null) {

                //Si el estado es autenticado, es al iniciar la página
                if (estado.equals("autenticado")) {

                    //Se capturan los parametros user y pass (usuario y contraseña) que ha metido el usuario en el login
                    String user = request.getParameter("user");
                    String pass = request.getParameter("pass");

                    //Estas variables se pasan por la funcion de validacion y si valida (si devuelve true) se crean variables de sesion con los datos del usuario (user y pass)
                    if (controladores.Toolbox.validacion(user, pass)) {
                        request.setAttribute("usuario", user);
                        session.setAttribute("usuario", user);
                        session.setAttribute("contra", pass);

                        //Cuando se inicia sesion estado toma valor a menu, esta varible se envia al final del controlador a Toolbox.nextPage() para dirigirnos a el menu principal
                        estado = "menu";
                        session.setAttribute("usuarioValido", true);
                    } else {
                        session.invalidate();
                        session = request.getSession(true);
                        estado = null;
                    }

                    //INSERTAR PARCELA
                } else if (estado.equals("ejecutarpinsert")) {

                    //Se capturan los valores pasados por parametros y se intenta hacer la conexion a la base de datos dentro de un try-catch
                    int hectareas = Integer.parseInt(request.getParameter("hectareas"));
                    String user = (String) session.getAttribute("usuario");
                    int iduser = ClasesBD.UsuarioBD.idUser(user);
                    int idpropietario = ClasesBD.PropietarioBD.idProp(iduser);
                    int idestado = Integer.parseInt(request.getParameter("idestado"));
                    int idtipoparcela = Integer.parseInt(request.getParameter("idtipoparcela"));
                    int referencia = Integer.parseInt(request.getParameter("referencia"));

                    ClasesBD.ParcelaBD.insertar(hectareas, idpropietario, idestado, idtipoparcela, referencia);

                    //metodo creado en el Toolbox que devuelve el id de la parcela cuando le pasamos su referencia
                    int idparcela = ClasesBD.ParcelaBD.buscarPorRef(referencia);

                    //Hay dos tipos de parcelas que estan relacionadas con Parcela, estas son pagricola y pganadera, 
                    //al crear la parcela le hemos tenido que asignar un tipo, por tanto se introduce los datos de la parcela creada tambien en las parcelas hijas de esta
                    //SI EL TIPO DE PARCELA ES 1 POR TANTO ES AGRICOLA Y SE AÑADE EN PAGRICOLA
                    if (idtipoparcela == 1) {

                        ClasesBD.PAgricolaBD.insertarAgricola(idparcela, referencia);

                        //SI EL TIPO DE PARCELA ES 2 ES GANADERA Y POR TANTO SE AÑADE A PGANADERA
                    } else if (idtipoparcela == 2) {

                        ClasesBD.PGanaderaBD.insertarGanadera(idparcela, referencia);
                    }

                    //SE VUELVE AL MENUPARCELAS
                    estado = "gestionparcelas";

                    //BORRAR PARCELA
                } else if (estado.equals("ejecutarbparcela")) {

                    int idparcela = Integer.parseInt(request.getParameter("idparcela"));

                    //La parcela tiene una relacion padre hijo con las parcelas agricolas y ganaderas por tanto hay que borrar antes la parcela de las tablas agricola o ganadera
                    //Se deben de borra las plantaciones que se encuentran en esa parcela
                    //Aqui se borran las plantaciones de esa parcela
                    try {

                        int idagricola = ClasesBD.PAgricolaBD.buscarAgricola(idparcela);

                        ClasesBD.PlantacionBD.borrarPorParcela(idagricola);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    //Aquí se borran los animales de esa parcela
                    try {

                        int idganadera = ClasesBD.PGanaderaBD.buscarGanadera(idparcela);

                        ClasesBD.AnimalBD.borrarPorParcela(idganadera);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    //Se deben de borrar tambien las filas de la tabla trabaja que estan relacionadas con el jornalero
                    try {

                        ClasesBD.ParcelaBD.borrarTrabajaParcela(idparcela);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    //Aqui se borra el registro de la parcela si es agricola
                    try {

                        ClasesBD.PAgricolaBD.borrarPAgricola(idparcela);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    //Aqui se borra el registro de la parcela si es ganadera
                    try {

                        ClasesBD.PGanaderaBD.borrarPGanadera(idparcela);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    //Por ultimo se intenta borrar la parcela 
                    try {
                        ClasesBD.ParcelaBD.borrar(idparcela);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    //SE VUELVE A MENUPARCELA
                    estado = "gestionparcelas";

                    //SE BORRA LA ESPECIE
                } else if (estado.equals("ejecutarbespecie")) {

                    int idespecie = Integer.parseInt(request.getParameter("idespecie"));

                    //Se borra la especie agricola o ganadera antes de borrar la especie al ser un borrado en cascada, ademas tambien debemos de borrar antes los animales o las plantaciones realacionadas
                    //PRIMERO SE INTENTA BORRAR LA ESPECIE AGRICOLA QUE TENGA COMO IDESPECIE LA ESPECIE QUE QUEREMOS BORRAR
                    try {

                        //Para borrar las plantaciones y la especie agricola
                        int ideagricola = ClasesBD.EAgricolaBD.buscarPorEspecie(idespecie);

                        ClasesBD.PlantacionBD.borrarPorEAgricola(ideagricola);
                        ClasesBD.EAgricolaBD.borrarPorEspecie(idespecie);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    //TAMBIEN SE INTENTA BORRAR LA ESPECIE GANADERA QUE TENGA COMO IDESPECIE LA QUE QUEREMOS BORRAR
                    try {

                        int ideganadera = ClasesBD.EGanaderaBD.buscarPorEspecie(idespecie);

                        ClasesBD.AnimalBD.borrarPorEGanadera(ideganadera);
                        ClasesBD.EGanaderaBD.borrarPorEspecie(idespecie);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    //POR ULTIMO SE BORRA LA ESPECIE DADO QUE TIENE UNA RELACION PADRE HIJO CON EGARCIOLA Y EGANADERA HAY BORRAR ANTES DE LA TABLA HIJO QUE DE LA PADRE
                    ClasesBD.EspecieBD.borrar(idespecie);
                    //VUELVE A MENUESPECIE
                    estado = "gestionespecies";
                    //AÑADIR USUARIO
                } else if (estado.equals("ejercutariusuario")) {
                    String nombre = request.getParameter("nombre");
                    String email = request.getParameter("email");
                    String dni = request.getParameter("dni");
                    int telefono = Integer.parseInt(request.getParameter("telefono"));
                    String contrasena = request.getParameter("pass");
                    if (ClasesBD.UsuarioBD.existeUsuarioNombre(nombre) == true) {

                        ClasesBD.UsuarioBD.insertar(nombre, email, dni, telefono, 2, contrasena);
                        int idusuario = ClasesBD.UsuarioBD.buscarPorNombre(nombre);
                        ClasesBD.UsuarioBD.insertarJoralero(idusuario);

                        estado = "gestionusuarios";

                    } else {

                        estado = "irinsertarusuario";

                    }

                    //VUELVE A MENUSUARIO
                    //INSERTA ANIMAL
                } else if (estado.equals("insertaranimal")) {

                    //Se capturan los valores que se van a introducir para dar de alta el animal
                    char sexo = request.getParameter("sexo").charAt(0);
                    int idespecie = Integer.parseInt(request.getParameter("idespecie"));
                    int idparcela = Integer.parseInt(request.getParameter("idparcela"));

                    //Se llama a la funcion en la que esta la consulta insert
                    ClasesBD.AnimalBD.insertAnimal(sexo, idespecie, idparcela);

                    //VUELVE A MENUANIMAL
                    estado = "gestionanimal";

                    //INSERTA PLANTACIONES
                } else if (estado.equals("inserplantacion")) {

                    //Se capturan los valores que se van a introducir
                    Date fecha = Date.valueOf(request.getParameter("fecha"));
                    int idespecie = Integer.parseInt(request.getParameter("idespecie"));
                    int idparcela = Integer.parseInt(request.getParameter("idparcela"));

                    //Se llama a la funcion  que ejecuta el insert
                    ClasesBD.PlantacionBD.insertPlantacion(fecha, idespecie, idparcela);

                    //VUELVE A MENUANIMAL
                    estado = "gestionplantaciones";

                    //Borra plantaciones
                } else if (estado.equals("ejecutarbplantacion")) {

                    //Se captura el int de la plantacion que ha pasado por parametro
                    int idplantacion = Integer.parseInt(request.getParameter("idplantacion"));

                    //Se llama a la funcion de borrado que esta en el paquete ClasesBD
                    ClasesBD.PlantacionBD.borrar(idplantacion);

                    //Vuelve al menu de las plataciones
                    estado = "gestionplantaciones";

                    //Borrar usuario
                } else if (estado.equals("ejecutarbusuario")) {

                    int idusuario = Integer.parseInt(request.getParameter("idusuario"));
                    
                    //BORRAR DE LA TABLA TRABAJA SI ESTA EL JORNALERO
                    try {

                        int idjornalero = ClasesBD.JornaleroBD.idJornalero(idusuario);

                        ClasesBD.ParcelaBD.borrarTrabajaJornalero(idjornalero);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    
                    //BORRAR EL JORNALERO
                    try {
                        ClasesBD.UsuarioBD.borrarJornalero(idusuario);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    
                    //BORRAR LOS ANIMALES POR 
                    try {

                        int idpropietario = ClasesBD.PropietarioBD.idProp(idusuario);

                        ClasesBD.UsuarioBD.borrarPropietario(idusuario);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    ClasesBD.UsuarioBD.borrar(idusuario);

                    //VUELVE A MENUSUARIOS
                    estado = "gestionusuarios";

                    //BORRAR ANIMAL
                } else if (estado.equals("ejecutarbanimal")) {

                    //Se captura el id del animal que se quiere borrar
                    int idanimal = Integer.parseInt(request.getParameter("idanimal"));

                    //Se llama a la funcion donde esta el delete
                    ClasesBD.AnimalBD.borrar(idanimal);

                    //VUELVE A MENUANIMALES
                    estado = "gestionanimal";

                    //INSERTAR ESPECIE
                } else if (estado.equals("insertespecie")) {

                    String nombre = request.getParameter("nombre");
                    int idtipo = Integer.parseInt(request.getParameter("idtipo"));

                    ClasesBD.EspecieBD.insertEspecie(nombre, idtipo);

                    int idespecie = ClasesBD.EspecieBD.buscarPorNombre(nombre);

                    //SI EL TIPO DE LA ESPECIE ES AGRICOLA SE AÑADE EN EAGRICOLA
                    if (idtipo == 1) {

                        ClasesBD.EAgricolaBD.insertEAgricola(idespecie, nombre);

                        //SI EL TIPO DE LA ESPECIE ES GANADERA SE AÑADE EN EGANADERA
                    } else if (idtipo == 2) {

                        ClasesBD.EGanaderaBD.insertEGanadera(idespecie, nombre);

                    }
                    //VUELVE AL MENU GESTIONESPCIES
                    estado = "gestionespecies";

                    //MODIFICAR PARCELA
                } else if (estado.equals("ejecutarUpdateParcela")) {

                    int idestado = Integer.parseInt(request.getParameter("idestado"));
                    int idparcela = (Integer) session.getAttribute("parcela");

                    ClasesBD.ParcelaBD.modificar(idparcela, idestado);

                    //VUELVE A MENUPARCELAS
                    estado = "gestionparcelas";
                } else if (estado.equals("ejecutarUpdatePlantacion")) {

                    Date fecha = Date.valueOf(request.getParameter("frecogida"));
                    int idplantacion = (Integer) session.getAttribute("idplantacion");

                    ClasesBD.PlantacionBD.modificar(fecha, idplantacion);

                    //VUELVE A MENUPARCELAS
                    estado = "gestionplantaciones";
                } else if (estado.equals("ejecutarUpdateusuario")) {
                    String pass = request.getParameter("pass");
                    out.println(pass);
                    int idusuario = (Integer) session.getAttribute("iduser");

                    ClasesBD.UsuarioBD.modificarContra(idusuario, pass);

                    estado = "gestionusuarios";

                } else if (estado.equals("asignajornalero")) {
                    int idjornalero = Integer.parseInt(request.getParameter("idjornalero"));
                    int idparcela = Integer.parseInt(request.getParameter("idparcela"));

                    ClasesBD.PropietarioBD.asiganarJornalero(idjornalero, idparcela);

                    estado = "gestionusuarios";

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
        } catch (ParseException ex) {
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
        } catch (ParseException ex) {
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
