/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Estado;
import clases.Parcela;
import clases.Propietario;
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
public class ParcelaBD {
    
     private static ArrayList<Parcela> listaParcelas = new ArrayList<Parcela>();

    public static void cargarParcelas() throws ClassNotFoundException, SQLException, InstantiationException{
        
        listaParcelas = new ArrayList<Parcela>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr = "SELECT * FROM parcela;";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
        while(rset.next()){
            
            Parcela p = new Parcela (rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idestado"), rset.getInt("idtipoparcela"), rset.getInt("referencia"));
            listaParcelas.add(p);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();

    }
    
   

    
    public static int parcelasSize(){
        return listaParcelas.size();
    }
    
   public static int getId(int idparcela) {
      return listaParcelas.get(idparcela).getIdparcela();
   }
   
   public static int getIdProp(int idparcela){
       return listaParcelas.get(idparcela).getIdpropietario();
   }
   
   public static int getHectareas(int idparcela){
       return listaParcelas.get(idparcela).getHectareas();
   }
   
   public static int getReferencia (int idparcela){
       return listaParcelas.get(idparcela).getReferencia();
   }
   
   public static int getEstado (int idparcela){
       return listaParcelas.get(idparcela).getIdestado();
   }
   
   public static int getTipo (int idparcela){
       return listaParcelas.get(idparcela).getIdtipoparcela();
   }
   
   
  
    
}
