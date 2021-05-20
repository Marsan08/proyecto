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
public class EGanadera extends Especie{
    
    private int ideganadera;

    public int getIdeganadera() {
        return ideganadera;
    }

    public void setIdeganadera(int ideganadera) {
        this.ideganadera = ideganadera;
    }

    public EGanadera() {
    }

    public EGanadera(int ideganadera, int idespecie, String nombreespecie, int tipo) {
        super(idespecie, nombreespecie, tipo);
        this.ideganadera = ideganadera;
    }

    public EGanadera(int ideganadera) {
        this.ideganadera = ideganadera;
    }
    
    
    
}
