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


function limpia() {
    var val = document.getElementById("miInput").value;
    var tam = val.length;
    for (i = 0; i < tam; i++) {
        if (!isNaN(val[i]))
            document.getElementById("miInput").value = '';
    }
}
function validarPersona() {
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    var text1 = document.getElementById("perTeldo");
    var text2 = document.getElementById("perTelce");
    var text4 = document.getElementById("perCorreoPer");
    var text5 = document.getElementById("cargasFam");
    var pdf = document.getElementById("idr").src;

    if (((text1.value != "") && (text1.value.length > 1))
            && ((text2.value != "") && (text2.value.length > 1))
            && (emailRegex.test(text4.value)) && ((text5.value != "") && ((pdf.length > 90)))
            ) {
        document.getElementById("enviar").disabled = "";
    } else {
        document.getElementById("enviar").disabled = "disabled";
    }
}


function Menu() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#6FBC85");
    $("#contenidoDinamico").html("");
    var UsuLinea = $("#codCas").text();
    $("#menuDerecha").removeClass("control-sidebar-open");
    $.ajax({
        url: "Menu.jsp",
        type: "GET",
        data: {UsuLinea: UsuLinea},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
            clickPerfil();
        },
        error: function (error) {
            location.reload();
        }
    });
}

//MENU SA
function MenuSA() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#304A54");
    $("#contenidoDinamico").html("");
    var UsuLinea = $("#codCas").text();
    $("#menuDerecha").removeClass("control-sidebar-open");
    $.ajax({
        url: "MenuSA.jsp",
        type: "GET",
        data: {UsuLinea: UsuLinea},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
        },
        error: function (error) {
            location.reload();
        }
    });
}

