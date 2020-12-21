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

function importaCSV() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminImporCsvTemp.jsp",
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

function ImportadosCsvDB() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarCsvDB.jsp",
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

function ImportadosTemporal() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarTemp.jsp",
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

function verUsuarios() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarPersonas.jsp",
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

function verTodosBienes() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBienes.jsp",
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

function verTodosBienesMantenimiento() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBienesMantenimiento.jsp",
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

function verTodosHistoriales() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarHistorialMantenimiento.jsp",
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

function verTodosTecnicos() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarTecnicos.jsp",
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

function verFormularioBien() {
    //ar datos = Objeto2Json('addUbicacion');
    $.ajax({
        url: "AdminIngreBien.jsp",
        type: "POST",
        data: {datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            //verUbicaciones();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            // verUbicaciones();
            alertError();
        }
    });
}

function PreAddBien() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarCatalogos.jsp",
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

function addBien() {
    var datos = Objeto2Json('FrmAddBien');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Bien', tsk: 'addBien', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {

            var correcto = datos.indexOf("NO");
            var error = datos.indexOf("ERROR");
            if (correcto == 0) {
                alertify.alert('Bien duplicado', 'El bien que intenta ingresar ya se encuentra en la base de datos!', function () {
                    alertify.error('Bien duplicado');
                });
                alertDuplicado();
            }
            if (error == 0) {
                alertify.alert('Campos incorrectos', 'El bien que intenta ingresar no mantiene los campos correctamente tipeados, por favor reviselo e intente de nuevo!', function () {
                    alertify.error('Revise los campos del bien');
                });
                alertError()();
            }
            if (correcto == -1) {
                PreAddBien()
                alertAdd();
            }
        },
        error: function (error) {
            PreAddBien();
            alertError();
        }
    });
}

function PreBienesBusqueda() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBienesBusca.jsp",
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


function PreBusquedaPorPersona() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminBuscaBienes.jsp",
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

function ReportesBien() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBienesReportes.jsp",
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

function BienesBusqueda(tipoBusqueda) {
    var datos = Objeto2Json('FrmBien' + tipoBusqueda);
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBienesDependenciaId.jsp",
        type: "GET",
        data: {tipoBusqueda: tipoBusqueda, datos: datos},
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

function clicCertificadoPDF() {
    datNomb;
    datIDPerio;
    datTipoCer;
    datFecha;
    datPerio
    var datos = Objeto2Json('FrmBuscarBienCedula');
    alerrt(datos);
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "reporte.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0'
    params += ', fullscreen=yes';
    window.open(url, "", params);

}
function verDependencias() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarDependencias.jsp",
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

function verUbicaciones() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarUbicaciones.jsp",
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

function verCargos() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarCargos.jsp",
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

function verAuditoria() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarAuditoria.jsp",
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

function verTipoIngreso() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarTipoIngreso.jsp",
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

function verBaja() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBajas.jsp",
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

function verMotivoInforme() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarMotivoInforme.jsp",
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

function verInformes() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarInformes.jsp",
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

function addDependencia() {
    var datos = Objeto2Json('FrmNewDependencia');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Dependencia', tsk: 'addDependencia', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verDependencias();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            verDependencias();
            alertError();
        }
    });
}

function estDependencia(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'Dependencia', tsk: 'estDependencia', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verDependencias();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verDependencias();
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

function addUbicacion() {
    var datos = Objeto2Json('addUbicacion');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Ubicacion', tsk: 'addUbicacion', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verUbicaciones();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            verUbicaciones();
            alertError();
        }
    });
}

function addTecnico() {
    var datos = Objeto2Json('addTecnico');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Tecnico', tsk: 'addTecnico', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verTodosTecnicos();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            verTodosTecnicos();
            alertError();
        }
    });
}

function addMantenimiento() {
    var datos = Objeto2Json('addMantenimiento');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'MantenimientoBien', tsk: 'addMantenimiento', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verTodosBienesMantenimiento();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            verTodosBienesMantenimiento();
            alertError();
        }
    });
}

