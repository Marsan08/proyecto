"use strict";

import { validarNombre } from './validaciones.js';
 
function validarEspecie(){
    
    var validar;
    
    var especie = document.getElementById("nombrespecie").value;
    
    
    
    if(validarNombre(especie) === false){
        
        console.log("el nombre de la especie no es correcto");
        
        validar = validar = document.getElementById("divespecie").hidden = true;
        
    } else if(validarNombre(especie) === true){
        
        console.log("el nombre es correcto");
        
       validar = validar = document.getElementById("divespecie").hidden = false;
        
    }
    
    return validar;
}


function eventoListenerEspecie() {

    document.getElementById("divespecie").setAttribute("hidden", true);

    document.getElementById("validaespecie").addEventListener("keyup", validarEspecie);
    

}


eventoListenerEspecie();