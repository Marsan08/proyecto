"use strict";
//la funcion devuelve true si es positivo y mayor que 0 
function noNegativo(numero) {

    var validar = new Boolean;
    validar = false;
    if (numero <= 0) {

        validar = false;
    } else if (numero > 0) {

        validar = true;
    }

    return validar;
}

//funcion que devuelve true si el email es valido

function validarEmail(email) {

    var validar = new Boolean;
    var regEx = "/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3,4})+$/";
    if (regEx.test(email)) {

        validar = true;
    } else {

        validar = false;
    }

    return validar;
}

//funcion que devuelve true si el dni es valido

function validarDni(dni) {

    var validar = new Boolean;
    validar = false;
    var numero;
    var letr;
    var letra;
    var expresion_regular_dni;
    expresion_regular_dni = /^\d{8}[a-zA-Z]$/;
    if (expresion_regular_dni.test(dni) == true) {
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

//funcion que devuelve true si la fecha de recogida es mayor que la fecha de plantacion
function validarFecha(fplantacion, frecogida) {
    
    var validar = new Boolean;
    validar = false;
    
    var date1 = new Date();
    var date2 = new Date();
    
    date1 = fplantacion;
    date2 = frecogida;
    
    if (date1.valueOf() < date2.valueOf()){
        validar = true;
    
    }else if (date1.valueOf() > date2.valueOf()){
         validar = false;
    
    }else if (date1.valueOf() === date2.valueOf()){
        validar = false;
    }
    
    return validar;
}


function insertarParcela(){
    
    var hectarea = document.getElementById("hectareas").value;
    
    var referencia = docuemnt.getElementById("referencia").value;
    
    var boton = document.getElementById("insertarparcela");
    
    boton.setAttribute("type", "hidden");
    
    if(noNegativo(hectarea) == true){
        
        if(noNegativo(referencia) == true){
            
            boton.setAttribute("type", "submit");
        }
        
    }
    
}

insertarParcela();