function estUbicacion(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'Ubicacion', tsk: 'estUbicacion', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verUbicaciones();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verUbicaciones();
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

function addCargo() {
    var datos = Objeto2Json('addCargo');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Cargo', tsk: 'addCargo', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verCargos();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            location.reload();
        }
    });
}

function estCargo(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'Cargo', tsk: 'estCargo', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verCargos();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verCargos();
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

function addMotivoinforme() {
    var datos = Objeto2Json('addMotivoinforme');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Motivoinforme', tsk: 'addMotivoinforme', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verMotivoInforme();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            location.reload();
        }
    });
}

function estMotivoinforme(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'Motivoinforme', tsk: 'estMotivoinforme', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verMotivoInforme();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verMotivoInforme();
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

function addBaja() {
    var datos = Objeto2Json('addBaja');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Baja', tsk: 'addBaja', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verBaja();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            location.reload();
        }
    });
}

function estBaja(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'Baja', tsk: 'estBaja', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verBaja();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verBaja();
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


function addTipoingreso() {
    var datos = Objeto2Json('addTipoingreso');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Tipoingreso', tsk: 'addTipoingreso', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verTipoIngreso();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            location.reload();
        }
    });
}

function estTipoingreso(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'Tipoingreso', tsk: 'estTipoingreso', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verTipoIngreso();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verTipoIngreso();
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


function AddUsuarios() {
    var datos = Objeto2Json('FrmIngUsuarios');
    MuestraLoad();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Usuarios', tsk: 'agregarUsuarios', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verUsuarios()
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            location.reload();
        }
    });
}

function estUsuarios(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'Usuarios', tsk: 'estUsuarios', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verUsuarios();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verUsuarios();
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

//R  O  L  E  S

function rolUSER() {
        var rolIng = $("input[id='idrol']").val(); 

        if(rolIng === "ADMINISTRADOR")
            rolADMINISTRADOR();
        
        if(rolIng === "SUPERVISOR")
            rolSUPERVISOR();
        
        if(rolIng === "OPERARIO")
            rolOPERARIO();
        
}

function rolADMINISTRADOR() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#304A54");
    $("#contenidoDinamico").html("");
    var idUser = $("#codCas").text();
    $.ajax({
        url: "MenuAdmin.jsp",
        type: "GET",
        data: {idUser: idUser},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Bienes</h2><em>Bienes</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>Estimado(a) Administrador(a) del Sistema, usted podrá asignar, descargar y administrar las Bienes Honoríficas al Desempeño Integral Docente del Personal Académico (a partir del periodo octubre 2017 - marzo 2018).</p></br><img src='assets/img/dashboard-normal-sidebar.png' class='img-responsive center-block' alt='Normal Sidebar'><div class='bottom-30px'></div></div>");
        },
        error: function (error) {
            location.reload();
        }
    });
}

function rolSUPERVISOR() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#304A54");
    $("#contenidoDinamico").html("");
    var idUser = $("#codCas").text();
    $.ajax({
        url: "MenuSuperAdmin.jsp",
        type: "GET",
        data: {idUser: idUser},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Bienes</h2><em>Bienes</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>Estimado(a) Administrador(a) del Sistema, usted podrá asignar, descargar y administrar las Bienes Honoríficas al Desempeño Integral Docente del Personal Académico (a partir del periodo octubre 2017 - marzo 2018).</p></br><img src='assets/img/dashboard-normal-sidebar.png' class='img-responsive center-block' alt='Normal Sidebar'><div class='bottom-30px'></div></div>");
        },
        error: function (error) {
            location.reload();
        }
    });
}

function rolOPERARIO() {
    VentanaPorte();
    $("#left-sidebar").css("background-color", "#1e6887");
    $("#contenidoDinamico").html("");
    var idUser = $("#codCas").text();
    $.ajax({
        url: "MenuUser.jsp",
        type: "GET",
        data: {idUser: idUser},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#left-sidebar").html(datos);
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Bienes</h2><em>Bienes</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>Estimado(a) Administrador(a) del Sistema, usted podrá asignar, descargar y administrar las Bienes Honoríficas al Desempeño Integral Docente del Personal Académico (a partir del periodo octubre 2017 - marzo 2018).</p></br><img src='assets/img/dashboard-normal-sidebar.png' class='img-responsive center-block' alt='Normal Sidebar'><div class='bottom-30px'></div></div>");
        },
        error: function (error) {
            location.reload();
        }
    });
}

