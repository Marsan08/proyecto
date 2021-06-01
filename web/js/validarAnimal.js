"use strict";

import { validarNombre, validarNoNegativo } from './validaciones.js';


 
function validarAnimal() {

    console.log("entra en la funcion");

    var validar;

  
    var crotal = document.getElementById("crotal").value;

    validar = document.getElementById("divanimal").hidden = true;

   if(validarNoNegativo(crotal) === false){
        
        validar = document.getElementById("divanimal").hidden = true;
        
        
    }else if (validarNoNegativo(crotal) === true) {

        console.log("Los tres son validos");
        
        validar = document.getElementById("divanimal").hidden = false;

    }
    return validar;

}


function eventoListenerAnimal() {

    document.getElementById("divanimal").setAttribute("hidden", true);

    document.getElementById("validanimal").addEventListener("keyup", validarAnimal);
    

}


eventoListenerAnimal();