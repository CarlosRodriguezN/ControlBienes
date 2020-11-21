
function confirmarCierre() {
    var cerrar = setTimeout(cerrarSesion,0);//3 minutos para dar aceptar 
    alertify.confirm(
        '<b>Cierre de Sesión</b>',
        'Su sesión expirará pronto, por favor presione OK para mantenerla activa o Cancel para terminarla.', 
        function(){
            //si presiona OK
            clearTimeout(cerrar); //elimino el tiempo a la funcion cerrarSesion
            clearTimeout(temp); //elimino el tiempo a la funcion confirmarCierre
            temp = setTimeout(confirmarCierre, 1.08e+6); //y aca le doy un nuevo tiempo a la funcion confirmarCierre
            alertify.success('Su sesión ha sido prolongada');
        },
            function () {
            
            cerrarSesion(); //si presiono Cancel, pues ejecuta la funcion cerrarSesion y posteriormente la cierra.
        }
    ).autoCancel(0).set('oncancel', function () {
        cerrarSesion();
        
    });
    ;
}

function cerrarSesion() {
    window.location = "redireccion.jsp";
}

// se llamará a la función que confirmar Cierre después de 18 minutos
var temp = setTimeout(confirmarCierre, 1.08e+6);

// hacemos que al pulsar en los botones de Alertify no se propaguen los eventos
$("body").on("click", ".ajs-button", function(e) {
  e.stopPropagation();
});

function hayActividad(){
    clearTimeout(temp);
    // y volver a iniciarlo con 18 minutoss
    temp = setTimeout(confirmarCierre,1.08e+6);
}