function regTemporalesDB() {
    alertify.confirm(
            '<center><b>Importacion en curso.</b><center>',
            'Al continuar con este proceso usted <b>IMPORTARÁ</b> toda la informacion a la base de datos, recuerde <b>VERIFICAR LA INFORMACIÓN</b> antes de continuar con este proceso, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                var myRows = {respuesta: []};
                var $th = $('table th');
                $('table tbody tr').each(function (i, tr) {
                    var obj = {}, $tds = $(tr).find('td');
                    $th.each(function (index, th) {
                        obj[$(th).text()] = $tds.eq(index).text();
                    });
                    myRows.respuesta.push(obj);
                });
                $("#parrafo").text(JSON.stringify(myRows));
                agregarTemporales();

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

function agregarTemporales() {
    var datos = $("#parrafo").text();
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "POST",
        data: {opc: 'temporales', tsk: 'agregarTemp', datos: datos},
        // contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            //alert(datos.length);
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Importacion CSV.</h2><em>Si existen errores en la importación CSV se reflejaran a continuacion los códigos de sus bienes no ingresados.</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>" + datos + "</p></div><br><br><button class='btn btn-primary' onclick='importaCSV()'><i class='fa fa-check-circle'></i> Aceptar</button><br><br><br>");
            alertAdd();
        }
        ,
        error: function (error) {
            importaCSV();
            alertError();
        }
    });
}


function procesTemp(codBien) {

    MuestraLoad();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'CSV', tsk: 'addprocesarIndividual', codBien: codBien},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Procesamiento CSV.</h2><em>Si existen errores en el proceso se reflejaran a continuacion eldetalle del error.</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>" + datos + "</p></div><br><br><button class='btn btn-primary' onclick='ImportadosTemporal()'><i class='fa fa-check-circle'></i> Aceptar</button><br><br><br>");
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            ImportadosTemporal();
            alertError();
            TerminaLoad();
        }
    });
}
//lll..
function importarTodos(codBien) {

    MuestraLoad();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'CSV', tsk: 'addprocesarTodos', codBien: codBien},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Procesamiento CSV.</h2><em>Si existen errores en el proceso se reflejaran a continuacion eldetalle del error.</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>" + datos + "</p></div><br><br><button class='btn btn-primary' onclick='ImportadosTemporal()'><i class='fa fa-check-circle'></i> Aceptar</button><br><br><br>");
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            ImportadosTemporal();
            alertError();
            TerminaLoad();
        }
    });
}

function eliminaTemp(codBien) {

    MuestraLoad();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'temporales', tsk: 'eliminaTemp', codBien: codBien},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Procesamiento CSV.</h2><em>Si existen errores en el proceso se reflejaran a continuacion eldetalle del error.</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>" + datos + "</p></div><br><br><button class='btn btn-primary' onclick='ImportadosTemporal()'><i class='fa fa-check-circle'></i> Aceptar</button><br><br><br>");
            alertAdd();
            TerminaLoad();
        },
        error: function (error) {
            ImportadosTemporal();
            alertError();
            TerminaLoad();
        }
    });
}

function deleteTecnico(codTecnico) {
    MuestraLoad();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Tecnico', tsk: 'deleteTecnico', codTecnico: codTecnico},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
//            $("#contenidoDinamico").html("");
//            $("#contenidoDinamico").html(datos);
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html("<div class='main-header'><h2>Procesamiento CSV.</h2><em>Si existen errores en el proceso se reflejaran a continuacion eldetalle del error.</em></div><div id='contenidoInferior' class='main-content'><p class='lead'>" + datos + "</p></div><br><br><button class='btn btn-primary' onclick='verTodosTecnicos()'><i class='fa fa-check-circle'></i> Aceptar</button><br><br><br>");
            //verTodosBienesMantenimiento();
            alertDel();
            TerminaLoad();
        },
        error: function (error) {
            verTodosTecnicos()
            alertError();
            TerminaLoad();
        }
    });
}

