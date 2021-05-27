/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Animal;
import clases.Plantacion;
import com.mysql.jdbc.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class PlantacionBD {

    private static ArrayList<Plantacion> listaPlantacion = new ArrayList<Plantacion>();

    public static void cargarPlantacion() throws ClassNotFoundException, InstantiationException, SQLException {

        listaPlantacion = new ArrayList<Plantacion>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM plantacion";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Plantacion p = new Plantacion(rset.getInt("idplantacion"), rset.getDate("fplantacion"), rset.getDate("frecogida"), rset.getInt("idparcela"), rset.getInt("ideagricola"));
            listaPlantacion.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static int PlantacionSize() {

        return listaPlantacion.size();
    }

    public static void insertPlantacion(Date fecha, int idespecie, int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "insert into plantacion(fplantacion, ideagricola, idparcela) values('" + fecha + "' , " + idespecie + ", " + idparcela + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
    
    public static void modificar(Date fecha, int idplantacion) throws ClassNotFoundException, InstantiationException, SQLException {

       java.sql.Connection conn = controladores.Toolbox.Conexion();
                    Statement stmt = conn.createStatement();
                    String sqlStr = "UPDATE `plantacion` SET `frecogida`='" + fecha + "' WHERE idplantacion = " + idplantacion + ";";
                    int state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
    }

    public static void borrar(int idplantacion) throws ClassNotFoundException, InstantiationException, SQLException {

        try {

            java.sql.Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            String sqlStr = "delete from plantacion where idplantacion=" + idplantacion + ";";
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
    
     public static void borrarPorParcela(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        try {

            java.sql.Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            String sqlStr = "delete from plantacion where idparcela=" + idparcela + ";";
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
     
     
      public static void borrarPorEAgricola(int ideagricola) throws ClassNotFoundException, InstantiationException, SQLException {

        try {

            java.sql.Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            String sqlStr = "delete from plantacion where ideagricola=" + ideagricola + ";";
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
      
      
    public static Date sacarFPlantacion(int idplantacion) throws ClassNotFoundException, InstantiationException, SQLException {

        Date ref = null;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM plantacion WHERE idplantacion =" + idplantacion + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getDate("fplantacion");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }
    
    
    public static Date sacarFRecogida(int idplantacion) throws ClassNotFoundException, InstantiationException, SQLException {

        Date ref = null;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM plantacion WHERE idplantacion =" + idplantacion + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getDate("frecogida");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }
    
    public static int sacarEspecie(int idplantacion) throws ClassNotFoundException, InstantiationException, SQLException {

        int ref = 0;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM plantacion WHERE idplantacion =" + idplantacion + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getInt("ideagricola");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }
    
    
     public static int sacarAgricola(int idplantacion) throws ClassNotFoundException, InstantiationException, SQLException {

        int ref = 0;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM plantacion WHERE idplantacion =" + idplantacion + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            ref = rset.getInt("idparcela");

            return ref;

        }

        rset.close();

        stmt.close();

        conn.close();

        return ref;

    }

    public static int getId(int idplantacion) {
        return listaPlantacion.get(idplantacion).getIdplantacion();
    }

    public static Date getFPlantacion(int idplantacion) {
        return listaPlantacion.get(idplantacion).getFplantacion();

    }

    public static Date getFRecogida(int idplantacion) {
        return listaPlantacion.get(idplantacion).getFrecogida();

    }

    public static int getIdparcela(int idplantacion) {
        return listaPlantacion.get(idplantacion).getIdparcela();

    }

    public static int getIdeagricola(int idplantacion) {
        return listaPlantacion.get(idplantacion).getIdeagricola();
    }

}
