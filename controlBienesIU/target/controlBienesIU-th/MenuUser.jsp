<link href="assets/css/skins/dticUser.css" rel="stylesheet" type="text/css"/>
<!-- Javascript -->
<script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
<script src="assets/js/king-common.js"></script>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<div class="sidebar-minified js-toggle-minified">
    <i class="fa fa-exchange"></i>
</div>
<div class="sidebar-scroll">
    <nav class="main-nav">
        <ul class="main-menu">
<!--            <li style='cursor: pointer' title="Mis datos">
                <a onclick="clicUserCertif()" >
                    <i class="fa fa-handshake-o"></i><span class="text">Mis datos</span>
                </a>
            </li>-->
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
    </nav>
</div>