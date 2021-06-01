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
public class Trabaja {
    
    private int idtrabaja;
    
    private int idjornalero;
    
    private int idparcela;

    public int getIdtrabaja() {
        return idtrabaja;
    }

    public void setIdtrabaja(int idtrabaja) {
        this.idtrabaja = idtrabaja;
    }

    public int getIdjornalero() {
        return idjornalero;
    }

    public void setIdjornalero(int idjornalero) {
        this.idjornalero = idjornalero;
    }

    public int getIdparcela() {
        return idparcela;
    }

    public void setIdparcela(int idparcela) {
        this.idparcela = idparcela;
    }

    public Trabaja(int idtrabaja, int idjornalero, int idparcela) {
        this.idtrabaja = idtrabaja;
        this.idjornalero = idjornalero;
        this.idparcela = idparcela;
    }

    public Trabaja() {
    }
    
    
    
}
