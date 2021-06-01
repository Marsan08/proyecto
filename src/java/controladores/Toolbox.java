package controladores;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;

import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author DAW208
 */
public class Toolbox {

    //login y contraseña utilizados para la conectarse a la base de datos
    private static String loginBD = "admin";
    private static String passwordBD = "admin";

    public static String encriptaContrasena(String contrasena) {
        try {
            byte[] textoArrayBytes = contrasena.getBytes();
            MessageDigest mensaje = MessageDigest.getInstance("SHA");
            mensaje.update(textoArrayBytes);
            byte[] resumen = mensaje.digest();
            String cadenaHexadecimal = "";
            String apoyo;
            for (int i = 0; i < resumen.length; i++) {
                apoyo = Integer.toHexString(resumen[i] & 0xFF);
                if (apoyo.length() == 1) {
                    apoyo = "0" + apoyo;
                }
                cadenaHexadecimal = cadenaHexadecimal + apoyo;
            }
            return cadenaHexadecimal;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static boolean validacion(String user, String pass) {
        java.sql.Connection conn = null;
        java.sql.Statement stmt = null;
        try {
            conn = Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario where nombre='" + user + "' and pass='" + pass + "';";
            //PARA DEPURACIÓN
            System.out.println("La consulta sql es " + sqlStr);
            //Ejecutar la sentencia SQL a través de los objetos Statement 
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                return true;
            }

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
        return false;
    }

    public static int rol(String user, String pass) {
        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario WHERE nombre='" + user + "' and pass='" + pass + "'";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idusuario");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM usuario WHERE idusuario = '" + id + "'";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("idrol");
                System.out.println("ENTRA");
            }

            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("NO ENTRA");
        }
        return validar;

    }

    /**
     * metodo que realiza la conexion a la base de datos gestionParcelas
     *
     * @return una conexion a la base de datos gestionParcelas
     * @throws ClassNotFoundException
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws SQLException
     */
    public static Connection Conexion() throws ClassNotFoundException, InstantiationException, SQLException {

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
            conn = (Connection) DriverManager.getConnection(url, userName, password);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return conn;
    }

    public static String getNextPage(String estado) {
        String nextPage = "";
        if (estado == null) {
            nextPage = "/index.jsp";

        } else if (estado.equals("menu")) {
            nextPage = "/menu.jsp";

        } else if (estado.equals("gestionusuarios")) {
            nextPage = "/menusuario.jsp";

        } else if (estado.equals("gestionespecies")) {
            nextPage = "/menuespecie.jsp";

        } else if (estado.equals("gestionparcelas")) {
            nextPage = "/menuparcela.jsp";

        } else if (estado.equals("irinsertespecie")) {
            nextPage = "/insertarespecies.jsp";

        } else if (estado.equals("irinsertparcela")) {
            nextPage = "/insertarparcela.jsp";

        } else if (estado.equals("modificarparcela")) {
            nextPage = "/modificaparcela.jsp";

        } else if (estado.equals("irinsertanimal")) {
            nextPage = "/insertaranimal.jsp";

        } else if (estado.equals("irinsertarplantacion")) {
            nextPage = "/insertarplantacion.jsp";

        } else if (estado.equals("gestionanimal")) {
            nextPage = "/menuanimales.jsp";

        } else if (estado.equals("gestionplantaciones")) {
            nextPage = "/menuplantaciones.jsp";

        } else if (estado.equals("modificarplantacion")) {
            nextPage = "/modfiicarplantacion.jsp";

        } else if (estado.equals("irinsertarusuario")) {
            nextPage = "/insertausuario.jsp";

        } else if (estado.equals("modificarcontra")) {
            nextPage = "/modificarcontra.jsp";

        } else if (estado.equals("asignarparcela")) {
            nextPage = "/asignaparcela.jsp";

        } else if (estado.equals("desasignarparcela")) {
            nextPage = "/menutrabaja.jsp";

        } else if (estado.equals("modificardatos")) {
            nextPage = "/modificardatos.jsp";

        }

        return nextPage;
    }

    private Connection getConexion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