function quitarDeMantenimiento(idMantenimiento) {
    alertify.confirm(
            '<center><b>Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>DEJARÁ</b> el mantenimiento del bien, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'MantenimientoBienN', tsk: 'quitarMantenimiento', idDato: idMantenimiento},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verTodosBienesMantenimientos();
                        TerminaLoad();
                    },
                    error: function (error) {
                        alert("error");
                        verTodosBienesMantenimientos();
                        alertError(error);
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

// EDICIONES

function PreEditBaja(idDato) {
    $.ajax({
        url: "AdminEditBajas.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verBaja();
        }
    });
}

function EditarBaja(idDato) {
    var datos = Objeto2Json('FrmEditBaja');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Baja', tsk: 'editBaja', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verBaja();
            alertEdit();
        }
        ,
        error: function (error) {
            verBaja();
            alertError();
        }
    });
}


function PreEditDependencia(idDato) {
    $.ajax({
        url: "AdminEditDependencias.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verDependencias();
        }
    });
}

function EditarDependencia(idDato) {
    var datos = Objeto2Json('FrmEditDependencia');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Dependencia', tsk: 'editDependencia', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verDependencias();
            alertEdit();
        }
        ,
        error: function (error) {
            verDependencias();
            alertError();
        }
    });
}

function PreEditUbicacion(idDato) {
    $.ajax({
        url: "AdminEditUbicaciones.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verUbicaciones();
        }
    });
}

function EditarUbicacion(idDato) {
    var datos = Objeto2Json('FrmEditUbicacion');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Ubicacion', tsk: 'editUbicacion', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verUbicaciones();
            alertEdit();
        }
        ,
        error: function (error) {
            verUbicaciones();
            alertError();
        }
    });
}

function actualizarBien(idDato) {
    var datos = Objeto2Json('FrmActualizarBien');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Bien', tsk: 'editBien', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verTodosBienes();
            alertEdit();
        }
        ,
        error: function (error) {
            verTodosBienes();
            alertError();
        }
    });
}

function editarTrasCustodio(traCodigo, bnCodigo) {
    var datosP = Objeto2Json('FrmTraspPersona');
    var datosUbDp = Objeto2Json('FrmTraspCustodio');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Traspaso', tsk: 'editTraspaso', datosP:datosP, datosUbDp:datosUbDp, traCodigo: traCodigo, bnCodigo: bnCodigo},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verTodosBienes();
            alertEdit();
        }
        ,
        error: function (error) {
            verTodosBienes();
            alertError();
        }
    });
}

function editarMotivoBaja() {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                var datos = Objeto2Json('FrmMotivoBaja');
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'MotivoInforme', tsk: 'editMotivoInforme', datos: datos},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verTodosBienes();
                        alertEdit();
                    }
                    ,
                    error: function (error) {
                        verTodosBienes();
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

function PreEditCargo(idDato) {
    $.ajax({
        url: "AdminEditCargos.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verCargos();
        }
    });
}

function editarBien(codBien, codPersona, codCatalogo) {
    $.ajax({
        url: "AdminEditBien.jsp",
        type: "GET",
        data: {codBien: codBien, codPersona: codPersona, codCatalogo: codCatalogo},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verUbicaciones();
        }
    });
}

function EditarCargo(idDato) {
    var datos = Objeto2Json('FrmEditCargo');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Cargo', tsk: 'editCargo', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verCargos();
            alertEdit();
        }
        ,
        error: function (error) {
            verCargos();
            alertError();
        }
    });
}

function PreEdiTipoingreso(idDato) {
    $.ajax({
        url: "AdminEditTipoingreso.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verTipoIngreso();
        }
    });
}

function EditarTipoingreso(idDato) {
    var datos = Objeto2Json('FrmEditTipoingreso');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Tipoingreso', tsk: 'editTipoingreso', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verTipoIngreso();
            alertEdit();
        }
        ,
        error: function (error) {
            verTipoIngreso();
            alertError();
        }
    });
}

