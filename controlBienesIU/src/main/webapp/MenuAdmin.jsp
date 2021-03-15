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
    String strOpc = request.getParameter("idUser");
%>
<div class="sidebar-minified js-toggle-minified">
    <i class="fa fa-exchange"></i>
</div>
<div class="sidebar-scroll">
    <nav class="main-nav">
        <ul class="main-menu">
            <li id="menu0"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-list-ol"></i><span class="text">Administrar Roles</span>
                    <i id="ico1" class="toggle-icon fa fa-angle-left"></i></a>
                <ul id="submenu0" class="sub-menu ">
                    <li style='cursor: pointer'>
                        <a onclick="AdminAdministradores();">
                            <i class="fa fa-filter"></i><span class="text">Administradores</span>
                        </a>
                    </li>
                    <li style='cursor: pointer'>
                        <a onclick="AdminSupervisores();">
                            <i class="fa fa-filter"></i><span class="text">Supervisores</span>
                        </a>
                    </li>
                    <li style='cursor: pointer'>
                        <a onclick="AdminOperarios();">
                            <i class="fa fa-filter"></i><span class="text">Operarios</span>
                        </a>
                    </li>
                </ul>
            </li>
            
            <li style='cursor: pointer' title="Auditoria">
                <a onclick="verAuditoria()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Auditoria</span>
                </a>
            </li>
            
            <li id="menu1"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-file-text-o"></i><span class="text">CSV</span>
                    <i id="ico11" class="toggle-icon fa fa-angle-left"></i></a>
                <ul id="submenu1" class="sub-menu ">
                    <li style='cursor: pointer' title="Mis datos">
                        <a onclick="importaCSV()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Importar CSV</span>
                        </a>
                    </li>
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
                    <li style='cursor: pointer' title="Ingreso manual del bien">
                        <a onclick="PreAddBien()" >
                            <i class="fa fa-handshake-o"></i><span class="text">Ingreso Manual</span>
                        </a>
                    </li>
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
              <!-- <li id="menu1"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-list-ol"></i><span class="text">Listar bienes</span>
                        <i id="ico1" class="toggle-icon fa fa-angle-left"></i></a>
                    <ul id="submenu1" class="sub-menu ">
                        <li style='cursor: pointer'>
                            <a onclick="AdminListCertif();">
                                <i class="fa fa-filter"></i><span class="text">Bienes generales</span>
                            </a>
                        </li>
                        <li style='cursor: pointer'>
                            <a onclick="AdminListCertifPDF();">
                                <i class="fa fa-filter"></i><span class="text">Bienes por períodos</span>
                            </a>
                        </li>

                    </ul>
                </li>

                <li id="menu2"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-file-text-o"></i><span class="text">Reportes</span>
                        <i id="ico12" class="toggle-icon fa fa-angle-left"></i></a>
                    <ul id="submenu2" class="sub-menu ">
                        <li style='cursor: pointer'>
                            <a onclick="ReporCertiPeriodo();">
                                <i class="fa fa-server"></i><span class="text">Descargas por períodos</span>
                            </a>
                        </li>

                    </ul>
                </li>

                <li style='cursor: pointer'>
                    <a onclick="AdmAsignaCertif(<%= strOpc%>)">
                        <i class="fa fa-certificate"></i><span class="text">Asignar bienes</span>
                    </a>
                </li>
                <li style='cursor: pointer'>
                    <a onclick="clicPeriodo(<%= strOpc%>)">
                        <i class="fa fa-line-chart"></i><span class="text">Periodos</span>
                    </a>
                </li>
                <li style='cursor: pointer'>
                    <a onclick="clicTipoCer(<%= strOpc%>)">
                        <i class="fa fa-institution"></i><span class="text">Tipos de bienes</span>
                    </a>
                </li>
                <li style='cursor: pointer'>
                    <a onclick="clicPersona(<%= strOpc%>)">
                        <i class="fa fa-users"></i><span class="text">Docentes</span>
                    </a>
                </li>-->
        </ul>
    </nav>
</div>
