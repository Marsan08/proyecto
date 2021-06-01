/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Date;

/**
 *
 * @author Marsan
 */
public class Plantacion {
    
    private int idplantacion;
    
    private Date fplantacion;
    
    private Date frecogida;

    public int getIdplantacion() {
        return idplantacion;
    }

    public void setIdplantacion(int idplantacion) {
        this.idplantacion = idplantacion;
    }

    public Date getFplantacion() {
        return fplantacion;
    }

    public void setFplantacion(Date fplantacion) {
        this.fplantacion = fplantacion;
    }

    public Date getFrecogida() {
        return frecogida;
    }

    public void setFrecogida(Date frecogida) {
        this.frecogida = frecogida;
    }

    public Plantacion() {
    }

    public Plantacion(int idplantacion, Date fplantacion, Date frecogida) {
        this.idplantacion = idplantacion;
        this.fplantacion = fplantacion;
        this.frecogida = frecogida;
    }
    
    
    
   
    
}
