<%@page import="com.google.gson.Gson"%>
<%@page import="esntidadesSeg.Funcion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Personapermiso"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.sPermisoPersona"%>
<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<link href="assets/css/skins/fulldark.css" rel="stylesheet" type="text/css"/>

<script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
<script src="assets/js/king-common.js"></script>
<%@page contentType='text/html' pageEncoding='UTF-8'%>

<%
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        String rol1,rol2,rol3;
  
        try{
            rol1 = session.getAttribute("Rol0").toString();
        }catch(Exception e)
        {
            rol1 = "";
        }
        try{
            rol2 = session.getAttribute("Rol1").toString();
        }catch(Exception e)
        {
            rol2 = "";
        }
        try{
            rol3 = session.getAttribute("Rol2").toString();
        }catch(Exception e)
        {
            rol3 = "";
        }
        //Pemisos Pesona
        ArrayList<Personapermiso> cadPerPm = new ArrayList<Personapermiso>();  
        String listPerPm = sPermisoPersona.listaPermisoPersonaPorCodPersona(Integer.parseInt(UsuLinea));
        String resultadoaccion = "{\"respuesta\":" + listPerPm + "}";
        JSONObject objJSONrespuesta1 = new JSONObject(resultadoaccion);
        JSONArray arrayJSONrespuesta1 = objJSONrespuesta1.getJSONArray("respuesta");
        for (int i = 0; i < arrayJSONrespuesta1.length(); i++) {
            JSONObject childJSONObject = arrayJSONrespuesta1.getJSONObject(i);
            Personapermiso objPerPm = new Gson().fromJson(childJSONObject.toString(), Personapermiso.class);
            cadPerPm.add(objPerPm);
        }
       
        
%>
<%!
        public Boolean getPermisos(ArrayList<Personapermiso> cadPerPm, String codPer)
        {
            Boolean bandera = false;
            for (Personapermiso oPerPm: cadPerPm) {
                if(oPerPm.getPmId().getPmCodigo().equals(codPer) && oPerPm.getPerpmEstado())
                {
                    bandera = true;
                }
            }
            return bandera; 
        }
%>
<div class="sidebar-minified js-toggle-minified">
    <i class="fa fa-exchange"></i>

</div>
<div class="sidebar-scroll">
    <nav class="main-nav">
        <ul class="main-menu">
            <!--<li id="menu1"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-list-ol"></i><span class="text">Administrar roles</span>
                    <i id="ico1" class="toggle-icon fa fa-angle-left"></i></a>
                <ul id="submenu1" class="sub-menu ">
                    <li style='cursor: pointer'>
                        <a onclick="clicMosAdmins();">
                            <i class="fa fa-filter"></i><span class="text">Administrador</span>
                        </a>
                    </li>
                </ul>
            </li>-->
            
            <li id="menu1"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-file-text-o"></i><span class="text">CSV</span>
                    <i id="ico11" class="toggle-icon fa fa-angle-left"></i></a>
                <ul id="submenu1" class="sub-menu ">
                    <%if(getPermisos(cadPerPm ,"POP_CSV")){%>
                        <li style='cursor: pointer' title="Mis datos">
                            <a onclick="importaCSV()" >
                                <i class="fa fa-handshake-o"></i><span class="text">Importar CSV</span>
                            </a>
                        </li>
                    <%}%>
                    <li style='cursor: pointer' title="Mis datos">
                        <a onclick="ImportadosTemporal()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Importaciones Temporales</span>
                        </a>
                    </li>
                    <li style='cursor: pointer' title="Mis datos">
                        <a onclick="ImportadosCsvDB()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Importaciones DB</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li id="menu2"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-file-text-o"></i><span class="text">BIENES</span>
                    <i id="ico12" class="toggle-icon fa fa-angle-left"></i></a>
                <ul id="submenu2" class="sub-menu ">
                    
                    <%if(getPermisos(cadPerPm ,"POP_INGBIEN")){%>
                        <li style='cursor: pointer' title="Ingreso manual del bien">
                            <a onclick="PreAddBien()" >
                                <i class="fa fa-handshake-o"></i><span class="text">Ingreso Manual</span>
                            </a>
                        </li>
                    <%}%> 
                    <li style='cursor: pointer' title="Todos los bienes">
                        <a onclick="verTodosBienes()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Todos los bienes</span>
                        </a>
                    </li>
                    <li style='cursor: pointer' title="Por estado">
                        <a onclick="PreBienesBusqueda()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Por Tipo</span>
                        </a>
                    </li>
                    
<!--                    <li style='cursor: pointer' title="Por estado">
                        <a onclick="PreBusquedaPorPersona()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Por persona</span>
                        </a>
                    </li>-->
                    <li style='cursor: pointer' title="Reportes">
                        <a onclick="ReportesBien()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Reportes</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li style='cursor: pointer' title="Mis datos">
                <a onclick="verUsuarios()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Usuarios</span>
                </a>
            </li>

            <li style='cursor: pointer' title="Dependencias">
                <a onclick="verDependencias()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Dependencias</span>
                </a>
            </li>

            <li style='cursor: pointer' title="Ubicaciones">
                <a onclick="verUbicaciones()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Ubicaciones</span>
                </a>
            </li>

            <li style='cursor: pointer' title="Tipos de Ingresos">
                <a onclick="verTipoIngreso()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Tipos de Ingresos</span>
                </a>
            </li>

            <li style='cursor: pointer' title="Tipos de bajas">
                <a onclick="verBaja()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Motivo bajas</span>
                </a>
            </li>



<!--            <li style='cursor: pointer' title="Informes">
                <a onclick="verInformes()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Informes</span>
                </a>
            </li>-->

            <li style='cursor: pointer' title="Motivo de Informes">
                <a onclick="verMotivoInforme()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Motivo de Informes</span>
                </a>
            </li>

            <li style='cursor: pointer' title="Cargos">
                <a onclick="verCargos()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Cargos</span>
                </a>
            </li>
       <!------------ Fase 2 Cecilio ------------>
       
            <li id="menu3"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-file-text-o"></i><span class="text">MANTENIMIENTO</span>
                    <i id="ico13" class="toggle-icon fa fa-angle-left"></i></a>
                <ul id="submenu3" class="sub-menu ">
                    <li style='cursor: pointer' title="Bienes en Mantenimiento">
                        <a onclick="verTodosBienesMantenimientos()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Bienes en Mantenimiento</span>
                                </a>
                    </li>
                    <li style='cursor: pointer' title="Bienes en Mantenimiento">
                        <a onclick="verNivelMantenimiento()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Tipo de Servicio</span>
                        </a>
                    </li>
                    <li style='cursor: pointer' title="Reportes">
                        <a onclick="verTodosReportes()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Reportes</span>
                        </a>
                    </li>
                </ul>
            </li>
        <!---------------------------------------->
        <!---------------------------------------->
        
            
           
        </ul>
    </nav>
</div>
