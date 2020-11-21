<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="servicios.WSCentralizada"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <base href="index.jsp">
        <meta name="description" content="Certificaion al Desempeño Docente, DEAC - ESPOCH." />
        
        <title>Usuario no autorizado | DEAC</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
        <script src="assets/js/bootstrap/bootstrap.js"></script>

        <!-- CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/main.css" rel="stylesheet" type="text/css">
        <link href="assets/css/my-custom-styles.css" rel="stylesheet" type="text/css">
        <!--[if lte IE 9]>
                <link href="assets/css/main-ie.css" rel="stylesheet" type="text/css"/>
                <link href="assets/css/main-ie-part2.css" rel="stylesheet" type="text/css"/>
        <![endif]-->

        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/kingadmin-favicon144x144.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/kingadmin-favicon114x114.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/kingadmin-favicon72x72.png">
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="assets/ico/kingadmin-favicon57x57.png">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">

        <script src="js/validacion.js" type="text/javascript"></script>

        <link href="js/css/server.css" rel="stylesheet" type="text/css"/>
        
        <link href="assets/css/skins/darkblue.css" rel="stylesheet" type="text/css"/>


        <script type="text/javascript">
            var timeLimit = 0.3; //tiempo en minutos 9
            var conteo = new Date(timeLimit * 60000);
            function inicializar() {
                document.getElementById('cuenta').childNodes[0].nodeValue =
                        conteo.getMinutes() + ":" + conteo.getSeconds();
            }
            function cuenta() {
                intervaloRegresivo = setInterval("regresiva()", 1000);
            }
            function regresiva() {
                if (conteo.getTime() > 0) {
                    conteo.setTime(conteo.getTime() - 1000);
                } else {
                    clearInterval(intervaloRegresivo);
                    Matar();
                }
                if (conteo.getMinutes() > 1) {
                    document.getElementById('cuenta').childNodes[0].nodeValue =
                            "Su sesión se cerrará automaticamente en " + conteo.getMinutes() + " minutos ";
                } else {
                    document.getElementById('cuenta').childNodes[0].nodeValue =
                            "Su sesión se cerrará automaticamente en 1 minuto ";
                }

            }
            onload = inicializar;
        </script>

    </head>
    <%
        String tipoLogueo = "";
        if (session.getAttribute("tipousuario2").toString().isEmpty()) {
            tipoLogueo = "Oasis";
        } else {
            tipoLogueo = "Institucional";
        }
    %>

    <body onload="cuenta()">

        <div class="container">
            <div class="col-sm-12" align="center">
                <div class="inner-page">
                    <div class="col-sm-2" align="rigth"></div>
                    <div class="col-sm-2" align="rigth">
                        </br>
                        <div class="grid">
                            <span class="server"></span>
                            <span class="server"></span>
                            <span class="server"></span>
                            <span class="server"></span>
                            <span class="server"></span>

                        </div>
                    </div>
                    <div class="col-sm-6" align="left">
                        <img src="assets/img/users.png">
                    </div>
                    <div class="col-sm-2" align="rigth"></div>
                    <div class="col-sm-12"  align="center">
                        <FONT SIZE=7> &nbsp; Oops!</FONT>
                        <h1 style='color: #378df5;'>
                            NO TIENE AUTORIZACIÓN O NO SE ENCUENTRA EN NUESTA BASE DE DATOS
                        </h1><br/>
                        <p>Si esta teniendo problemas contáctese con el administrador, <a style='color: #BD4A4A;cursor: pointer' onclick="Matar();"> <b>cierre su sesion ahora</b></a> tenemos incovenientes con sus permisos.</p>
                        <h2><div id="cuenta">&nbsp;</div> </h2>
                    </div>
                </div>
            </div>

            <div class='col-md-12' id="Logeo" name="Logeo" ><div style="display:none;"><% out.println(tipoLogueo);%></div></div>
        </div>
        
        <footer class="footer">
            <div> <a href="http://dtic.espoch.edu.ec/" target="_blank" style="color:#FFF;"> <img width="45" height="15" src="assets/img/dtic.png" > Escuela Superior Politécnica de Chimborazo © 2019</a></div>
        </footer>
        <!-- jQuery 3 -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="js/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <!-- Bootstrap 3.3.7 -->
        <script src="js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="js/adminlte.min.js"></script>
        <!-- Bladd -->
        <script src="dtic/validacion.js"></script>
        <script src="dtic/validaTiempo.js"></script>

        <script type="text/javascript">
        document.getElementById('tris').addEventListener('click', function () {
            Matar();
        }, false);
        triste();
        setInterval(triste, 2000);
        //setInterval(Matar, 540000); // se auto ejecuta en 9 minutos
        </script>
        
        <script src="js/bloqueo.js"></script>


    </body>
</html>


