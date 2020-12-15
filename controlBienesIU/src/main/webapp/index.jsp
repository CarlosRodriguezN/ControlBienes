
<%@page import="esntidadesSeg.Funcion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="esntidadesSeg.Rol"%>
<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<%@page import="entidades.Persona"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="servicios.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<html lang="es" class="no-js">
    <head>
        <title>Control bienes | DTIC ESPOCH</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


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

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

        <link href="js/css/dtic.css" rel="stylesheet" type="text/css"/>

        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="js/jquery.loadingModal.min.js" type="text/javascript"></script>
        <link href="js/css/jquery.loadingModal.min.css" rel="stylesheet" type="text/css"/>


    </head>

    <%
        String tipoLogueo = "";
        Boolean estado = false;
        session.setAttribute("tipousuario2", "");
        session.setAttribute("TipoUser", "");
        session.setAttribute("ingreso", "false");
        String codigocas = "";
        String cedulacas = "";
        try {

            if (request.getUserPrincipal() != null) {
                AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();
                final Map attributes = principal.getAttributes();
                String[] cadena = attributes.toString().split("=");

                for (String i : cadena) {
                    if (i.contains("cedula")) {
                        session.setAttribute("existe", "true");
                        estado = true;
                    }
                }
                if (attributes != null) {
                    Iterator attributeNames = attributes.keySet().iterator();
                    if (attributeNames.hasNext()) { //Devuelve verdadero si el Iterator tiene más elementos para iterar.
                        for (; attributeNames.hasNext();) {
                            String attributeName = (String) attributeNames.next();
                            final Object attributeValue = attributes.get(attributeName);
                            if (attributeValue instanceof List) {
                                final List values = (List) attributeValue;
                            } else {
                                if (attributeName == "perid") {
                                    session.setAttribute("ingreso", "true");
                                    codigocas = attributeValue.toString();
                                    session.setAttribute("tipousuario2", "");
                                }
                                if (attributeName == "cedula") {
                                    cedulacas = attributeValue.toString();
                                }
                                if (attributeName == "clientName") {
                                    session.setAttribute("tipousuario2", attributeValue.toString());
                                }
                            }
                        }
                    } else {
                        out.println("<pre>The attribute map is empty. Review your CAS filter configurations.</pre>");
                    }
                } else {
                    out.println("<pre>The user principal is empty from the request object. Review the wrapper filter configuration.</pre>");
                }
            }
            if (estado == true) {
                if (!codigocas.equals("")) {
                    //tipo de sesion
                    if (session.getAttribute("tipousuario2").toString().isEmpty()) {
                        tipoLogueo = "Oasis";
                    } else {
                        tipoLogueo = "Institucional";
                    }
                    //
                    Integer codigo = 0;
                    codigo = Integer.parseInt(codigocas);
                    String strCedula = cedulacas;
                    String result = sPersona.listaPersonaId(codigo);
                    if (!result.isEmpty()) {//Si el codigo de a persona existe en la tabla Persona de la BD
                        JSONObject req1 = new JSONObject(result);
                        String[] nombres = req1.getString("perNombres").split(" ");
                        String nombre1 = nombres[0];
                        String nombre2 = " ";
                        try {
                            nombre2 = nombres[1];
                        } catch (Exception e) {
                            nombre2 = " ";
                        }

                        session.setAttribute("codigoPersona", req1.getInt("perId"));
                        session.setAttribute("cedulaPersona", cedulacas);
                        session.setAttribute("nombreApellidoPersona", nombre1 + " " + req1.getString("perApellido1"));
                    }
                    if (result.isEmpty()) {

                        session.setAttribute("ingreso", "false");

    %>
    <script type="text/javascript">
        location.href = "usuarioDenegado.jsp";
    </script>
    <%        }

    } else {

    %>
    <script type="text/javascript">
        location.href = "redirError.jsp";
        //cambiar comprobantes
    </script>

    <%                    }
    } else {
    %>
    <script type="text/javascript">
        location.href = "redirNuevaCuenta.jsp";
        //cambiar comprobantes
    </script>

    <%
        }

    } catch (Exception e) {
    %>
    <script type="text/javascript">
        location.href = "redirError.jsp";
        //cambiar comprobantes
    </script>

    <%
        } finally {

        }
    %>
    <link href="assets/css/skins/dticUser.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <%
        String rolIng  = null;
    %>
    <body class="sidebar-fixed topnav-fixed dashboard" onMouseOver="hayActividad();" onload="rolUSER(<%=rolIng%>)">
        <div id="codCas" name="codCas" ><div style="display:none;"><% out.println(codigocas);%></div></div>
        <div id="Logeo" name="Logeo" ><div style="display:none;"><% out.println(tipoLogueo); %></div></div>

        <!-- WRAPPER -->
        <div id="wrapper" class="wrapper">
            <!-- TOP BAR -->
            <div class="top-bar navbar-fixed-top">
                <div class="container">
                    <div class="clearfix">
                        <!-- logo -->
                        <div class="pull-left left logo">
                            <a href="index.jsp"><img src="assets/img/logbien.png"/></a>
                        </div>
                        <!-- end logo -->
                        <div class="pull-right right">
                            <!-- search box -->
                            <!--<div class="searchbox">
                                    <div id="tour-searchbox" class="input-group">
                                    <input type="search" class="form-control" placeholder="Ingrese su busqueda...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
                                    </span>
                                    </div>
                                </div>-->
                            <!-- end search box -->
                            <!-- top-bar-right -->
                            <div class="top-bar-right">

                                <!-- logged user and the menu -->
                                <div class="logged-user">
                                    <div id="btnUser" class="btn-group">
                                        <a  class="btn btn-link dropdown-toggle" data-toggle="dropdown" >
                                            <img src="assets/img/user-avatar.png" alt="User Avatar" />
                                            <%
                                                if (session.getAttribute("ingreso").toString().equals("true")) {
                                                    out.println("<span class='name'>" + session.getAttribute("nombreApellidoPersona").toString() + " </span><span class='caret'></span>");
                                                }
                                            %>

                                        </a>
                                        <ul class="dropdown-menu" role="menu" >
