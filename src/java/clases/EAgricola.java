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
public class EAgricola extends Especie{
    
    private int ideagricola;
    
    private int idespecie;
    
    private String nombreespecie;

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

    public EAgricola(int ideagricola, int idespecie, String nombreespecie) {
        this.ideagricola = ideagricola;
        this.idespecie = idespecie;
        this.nombreespecie = nombreespecie;
    }

    public int getIdeagricola() {
        return ideagricola;
    }

    public void setIdeagricola(int ideagricola) {
        this.ideagricola = ideagricola;
    }

    public EAgricola() {
    }


    public EAgricola(int ideagricola) {
        this.ideagricola = ideagricola;
    }
    
    
    
    
}