function clickPersona() {

    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();

    $.ajax({
        url: "AdminPersona.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

function clickDatosPersonales() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();

    $.ajax({
        url: "AdminDatosPersonales.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

function clickPerfil() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserPerfil.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}


function validarReferencia() {
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
        document.getElementById("enviar").disabled = "";
    } else {
        document.getElementById("enviar").disabled = "disabled";
    }
}

function validarRefe() {
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    var text1 = document.getElementById("perCallep");
    var text2 = document.getElementById("perCalles");
    var text3 = document.getElementById("perNumCas");
    var text4 = document.getElementById("perSect");
    var text5 = document.getElementById("perRefen");

    if (((text1.value != "") && (text1.value.length > 1))
            && ((text2.value != "") && (text2.value.length > 1))
            && ((text3.value != "") && (text3.value.length > 1))
            && ((text4.value != "") && (text4.value.length > 1))
            && ((text5.value != "") && (text5.value.length > 1))
            ) {
        document.getElementById("enviarRef").disabled = "";
    } else {
        document.getElementById("enviarRef").disabled = "disabled";
    }
}

function cargarprovincia() {
    var e = document.getElementById("idPais");
    var strUser = e.options[e.selectedIndex].value;
    $.ajax({
        type: 'POST',
        url: "./contHojaVida.jsp",
        data: {opc: 'select', tsk: 'cargarprovincia', id: strUser},
        success: function (resp1) {
            var resp = JSON.parse(resp1);
            document.getElementById('idProvincia').options.length = 0;
            document.getElementById('idCanton').options.length = 0;
            document.getElementById('idParroquia').options.length = 0;
            var sel = document.getElementById('idProvincia');
            for (var i = 0; i < resp.length; i++) {
                sel.options[i] = new Option(resp[i].proNombre,
                        resp[i].proId);
            }
        },
        error: function (error) {
            location.reload();
        }
    });
}

function cargarcanton() {

    var e = document.getElementById("idProvincia");

    var strUser = e.options[e.selectedIndex].value;

    $.ajax({
        type: 'POST',
        url: "./contHojaVida.jsp",
        data: {opc: 'select', tsk: 'cargarcanton', id: strUser},
        success: function (resp1) {
            var resp = JSON.parse(resp1);
            document.getElementById('idCanton').options.length = 0;
            var sel = document.getElementById('idCanton');
            for (var i = 0; i < resp.length; i++) {
                sel.options[i] = new Option(resp[i].ciuNombre,
                        resp[i].ciuId);
            }
            cargarparroquiaPorv('idCanton');
        },
        error: function (error) {
            location.reload();
        }
    });
}

function cargarparroquia() {
    var e = document.getElementById('idCanton');
    var strUser = e.options[e.selectedIndex].value;
    $.ajax({
        type: 'POST',
        url: "./contHojaVida.jsp",
        data: {opc: 'select', tsk: 'cargarparroquia', id: strUser},
        success: function (resp1) {
            var resp = JSON.parse(resp1);
            document.getElementById('idParroquia').options.length = 0;
            var sel = document.getElementById('idParroquia');
            for (var i = 0; i < resp.length; i++) {
                sel.options[i] = new Option(resp[i].prqNombre,
                        resp[i].prqId);
            }
        },
        error: function (error) {
            location.reload();
        }
    });
}

function cargarparroquiaPorv(varia) {
    var e = document.getElementById(varia);
    var strUser = e.options[e.selectedIndex].value;
    $.ajax({
        type: 'POST',
        url: "./contHojaVida.jsp",
        data: {opc: 'select', tsk: 'cargarparroquia', id: strUser},
        success: function (resp1) {
            var resp = JSON.parse(resp1);
            document.getElementById('idParroquia').options.length = 0;
            var sel = document.getElementById('idParroquia');
            for (var i = 0; i < resp.length; i++) {
                sel.options[i] = new Option(resp[i].prqNombre,
                        resp[i].prqId);
            }
        },
        error: function (error) {
            location.reload();
        }
    });
}

function actualizarpersona() {
    var objImagen = new Image();
    objImagen.src = document.getElementById("idr").src;
    var tipo = objImagen.src;
    var datos = convertirObjetoJson('frmactualizarpersona1');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    $.ajax({
        url: "./contHojaVida.jsp",
        type: "POST",
        data: {opc: 'actualizarpersona', tsk: 'personaactualizar', datos: datos, tipo: tipo},
        //  contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#imgUser").attr("src", tipo);
            clickDatosPersonales('Metodo');
            alertEdit();

        },
        error: function (error) {
            location.reload();
        }
    });
}

function actualizarDireccion() {
    var datos = convertirObjetoJson('frmdireccionactualizar');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    $.ajax({
        url: "./contHojaVida.jsp",
        type: "POST",
        data: {opc: 'actualizarpersona', tsk: 'personaactualizarDireccion', datos: datos},
        //  contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            alertEdit();
            clickReportePersona('Metodo');
            var data = JSON.parse(datos);
            alert(data.resultJSON);
        },
        error: function (error) {
            location.reload();
        }
    });
}

function actualizarDiscapacidad() {
    var datos = convertirObjetoJson('frmdiscapacidadactualizar');
    var pdf = document.getElementById("pdf11").src;
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    $.ajax({
        url: "./contHojaVida.jsp",
        type: "POST",
        data: {opc: 'actualizarpersona', tsk: 'personaactualizarDiscapacidad', datos: datos, pdf: pdf},
        //  contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            alertEdit();
            clickReportePersona('Metodo');
            var data = JSON.parse(datos);
            alert(data.resultJSON);
        },
        error: function (error) {
            location.reload();
        }
    });
}

// ************** capacitaciones ****************
function clickCapacitaciones() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserCapacitaciones.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alertError();
            location.reload();
        }
    });
}

function AddCapacitacion() {
    var datos = convertirObjetoJson('FrmNewCapacitacion');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Capacitacion', tsk: 'AddCapacitacion', datos: datos, pdf: pdf},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickCapacitaciones();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickCapacitaciones();
            alertError();
            TerminaLoad();
        }
    });
}

function DelCapacitacion(idCap) {
    alertify.confirm(
            '<center><b>Se va a eliminar una capacitación.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su capacitación, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Capacitacion', tsk: 'DelCapacitacion', idCap: idCap},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickCapacitaciones();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickCapacitaciones();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function MostCapacitacion(idCap) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserCapacitacionesEdit.jsp",
        type: "GET",
        data: {idCap: idCap},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickCapacitaciones();
            alertError();
        }
    });
}

function EditCapacitacion(idCap) {
    var datos = convertirObjetoJson('FrmEditCapacitacion');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Capacitacion', tsk: 'EditCapacitacion', datos: datos, pdf: pdf, idCap: idCap},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickCapacitaciones();
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            clickCapacitaciones();
            alertError();
            TerminaLoad();
        }
    });
}

// ************** Fin capacitaciones ****************



// ************** L O G R O S ****************
function clickLogros() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserLogros.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alertError();
            location.reload();
        }
    });
}