<!--                                            <li>
                                                <a onclick="rolUSER();" style='cursor: pointer'>
                                                    <i class="fa fa-user"></i>
                                                    <span class="text">MI PERFIL</span>
                                                </a>
                                            </li>-->


                                            <%
                                                int cont=0;
                                                if (session.getAttribute("ingreso").toString().equals("true")) {
                                                    String resSeguridad = sSeguridad.listarRoles(Integer.parseInt(codigocas), "CONTROL DE BIENES INFORMATICOS");
                                                    if (!resSeguridad.isEmpty()) {
                                                        if (!resSeguridad.equals("{\"strError\":\"\"}")) {
                                                            JSONObject objJSON112 = new JSONObject(resSeguridad);
                                                            ArrayList<Funcion> listafunciones12 = new ArrayList<Funcion>();
                                                            if (objJSON112.getString("strError").isEmpty()) {
                                                                JSONArray arrayJSON1 = objJSON112.getJSONArray("objLista");
                                                                if (arrayJSON1.length() == 0) {
                                                                }
                                                                String respuesta = "{\"respuesta\":" + arrayJSON1.toString() + "}";
                                                                JSONObject objJSONrespuesta1 = new JSONObject(respuesta);
                                                                JSONArray arrayJSONrespuesta1 = objJSONrespuesta1.getJSONArray("respuesta");
                                                                String nomFunc = "";
                                                                for (int i = 0; i < arrayJSONrespuesta1.length(); i++) {
                                                                    JSONObject childJSONObject = arrayJSONrespuesta1.getJSONObject(i);
                                                                    Funcion objMenus = new Gson().fromJson(childJSONObject.toString(), Funcion.class);
                                                                    listafunciones12.add(objMenus);
                                                                    if (listafunciones12.get(i).getBlnactivo() == true) {
                                                                        nomFunc = listafunciones12.get(i).getIntrolId().getStrnombre().replace("CB ", "");
                                                                        session.setAttribute("Rol" + i, nomFunc);
                                                                        if(cont  == 0){
                                                                            rolIng = nomFunc;
                                                                            cont++;
                                                                        }    
                                                                        out.print("<li ><a onclick='rol" + nomFunc + "();' style='cursor: pointer'<i class='fa fa-circle-o'></i><span class='text'>&nbsp;" + nomFunc + "</span></a></li>");
                                                                    }
                                                                }
                                                            } else {
                                                                out.print("Error al consumir el servicio");
                                                            }
                                                            cont = 0;
//                                                            for (int i = 0; i < listafunciones12.size(); i++) {
//
//                                                                if (listafunciones12.get(i).getIntrolId().getStrnombre().equals("CB ADMINISTRADOR")) {
//                                                                    session.setAttribute("Rol1", "Administra");
//                                                                    out.print("<li ><a onclick='rolAdmin();' style='cursor: pointer'<i class='fa fa-cog'></i><span class='text'>&nbsp;ADMINISTRADOR</span></a></li>");
//                                                                }
//
//                                                                if (listafunciones12.get(i).getIntrolId().getStrnombre().equals("CB SUPERVISOR")) {
//                                                                    session.setAttribute("Rol2", "Supervisa");
//                                                                    out.print("<li ><a onclick='rolSuperv();' style='cursor: pointer'<i class='fa fa-cog'></i><span class='text'>&nbsp;SUPERVISOR</span></a></li>");
//                                                                }
//
//                                                                if (listafunciones12.get(i).getIntrolId().getStrnombre().equals("CB OPERARIO")) {
//                                                                    session.setAttribute("Rol3", "Operario");
//                                                                    out.print("<li ><a onclick='rolOpera();' style='cursor: pointer'<i class='fa fa-cog'></i><span class='text'>&nbsp;OPERARIO</span></a></li>");
//                                                                }
//
//                                                            }
                                                        }
                                                    }
                                                }

                                            %>


                                            <li>
                                                <a onclick="Matar();" style='cursor: pointer' >
                                                    <i class="fa fa-power-off"></i>
                                                    <span class="text">SALIR</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- end logged user and the menu -->
                            </div>
                            <!-- end top-bar-right -->
                        </div>
                    </div>
                </div>
                <!-- /container -->
            </div>
            <!-- END TOP BAR -->
            <!-- LEFT SIDEBAR -->
            <div id="left-sidebar" class="left-sidebar scroll_vertical">

                <!--AQUI SE CARGA EL MENU DEL USUARIO-->

            </div>
            <!-- END LEFT SIDEBAR -->
            <!-- MAIN CONTENT WRAPPER -->
            <div id="main-content-wrapper" class="content-wrapper">
                <div id="alert-dtic">
                </div>
                <div class="row">
                    <div class="col-lg-12 ">
                        <ul id='divSeguimiento' class="breadcrumb">
                            <li><i class="fa fa-home"></i><a href="index.jsp">Inicio</a></li>
                        </ul>
                    </div>
                </div>
                <!-- main -->
                <div id='contenidoDinamico' class="content">
                    <div class="main-header">
                        <h2>Control de bienes</h2>
                        <em>Control de bienes institucionales</em>
                    </div>
                    <div id='contenidoInferior' class="main-content">
                        <p class="lead">Estimado(a) compañero (a), politécnico, a través del aplicativo usted podrá verificar sus bienes informáticos institucionales.</p>
                        </br>
                        <img src="assets/img/bienes.png" class="img-responsive center-block" alt="Normal Sidebar">
                        <div class="bottom-30px"></div>
                    </div>

                </div>
                <!-- /main -->
                <!-- FOOTER -->
                <footer class="footer">
                    <div> <a href="http://dtic.espoch.edu.ec/" target="_blank" style="color:#FFF;"> <img width="45" height="15" src="assets/img/dtic.png" > Escuela Superior Politécnica de Chimborazo © 2019</a></div>
                </footer>
                <!-- END FOOTER -->
            </div>

            <!-- END CONTENT WRAPPER -->
        </div>
        <!-- END WRAPPER -->
        <!-- Javascript -->
        <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
        <script src="assets/js/bootstrap/bootstrap.js"></script>
        <script src="assets/js/plugins/modernizr/modernizr.js"></script>
        <!--<script src="assets/js/plugins/bootstrap-tour/bootstrap-tour.custom.js"></script>-->
        <script src="assets/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/king-common.js"></script>
        <script src="assets/js/plugins/stat/jquery.easypiechart.min.js"></script>
        <script src="assets/js/plugins/raphael/raphael-2.1.0.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.resize.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.time.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.pie.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.tooltip.min.js"></script>
        <script src="assets/js/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
        <!--        <script src="assets/js/plugins/datatable/jquery.dataTables.min.js"></script>
                <script src="assets/js/plugins/datatable/dataTables.bootstrap.js"></script>-->
        <script src="assets/js/plugins/jquery-mapael/jquery.mapael.js"></script>
        <script src="assets/js/plugins/raphael/maps/usa_states.js"></script>
        <!--        <script src="assets/js/king-chart-stat.js"></script>
                <script src="assets/js/king-table.js"></script>
                <script src="assets/js/king-components.js"></script>-->


        <script src="assets/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
        <script src="assets/js/plugins/jqgrid/i18n/grid.locale-en.js"></script>
        <script src="assets/js/plugins/jqgrid/jquery.jqGrid.fluid.js"></script>
        <script src="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>

        <!-- Bladd -->
        <script src="js/validacion.js"></script>
        <script src="js/validaTiempo.js"></script>
        <script src="js/dtic.js"></script>
        <script src="js/controlBienes.js"></script>
        <script src="js/funciones.comunes.js"></script>

        <!--para que funcione alertyfy-->
        <script src="alertify/alertify.js" type="text/javascript"></script>
        <link href="alertify/css/alertify.css" crossorigin="anonymous" rel="stylesheet" />
        <link href="alertify/css/themes/semantic.css" rel="stylesheet" >

    </body>

</html>
