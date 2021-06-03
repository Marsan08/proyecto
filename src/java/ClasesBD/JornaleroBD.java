/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesBD;

import clases.Animal;
import clases.Jornalero;
import clases.PAgricola;
import clases.PGanadera;
import clases.Parcela;
import clases.Plantacion;
import com.mysql.jdbc.Connection;
import static controladores.Toolbox.Conexion;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marsan
 */
public class JornaleroBD {

    private static ArrayList<Parcela> listaParcelas = new ArrayList<Parcela>();
    private static ArrayList<PAgricola> listaPagricola = new ArrayList<PAgricola>();
    private static ArrayList<PGanadera> listaPganadera = new ArrayList<PGanadera>();
    private static ArrayList<Animal> listaAnimal = new ArrayList<Animal>();
    private static ArrayList<Plantacion> listaPlantacion = new ArrayList<Plantacion>();
    private static ArrayList<Jornalero> listaJornalero = new ArrayList<Jornalero>();

    public static void cargarParcelas(int idjornalero) throws ClassNotFoundException, SQLException, InstantiationException {

        listaParcelas = new ArrayList<Parcela>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM parcela INNER JOIN trabaja ON parcela.idparcela = trabaja.idparcela INNER JOIN jornalero ON jornalero.idjornalero = trabaja.idjornalero WHERE jornalero.idjornalero =" + idjornalero + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

             while (rset.next()) {

            Parcela p = new Parcela(rset.getInt("idparcela"), rset.getInt("hectareas"), rset.getInt("idpropietario"), rset.getInt("idtipoparcela"), rset.getInt("referencia"));
            listaParcelas.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }
    
    public static void cargarJornalero() throws ClassNotFoundException, SQLException, InstantiationException {

        listaJornalero = new ArrayList<Jornalero>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM jornalero";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            Jornalero j = new Jornalero(rset.getInt("idjornalero"), rset.getInt("idusuario"));
            listaJornalero.add(j);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static void cargarPAgricola(int idjornalero) throws ClassNotFoundException, SQLException, InstantiationException {

        listaPagricola = new ArrayList<PAgricola>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM pagricola INNER JOIN parcela ON pagricola.idparcela = parcela.idparcela INNER JOIN trabaja ON parcela.idparcela = trabaja.idparcela WHERE trabaja.idjornalero =" + idjornalero + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            PAgricola p = new PAgricola(rset.getInt("idpagricola"), rset.getInt("idparcela"), rset.getInt("idestado"));
            listaPagricola.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static void cargarPGanadera(int idjornalero) throws ClassNotFoundException, SQLException, InstantiationException {

        listaPganadera = new ArrayList<PGanadera>();

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM trabaja INNER JOIN parcela ON trabaja.idparcela = parcela.idparcela INNER JOIN pganadera ON parcela.idparcela = pganadera.idparcela WHERE trabaja.idjornalero =" + idjornalero + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            PGanadera p = new PGanadera(rset.getInt("idpganadera"), rset.getInt("idparcela"), rset.getInt("idestado"));
            listaPganadera.add(p);

        }

        conn.close();
        stmt.close();
        rset.close();

    }

    public static int sacarIdParcelaDeGanadera(int idjornalero) throws ClassNotFoundException, SQLException, InstantiationException {

        int idpganadera = 0;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM pganadera INNER JOIN parcela ON pganadera.idparcela = parcela.idparcela INNER JOIN trabaja ON parcela.idparcela = trabaja.idparcela WHERE trabaja.idjornalero =" + idjornalero + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            idpganadera = rset.getInt("parcela.idparcela");

            return idpganadera;

        }

        conn.close();
        stmt.close();
        rset.close();

        return idpganadera;

    }

    public static void cargarAnimalesJornalero(int idjornalero) throws ClassNotFoundException, InstantiationException, SQLException {

        listaAnimal = new ArrayList<Animal>();

        //cargo las parcelas ganaderas del jornalero
        ClasesBD.JornaleroBD.cargarPGanadera(idjornalero);

        for (int i = 0; i < ClasesBD.JornaleroBD.parcelasGanaderasSize(); i++) {

            int idganadera = ClasesBD.JornaleroBD.getIdGparcela(i);

            int idpganadera = ClasesBD.PGanaderaBD.buscarGanadera(idganadera);

            Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM animal WHERE idparcela = " + idpganadera + ";";

            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {

                Animal a = new Animal(rset.getInt("idanimal"), rset.getString("sexo").charAt(0), rset.getInt("ideganadera"), rset.getInt("idparcela"));
                listaAnimal.add(a);

            }

            conn.close();
            stmt.close();
            rset.close();

        }

    }

    public static void cargarPlantacionesJornalero(int idjornalero) throws ClassNotFoundException, InstantiationException, SQLException {

        listaPlantacion = new ArrayList<Plantacion>();

        //cargo las parcelas ganaderas del jornalero
        ClasesBD.JornaleroBD.cargarPGanadera(idjornalero);

        for (int i = 0; i < ClasesBD.JornaleroBD.parcelasGanaderasSize(); i++) {

            int idganadera = ClasesBD.JornaleroBD.getIdGparcela(i);

            int idpganadera = ClasesBD.PGanaderaBD.buscarGanadera(idganadera);

            Connection conn = controladores.Toolbox.Conexion();

            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT * FROM plantacion WHERE idparcela = " + idpganadera + ";";

            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {

                Plantacion p = new Plantacion(rset.getInt("idplantacion"), rset.getDate("fplantacion"), rset.getDate("frecogida"), rset.getInt("idparcela"), rset.getInt("ideagricola"));
                listaPlantacion.add(p);

            }

            conn.close();
            stmt.close();
            rset.close();

        }

    }

    public static int sacarIdParcelaDeAgricola(int idjornalero) throws ClassNotFoundException, SQLException, InstantiationException {

        int idpganadera = 0;

        Connection conn = controladores.Toolbox.Conexion();

        Statement stmt = conn.createStatement();

        String sqlStr = "SELECT * FROM pagricola INNER JOIN parcela ON pagricola.idparcela = parcela.idparcela INNER JOIN trabaja ON parcela.idparcela = trabaja.idparcela WHERE trabaja.idjornalero =" + idjornalero + ";";

        ResultSet rset = stmt.executeQuery(sqlStr);

        while (rset.next()) {

            idpganadera = rset.getInt("parcela.idparcela");

            return idpganadera;

        }

        conn.close();
        stmt.close();
        rset.close();

        return idpganadera;

    }

    public static int idJornalero(int iduser) {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {

            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM jornalero WHERE idusuario='" + iduser + "';";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getInt("idjornalero");
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
    
    
    public static String sacarNombre(int idjornalero) {

        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        String validar = "";
        
        try {

            conn = Conexion();
            stmt = (com.mysql.jdbc.Statement) conn.createStatement();

            String sqlStr = "SELECT * FROM jornalero INNER JOIN usuario ON jornalero.idusuario = usuario.idUsuario WHERE jornalero.idjornalero=" + idjornalero + ";";
            ResultSet rset = stmt.executeQuery(sqlStr);

            while (rset.next()) {
                validar = rset.getString("usuario.nombre");
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
    
    public static int getPropietarioParcela(int idparcela) throws ClassNotFoundException, InstantiationException, SQLException {
        Connection conn = null;
        com.mysql.jdbc.Statement stmt = null;
        int validar = 0;
        int id = 0;
        try {
            conn = Conexion();
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

    public static int parcelasSize() {

        return listaParcelas.size();
    }
    
    public static int jornaleroSize() {

        return listaJornalero.size();
    }
    
    public static int idjornalero(int idjornalero){
        
        return listaJornalero.get(idjornalero).getIdjornalero();
    }

    public static int animalesSize() {

        return listaAnimal.size();
    }
    
    public static int plantacionesSize() {

        return listaPlantacion.size();
    }

    public static int idanimal(int idanimal) {
        return listaAnimal.get(idanimal).getIdanimal();
    }

    public static char sexoAnimal(int idanimal) {
        return listaAnimal.get(idanimal).getSexo();
    }

    public static int idespecie(int idanimal) {
        return listaAnimal.get(idanimal).getIdeganadera();
    }

    public static int idparcela(int idanimal) {
        return listaAnimal.get(idanimal).getIdparcela();
    }
    
     public static int idestadoa(int idpagricola){
        return listaPagricola.get(idpagricola).getIdestado();
    }

    public static int idestadog(int idpganadera){
        return listaPganadera.get(idpganadera).getIdestado();
    }
    
     public static int idplantacion(int idplantacion) {
        return listaPlantacion.get(idplantacion).getIdplantacion();
    }

    public static Date frecogida(int idplantacion) {
        return listaPlantacion.get(idplantacion).getFrecogida();
    }

    public static Date fplantacion(int idplantacion) {
        return listaPlantacion.get(idplantacion).getFplantacion();
    }

    public static int ideagricola(int idplantacion) {
        return listaPlantacion.get(idplantacion).getIdeagricola();
    }
    
    public static int idpagricola(int idplantacion) {
        return listaPlantacion.get(idplantacion).getIdparcela();
    }

    public static int parcelasAgricolasSize() {

        return listaPagricola.size();
    }

    public static int getIdagricola(int idparcela) {
        return listaPagricola.get(idparcela).getIdpagricola();

    }

    public static int getIdAparcela(int idparcela) {
        return listaPagricola.get(idparcela).getIdparcela();

    }

    public static int parcelasGanaderasSize() {

        return listaPganadera.size();
    }

    public static int getIdganadera(int idparcela) {
        return listaPganadera.get(idparcela).getIdpganadera();

    }

    public static int getIdGparcela(int idparcela) {
        return listaPganadera.get(idparcela).getIdparcela();
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

}