function AddLogro() {
    var datos = convertirObjetoJson('FrmNewLogro');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Logro', tsk: 'AddLogro', datos: datos, pdf: pdf},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickLogros();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickLogros();
            alertError();
            TerminaLoad();
        }
    });
}

function DelLogro(idLog) {
    alertify.confirm(
            '<center><b>Se va a eliminar un logro.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su logro, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Logro', tsk: 'DelLogro', idLog: idLog},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickLogros();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickLogros();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}


function MostLogro(idLog) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserLogrosEdit.jsp",
        type: "GET",
        data: {idLog: idLog},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickLogros();
            alertError();
        }
    });
}

function EditLogro(idLog) {
    var datos = convertirObjetoJson('FrmEditCapacitacion');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Logro', tsk: 'EditLogro', datos: datos, pdf: pdf, idLog: idLog},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickLogros();
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            clickLogros();
            alertError();
            TerminaLoad();
        }
    });
}


// ************** F I N      L O G R O S ****************





// ************** O F I C I O S ****************
function clickOficios() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserOficios.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alertError();
            location.reload();
        }
    });
}

function AddOficios() {
    var datos = convertirObjetoJson('FrmNewOficio');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Oficio', tsk: 'AddOficio', datos: datos},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickOficios();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickOficios();
            alertError();
            TerminaLoad();
        }
    });
}

function DelOficios(idOfi) {
    alertify.confirm(
            '<center><b>Se va a eliminar un oficio o subactividad.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su oficio o subactividad, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Oficio', tsk: 'DelOficio', idOfi: idOfi},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickOficios();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickOficios();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}


function MostOficios(idOfi) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserOficiosEdit.jsp",
        type: "GET",
        data: {idOfi: idOfi},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickOficios();
            alertError();
        }
    });
}

function EditOficios(idOfi) {
    var datos = convertirObjetoJson('FrmEditOficios');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Oficio', tsk: 'EditOficio', datos: datos, idOfi: idOfi},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickOficios();
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            clickOficios();
            alertError();
            TerminaLoad();
        }
    });
}


// ************** F I N    O F I C I O S ****************




// ************** R E F E R E N C I A S ****************
function clickReferencia() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserReferencia.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
            alertError();
        }
    });
}

function AddReferencia() {
    var datos = convertirObjetoJson('FrmNewReferencia');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Referencia', tsk: 'AddReferencia', datos: datos},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickReferencia();
            TerminaLoad();
            alertAdd();
        },
        error: function (error) {
            clickReferencia();
            TerminaLoad();
            alertError();
        }
    });
}

function DelReferencia(idRef) {
    alertify.confirm(
            '<center><b>Se va a eliminar una referencia.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su referencia, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Referencia', tsk: 'DelReferencia', idRef: idRef},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickReferencia();
                        TerminaLoad();
                        alertDel();
                    }
                    ,
                    error: function (error) {
                        clickReferencia();
                        TerminaLoad();
                        alertError();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function MostReferencia(idRef) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserReferenciaEdit.jsp",
        type: "GET",
        data: {idRef: idRef},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickReferencia();
            alertError();
        }
    });
}

function EditReferencia(idRef) {
    var datos = convertirObjetoJson('FrmEditReferencia');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Referencia', tsk: 'EditReferencia', datos: datos, idRef: idRef},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickReferencia();
            TerminaLoad();
            alertEdit();
        },
        error: function (error) {
            clickReferencia();
            TerminaLoad();
            alertError();
        }
    });
}


// ************** F I N    R E F E R E N C I A S ****************






// ************** idiomas ****************
function clickIdiomas() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserIdiomas.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}



function AddIdiomas() {
    var datos = convertirObjetoJson('FrmNewIdiomas');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Idioma', tsk: 'AddIdioma', datos: datos, pdf: pdf},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickIdiomas();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickIdiomas();
            alertError();
            TerminaLoad();
        }
    });
}

function DelIdioma(idIdioma) {
    alertify.confirm(
            '<center><b>Se va a eliminar un Idioma.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su Idioma, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Idioma', tsk: 'DelIdioma', idIdioma: idIdioma},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickIdiomas();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickIdiomas();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function MostIdioma(idIdi) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserIdiomasEdit.jsp",
        type: "GET",
        data: {idIdi: idIdi},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickIdiomas()();
            alertError();
        }
    });
}

