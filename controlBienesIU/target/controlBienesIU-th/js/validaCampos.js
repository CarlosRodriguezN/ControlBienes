//Querido colega programador: 
//Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
//Ahora solo dios lo sabe!!
//
//Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
//y fracasas (seguramente), por favor, incrementa 
//el siguiente contador como una advertencia para el siguiente colega:
//
//Total_horas_perdidas_aqui = 0

//Funciones de los menus

function ValRefer() {
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    var text1 = document.getElementById("RefNombre");
    var text2 = document.getElementById("RefTelefo");
    var text3 = document.getElementById("RefApelli");
    var text4 = document.getElementById("RefEmail");

    if (((text1.value != "") && (text1.value.length > 1))
            && ((text2.value != "") && (text2.value.length > 1))
            && ((text3.value != "") && (text3.value.length > 1))
            && (emailRegex.test(text4.value))
            ) {
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}

function ValCargo() {
    var text1 = document.getElementById("denominacion");
    var text2 = document.getElementById("competencia");
    var text3 = document.getElementById("grupo");
    var text4 = document.getElementById("grado");
    var text5 = document.getElementById("rol");
    var text6 = document.getElementById("rmn");

    if (((text1.value != "") && (text1.value.length > 1))
            && ((text2.value != "") && (text2.value.length > 1))
            && ((text3.value != "") && (text3.value.length > 1))
            && ((text4.value != "") && (text4.value.length > 1))
            && ((text5.value != "") && (text5.value.length > 1))
            && ((text6.value != "") && (text6.value.length > 1))
            ) {
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}

function ValDependencia() {
    var text1 = document.getElementById("TipoFlNomb");

    if (((text1.value != "") && (text1.value.length > 1))
            ) {
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}

function ValModalidad() {
    var text1 = document.getElementById("TipoFlNomb");

    if (((text1.value != "") && (text1.value.length > 1))
            ) {
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}

function ValRegimen() {
    var text1 = document.getElementById("TipoFlNomb");

    if (((text1.value != "") && (text1.value.length > 1))
            ) {
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}



function ValCapacita() {
    var text1 = document.getElementById("InstNombre");
    var text2 = document.getElementById("NumDias");
    var text3 = document.getElementById("EvnNombre");
    var text4 = document.getElementById("NumHoras");
    var fechaDesde = document.getElementById("fecDesde").value.split("-");
    var comDesde = new Date();
    var pdf = document.getElementById("pdf1").src;
    comDesde.setFullYear(fechaDesde[0], fechaDesde[1] - 1, fechaDesde[2]);
    var fechaHasta = document.getElementById("fecHasta").value.split("-");
    var comHasta = new Date();
    comHasta.setFullYear(fechaHasta[0], fechaHasta[1] - 1, fechaHasta[2]);
    if (((text1.value != "") && (text1.value.length > 1)) && ((text2.value != "") && (text2.value.length > 0) && (text2.value > 0))
            && ((text3.value != "") && (text3.value.length > 1)) && ((text4.value != "") && (text4.value.length > 0) && (text4.value > 0))
            && (comDesde <= comHasta) && (pdf.length > 90)) {
        
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}
function ValExperiencia() {
    var text2 = document.getElementById("ActiviNombre");
    var text3 = document.getElementById("InstNombre");
    var text4 = document.getElementById("PuesNombre");
    var fechaDesde = document.getElementById("fecDesde").value.split("-");
    var comDesde = new Date();
    var pdf = document.getElementById("pdf1").src;
    comDesde.setFullYear(fechaDesde[0], fechaDesde[1] - 1, fechaDesde[2]);
    var fechaHasta = document.getElementById("fecHasta").value.split("-");
    var comHasta = new Date();
    comHasta.setFullYear(fechaHasta[0], fechaHasta[1] - 1, fechaHasta[2]);
    if ( ((text2.value != "") && (text2.value.length > 4) )
            && ((text3.value != "") && (text3.value.length > 4)) && ((text4.value != "") && (text4.value.length > 4) )
            && (comDesde <= comHasta) && (pdf.length > 90)) {
        
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}

function ValOfici() {
    var text1 = document.getElementById("OfiDescri");
    if (((text1.value != "") && (text1.value.length > 1))) {
        $("#BtnAcept").prop("disabled", false);
    } else {
        $("#BtnAcept").prop("disabled", true);
    }
}

function ValLogro(){
  var text1 = document.getElementById("LogDescri");
  var pdf = document.getElementById("pdf1").src;
  if(((text1.value != "")&&(text1.value.length > 1))&& (pdf.length > 90)){
        $("#BtnAcept").prop("disabled", false);
  }else{
        $("#BtnAcept").prop("disabled", true);
  }
}

function validarAccion() {
    var text1 = document.getElementById("aResidencia");
    if ((((text1.value != "") && (text1.value.length > 0)
            && (text1.value >= 2) && (text1.value < 80)))||($("#ResiPaisNo").is(':checked'))) {
        document.getElementById("BtnAcept").disabled = "";
    } else {
        document.getElementById("BtnAcept").disabled = "disabled";
    }
}

function validaridioma() {
    var text1 = document.getElementById("nivHabla");
    var text2 = document.getElementById("nivEscri");
     var pdf = document.getElementById("pdf1").src;
    if ((((text1.value != "") && (text1.value >= 0) ))&&((text2.value != "") && (text2.value >= 0) )&& (pdf.length > 90)) {
       $("#BtnMiProce").prop("disabled", false);
    } else {
         $("#BtnMiProce").prop("disabled", true);
    }
}

function ValBasica() {

    var text2 = document.getElementById("NomTitu");
    var text3 = document.getElementById("NomInst");
    var text6 = document.getElementById("NumRegis");
    var text4 = document.getElementById("TotTiempo");
    var pdf = document.getElementById("pdf1").src;
    var fechaHasta = document.getElementById("FecRegis").value.split("-");
    var comHasta = new Date();
    comHasta.setFullYear(fechaHasta[0], fechaHasta[1] - 1, fechaHasta[2]);
    if ( ((text2.value != "") && (text2.value.length > 4) )
            && ((text3.value != "") && (text3.value.length > 4)) && ((text6.value != "") && (text6.value.length > 3)) && ((text4.value != "") && (text4.value > 0) )
             && (pdf.length > 90)) {
        
        $("#BtnMiProce").prop("disabled", false);
    } else {
        $("#BtnMiProce").prop("disabled", true);
    }
}

function ValPuesto(){
  var text1 = document.getElementById("partida");
  var pdf = document.getElementById("pdf1").src;
  var text2 = document.getElementById("observacion");
  
  if(((text1.value != "")&&(text1.value.length > 1))&&((text2.value != "")&&(text2.value.length > 1))&& (pdf.length > 90)){
        $("#BtnAcept").prop("disabled", false);
  }else{
        $("#BtnAcept").prop("disabled", true);
  }
}