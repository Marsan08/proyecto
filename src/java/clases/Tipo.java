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
public class Tipo {
    
    private int idtipo;
    
    private String nombre;

    public int getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(int idtipo) {
        this.idtipo = idtipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Tipo() {
    }

    public Tipo(int idtipo, String nombre) {
        this.idtipo = idtipo;
        this.nombre = nombre;
    }
    
    
    
}
