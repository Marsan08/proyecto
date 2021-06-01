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

        String sqlStr = "SELECT * FROM egaricola";

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
       return listaEagricola.get(idespecie).getNombreespecie();
       
   }
   
   public static int getIdespecie(int idespecie){
       return listaEagricola.get(idespecie).getIdespecie();
   }
   
    
}