function PreEdiMotivoinforme(idDato) {
    $.ajax({
        url: "AdminEditMotivoinforme.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verMotivoInforme();
        }
    });
}

function EditarMotivoinforme(idDato) {
    var datos = Objeto2Json('FrmEditMotivoinforme');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Motivoinforme', tsk: 'editMotivoinforme', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verMotivoInforme();
            alertEdit();
        }
        ,
        error: function (error) {
            verMotivoInforme();
            alertError();
        }
    });
}

function PreEdiUsuario(idDato) {
    $.ajax({
        url: "AdminEditPersonas.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verUsuarios();
        }
    });
}

function EditarUsuario(idDato) {
    var datos = Objeto2Json('FrmEditPersona');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'Usuarios', tsk: 'editUsuarios', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verUsuarios();
            alertEdit();
        }
        ,
        error: function (error) {
            verUsuarios();
            alertError();
        }
    });
}

function FotmularioIngBien(idDato) {
    $.ajax({
        url: "AdminIngreBien.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verUbicaciones();
        }
    });
}

//function repotesBien(tipo, opc) {
//    //window.open('about:blank', 'myNewPage');
//    //windows.open("www.google.com.ec","myNewPage");
//    
//    //----var safariOp = window.open("report.jsp");
//    var $this = $(this);
//    $.ajax({
//        url: "report.jsp",
//        type: "GET",
//        //type: "POST",
//        
//        async: false, 
//        data: {tipo: tipo, opc: opc },
//        contentType: "application/json ; charset=UTF-8",
//        //success: function (datos) {
//        
//        success: function (data) {
//            //window.open(datos.url);
//            
//            window.location.href = data.redirect;
//            
////            $this.attr("href", url);
////            $this.attr("target", "_blank");
//            
//            
//            //    TerminaLoad();  
//            
//            //---safariOp.focus();
//            
//            
//            //
//            //windows.open("www.google.com.ec","myNewPage");
//            //windows.open("www.google.com.ec");
//        }
//        ,
//        error: function (error) {
//            verUbicaciones();
//        }
//    });
//}

function repotesBien(tipo, opc) {
    $.ajax({
        url: "report.jsp",
        type: "GET",
        data: {tipo: tipo, opc: opc},
        contentType: "application/json ; charset=UTF-8",
        success: function (data) {
            //window.location.href = data.redirect;
            //window.open(downloadLink.href,'_blank');
            alert("Se guardaron los datos: " + data);
        }
        ,
        error: function (error) {
            verUbicaciones();
        }
    });
}

//function editarBien(codBien,codPersona,codCatalogo) {
//    $.ajax({
//        url: "AdminEditBien.jsp",
//        type: "GET",
//        data: {codBien: codBien, codPersona: codPersona, codCatalogo: codCatalogo},
//        contentType: "application/json ; charset=UTF-8",
//        success: function (datos) {
//            $("#contenidoDinamico").html("");
//            $("#contenidoDinamico").html(datos);
//        }
//        ,
//        error: function (error) {
//            verUbicaciones();
//        }
//    });
//}

//Fase 2
function verTodosBienesMantenimientos() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBienesMantenimientoN.jsp",
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

// Mantenimiento
// Dar servicio de mantenimiento a los equipos
function DetalleMantenimiento(idMantenimiento) {
    $.ajax({
        url: "AdminDetallesMantenimiento.jsp",
        type: "GET",
        data: {idMant: idMantenimiento},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alert(error);
        }
    });
}

function DetalleAsignarTecnicoMantenimiento(idMantenimiento) {
    $.ajax({
        url: "AdminDetallesAsignarTecnico.jsp",
        type: "GET",
        data: {idMant: idMantenimiento},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alert(error);
        }
    });
}

function DetalleEntrega(idMantenimiento) {
    $.ajax({
        url: "AdminDetallesEntrega.jsp",
        type: "GET",
        data: {idMant: idMantenimiento},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            alert(error);
        }
    });
}

