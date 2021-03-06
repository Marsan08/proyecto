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
import java.sql.DriverManager;
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

    public static ArrayList<Parcela> getListaParcelas() {
        return listaParcelas;
    }

    public static void setListaParcelas(ArrayList<Parcela> listaParcelas) {
        ParcelaBD.listaParcelas = listaParcelas;
    }
    
    

    public static void cargarParcelas() throws ClassNotFoundException, SQLException, InstantiationException {

        listaParcelas = new ArrayList<Parcela>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela;";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Parcela p = new Parcela(rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idestado"), rset.getInt("idtipoparcela"), rset.getInt("referencia"),rset.getInt("idcoordenadas"));
            listaParcelas.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static void insertar(int hectareas, int idpropietario, int estado, int tipo, int referencia) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into parcela(hectareas, idpropietario, idestado, idtipoparcela, referencia) values(" + hectareas + ", " + idpropietario + ", " + estado + ", " + tipo + ", " + referencia + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
    
     public static void insertarAgricola(int idparcela, int referencia) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into pagricola(idparcela, referencia) values(" + idparcela + ", " + referencia + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
     
      public static void insertarGanadera(int idparcela, int referencia) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into pganadera(idparcela, referencia) values(" + idparcela + ", " + referencia + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }
      
      
      public static void borrar(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException{
          
        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from parcela where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
          
          
          
      }
      
      public static void borrarPAgricola(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException{
          
        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from pagricola where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
          
          
          
      }
      
      public static void borrarPGanadera(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException{
          
        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from pganadera where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
          
          
          
      }
      
      public static void borrarTrabaja(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException{
          
        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "delete from trabaja where idparcela=" + idparcela + ";";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
          
          
          
      }

    public static int parcelasSize() {
        return listaParcelas.size();
    }

    public static int getId(int idparcela) {
        return listaParcelas.get(idparcela).getIdparcela();
    }

    public static int getIdProp(int idparcela) {
        return listaParcelas.get(idparcela).getIdpropietario();
    }

    public static int getHectareas(int idparcela) {
        return listaParcelas.get(idparcela).getHectareas();
    }

    public static int getReferencia(int idparcela) {
        return listaParcelas.get(idparcela).getReferencia();
    }

    public static int getEstado(int idparcela) {
        return listaParcelas.get(idparcela).getIdestado();
    }

    public static int getTipo(int idparcela) {
        return listaParcelas.get(idparcela).getIdtipoparcela();
    }

}
