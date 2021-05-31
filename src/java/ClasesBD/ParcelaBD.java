/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Estado;
import clases.Parcela;
import clases.Propietario;
import clases.Tipo;
import com.mysql.jdbc.Connection;
import static controladores.Toolbox.Conexion;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class ParcelaBD {

    private static ArrayList<Parcela> listaParcelas = new ArrayList<Parcela>();

    public static ArrayList<Parcela> getListaParcelas() {
        return listaParcelas;
    }

    public static void setListaParcelas(ArrayList<Parcela> listaParcelas) {
        ParcelaBD.listaParcelas = listaParcelas;
    }

    public static void cargarParcelas() throws ClassNotFoundException, SQLException, InstantiationException {

        listaParcelas = new ArrayList<Parcela>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela;";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Parcela p = new Parcela(rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idtipoparcela"), rset.getInt("referencia"));
            listaParcelas.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static void insertar(int hectareas, int idpropietario, int tipo, int referencia) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into parcela(hectareas, idpropietario, idtipoparcela, referencia) values(" + hectareas + ", " + idpropietario + "," + tipo + ", " + referencia + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void borrar(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from parcela where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }



    public static int buscarPorRef(int referencia) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
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
    
    public static int buscarPorProp(int idpropietario) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM parcela WHERE idpropietario=" + idpropietario + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idparcela");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM parcela WHERE idpropietario=" + idpropietario + ";";
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

    public static int sacarReferencia(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        int ref = 0;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela WHERE idparcela =" + idparcela + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getInt("referencia");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }

    public static int sacarHectareas(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        int ref = 0;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela WHERE idparcela =" + idparcela + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getInt("hectareas");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }

    public static int sacarTipo(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        int ref = 0;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela WHERE idparcela =" + idparcela + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getInt("idtipoparcela");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }

    public static String sacarProp(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        String ref = "";

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela INNER JOIN propietario ON parcela.idpropietario = propietario.idpropietario INNER JOIN usuario ON propietario.idusuario = usuario.idUsuario WHERE parcela.idparcela =" + idparcela + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getString("usuario.nombre");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }

    public static int parcelasSize() {
        return listaParcelas.size();
    }

    public static int getId(int idparcela) {
        return listaParcelas.get(idparcela).getIdparcela();
    }

    public static int getIdProp(int idparcela) {
        return listaParcelas.get(idparcela).getIdpropietario();
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

}
