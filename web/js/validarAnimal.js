"use strict";

import { validarNombre } from './validaciones.js';


function validarAnimal() {

    console.log("entra en la funcion");

    var validar;

    var sexo = document.getElementById("sexo").value;

    validar = document.getElementById("divanimal").hidden = true;

    if (validarNombre(sexo) === false) {

        validar = document.getElementById("divanimal").hidden = true;

        console.log("El sexo no es  valido");

    } else if (validarNombre(sexo) === true) {

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