function EditIdioma(idLog) {
    var datos = convertirObjetoJson('FrmModIdiomas');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Idioma', tsk: 'EditIdioma', datos: datos, pdf: pdf, idLog: idLog},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickIdiomas();
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            clickIdiomas();
            alertError();
            TerminaLoad();
        }
    });
}


// ************** Fin Idiomas ****************

// ************** Instruccion Formal ****************
function clickInstruccionFormal() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserInstruccionFormal.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}


function clickactualizarsenecyt() {
    alertify.confirm(
            '<center><b>Se va a Actualizar sus Títulos.</b><center>',
            'Al continuar con este proceso usted <b>ACTUALIZARÁ</b> y obtendra todos los Títulos registrados en el Senecyt, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'InstruccionFormal', tsk: 'actualizarsenecyt'},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickInstruccionFormal();
                        alertAdd();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickInstruccionFormal();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function DelInstruccionFormal(idinstruccion) {
    alertify.confirm(
            '<center><b>Se va a eliminar un Título.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su Título obtenido del Senecyt, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'InstruccionFormal', tsk: 'DelInstruccionformal', idinstruccion: idinstruccion},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickInstruccionFormal();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickInstruccionFormal();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function MostInstruccionFormal(idIdi) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserInstruccionFormalEdit.jsp",
        type: "GET",
        data: {idIdi: idIdi},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickInstruccionFormal()();
            alertError();
        }
    });
}

function EditInstruccionFormal(idLog) {
    var datos = convertirObjetoJson('FrmModIdiomas');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'InstruccionFormal', tsk: 'EditInstruccionformal', datos: datos, pdf: pdf, idLog: idLog},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickInstruccionFormal();
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            clickInstruccionFormal()();
            alertError();
            TerminaLoad();
        }
    });
}

// ************** Fin Instruccion Formal ****************

// ************** Instruccion Basica ****************

function AddInstruccionBasica() {
    var datos = convertirObjetoJson('FrmNewInstruccionBasica');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'InstruccionBasica', tsk: 'AddBasica', datos: datos, pdf: pdf},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickInstruccionFormal();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickInstruccionFormal();
            alertError();
            TerminaLoad();
        }
    });
}

function DelInstruccionBasica(idBasica) {
    alertify.confirm(
            '<center><b>Se va a eliminar un Título.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su Título Ingresado, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'InstruccionBasica', tsk: 'DelBasica', idBasica: idBasica},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickInstruccionFormal();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickInstruccionFormal();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function MostInstruccionBasica(idIdi) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserInstruccionBasicaEdit.jsp",
        type: "GET",
        data: {idIdi: idIdi},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickInstruccionFormal()();
            alertError();
        }
    });
}

function EditInstruccionBasica(idLog) {
    var datos = convertirObjetoJson('FrmModIdiomas');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'InstruccionBasica', tsk: 'EditBasica', datos: datos, pdf: pdf, idLog: idLog},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickInstruccionFormal();
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            clickInstruccionFormal();
            alertError();
            TerminaLoad();
        }
    });
}


// ************** Fin Instruccion Formal ****************

// **************  pdf ****************
function clickpdf() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserPdf.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}
// ************** Fin pdf ****************



// ************** GRAFICAS ****************
function clickGraficas() {
    $.ajax({
        url: "Dibujagrafico.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

// ************** FIN GRAFICAS ****************


// ************** A D M I N ****************
function AdminListPerso() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListaPersonas.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
            alertError();
        }
    });
}

function AdminMostPerso(idPer) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminMostrarPersona.jsp",
        type: "GET",
        data: {idPer: idPer},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickInstruccionFormal()();
            alertError();
        }
    });
}

// ************** F I N   A D M I N ****************=======


// **************  experiencia ****************
function clickExperiencias() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserExperiencia.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}

function AddExperiencia() {
    var datos = convertirObjetoJson('FrmNewExperiencia');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Experiencia', tsk: 'AddExperiencia', datos: datos, pdf: pdf},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickExperiencias();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickExperiencias();
            alertError();
            TerminaLoad();
        }
    });
}

function DelExperiencia(idCap) {
    alertify.confirm(
            '<center><b>Se va a eliminar una experiencia.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su experiencia, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Experiencia', tsk: 'DelExperiencia', idCap: idCap},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickExperiencias();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickExperiencias();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function MostExperiencia(idCap) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserExperienciaEdit.jsp",
        type: "GET",
        data: {idCap: idCap},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        },
        error: function (error) {
            clickExperiencias();
            alertError();
        }
    });
}

