"use strict";

import {validarVacio, validarNoNegativo, validarNombre, validarEmail} from './validaciones.js';
 

function validarModificarDatos() {

    var validar = "";

    var nombre = document.getElementById("nombre").value;

    var email = document.getElementById("email").value;

    var tln = document.getElementById("tln").value;


    if ((validarVacio(nombre) && validarVacio(email) && validarVacio(tln)) === true) {
        
        alert("entra");
        
        if (validarNombre(nombre) === false) {

            console.log("falla el nombre");

            validar = document.getElementById("divmdatos").hidden = true;

        } else if (validarEmail(email) === false) {

            console.log("falla el email");


            validar = document.getElementById("divmdatos").hidden = true;

        } else if (validarNoNegativo(tln) === false) {

            console.log("falla el tlfn");


            validar = document.getElementById("divmdatos").hidden = true;

        } else if ((validarNombre(nombre) && validarEmail(email) && validarNoNegativo(tln)) === true) {

            console.log("todo ok");

            validar = document.getElementById("divmdatos").hidden = false;
        }



    } else {
        
        console.log("falla el vacio");

        validar = document.getElementById("divmdatos").hidden = true;
    }

    return validar;
}


function eventoListenerModificarDatos() {

    document.getElementById("divmdatos").setAttribute("hidden", false);
    
    document.getElementById("modificardatos").addEventListener("load", validarModificarDatos);
    
    document.getElementById("modificardatos").addEventListener("keyup", validarModificarDatos);

}

eventoListenerModificarDatos();