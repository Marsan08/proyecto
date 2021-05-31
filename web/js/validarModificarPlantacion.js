"use strict";


import {validarFecha} from './validaciones.js';


function validaFechaRecogida(){
    
    var validar;
    
    var fplantacion = document.getElementById("fplantacion").getAttribute("value");
    
    var frecogida = document.getElementById("frecogida").value;
    
    if( validarFecha(fplantacion, frecogida) === false ){
        
        console.log("la fecha de recogida es menor o igual a la de plantacion");
        
        validar = document.getElementById("divmplantacion").hidden = true;
        
    } else if(validarFecha(fplantacion, frecogida) === true){
        
        console.log("las fehcas son correctas");
        
        validar = document.getElementById("divmplantacion").hidden = false;
        
    }
    
    return validar;
        
}


function eventoListenerModificarPlantacion(){
    
    document.getElementById("divmplantacion").setAttribute("hidden", true);
    
    document.getElementById("modificarplantacion").addEventListener("click", validaFechaRecogida);
 
}

eventoListenerModificarPlantacion();