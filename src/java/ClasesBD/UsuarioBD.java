/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Parcela;
import clases.Propietario;
import clases.Usuario;
import com.mysql.jdbc.Connection;
import static controladores.Toolbox.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Marsan
 */
public class UsuarioBD {

    private static ArrayList<Parcela> listaParcelas = new ArrayList<Parcela>();
    private static ArrayList<Propietario> listaProp = new ArrayList<Propietario>();
    private static ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();

    public static void cargarParcelas(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException {

        listaParcelas = new ArrayList<Parcela>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela WHERE idpropietario=" + idpropietario + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Parcela p = new Parcela(rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idtipoparcela"), rset.getInt("referencia"));
            listaParcelas.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static void cargarUsuarios() throws ClassNotFoundException, SQLException, InstantiationException {

        listaUsuarios = new ArrayList<Usuario>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM usuario WHERE idrol= 2 ";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Usuario u = new Usuario(rset.getInt("idUsuario"), rset.getString("nombre"), rset.getString("email"), rset.getString("dni"), rset.getInt("telefono"), rset.getInt("idrol"), rset.getString("pass"));
            listaUsuarios.add(u);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static void cargarProp(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException {

        listaProp = new ArrayList<Propietario>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM `propietario` INNER JOIN usuario ON propietario.idusuario = usuario.idUsuario;";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Propietario p = new Propietario(rset.getInt("idpropietario"), rset.getInt("usuario.idusuario"), rset.getString("usuario.nombre"), rset.getString("usuario.email"), rset.getString("usuario.dni"), rset.getInt("usuario.telefono"), rset.getInt("usuario.idrol"), rset.getString("usuario.pass"));
            listaProp.add(p);
        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static int idUser(String user) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
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

    public static String sacarDni(int idusuario) {

        Connection conn = null;
        Statement stmt = null;
        String validar = "";

        try {
            conn = Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("dni");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getString("dni");
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

    public static String sacarNombre(int idusuario) {

        Connection conn = null;
        Statement stmt = null;
        String validar = "";

        try {
            conn = Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("nombre");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getString("nombre");
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

    public static String sacarEmail(int idusuario) {

        Connection conn = null;
        Statement stmt = null;
        String validar = "";

        try {
            conn = Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("email");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getString("email");
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

    public static int sacarTlfn(int idusuario) {

        Connection conn = null;
        Statement stmt = null;
        int validar = 0;

        try {
            conn = Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("telefono");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM usuario WHERE idusuario=" + idusuario + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("telefono");
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

    public static String sacarNombreRol(int idrol) {

        Connection conn = null;
        Statement stmt = null;
        String validar = "";

        try {
            conn = Conexion();
            stmt = (Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM rol WHERE idrol=" + idrol + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("nombre");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM rol WHERE idrol=" + idrol + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getString("nombre");
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

    public static void insertar(String nombre, String email, String dni, int telefono, int rol, String pass) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into usuario(nombre, email, dni, telefono, idrol, pass) values('" + nombre + "', '" + email + "', '" + dni + "', " + telefono + ", " + rol + ", '" + pass + "');";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void insertarJoralero(int iduser) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into jornalero(idusuario) values(" + iduser + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void borrar(int iduser) throws ClassNotFoundException, InstantiationException, SQLException {

        java.sql.Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();
        String sqlStr = "delete from usuario where idUsuario=" + iduser + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void borrarJornalero(int iduser) throws ClassNotFoundException, InstantiationException, SQLException {

        java.sql.Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();
        String sqlStr = "delete from jornalero where idusuario=" + iduser + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void borrarPropietario(int iduser) throws ClassNotFoundException, InstantiationException, SQLException {

        java.sql.Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();
        String sqlStr = "delete from propietario where idusuario=" + iduser + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void modificarContra(int iduser, String pass) throws ClassNotFoundException, InstantiationException, SQLException {

        java.sql.Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();
        String sqlStr = "UPDATE `usuario` SET `pass` = '" + pass + "' WHERE `usuario`.`idUsuario` = " + iduser + ";";
        int state = stmt.executeUpdate(sqlStr);
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void modificarDatos(int iduser, String nombre, String email, int telefono) throws ClassNotFoundException, InstantiationException, SQLException {

        java.sql.Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();
        String sqlStr = "UPDATE `usuario` SET nombre = '" + nombre + "' , email = '" + email + "' , telefono = " + telefono + " WHERE idusuario = " + iduser + ";";
        int state = stmt.executeUpdate(sqlStr);
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static int buscarPorNombre(String nombre) {
        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;

        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM usuario WHERE nombre='" + nombre + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idUsuario");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM usuario WHERE nombre='" + nombre + "';";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("idUsuario");
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

    public static Boolean existeUsuarioNombre(String nombre) throws SQLException, ClassNotFoundException, InstantiationException {

        Boolean bool = false;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT count(idUsuario) FROM usuario WHERE nombre ='" + nombre + "';";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            if (rset.getInt("count(idUsuario)") > 0) {

                bool = false;

                return bool;

            } else if (rset.getInt("count(idUsuario)") == 0) {

                bool = true;

                return true;

            }
        }

        rset.close();
        stmt.close();
        conn.close();

        return bool;

    }

    public static int parcelasSize() {

        return listaParcelas.size();
    }

    public static int UsuariosSize() {

        return listaUsuarios.size();
    }

    public static int getId(int idparcela) {
        return listaParcelas.get(idparcela).getIdparcela();
    }

    public static int getHectareas(int idparcela) {
        return listaParcelas.get(idparcela).getHectareas();

    }

    public static int getReferencia(int idparcela) {
        return listaParcelas.get(idparcela).getReferencia();
    }

    public static int getTipo(int idparcela) {
        return listaParcelas.get(idparcela).getIdtipoparcela();
    }

    public static String getNombre(int idpropietario) {

        return listaProp.get(idpropietario).getNombre();
    }

    public static int idusuario(int idusuario) {

        return listaUsuarios.get(idusuario).getIdusuario();
    }

    public static String nombreuser(int idusuario) {

        return listaUsuarios.get(idusuario).getNombre();
    }

    public static String email(int idusuario) {

        return listaUsuarios.get(idusuario).getEmail();
    }

    public static String dniuser(int idusuario) {

        return listaUsuarios.get(idusuario).getDni();
    }

    public static String passuser(int idusuario) {

        return listaUsuarios.get(idusuario).getPass();
    }

    public static int telefono(int idusuario) {

        return listaUsuarios.get(idusuario).getTelefono();
    }

    public static int idrol(int idusuario) {

        return listaUsuarios.get(idusuario).getIdrol();
    }

}
