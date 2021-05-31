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
    
    private static ArrayList<Estado> listaEstados = new ArrayList<Estado>(); 
    
     public static void cargarEstados() throws ClassNotFoundException, InstantiationException, SQLException {
        
        listaEstados = new ArrayList<Estado>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr ="SELECT * FROM estado";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
         while(rset.next()){
            
            Estado e = new Estado (rset.getInt("idestado"), rset.getString("nombrestado"));
            listaEstados.add(e);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();
        
        
    }
     
     public static String sacarNombre (int idestado) throws ClassNotFoundException, InstantiationException, SQLException{
         
         String nombre ="";
         
         Connection conn = controladores.Toolbox.Conexion();
         
         Statement stmt = conn.createStatement();
         
         String sqlStr = "SELECT * FROM estado WHERE idestado=" + idestado + ";";
         
         ResultSet rset = stmt.executeQuery(sqlStr);
         
         while(rset.next()){
             
             nombre = rset.getString("nombrestado");
             
             return nombre;
             
         }
         
         rset.close();
         
         stmt.close();
         
         conn.close();
         
         return nombre;
         
         
     }
    
            
    public static int estadosSize(){
        
        return listaEstados.size();
    }
    
   public static int getId(int idestado) {
      return listaEstados.get(idestado).getIdestado();
   }
   
   public static String getNombre(int idestado) {
       return listaEstados.get(idestado).getNombre();
        
   }
   
    
}
