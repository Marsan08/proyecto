/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.EGanadera;
import com.mysql.jdbc.Connection;
import static controladores.Toolbox.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class EGanaderaBD {

    private static ArrayList<EGanadera> listaEGanadera = new ArrayList<EGanadera>();

    public static void cargarEGanadera() throws ClassNotFoundException, InstantiationException, SQLException {

        listaEGanadera = new ArrayList<EGanadera>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM eganadera";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            EGanadera e = new EGanadera(rset.getInt("ideganadera"), rset.getInt("idespecie"), rset.getString("nombreespecie"));
            listaEGanadera.add(e);
        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static String getNombrePorEspecie(int idespecie) {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        String validar = "";
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM `eganadera` INNER JOIN especie ON eganadera.idespecie = especie.idespecie WHERE ideganadera=" + idespecie + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("especie.nombreespecie");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM `eganadera` INNER JOIN especie ON eganadera.idespecie = especie.idespecie WHERE ideganadera=" + idespecie + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getString("especie.nombreespecie");
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

    public static int buscarPorEspecie(int idespecie) {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM `eganadera` WHERE idespecie=" + idespecie + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("ideganadera");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM `eganadera` WHERE idespecie=" + idespecie + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("ideganadera");
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

    public static void borrarPorEspecie(int idespecie) throws ClassNotFoundException, InstantiationException, SQLException {

        try {

            java.sql.Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            String sqlStr = "delete from eganadera where idespecie=" + idespecie + ";";
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

    }

    public static void insertEGanadera(int idespecie, String nombre) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr2 = "insert into eganadera(idespecie, nombreespecie) values(" + idespecie + ", '" + nombre + "');";
        int state = stmt.executeUpdate(sqlStr2);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static int EGanaderaSize() {

        return listaEGanadera.size();
    }

    public static int getIdEganadera(int idespecie) {
        return listaEGanadera.get(idespecie).getIdeganadera();
    }

    public static int getIdespecie(int idespecie) {
        return listaEGanadera.get(idespecie).getIdespecie();
    }

}