function verBienesEncontrados(codigo, tipo) {
    document.getElementById('modalBien').innerHTML = "";
    document.getElementById('modalBien').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarBienesBuscados.jsp",
        type: "GET",
        data: {codigo: codigo, tipo: tipo},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#modalBien").html("");
            $("#modalBien").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

function addMantenimientoN() {
    var datos = Objeto2Json('addMantenimiento');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'MantenimientoBienN', tsk: 'addMantenimiento', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verTodosBienesMantenimientos();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            verTodosBienesMantenimiento();
            alertError();
        }
    });
}

function verTodosReportes() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarHistorialMantenimiento.jsp",
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

function clicReportes() { //datNomb ; datIDPerio ; datTipoCer ; datFecha; datPerio
    var datos = Objeto2Json('buscarMantenimientoCodigo');
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "reporteMatenimientosTecnico.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    window.open(url, "", params);

}
function clicReportesSO() { //datNomb ; datIDPerio ; datTipoCer ; datFecha; datPerio
    var datos = Objeto2Json('buscarMantenimientoSO');
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "reporteMatenimientosSO.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    window.open(url, "", params);

}

function clicReportesMantBienes() { //datNomb ; datIDPerio ; datTipoCer ; datFecha; datPerio
    var datos = Objeto2Json('buscarMantenimientoBienes');
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "reporteMatenimientosBien.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    window.open(url, "", params);

}
function clicReportesMantTipo() { //datNomb ; datIDPerio ; datTipoCer ; datFecha; datPerio
    var datos = Objeto2Json('buscarMantenimientoTipo');
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "reporteMatenimientosTipo.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    window.open(url, "", params);

}


function clicReportesMantGeneral() { //datNomb ; datIDPerio ; datTipoCer ; datFecha; datPerio
    var datos = Objeto2Json('buscarMantenimientoGeneral');
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "reporteMatenimientosGeneral.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    window.open(url, "", params);

}

function clicReportesInvBienes(fomulario,tipo) { //datNomb ; datIDPerio ; datTipoCer ; datFecha; datPerio
    var datos = Objeto2Json(fomulario);
    var datosFecha = Objeto2Json('FrmRangoFecha');
    datos =  datos + "__" + datosFecha + "__" + tipo;
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "repotesInventarios.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    window.open(url, "", params);
}

function AsignarTecnicoMantenimiento(idMantenimiento) {
    var datos = Objeto2Json('FrmAsignarTecnico');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'MantenimientoBienN', tsk: 'asignarTecnicoMantenimiento', idDato: idMantenimiento, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verTodosBienesMantenimientos();
            alertEdit();
        }
        ,
        error: function (error) {
            verTodosBienesMantenimientos();
            alertError();
        }
    });
}

function DarServicioMantenimiento(idMantenimiento) {
    var datos = Objeto2Json('FrmDarServicio');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'MantenimientoBienN', tsk: 'doMantenimiento', idDato: idMantenimiento, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verTodosBienesMantenimientos();
            alertEdit();
        }
        ,
        error: function (error) {
            verTodosBienesMantenimientos();
            alertError();
        }
    });
}

function verPersonaEncontradas(codigo, tipo) {
    document.getElementById('modalPersonas').innerHTML = "";
    document.getElementById('modalPersonas').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarPersonasBuscadas.jsp",
        type: "GET",
        data: {cedula: codigo, tipo: tipo},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#modalPersonas").html("");
            $("#modalPersonas").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

function EntregarEquipoMantenimiento(idMantenimiento) {
    var datos = Objeto2Json('FrmEntrega');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'MantenimientoBienN', tsk: 'entregarMantenimiento', idDato: idMantenimiento, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verTodosBienesMantenimientos();
            alertEdit();
        }
        ,
        error: function (error) {
            verTodosBienesMantenimientos();
            alertError();
        }
    });
}

function verNivelMantenimiento() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarNivelMantenimiento.jsp",
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

function addNivelMantenimiento() {
    var datos = Objeto2Json('FrmNewDependencia');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'NivelMantenimiento', tsk: 'addNivelMantenimiento', datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            var posicion = datos.indexOf("SI");
            verNivelMantenimiento();
            if (posicion == -1)
                alertDuplicado();
            else
                alertAdd();
        },
        error: function (error) {
            verNivelMantenimiento();
            alertError();
        }
    });
}

