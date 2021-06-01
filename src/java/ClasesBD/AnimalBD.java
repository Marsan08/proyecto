/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Animal;
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
public class AnimalBD {
    
        private static ArrayList<Animal> listaAnimales = new ArrayList<Animal>(); 
    
     public static void cargarAnimal() throws ClassNotFoundException, InstantiationException, SQLException {
        
        listaAnimales = new ArrayList<Animal>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr ="SELECT * FROM animal";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
         while(rset.next()){
            
            Animal a = new Animal (rset.getInt("idanimal"), rset.getString("sexo").charAt(0), rset.getInt("idparcela"), rset.getInt("ideganadera"), rset.getInt("crotal"));
            listaAnimales.add(a);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();
        
        
    }
    
            
    public static int AnimalesSize(){
        
        return listaAnimales.size();
    }
    
    public static void insertAnimal(char sexo, int ideganadera, int idparcela, int crotal) throws ClassNotFoundException, InstantiationException, SQLException{
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr = "insert into animal(sexo, ideganadera, idparcela, crotal) values('" + sexo + "' , " + ideganadera+ ", " + idparcela + ", " + crotal + ");";
                    int state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }

    }
    
   public static void borrar(int idanimal) throws ClassNotFoundException, InstantiationException, SQLException {

        try {

            java.sql.Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            String sqlStr = "delete from animal where idanimal=" + idanimal + ";";
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
            String sqlStr = "delete from animal where idparcela=" + idparcela + ";";
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
   
    public static void borrarPorEGanadera(int ideganadera) throws ClassNotFoundException, InstantiationException, SQLException {

        try {

            java.sql.Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();
            String sqlStr = "delete from animal where ideganadera=" + ideganadera + ";";
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
    
   public static int getId(int idanimal) {
      return listaAnimales.get(idanimal).getIdanimal();
   }
   
   public static char getSexo(int idanimal) {
       return listaAnimales.get(idanimal).getSexo();
        
   }
   
   public static int getIdparcela(int idanimal){
       return listaAnimales.get(idanimal).getIdparcela();
       
   }
   
   public static int getIdeganadera (int idanimal){
       return listaAnimales.get(idanimal).getIdeganadera();
   }
   
   public static int getIdCrotal (int idanimal){
       return listaAnimales.get(idanimal).getCrotal();
   }
   
    
}
