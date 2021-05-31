/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Parcela;
import com.mysql.jdbc.Connection;
import static controladores.Toolbox.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Marsan
 */
public class JornaleroBD {
    
     private static ArrayList<Parcela> listaParcelas = new ArrayList<Parcela>();
    
    public static void cargarParcelas(int idjornalero) throws ClassNotFoundException, SQLException, InstantiationException{
        
        listaParcelas = new ArrayList<Parcela>();
        
        Connection conn = controladores.Toolbox.Conexion();
        
        Statement stmt = conn.createStatement();
        
        String sqlStr = "SELECT * FROM parcela INNER JOIN trabaja ON parcela.idparcela = trabaja.idparcela INNER JOIN jornalero ON jornalero.idjornalero = trabaja.idjornalero WHERE jornalero.idjornalero =" + idjornalero + ";";
        
        ResultSet rset = stmt.executeQuery(sqlStr);
        
        while(rset.next()){
            
            Parcela p = new Parcela (rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idestado"), rset.getInt("idtipoparcela"), rset.getInt("referencia"),rset.getInt("idcoordenadas"));
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
   
   public static int getHectareas(int idparcela){
       return listaParcelas.get(idparcela).getHectareas();
   }
   
   public static int getPropietarioParcela(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException{
      Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn=Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();
            String sqlStr = "SELECT * FROM parcela WHERE idparcela=" + idparcela + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                id = rset.getInt("idpropietario");
                System.out.println(id);
            }
            sqlStr = "SELECT * FROM parcela WHERE idparcela=" + idparcela + ";";
            rset = stmt.executeQuery(sqlStr);
            while (rset.next()) {
                validar = rset.getInt("idpropietario");
                System.out.println("ENTRA");
            }

            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("NO ENTRA");
        }
        return validar;
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
