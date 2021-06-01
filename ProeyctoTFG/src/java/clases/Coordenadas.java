/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Luis
 */
public class Coordenadas {
    private int idcoordenadas;
    private double longitud,latitud;

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public int getIdcoordenadas() {
        return idcoordenadas;
    }

    public void setIdcoordenadas(int idcoordenadas) {
        this.idcoordenadas = idcoordenadas;
    }
    
    
    public Coordenadas() {
    }

    public Coordenadas(int idcoordenadas,double longitud, double latitud) {
        this.idcoordenadas=idcoordenadas;
        this.longitud = longitud;
        this.latitud = latitud;
    }
    
}
