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
public class Animal {
    
    private int idanimal;
    
    private char sexo;
    
    private int idparcela;
    
    private int ideganadera;

    public Animal(int idanimal, char sexo, int idparcela, int ideganadera) {
        this.idanimal = idanimal;
        this.sexo = sexo;
        this.idparcela = idparcela;
        this.ideganadera = ideganadera;
    }

    public int getIdparcela() {
        return idparcela;
    }

    public void setIdparcela(int idparcela) {
        this.idparcela = idparcela;
    }

    public int getIdeganadera() {
        return ideganadera;
    }

    public void setIdeganadera(int ideganadera) {
        this.ideganadera = ideganadera;
    }
    

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public int getIdanimal() {
        return idanimal;
    }

    public void setIdanimal(int idanimal) {
        this.idanimal = idanimal;
    }

    public Animal() {
    }

    public Animal(char sexo, int idanimal) {
        this.sexo = sexo;
        this.idanimal = idanimal;
    }
    
    
    
    
}
