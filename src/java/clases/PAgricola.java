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
public class PAgricola extends Parcela {
    
    private int idpagricola;
    
    private int idparcela;

    public int getIdparcela() {
        return idparcela;
    }

    public void setIdparcela(int idparcela) {
        this.idparcela = idparcela;
    }

    public int getIdpagricola() {
        return idpagricola;
    }

    public void setIdpagricola(int idpagricola) {
        this.idpagricola = idpagricola;
    }

    public PAgricola() {
    }

    public PAgricola(int idpagricola, int idparcela) {
        this.idpagricola = idpagricola;
        this.idparcela = idparcela;
    }
    
    
    
    
    
    
}
