/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Marsan
 */
public class Jornalero extends Usuario {
    
    private int idjornalero;
    
    private int idusuario;

    public Jornalero(int idjornalero, int idusuario) {
        this.idjornalero = idjornalero;
        this.idusuario = idusuario;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public int getIdjornalero() {
        return idjornalero;
    }

    public void setIdjornalero(int idjornalero) {
        this.idjornalero = idjornalero;
    }

    public Jornalero(int idjornalero) {
        this.idjornalero = idjornalero;
    }

    public Jornalero(int idjornalero, int idusuario, String nombre, String email, String dni, int telefono, int idrol, String pass) {
        super(idusuario, nombre, email, dni, telefono, idrol, pass);
        this.idjornalero = idjornalero;
    }

    public Jornalero() {
    }
    
    
    
}
