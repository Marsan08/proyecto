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
public class Especie {
    
    private int idespecie;
    
    private String nombreespecie;
    
    private int tipo;

    public int getIdespecie() {
        return idespecie;
    }

    public void setIdespecie(int idespecie) {
        this.idespecie = idespecie;
    }

    public String getNombreespecie() {
        return nombreespecie;
    }

    public void setNombreespecie(String nombreespecie) {
        this.nombreespecie = nombreespecie;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Especie(int idespecie, String nombreespecie, int tipo) {
        this.idespecie = idespecie;
        this.nombreespecie = nombreespecie;
        this.tipo = tipo;
    }

    public Especie() {
    }
    
    
    
}
