/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.EGanadera;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class EGanaderaBD {

    private static ArrayList<EGanadera> listaEGanadera = new ArrayList<EGanadera>();

    public static void cargarEGanadera() throws ClassNotFoundException, InstantiationException, SQLException {

        listaEGanadera = new ArrayList<EGanadera>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM eganadera";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            EGanadera e = new EGanadera(rset.getInt("ideganadera"), rset.getInt("idespecie"), rset.getString("nombreespecie"));
            listaEGanadera.add(e);
        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static int EGanaderaSize() {

        return listaEGanadera.size();
    }
    
       public static int getIdEganadera(int idespecie) {
      return listaEGanadera.get(idespecie).getIdeganadera();
   }
   
   
   public static String getNombre(int idespecie){
       return listaEGanadera.get(idespecie).getNombreespecie();
       
   }
   
   public static int getIdespecie(int idespecie){
       return listaEGanadera.get(idespecie).getIdespecie();
   }
   

}
