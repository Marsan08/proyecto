"use strict";


import {validarVacio} from './validaciones.js';


function validarModificaUsuario() {

    var validar;

    var contra = document.getElementById("cambiausuario").value;

    if (validarVacio(contra) === false) {

        console.log("la contraseña esta vacia");

        validar = document.getElementById("divmusuario").hidden = true;


    } else if (validarVacio(contra) === true) {

        console.log("la contraseña tiene valores");

        validar = document.getElementById("divmusuario").hidden = false;

    }


    return validar;

}


function eventoListenerModificarUsuario() {

    document.getElementById("divmusuario").setAttribute("hidden", true);

    document.getElementById("modificarusuario").addEventListener("keyup", validarModificaUsuario);

}

eventoListenerModificarUsuario();