function EditExperiencia(idCap) {
    var datos = convertirObjetoJson('FrmEditExperiencia');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Experiencia', tsk: 'EditExperiencia', datos: datos, pdf: pdf, idCap: idCap},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickExperiencias();
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            clickExperiencias();
            alertError();
            TerminaLoad();
        }
    });
}

// ************** Fin experiencia ****************


//************** Puestos ****************
function clickPuestos() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserPuestos.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}

function AddPuestos() {
    var datos = convertirObjetoJson('FrmNewPuesto');
    var uscape = decodeURIComponent(datos);
    var pdf = document.getElementById("pdf1").src;
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Puestos', tsk: 'AddPuestos', datos: datos, pdf: pdf},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickPuestos();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickPuestos();
            alertError();
            TerminaLoad();
        }
    });
}

function DelPuestos(idCap) {
    alertify.confirm(
            '<center><b>Se va a eliminar la información de su Puesto.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> la información de su puesto, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Puestos', tsk: 'DelPuestos', idCap: idCap},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickPuestos();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickPuestos();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}


function cargarremuneracion() {
    var e = document.getElementById("cargo");
    var strUser = e.options[e.selectedIndex].value;
    $.ajax({
        type: 'POST',
        url: "./contHojaVida.jsp",
        data: {opc: 'select', tsk: 'cargarremuneracion', id: strUser},
        success: function (resp1) {
            var resp = JSON.parse(resp1);
            document.getElementById('idremuneracion').value = resp.carRemuneracion;
        },
        error: function (error) {
            location.reload();
        }
    });
}

// ************** Fin Puestos ****************

//**************  Acciones afirmativas ****************
function clickAccionesAfirmativas() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "UserAccionesAfirmativas.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}

function AddAccionesAfirmativas() {
    var datos = convertirObjetoJson('FrmNewAcciones');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'AccionesAfirmativas', tsk: 'AddAccion', datos: datos},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickAccionesAfirmativas();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickAccionesAfirmativas();
            alertError();
            TerminaLoad();
        }
    });
}

function DelAccionesAfirmativas(idCap) {
    alertify.confirm(
            '<center><b>Se va a eliminar sus Acciones Afirmativas.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> sus Acciones Afirmativas, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'AccionesAfirmativas', tsk: 'DelAccion', idCap: idCap},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickAccionesAfirmativas();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickAccionesAfirmativas();
                        alertError();
                        TerminaLoad();
                    }
                });

            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}


// ************** Fin acciones afirmativas ****************



//**************  Efermedades catastroficas  ****************
function clickEnfermedadCatastrofica() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminDatosPersonales.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);

        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}

function AddEnfermedadCatastrofica() {
    var datos = convertirObjetoJson('frmactualizarpersona1');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'EnfermedadCatastrofica', tsk: 'AddEnfermedadCatastrofica', datos: datos},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickEnfermedadCatastrofica();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickEnfermedadCatastrofica();
            alertError();
            TerminaLoad();
        }
    });
}



function DelEnfermedadCatastrofica(perid, enfid) {
    alertify.confirm(
            '<center><b>Se va a eliminar su Enfermedad Catastrófica.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su Enfermedad Catastrófica, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'EnfermedadCatastrofica', tsk: 'DelEnfermedadCatastrofica', perid: perid, enfid: enfid},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickEnfermedadCatastrofica();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickEnfermedadCatastrofica();
                        alertError();
                        TerminaLoad();
                    }
                });
            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function DelSustitutos(enfid) {
    alertify.confirm(
            '<center><b>Se va a eliminar a su Sustituto.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> su Sustituto, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'EnfermedadCatastrofica', tsk: 'DelSustituto', enfid: enfid},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickEnfermedadCatastrofica();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickEnfermedadCatastrofica();
                        alertError();
                        TerminaLoad();
                    }
                });
            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function AddSustituto() {
    var datos = convertirObjetoJson('frmactualizarpersona1');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'EnfermedadCatastrofica', tsk: 'AddSustituto', datos: datos},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickEnfermedadCatastrofica();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickEnfermedadCatastrofica();
            alertError();
            TerminaLoad();
        }
    });
}

// ************** Fin enfermedades catastroficas ****************

