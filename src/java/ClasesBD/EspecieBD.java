/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Animal;
import clases.EAgricola;
import clases.EGanadera;
import clases.Especie;
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
public class EspecieBD {

    private static ArrayList<Especie> listaEspecie = new ArrayList<Especie>();

    public static void cargarEspecie() throws ClassNotFoundException, InstantiationException, SQLException {

        listaEspecie = new ArrayList<Especie>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM especie";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Especie e = new Especie(rset.getInt("idespecie"), rset.getString("nombreespecie"), rset.getInt("tipo"));
            listaEspecie.add(e);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static int buscarPorNombre(String nombre) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
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
   

    public static int EspeciesSize() {

        return listaEspecie.size();
    }

    public static void insertEspecie(String nombre, int tipo) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "insert into especie(nombreespecie, tipo) values('" + nombre + "' , " + tipo + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void borrar(int idespecie) throws ClassNotFoundException, InstantiationException, SQLException {

        try {

            java.sql.Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            String sqlStr = "delete from especie where idespecie=" + idespecie + ";";
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

    public static int getId(int idespecie) {
        return listaEspecie.get(idespecie).getIdespecie();
    }

    public static String getIdnombre(int idespecie) {

        return listaEspecie.get(idespecie).getNombreespecie();

    }

    public static int getTipo(int idespecie) {
        return listaEspecie.get(idespecie).getTipo();
    }

}
