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
        String contrasenaenc = "";
        try {
            MessageDigest mensaje = MessageDigest.getInstance("SHA");
            byte[] textoArrayBytes = contrasena.getBytes();
            mensaje.update(textoArrayBytes);
            contrasenaenc = mensaje.digest().toString();

            while (contrasenaenc.length() < 32) {
                contrasenaenc = "0" + contrasenaenc;
            }
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return contrasenaenc;
    }
    
    
    public static boolean validacion(String user, String pass) {
        java.sql.Connection conn = null;
        java.sql.Statement stmt = null;
        try {
            conn=Conexion();
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
            conn=Conexion();
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

    public static int idUser(String user) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn=Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario WHERE nombre='" + user + "'";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idusuario");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM usuario WHERE nombre='" + user + "'";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("idusuario");
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
    
    
    public static int idparcela(int referencia) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn=Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM parcela WHERE referencia=" + referencia + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idparcela");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM parcela WHERE referencia=" + referencia + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("idparcela");
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
    
    public static int idespecie(String nombre) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn=Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM especie WHERE nombreespecie='" + nombre + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idespecie");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM especie WHERE nombreespecie='" + nombre + "';";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("idespecie");
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

    public static int idProp(int iduser) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn=Conexion();
            stmt = (Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM propietario WHERE idusuario='" + iduser + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idpropietario");
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
    
     public static int idAdmin(int iduser) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn=Conexion();
            stmt = (Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM admin WHERE idusuario='" + iduser + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idadmin");
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
     
     public static int idJornalero(int iduser) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn=Conexion();
            stmt = (Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM jornalero WHERE idusuario='" + iduser + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idjornalero");
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
    
     public static int parcelaAdmin(int iduser) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn=Conexion();
            stmt = (Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM admin WHERE idusuario='" + iduser + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idparcela");
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
     public static int parcelaJornalero(int iduser) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn=Conexion();
            stmt = (Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM jornalero WHERE idusuario='" + iduser + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idparcela");
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
     
      public static int pagricola(int idparcela) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn=Conexion();
            stmt = (Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM pagricola WHERE idparcela='" + idparcela + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idpagricola");
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
      
      public static int pganadera(int idparcela) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn=Conexion();
            stmt = (Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM pganadera WHERE idparcela='" + idparcela + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idpganadera");
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
        } else if (estado.equals("modificarusuario")) {
            nextPage = "/modificaUsuario.jsp";
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
        }else if (estado.equals("gestionplantaciones")) {
            nextPage = "/menuplantaciones.jsp";
        }else if (estado.equals("modificarplantacion")) {
            nextPage = "/modfiicarplantacion.jsp";
        }
        return nextPage;
    }

    public int existeUsuario(String usuario) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConexion();
        String sql = "SELECT count(id) FROM usuarios WHERE usuario = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

            return 1;

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.toString());
            return 1;
        } finally {
            con.close();
        }
    }
    
    

    private Connection getConexion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

