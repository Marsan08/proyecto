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
public class Parcela {
    
    private int idparcela;
    
    private int hectareas;
    
    private int idpropietario;
    
    private int idtipoparcela;
    
    private int referencia;

    public int getIdparcela() {
        return idparcela;
    }

    public void setIdparcela(int idparcela) {
        this.idparcela = idparcela;
    }

    public Parcela(int idparcela, int hectareas, int idpropietario, int idtipoparcela, int referencia) {
        this.idparcela = idparcela;
        this.hectareas = hectareas;
        this.idpropietario = idpropietario;
        this.idtipoparcela = idtipoparcela;
        this.referencia = referencia;
    }

    public Parcela() {
    }

    public int getHectareas() {
        return hectareas;
    }

    public void setHectareas(int hectareas) {
        this.hectareas = hectareas;
    }

    public int getIdpropietario() {
        return idpropietario;
    }

    public void setIdpropietario(int idpropietario) {
        this.idpropietario = idpropietario;
    }

  

    public int getIdtipoparcela() {
        return idtipoparcela;
    }

    public void setIdtipoparcela(int idtipoparcela) {
        this.idtipoparcela = idtipoparcela;
    }

    public int getReferencia() {
        return referencia;
    }

    public void setReferencia(int referencia) {
        this.referencia = referencia;
    }
    
    
    
}
