/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Parcela;
import clases.Propietario;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class UsuarioBD {
    
      private static ArrayList<Parcela> listaParcelas = new ArrayList<Parcela>();
    private static ArrayList<Propietario> listaProp = new ArrayList<Propietario>(); 
    
    public static void cargarParcelas(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException{
        
        listaParcelas = new ArrayList<Parcela>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr = "SELECT * FROM parcela WHERE idpropietario="+idpropietario+";";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
        while(rset.next()){
            
            Parcela p = new Parcela (rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idestado"), rset.getInt("idtipoparcela"), rset.getInt("referencia"),rset.getInt("idcoordenadas"));
            listaParcelas.add(p);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();
        
        
    }
    
    public static void cargarProp(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException{
        
        listaProp = new ArrayList<Propietario>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr = "SELECT * FROM `propietario` INNER JOIN usuario ON propietario.idusuario = usuario.idUsuario;";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
        while(rset.next()){
            
            Propietario p = new Propietario (rset.getInt("idpropietario"), rset.getInt("usuario.idusuario"), rset.getString("usuario.nombre"), rset.getString("usuario.email"), rset.getString("usuario.dni"), rset.getInt("usuario.telefono"), rset.getInt("usuario.idrol"), rset.getString("usuario.pass"));
            listaProp.add(p);
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
   
   public static String getNombre(int idpropietario){
       
       return listaProp.get(idpropietario).getNombre();
   }
    
    
    
}
