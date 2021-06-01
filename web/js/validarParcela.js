"use strict";

import { validarNoNegativo} from './validaciones.js';

function validarParcela() {

    console.log("entra en la funcion");

    var validar;

    var hectareas = document.getElementById("hectareas").value;

    //var hect = parseInt(hectareas);

    var referencia = document.getElementById("referencia").value;

    //var ref = parseInt(referencia);
    
    var tipo = document.getElementById("selecttipoparcela").value;

    validar = document.getElementById("divparcela").hidden = true;

    if (validarNoNegativo(hectareas) === false) {

        validar = document.getElementById("divparcela").hidden = true;

        console.log("Las hectareas no son validas");

    }  else if ((validarNoNegativo(hectareas) && validarNoNegativo(referencia)) === true) {

        console.log("los dos son validos");

        validar = document.getElementById("divparcela").hidden = false;

    }
    return validar;

}


function eventoListenerParcela() {

    document.getElementById("divparcela").setAttribute("hidden", true);

    document.getElementById("validaparcela").addEventListener("keyup", validarParcela);


}

eventoListenerParcela();


