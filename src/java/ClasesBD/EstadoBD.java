/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Estado;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class EstadoBD {
    
    private static ArrayList<Estado> listaEstadosA = new ArrayList<Estado>(); 
    private static ArrayList<Estado> listaEstadosG = new ArrayList<Estado>();
    
     public static void cargarEstadosA() throws ClassNotFoundException, InstantiationException, SQLException {
        
        listaEstadosA = new ArrayList<Estado>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr ="SELECT * FROM estadoa";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
         while(rset.next()){
            
            Estado e = new Estado (rset.getInt("idestado"), rset.getString("nombre"));
            listaEstadosA.add(e);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();
        
        
    }
     
     public static void cargarEstadosG() throws ClassNotFoundException, InstantiationException, SQLException {
        
        listaEstadosG = new ArrayList<Estado>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr ="SELECT * FROM estadog";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
         while(rset.next()){
            
            Estado e = new Estado (rset.getInt("idestado"), rset.getString("nombre"));
            listaEstadosG.add(e);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();
        
        
    }
     
     public static String sacarNombreA (int idestado) throws ClassNotFoundException, InstantiationException, SQLException{
         
         String nombre ="";
         
         Connection conn = controladores.Toolbox.Conexion();
         
         Statement stmt = conn.createStatement();
         
         String sqlStr = "SELECT * FROM estadoa WHERE idestado=" + idestado + ";";
         
         ResultSet rset = stmt.executeQuery(sqlStr);
         
         while(rset.next()){
             
             nombre = rset.getString("nombre");
             
             return nombre;
             
         }
         
         rset.close();
         
         stmt.close();
         
         conn.close();
         
         return nombre;
         
         
     }
     
     public static String sacarNombreG (int idestado) throws ClassNotFoundException, InstantiationException, SQLException{
         
         String nombre ="";
         
         Connection conn = controladores.Toolbox.Conexion();
         
         Statement stmt = conn.createStatement();
         
         String sqlStr = "SELECT * FROM estadog WHERE idestado=" + idestado + ";";
         
         ResultSet rset = stmt.executeQuery(sqlStr);
         
         while(rset.next()){
             
             nombre = rset.getString("nombre");
             
             return nombre;
             
         }
         
         rset.close();
         
         stmt.close();
         
         conn.close();
         
         return nombre;
         
         
     }
    
            
    public static int estadosASize(){
        
        return listaEstadosA.size();
    }
    public static int estadosGSize(){
        
        return listaEstadosG.size();
    }
    
   public static int getIdA(int idestado) {
      return listaEstadosA.get(idestado).getIdestado();
   }
   public static int getIdG(int idestado) {
      return listaEstadosG.get(idestado).getIdestado();
   }
   
   public static String getNombreA(int idestado) {
       return listaEstadosA.get(idestado).getNombre();
        
   }
   public static String getNombreG(int idestado) {
       return listaEstadosG.get(idestado).getNombre();
        
   }
   
    
}
