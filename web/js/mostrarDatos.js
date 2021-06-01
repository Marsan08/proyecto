'use strict';

import { noNulo } from './validaciones.js';

 
function noSacarNull(){
    
    var frecogida = document.getElementsByClassName("frecogida");
    
    var validar = "";
    
    document.getElementById("ocultar").setAttribute("hidden", true);

    if ( noNulo(frecogida) === false){
        
        console.log("entra por aqui");
        
       validar = document.getElementById("ocultar").hidden = true;
        
    } else  if( noNulo(frecogida) === true ){
        
        console.log("entra por alla");
        
       validar = document.getElementById("ocultar").hidden = false;    
    }    
    
    return validar;

}

noSacarNull();