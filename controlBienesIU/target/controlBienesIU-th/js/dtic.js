$(document).ready(function () {
    if ($(window).width() < 992) {
        $('.left-sidebar').addClass('minified');
        $('.content-wrapper').addClass('expanded');
    }
});

function abrecierra() {
    if (!$('.left-sidebar').hasClass('left-sidebar')) {
        $('.left-sidebar').addClass('sidebar-float-active');
    }
    if (!$('.left-sidebar').hasClass('left-sidebar sidebar-float-active')) {
        $('.left-sidebar').removeClass('sidebar-float-active');
    }
}

function VentanaPorte() {
    if ($(window).width() < 992) {
        // sirve para los menus, se debe colocar el numero de menus que existan para hacerlo pequeño verificar en dtic.css y king-common.js
        for (var i = 1; i < 50; i++) {
            $('#menu' + i).removeClass('active');
            $('#submenu' + i).css("display", "none");
            $('#ico1' + i).removeClass("fa fa-angle-down");
            $('#ico1' + i).addClass("fa fa-angle-left");
        }
        $('.left-sidebar').addClass('minified');
        $('.content-wrapper').addClass('expanded');
        $('#left-sidebar').removeClass("scroll_vertical"); 
    } else {


    }
}

function CerrarMenu() {
    for (var i = 1; i < 10; i++) {
        $('#menu' + i).removeClass('active');
        $('#submenu' + i).css("display", "none");
        $('#ico' + i).removeClass("fa fa-angle-down");
        $('#ico' + i).addClass("fa fa-angle-left");
    }
}

function MuestraLoad() {
    $('body').loadingModal({text: 'No cierre el navegador, estamos trabajando en ello....'});
    $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'black');
    var delay = function (ms) {
        return new Promise(function (r) {
            setTimeout(r, ms);
        })
    };
    var time = 2500;
    delay(time)
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red').loadingModal('text', 'Tomará un poco de tiempo, por favor espere....');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'black');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red').loadingModal('text', 'Puede ir por un café mientras terminamos el trabajo....');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'black').loadingModal('text', 'Su información la estamos procesando....');
                ;
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'red');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'green');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'blue');
                return delay(time);
            })
            .then(function () {
                $('body').loadingModal('animation', 'cubeGrid').loadingModal('backgroundColor', 'gray');
                return delay(time);
            })

}

function TerminaLoad() {
    $('body').loadingModal('hide');
    $('body').loadingModal('destroy');
}

function Objeto2Json(idFrm) {
    var result = JSON.stringify($('#' + idFrm).serializeArray());
    result = result.replace("[", "");
    result = result.replace("]", "");
    result = result.replace(/},{/g, ",");
    result = result.replace(/"name":/g, "");
    result = result.replace(/,"value"/g, "");
    return result;
}

function convertirObjetoJson(idFrm) {

    var result = JSON.stringify($('#' + idFrm).serialize());
    var uscape = "";

    result = result.replace(/&/gi, '","');
    result = result.replace(/=/gi, '":"');

    result = '{'.concat(result);
    result = result.concat('}');

    uscape = unescape(result);
    result = uscape;

    var obj = JSON.parse(result);

    for (var propiedad in obj) {
        if (propiedad.substring(0, 3) == 'str') {
            obj[propiedad] = decodeURI(obj[propiedad]);
        }
        if (propiedad.substring(0, 3) == 'int') {
            obj[propiedad] = parseInt(obj[propiedad]);
        }
        if (propiedad.substring(0, 2) == 'dt') {
            obj[propiedad] = toSQLDate(obj[propiedad]);
        }
    }
    return JSON.stringify(obj);
}

//    Convertir la fecha a formato DateSQL 
function toSQLDate(fechaInput) {
    var fechaFormato = new Date(fechaInput + 'T12:00-0500');
    var fecha = fechaFormato.toDateString().substr(4, 11);
    fecha = fecha.replace('' + fechaFormato.getDate(), '' + (fechaFormato.getDate()) + ',');
    fecha = fecha.replace(fecha.substr(0, 3), traducirMes(fecha.substr(0, 3)));
    return fecha;
}

//    Traducir meses de Ingles a Español
function traducirMes(mes) {
    var traducido = '';
    switch (mes) {
        case 'Jan':
            traducido = 'ene';
            break;
        case 'Feb':
            traducido = 'feb';
            break;
        case 'Mar':
            traducido = 'mar';
            break;
        case 'Apr':
            traducido = 'abr';
            break;
        case 'May':
            traducido = 'may';
            break;
        case 'Jun':
            traducido = 'jun';
            break;
        case 'Jul':
            traducido = 'jul';
            break;
        case 'Aug':
            traducido = 'ago';
            break;
        case 'Sep':
            traducido = 'sep';
            break;
        case 'Oct':
            traducido = 'oct';
            break;
        case 'Nov':
            traducido = 'nov';
            break;
        case 'Dec':
            traducido = 'dic';
            break;
    }
    return traducido;
}

// Recoge un parametro de la URL segun su nombre 
// @name: Nombre del parametro a recoger 
function getURLParameter(name) {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [, ""])[1].replace(/\+/g, '%20')) || null;
}

// Cambia un parametro de la URL 
// @param: Nombre del parametro a cambiar 
// @value: Valor nuevo asignado para el parametro 
function changeUrlParam(param, value) {
    var currentURL = window.location.href + '&';
    var change = new RegExp('(' + param + ')=(.*)&', 'g');
    var newURL = currentURL.replace(change, '$1=' + value + '&');

    if (getURLParameter(param) !== null) {
        try {
            window.history.replaceState('', '', newURL.slice(0, -1));
        } catch (e) {
            console.log(e);
        }
    } else {
        var currURL = window.location.href;
        if (currURL.indexOf("?") !== -1) {
            window.history.replaceState('', '', currentURL.slice(0, -1) + '&' + param + '=' + value);
        } else {
            window.history.replaceState('', '', currentURL.slice(0, -1) + '?' + param + '=' + value);
        }
    }
}
// Funciones para las alertas del Salchichon
function alertAdd() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha ingresado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}
function listarcorrecto() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha ingresado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertEdit() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha editado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertDel() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> Se ha eliminado correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertPasar() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Perfecto!</strong> El bien ha dejado el mantenimiento correctamente.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertError() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong> Ha ocurrido un error.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertErrorBusqueda(mensaje) {
    $('#alertdtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong>"+ mensaje +"</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertErrorValidacion(mensaje) {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong>"+ mensaje +"</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertDuplicado() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-danger' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong> No se ha podido ingresar, el dato ya se encuentra en la DB.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}

function alertCancel() {
    $('#alert-dtic').html("<div id='alerta' class='alert alert-info' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Ups!</strong> Acción cancelada por el usuario.</div>");
    $("#alerta").fadeTo(2500, 50).slideUp(500, function () {
        $(this).remove();
    });
}