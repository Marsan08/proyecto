"use strict";

export function validarNoNegativo(numero) {
 
    var validar = new Boolean();

    validar = false;

    //var num = parseInt(numero);

    if (numero < 0) {

        validar = false;

    } else if (numero == 0) {

        validar = false;

    } else if (numero > 0) {

        validar = true;

    }

    return validar;

}

export function validarEmail(email) {

    var validar = new Boolean();

    validar = false;

    var regEx = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;

    if (!regEx.test(email)) {

        validar = false;

    } else if (regEx.test(email)) {

        validar = true;

    }

    return validar;

}

export function validarVacio(texto) {

    var validar = new Boolean();
    
    validar = false;
    
    var long = texto.length;
    
    if(long === 0){
        
        validar = false;
        
    } else if (long > 0 ){
        
        validar = true;
        
    }

    return validar;

}


export function validarDni(dni) {

    var validar = new Boolean();

    validar = false;

    var numero;
    var letr;
    var letra;
    var regEx;

    regEx = /^\d{8}[a-zA-Z]$/;

    if (regEx.test(dni) == true) {
        numero = dni.substr(0, dni.length - 1);
        letr = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letra = letra.substring(numero, numero + 1);
        if (letra != letr.toUpperCase()) {

            validar = false;

        } else {

            validar = true;

        }
    } else {

        validar = false;

    }

    return validar;

}

export function validarNombre(nombre) {

    var validar = new Boolean();

    validar = false;

    var regEx = /^[a-zA-Z]+$/;

    if (regEx.test(nombre)) {

        validar = true;

    } else {

        validar = false;
    }

    return validar;

}


export function validarFecha(fplantacion, frecogida) {

    var validar = new Boolean();

    validar = false;

    var plantar = new Date(fplantacion);

    var recoger = new Date(frecogida);

    if (plantar.getTime() > recoger.getTime()) {

        validar = false;


    } else if (plantar.getTime() == recoger.getTime()) {

        validar = false;

    } else if (plantar.getTime() < recoger.getTime()) {

        validar = true;

    }

    return validar;

}

