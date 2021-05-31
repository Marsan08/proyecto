"use strict";

import { validarNombre, validarEmail, validarDni, validarNoNegativo, validarVacio} from './validaciones.js';



function validarUsuario(){
    
    var validar;
    
    var nombre = document.getElementById("nombreusuario").value;
    
    var email = document.getElementById("emailusuario").value;
    
    var dni = document.getElementById("dniusuario").value;
    
    var tlf = document.getElementById("tlfusuario").value;
    
    var pass = document.getElementById("passusuario").value;
    
    if(validarNombre(nombre) === false){
        
        console.log("el nombre no es valido");
        
        validar = document.getElementById("divusuario").hidden = true;
        
    } else if( validarEmail(email) === false){
        
        console.log("el email no es valido");
        
        validar = document.getElementById("divusuario").hidden = true;
        
    } else if( validarDni(dni) === false ){
        
        console.log("el dni no es valido");
        
        validar = document.getElementById("divusuario").hidden = true;
        
        
    } else if ( validarNoNegativo(tlf) === false){
        
        console.log("el telefono no es valido");
        
        validar = document.getElementById("divusuario").hidden = true;
        
    }else if ( validarVacio(pass) === false ){
        
        console.log("la contrasela esta vacia");
        
        validar = document.getElementById("divusuario").hidden = true;
        
    } else if( (validarNombre(nombre) && validarEmail(email) && validarDni(dni) && validarNoNegativo(tlf) && validarVacio(pass)) === true ){
        
        console.log("valida todo");
        
        validar = document.getElementById("divusuario").hidden = false;
   
    }

    return validar;
}

function eventoListenerUsuario(){
    
      document.getElementById("divusuario").setAttribute("hidden", true);

    document.getElementById("validarusuario").addEventListener("keyup", validarUsuario);
  
}

eventoListenerUsuario();