///************** conyugue ***************
function AddHijo() {
    var datos = convertirObjetoJson('frmconyugueactualizar');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Conyugue', tsk: 'AddHijo', datos: datos},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickEnfermedadCatastrofica();
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            clickEnfermedadCatastrofica();
            alertError();
            TerminaLoad();
        }
    });
}
function DelHijo(enfid) {
    alertify.confirm(
            '<center><b>Se va a eliminar la información de su hijo.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> la información de su Hijo, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Conyugue', tsk: 'DelHijo', enfid: enfid},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        clickEnfermedadCatastrofica();
                        alertDel();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        clickEnfermedadCatastrofica();
                        alertError();
                        TerminaLoad();
                    }
                });
            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}
function AddConyugue() {
    var datos = convertirObjetoJson('frmconyugueactualizar');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Conyugue', tsk: 'AddConyugue', datos: datos},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            clickEnfermedadCatastrofica();
            alertAdd();
            TerminaLoad();

        },
        error: function (error) {
            clickEnfermedadCatastrofica();
            alertError();
            TerminaLoad();
        }
    });
}


function DelConyugue(enfid) {

    alertify.confirm(
            '<center><b>Se va a eliminar la información de su Cónyugue.</b><center>',
            'Al continuar con este proceso usted <b>ELIMINARÁ</b> la información de su Cónyugue, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "contHojaVida.jsp",
                    type: "GET",
                    data: {opc: 'Conyugue', tsk: 'DelConyugue', enfid: enfid},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        alertDel();
                        TerminaLoad();
                        clickEnfermedadCatastrofica();
                    }
                    ,
                    error: function (error) {
                        clickEnfermedadCatastrofica();
                        alertError();
                        TerminaLoad();
                    }
                });
            },
            function () {
                //si presiona CANCEL
                alertCancel();
            }
    ).autoCancel(20).set('oncancel', function () {
        //si pasa el tiempo 
        alertCancel();
    });
}

function ActualizarConyugue(idCap) {
    var datos = convertirObjetoJson('frmconyugueactualizar');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "contHojaVida.jsp",
        type: "POST",
        data: {opc: 'Conyugue', tsk: 'EditConyugue', datos: datos, idCap: idCap},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            alertEdit();
            TerminaLoad();
        },
        error: function (error) {
            alertError();
            TerminaLoad();
        }
    });
}
// ************** Fin conyugue ****************



// ************** Inicio Reportes ****************

function clickkistanivelacademico() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminRepNivelAcademico.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);

        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}

//MOSTRAR reporte dado nivel academico
function cliclistardadonivelacademico() {
    var datos = convertirObjetoJson('Frmlistapersonasnivel');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    obj1 = JSON.parse(datos);
    VentanaPorte();
    $.ajax({
        url: "AdminListaNivelAcademico.jsp",
        type: "GET",
        data: {nivel: obj1["nivel"]},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            //    MuestraLoad();
            // clicklistarAspirantesTabla();
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
            //  TerminaLoad();
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}


//MOSTRAR reporte dado modalidad
function clickModalidadmostrar() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminRepModalidad.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);

        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}

function cliclistardadomodalidad() {
    var datos = convertirObjetoJson('Frmlistapersonasmodalidad');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    obj1 = JSON.parse(datos);
    VentanaPorte();
    $.ajax({
        url: "AdminListaModalidad.jsp",
        type: "GET",
        data: {nivel: obj1["nivel"]},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            // clicklistarAspirantesTabla();
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

//MOSTRAR reporte dado genero
function clickGeneromostrar() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminRepgenero.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);

        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}
function cliclistardadogenero() {
    var datos = convertirObjetoJson('Frmlistapersonasnivel');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    obj1 = JSON.parse(datos);
    VentanaPorte();
    $.ajax({
        url: "AdminListagenero.jsp",
        type: "GET",
        data: {nivel: obj1["nivel"]},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            // clicklistarAspirantesTabla();
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

//MOSTRAR reporte dado etnia
function clickEtniamostrar() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminRepetnia.jsp",
        type: "GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);

        }
        ,
        error: function (error) {
            alertify.error('Ha ocurrido un error');
            location.reload();
        }
    });
}
function cliclistardadoetnia() {
    var datos = convertirObjetoJson('Frmlistapersonasnivel');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    obj1 = JSON.parse(datos);
    VentanaPorte();
    $.ajax({
        url: "AdminListaetnia.jsp",
        type: "GET",
        data: {nivel: obj1["nivel"]},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            // clicklistarAspirantesTabla();
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}
// ************** Fin Reportes ****************
