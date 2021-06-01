/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.PAgricola;
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
public class PAgricolaBD {
    
    
    private static ArrayList<PAgricola> listaPAgricola = new ArrayList<PAgricola>();


    public static void cargarPAgricola() throws ClassNotFoundException, SQLException, InstantiationException {

        listaPAgricola = new ArrayList<PAgricola>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM pagricola;";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            PAgricola p = new PAgricola(rset.getInt("idpagricola"), rset.getInt("idparcela"), rset.getInt("idestado"));
            listaPAgricola.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }
     public static void modificarA(int idparcela, int idestado) throws ClassNotFoundException, InstantiationException, SQLException {

        java.sql.Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();
        String sqlStr = "UPDATE `pagricola` SET `idestado`=" + idestado + " WHERE idparcela = " + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
    public static void insertarAgricola(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into pagricola(idparcela) values(" + idparcela + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
    
      public static void borrarPAgricola(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException{
          
        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from pagricola where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

      }
      
       public static int buscarAgricola(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM pagricola WHERE idparcela=" + idparcela + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idpagricola");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM pagricola WHERE idparcela=" + idparcela + ";";
            rset = stmt.executeQuery(sqlStr);
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
       
       public static int sacarIdparcela(int idpagricola) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM pagricola WHERE idpagricola=" + idpagricola + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idparcela");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM pagricola WHERE idpagricola=" + idpagricola + ";";
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
       
       
        public static int sacarIdestado(int idpagricola) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;

        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM pagricola WHERE idpagricola=" + idpagricola + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idestado");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM pagricola WHERE idpagricola=" + idpagricola + ";";
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
      
      public static int getIdpagricola(int idparcela){
          return listaPAgricola.get(idparcela).getIdpagricola();
      }
      
      public static int getIdparcela(int idparcela){
          return listaPAgricola.get(idparcela).getIdparcela();
      }
      
      public static int getReferencia (int idparcela) throws ClassNotFoundException, InstantiationException, SQLException{
          
          int ref = 0;
          
          Connection conn = controladores.Toolbox.Conexion();
          
          Statement stmt  = conn.createStatement();
          
          String sqlStr = "SELECT * FROM parcela WHERE idparcela =" + idparcela + ";";
          
          ResultSet rset = stmt.executeQuery(sqlStr);
          
          while(rset.next()){
          
          ref = rset.getInt("referencia");
          
          return ref;
          
          }
          
          rset.close();
          
          stmt.close();
          
          conn.close();
          
          return ref;
          
      }
    
}
