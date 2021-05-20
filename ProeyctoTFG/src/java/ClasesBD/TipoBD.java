/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Tipo;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class TipoBD {
     private static ArrayList<Tipo> listaTipos = new ArrayList<Tipo>();
    
    
     public static void cargarTipos() throws ClassNotFoundException, InstantiationException, SQLException {
        
        listaTipos = new ArrayList<Tipo>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr ="SELECT * FROM tipo";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
         while(rset.next()){
            
            Tipo t = new Tipo (rset.getInt("idtipo"), rset.getString("nombretipo"));
            listaTipos.add(t);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();
        
        
    }
     
       
    public static int tiposSize(){
        
        return listaTipos.size();
    }
    
   public static int getId(int idtipo) {
      return listaTipos.get(idtipo).getIdtipo();
   }
   
   public static String getNombre(int idtipo){
       return listaTipos.get(idtipo).getNombre();
       
   }
   
    
}
