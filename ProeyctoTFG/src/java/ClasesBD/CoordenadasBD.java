/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Coordenadas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Luis
 */
public class CoordenadasBD {
    
        private static ArrayList<Coordenadas> listaCoordenadas = new ArrayList<>(); 
    
     public static void cargarCoordenadas() throws ClassNotFoundException, InstantiationException, SQLException {
        
        listaCoordenadas = new ArrayList<>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr ="SELECT * FROM coordenadas";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
         while(rset.next()){
            
            Coordenadas c = new Coordenadas (rset.getInt("idcoordenadas"), rset.getDouble("longitud"), rset.getDouble("latitud"));
            listaCoordenadas.add(c);
            
        }
        
        conn.close();
        stmt.close();
        rset.close();
        
        
    }
    
            
    public static int CoordenadasSize(){
        
        return listaCoordenadas.size();
    }
    
    public static void insertCoordenada(double longitud, double latitud) throws ClassNotFoundException, InstantiationException, SQLException{
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr = "insert into coordenadas(longitud,latitud) values('" + longitud + "' , " + latitud + ");";
                    int state = stmt.executeUpdate(sqlStr);

                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }

        
        
    }
    
   public static int getId(int idcoordenadas) {
      return listaCoordenadas.get(idcoordenadas).getIdcoordenadas();
   }
   
   public static double getLongitud(int idcoordenadas) {
       return listaCoordenadas.get(idcoordenadas).getLongitud();
        
   }
   
   public static double getLatitud(int idcoordenadas){
       return listaCoordenadas.get(idcoordenadas).getLatitud();
       
   }
    
}
