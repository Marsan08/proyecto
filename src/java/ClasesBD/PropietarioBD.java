/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.PAgricola;
import clases.PGanadera;
import clases.Parcela;
import clases.Propietario;
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
public class PropietarioBD {

    private static ArrayList<Parcela> listaParcelas = new ArrayList<Parcela>();
    private static ArrayList<Propietario> listaProp = new ArrayList<Propietario>();
    private static ArrayList<PAgricola> listaPagricola = new ArrayList<PAgricola>();
    private static ArrayList<PGanadera> listaPGanadera = new ArrayList<PGanadera>();

    public static void cargarParcelas(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException {

        listaParcelas = new ArrayList<Parcela>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela WHERE idpropietario=" + idpropietario + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Parcela p = new Parcela(rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idtipoparcela"), rset.getInt("referencia"));
            listaParcelas.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }
    
     public static void asiganarJornalero(int idjornalero, int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {

        Connection conn = controladores.Toolbox.Conexion();
        Statement stmt = conn.createStatement();

        String sqlStr = "insert into trabaja(idjornalero, idparcela) values(" + idjornalero + "," + idparcela + ");";
        int state = stmt.executeUpdate(sqlStr);

        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public static void cargarPAgricola(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException {

        listaPagricola = new ArrayList<PAgricola>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM pagricola INNER JOIN parcela ON pagricola.idparcela = parcela.idparcela WHERE parcela.idpropietario =" + idpropietario + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            PAgricola p = new PAgricola(rset.getInt("idpagricola"), rset.getInt("idparcela"));
            listaPagricola.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static void cargarPGanadera(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException {

        listaPGanadera = new ArrayList<PGanadera>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM pganadera INNER JOIN parcela ON pganadera.idparcela = parcela.idparcela WHERE parcela.idpropietario =" + idpropietario + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            PGanadera p = new PGanadera(rset.getInt("idpganadera"), rset.getInt("idparcela"));

            listaPGanadera.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }
   

    public static void cargarProp(int idpropietario) throws ClassNotFoundException, SQLException, InstantiationException {

        listaProp = new ArrayList<Propietario>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM `propietario` INNER JOIN usuario ON propietario.idusuario = usuario.idUsuario;";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Propietario p = new Propietario(rset.getInt("idpropietario"), rset.getInt("usuario.idusuario"), rset.getString("usuario.nombre"), rset.getString("usuario.email"), rset.getString("usuario.dni"), rset.getInt("usuario.telefono"), rset.getInt("usuario.idrol"), rset.getString("usuario.pass"));
            listaProp.add(p);
        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static int idProp(int iduser) {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM propietario WHERE idusuario='" + iduser + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

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
    
    
    public static String nombreProp(int idparcela) {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        String validar = "";
   
        try {

            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM parcela INNER JOIN propietario ON parcela.idpropietario = propietario.idpropietario INNER JOIN usuario ON propietario.idusuario = usuario.idUsuario WHERE parcela.idparcela=" + idparcela +";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("nombre");
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

    public static int parcelasSize() {

        return listaParcelas.size();
    }
    
    public static int pganaderaSize() {

        return listaPGanadera.size();
    }
    
    public static int pagricolaSize() {

        return listaPagricola.size();
    }
    
    public static int getIdpagricola(int idparcela) {
        return listaPagricola.get(idparcela).getIdpagricola();

    }
    
     public static int getIdagricola(int idparcela) {
        return listaPagricola.get(idparcela).getIdparcela();

    }
    
    public static int getIdpganadera(int idparcela) {
        return listaPGanadera.get(idparcela).getIdpganadera();

    }
    
     public static int getIdganadera(int idparcela) {
        return listaPGanadera.get(idparcela).getIdparcela();

    }

    public static int getId(int idparcela) {
        return listaParcelas.get(idparcela).getIdparcela();

    }

    public static int getHectareas(int idparcela) {
        return listaParcelas.get(idparcela).getHectareas();

    }

    public static int getReferencia(int idparcela) {
        return listaParcelas.get(idparcela).getReferencia();
    }

    public static int getTipo(int idparcela) {
        return listaParcelas.get(idparcela).getIdtipoparcela();
    }

    public static String getNombre(int idpropietario) {

        return listaProp.get(idpropietario).getNombre();
    }

    

}
