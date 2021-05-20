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
public class Propietario extends Usuario{
    
    private int idpropietario;

    public int getIdpropietario() {
        return idpropietario;
    }

    public void setIdpropietario(int idpropietario) {
        this.idpropietario = idpropietario;
    }

    public Propietario(int idpropietario) {
        this.idpropietario = idpropietario;
    }

    public Propietario(int idpropietario, int idusuario, String nombre, String email, String dni, int telefono, int idrol, String pass) {
        super(idusuario, nombre, email, dni, telefono, idrol, pass);
        this.idpropietario = idpropietario;
    }
    
    
   
    
}
