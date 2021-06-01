/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Trabaja;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class TrabajaBD {
    
     private static ArrayList<Trabaja> listaTrabaja = new ArrayList<Trabaja>();
     
     
     public static void cargarTrabaja() throws ClassNotFoundException, InstantiationException, SQLException{
         
         listaTrabaja = new ArrayList<Trabaja>();
         
         Connection conn = controladores.Toolbox.Conexion();
         
         Statement stmt = conn.createStatement();
         
         String sqlStr = "SELECT * FROM trabaja";
         
         ResultSet rset = stmt.executeQuery(sqlStr);
         
         while(rset.next()){
             
             Trabaja t  = new Trabaja (rset.getInt("idtrabaja"), rset.getInt("idjornalero"), rset.getInt("idparcela"));
             
             listaTrabaja.add(t);
             
         }
         
         
         rset.close();
         
         stmt.close();
         
         conn.close();
 
     }
     
     public static void asiganarJornalero(int idjornalero, int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        com.mysql.jdbc.Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into trabaja(idjornalero, idparcela) values(" + idjornalero + "," + idparcela + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
     
     
       public static void borrarTrabaja(int idtrabaja) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from trabaja where idtrabaja=" + idtrabaja + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
     
 
    public static void borrarTrabajaParcela(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from trabaja where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
    
    public static void borrarTrabajaJornalero(int idjornalero) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from trabaja where idjornalero=" + idjornalero + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
     
     
     public static int trabajaSize(){
         return listaTrabaja.size();
     }
     
     
     public static int getId(int idtrabaja){
         
         return listaTrabaja.get(idtrabaja).getIdtrabaja();
     }
     
     public static int getIdJornalero(int idtrabaja){
         
         return listaTrabaja.get(idtrabaja).getIdjornalero();
     }
    
     public static int getIdParcela (int idtrabaja){
         
         return listaTrabaja.get(idtrabaja).getIdparcela();
     }
    
}
