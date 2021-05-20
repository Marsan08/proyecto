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

    public int getIdeagricola() {
        return ideagricola;
    }

    public void setIdeagricola(int ideagricola) {
        this.ideagricola = ideagricola;
    }

    public EAgricola() {
    }

    public EAgricola(int ideagricola, int idespecie, String nombreespecie, int tipo) {
        super(idespecie, nombreespecie, tipo);
        this.ideagricola = ideagricola;
    }

    public EAgricola(int ideagricola) {
        this.ideagricola = ideagricola;
    }
    
    
    
}
