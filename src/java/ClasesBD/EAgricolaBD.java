/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import clases.EAgricola;
import static controladores.Toolbox.Conexion;

/**
 *
 * @author Marsan
 */
public class EAgricolaBD {

    private static ArrayList<EAgricola> listaEagricola = new ArrayList<EAgricola>();

    public static void cargarEAgricola() throws ClassNotFoundException, InstantiationException, SQLException {

        listaEagricola = new ArrayList<EAgricola>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM eagricola";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            EAgricola e = new EAgricola(rset.getInt("ideagricola"), rset.getInt("idespecie"), rset.getString("nombreespecie"));
            listaEagricola.add(e);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

        public static int EAgricolaSize(){
        
        return listaEagricola.size();
    }
    
               public static int getIdEagricola(int idespecie) {
      return listaEagricola.get(idespecie).getIdeagricola();
   }
   
   
   public static String getIdnombre(int idespecie){
       
        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        String validar = "";
        try {
            conn=Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM `eagricola` INNER JOIN especie ON eagricola.idespecie = especie.idespecie WHERE ideagricola=" + idespecie + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("especie.nombreespecie");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM `eagricola` INNER JOIN especie ON eagricola.idespecie = especie.idespecie WHERE ideagricola=" + idespecie + ";";
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
   
    public static int buscarPorEspecie(int idespecie){
       
        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        try {
            conn=Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM `eagricola` WHERE idespecie=" + idespecie + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("ideagricola");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM `eagricola` WHERE idespecie=" + idespecie + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("ideagricola");
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
            String sqlStr = "delete from eagricola where idespecie=" + idespecie + ";";
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
      public static String getNombrePorEspecie(int idespecie) {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        String validar = "";
        try {
            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM `eagricola` INNER JOIN especie ON eagricola.idespecie = especie.idespecie WHERE ideagricola=" + idespecie + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("especie.nombreespecie");
                System.out.println(validar);
            }
            sqlStr = "SELECT * FROM `eagricola` INNER JOIN especie ON eagricola.idespecie = especie.idespecie WHERE ideagricola=" + idespecie + ";";
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
     
      public static void insertEAgricola(int idespecie, String nombre) throws ClassNotFoundException, InstantiationException, SQLException{
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
       String sqlStr2 = "insert into eagricola(idespecie, nombreespecie) values(" + idespecie + ", '" + nombre + "');";
                            int state2 = stmt.executeUpdate(sqlStr2);

                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }

        
        
    }
   
   public static int getIdespecie(int idespecie){
       return listaEagricola.get(idespecie).getIdespecie();
   }
   
    
}