function PreEditNivelMantenimiento(idDato) {
    $.ajax({
        url: "AdminEditNivelMantenimiento.jsp",
        type: "GET",
        data: {idDato: idDato},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            verNivelMantenimiento();
        }
    });
}

function EditarNivelMantenimiento(idDato) {
    var datos = Objeto2Json('FrmEditDependencia');
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: 'NivelMantenimiento', tsk: 'editNivelMantenimiento', idDato: idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            verNivelMantenimiento();
            alertEdit();
        }
        ,
        error: function (error) {
            verNivelMantenimiento();
            alertError();
        }
    });
}

function estNivelMantenimiento(idDato, estado) {
    alertify.confirm(
            '<center><b>Habilitar / Desabilitar.</b><center>',
            'Al continuar con este proceso usted <b>EDITARÁ</b> elestado de su dato, si usted está de acuerdo de clic en OK caso contrario en CANCEL… </br></br><b>Se auto cancelará en 20 segundos.<b>',
            function () {
                //si presiona OK
                MuestraLoad();
                $.ajax({
                    url: "controladorBienes.jsp",
                    type: "GET",
                    data: {opc: 'NivelMantenimiento', tsk: 'estNivelMantenimiento', idDato: idDato, estado: estado},
                    contentType: "application/json ; charset=UTF-8",
                    success: function (datos) {
                        verNivelMantenimiento();
                        alertEdit();
                        TerminaLoad();
                    }
                    ,
                    error: function (error) {
                        verNivelMantenimiento();
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

function AdminSupervisores() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarRoles.jsp",
        type: "GET",
        data: {tsk: 'supervisor'},
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

function AdminOperarios() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminListarRoles.jsp",
        type: "GET",
        data: {tsk: 'operario'},
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

function AddAdministrador(rol) {
    var datos = convertirObjetoJson('FrmNewTipoFlujo');
    var uscape = decodeURIComponent(datos);
    datos = "";
    datos = uscape;
    MuestraLoad();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "POST",
        data: {opc: 'Administrador', tsk: 'AddAdministrador', datos: datos, rol: rol},
        //contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            //clicSuperAdminUsuario();
            if(rol === 'supervisor')
                AdminSupervisores(); 
            else
                AdminOperarios(); 
            TerminaLoad();
            alertAdd();
        },
        error: function (error) {
            //clicSuperAdminUsuario();
            if(rol === 'supervisor')
                AdminSupervisores(); 
            else
                AdminOperarios(); 
            TerminaLoad();
            alertError();
        }
    });
}

function MostAdministrador(idFuncion) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminEditRol.jsp",
        type: "GET",
        data: {idRef: idFuncion},
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
    
function EditRol(idFuncion,rol) {
    var datos = Objeto2Json('FrmEditTipoFlujo');
    VentanaPorte();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: "Administrador", tsk:'EditAdministrador', idRef: idFuncion, rol: rol, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            if(rol === 'supervisor')
                AdminSupervisores(); 
            else
                AdminOperarios();
              alertEdit();
        }
        ,
        error: function (error) {
            if(rol === 'supervisor')
                AdminSupervisores(); 
            else
                AdminOperarios();
        }
    });
}

function ChekPermisos(idFuncion, rol) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminEditPermisos.jsp",
        type: "GET",
        data: {idRef: idFuncion, rol:rol},
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

function EditCheck(idDato) {
    var datos = Objeto2Json('FrmEditPermisos');
    var selected = '';    
        $('#FrmEditPermisos input[type=checkbox]').each(function(){
            if (this.checked) {
                selected += $(this).val()+'_';
            }
        });
    VentanaPorte();
    $.ajax({
        url: "controladorBienes.jsp",
        type: "GET",
        data: {opc: "Administrador", tsk:'EditPermisos', selected:selected, idDato : idDato, datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
//            if(rol === 'supervisor')
                AdminSupervisores(); 
//            else
//                AdminOperarios();
              alertEdit();
        }
        ,
        error: function (error) {
//            if(rol === 'supervisor')
//                AdminSupervisores(); 
//            else
                AdminOperarios();
        }
    });
}

