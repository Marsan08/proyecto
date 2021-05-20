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
    
    
    private char sexo;
    
    private int idanimal;

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
