/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Animal;
import clases.PGanadera;
import clases.Parcela;
import com.mysql.jdbc.Connection;
import static controladores.Toolbox.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author msantin
 */
public class PGanaderaBD {
    
    private static ArrayList<PGanadera> listaGanadera = new ArrayList<PGanadera>();
    
      public static void cargarGanadera() throws ClassNotFoundException, SQLException, InstantiationException {

        listaGanadera = new ArrayList<PGanadera>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM pganadera;";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            PGanadera p = new PGanadera(rset.getInt("idpganadera"), rset.getInt("idparcela"), rset.getInt("idestado"));
            listaGanadera.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }
    
    
    public static void insertarGanadera(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into pganadera(idparcela) values(" + idparcela + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
    
      public static void borrarPGanadera(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from pganadera where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
    
     public static int buscarGanadera(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM pganadera WHERE idparcela=" + idparcela + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idpganadera");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM pganadera WHERE idparcela=" + idparcela + ";";
            rset = stmt.executeQuery(sqlStr);
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
     
     
     public static int sacarIdparcela(int idpganadera) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM pganadera WHERE idpganadera=" + idpganadera + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idparcela");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM pganadera WHERE idpganadera=" + idpganadera + ";";
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
     
     public static int sacarIdestado(int idpganadera) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;

        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM pganadera WHERE idpganadera=" + idpganadera + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idestado");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM pganadera WHERE idpganadera=" + idpganadera + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("idestado");
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
     
      public static void modificarG(int idparcela, int idestado) throws ClassNotFoundException, InstantiationException, SQLException {

        java.sql.Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();
        String sqlStr = "UPDATE `pganadera` SET `idestado`=" + idestado + " WHERE idparcela = " + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
     
     public static void ganaderaSize(){
         listaGanadera.size();
         
     }
    
}