function verTodosReportesMantenimientoPorTecnico(nombre, fechai, fechaf) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteMantenimientoPorTecnicoCsv.jsp",
        type: "GET",
        data: {nombre: nombre, fechai: fechai, fechaf: fechaf},
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

function verTodosReportesMantenimientoPorBienes(nombre, fechai, fechaf) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteMantenimientoPorBienesCsv.jsp",
        type: "GET",
        data: {nombre: nombre, fechai: fechai, fechaf: fechaf},
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

function verTodosReportesMantenimientoGeneral(fechai, fechaf) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteMantenimientoGeneralCsv.jsp",
        type: "GET",
        data: {fechai: fechai, fechaf: fechaf},
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

function verTodosReportesMantenimientoTipo(nombre, fechai, fechaf) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteMantenimientoPorTipoCsv.jsp",
        type: "GET",
        data: {nombre: nombre, fechai: fechai, fechaf: fechaf},
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

function verTodosReportesMantenimientoVersionSO(nombre, fechai, fechaf) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteMantenimientoPorVersionSOCsv.jsp",
        type: "GET",
        data: {nombre: nombre, fechai: fechai, fechaf: fechaf},
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

function verTodosReportesInvTraspaso(fechai, fechaf) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteInventarioTraspasoCsv.jsp",
        type: "GET",
        data: {fechai: fechai, fechaf: fechaf},
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

function verTodosReportesInvUbicDep(fechai, fechaf, ubicacion, dependencia) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteInventarioUbicDepCsv.jsp",
        type: "GET",
        data: {fechai: fechai, fechaf: fechaf, ubicacion: ubicacion, dependencia: dependencia},
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

function verTodosReportesInvMarca(fechai, fechaf, marca) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteInventarioMarcaCsv.jsp",
        type: "GET",
        data: {fechai: fechai, fechaf: fechaf, marca: marca},
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

function verTodosReportesInvGarantia() {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteInventarioGarantiaCsv.jsp",
        type: "GET",
        data: { },
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

function verTodosReportesInvDesactivados(fechai, fechaf) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteInventarioDesactivadoCsv.jsp",
        type: "GET",
        data: {fechai: fechai, fechaf: fechaf},
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
         
function verTodosReportesInvGeneral(bnCodigo, bnNombre, bnModelo, bnSerie, bnMarca,
                                    bnColor, bnPrecio, bnEstado, bnFechaCompra, bnFechaGarantia,
                                    bnProveedor, bnDescripcion, bnDependencia, bnUbicacion, bnCodCatalogo,
                                    bnNombreCatalogo, prCedula, prNombre, prFechaTraspaso, prEmail,
                                    prTelefono, prCargo) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "ReporteInventarioGeneralCsv.jsp",
        type: "GET",
        data: {bnCodigo: bnCodigo, bnNombre: bnNombre, bnModelo:bnModelo, bnSerie:bnSerie, bnMarca:bnMarca,
                bnColor:bnColor, bnPrecio:bnPrecio, bnEstado:bnEstado, bnFechaCompra:bnFechaCompra, bnFechaGarantia:bnFechaGarantia,
                bnProveedor:bnProveedor, bnDescripcion:bnDescripcion, bnDependencia:bnDependencia, bnUbicacion:bnUbicacion, bnCodCatalogo:bnCodCatalogo,
                bnNombreCatalogo:bnNombreCatalogo, prCedula:prCedula, prNombre:prNombre, prFechaTraspaso:prFechaTraspaso, prEmail:prEmail,
                prTelefono:prTelefono, prCargo:prCargo},
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


function bnTraspasoPersona(traCodigo, bnCodigo) {
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    VentanaPorte();
    $.ajax({
        url: "AdminEditTraspaso.jsp",
        type: "GET",
        data: {traCodigo: traCodigo, bnCodigo: bnCodigo},
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