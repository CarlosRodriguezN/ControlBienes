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
            <li id="menu1"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-list-ol"></i><span class="text">Listar bienes</span>
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
            </li>
        </ul>
    </nav>
</div>
