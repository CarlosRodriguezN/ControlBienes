<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="esntidadesSeg.Funcion"%>
<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>

    <link href="assets/css/skins/fulldark.css" rel="stylesheet" type="text/css"/>
    <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
    <!-- Tablas -->
    <script src="assets/js/plugins/datatable/jquery.dataTables.min.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.colVis.bootstrap.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.colReorder.min.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.tableTools.min.js"></script>
    <script src="assets/js/plugins/datatable/dataTables.bootstrap.js"></script>
    <script src="assets/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
    <script src="assets/js/plugins/jqgrid/i18n/grid.locale-en.js"></script>
    <script src="assets/js/plugins/jqgrid/jquery.jqGrid.fluid.js"></script>
    <script src="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="assets/js/king-table.js"></script>
      <script src="js/jquery.loadingModal.min.js" type="text/javascript"></script>
    <link href="js/css/jquery.loadingModal.min.css" rel="stylesheet" type="text/css"/>


    <%
        String tsk = request.getParameter("tsk");
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        ArrayList<Funcion> listTipoflujo = new ArrayList<Funcion>();
        if (session.getAttribute("ingreso").toString().equals("true")) {

            String resultadoTipoflujo =  sSeguridad.listarRolesPersonas();
            JSONObject objTipoCer = new JSONObject(resultadoTipoflujo);
            JSONArray arrayTipoCer = objTipoCer.getJSONArray("objLista");
            for (int i = 0; i < arrayTipoCer.length(); i++) {
                JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                Funcion objMenus = new Gson().fromJson(childJSONObject.toString(), Funcion.class);
                listTipoflujo.add(objMenus);
                //int opc = childJSONObject.;
            }

        } else {
            response.sendRedirect("index.jsp");
        }

    %>
    <div class="main-header">
        <%
       if(tsk.equals("operario"))
       {
       %>
            <h2>Administrador del sistema de Control de Bienes Informaticos</h2>
            <em>Lista de Operarios</em>
       <%
       }
       if(tsk.equals("supervisor"))
       {
       %>
            <h2>Administrador del sistema de Control de Bienes Informaticos</h2>
            <em>Lista de Supervisores</em>
       <%
       }
       if(tsk.equals("administrador"))
       {
       %>
            <h2>Administrador del sistema de Control de Bienes Informaticos</h2>
            <em>Lista de Administradores</em>
       <%
       }
       %>
    </div>
    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkTipoCer" data-toggle="tab">Administrador del Sistema de Control de Bienes</a></li>
                <li><a href="#blkAddTipoCer" data-toggle="tab">Agregar nuevo</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkTipoCer">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                   <%
                                   if(tsk.equals("operario"))
                                   {
                                   %>
                                        <h3><i class="fa fa-table"></i> Operarios del Sistema de Control de Bienes.</h3> 
                                   <%
                                   }
                                   if(tsk.equals("supervisor"))
                                   {
                                   %>
                                        <h3><i class="fa fa-table"></i> Supervisores del Sistema de Control de Bienes.</h3> 
                                   <%
                                   }
                                   if(tsk.equals("administrador"))
                                   {
                                   %>
                                        <h3><i class="fa fa-table"></i> Coordinnadores del Sistema de Control de Bienes.</h3> 
                                   <%
                                   }
                                   %>
                            </div>
                            <div class="widget-content">
                              <div class="table-responsive">
                                <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">

                                    <thead>
                                        <tr>
                                            <th>Número</th>
                                            <th>Cédula</th>
                                            <th>Nombre</th>
                                            <th>Descripción</th>
                                            <th>Estado</th>
                                            <th>Editar</th>
                                            <%
                                            if(!tsk.equals("administrador"))
                                            {
                                            %>
                                            <th>Permisos</th>
                                            <%
                                            }
                                            %>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% Integer cont = 0;
                                            for (Funcion oPet : listTipoflujo) {
                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB SUPERVISOR"))&& tsk.equals("supervisor"))
                                                {
                                                cont++;
                                                out.println("<tr id=" + oPet.getIntid() + ">");
                                                out.println("<td>" + cont + "</td>");
                                                out.println("<td>" + oPet.getUsuId().getUsuCedula()+ "</td>");
                                                out.println("<td>" + oPet.getUsuId().getUsuNombre() + "</td>");
                                                out.println("<td>" + oPet.getIntrolId().getStrnombre() + "</td>");
                                                if (oPet.getBlnactivo() == true) {
                                                    out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                }
                                                if (oPet.getBlnactivo() == false) {
                                                    out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                }
                                                out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getIntid() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsuId().getUsuId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");
                                                out.println("</tr>");
                                                }
                                                
                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB OPERARIO"))&& tsk.equals("operario"))
                                                {
                                                cont++;
                                                out.println("<tr id=" + oPet.getIntid() + ">");
                                                out.println("<td>" + cont + "</td>");
                                                out.println("<td>" + oPet.getUsuId().getUsuCedula()+ "</td>");
                                                out.println("<td>" + oPet.getUsuId().getUsuNombre() + "</td>");
                                                out.println("<td>" + oPet.getIntrolId().getStrnombre() + "</td>");
                                                if (oPet.getBlnactivo() == true) {
                                                    out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                }
                                                if (oPet.getBlnactivo() == false) {
                                                    out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                }
                                                out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getIntid() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsuId().getUsuId() + ", \"operario\");' class='fa fa-check-circle' style='font-size: 17px;' title='Permisos' ></i></td>");
                                                out.println("</tr>");
                                                }
                                                
                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& tsk.equals("administrador"))
                                                {
                                                cont++;
                                                out.println("<tr id=" + oPet.getIntid() + ">");
                                                out.println("<td>" + cont + "</td>");
                                                out.println("<td>" + oPet.getUsuId().getUsuCedula()+ "</td>");
                                                out.println("<td>" + oPet.getUsuId().getUsuNombre() + "</td>");
                                                out.println("<td>" + oPet.getIntrolId().getStrnombre() + "</td>");
                                                if (oPet.getBlnactivo() == true) {
                                                    out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                }
                                                if (oPet.getBlnactivo() == false) {
                                                    out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                }
                                                out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getIntid() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                //out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsuId().getUsuId() + ", \"operario\");' class='fa fa-check-circle' style='font-size: 17px;' title='Permisos' ></i></td>");
                                                out.println("</tr>");
                                                }
                                            }%>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="tab-pane" id="blkAddTipoCer">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">
                                    <form role="form" id="FrmNewTipoFlujo">
                                        <div class="form-group col-sm-4">
                                            <label for="numero">Número de Documento</label>
                                            <input required="true" type="text" class="form-control" id="numero" name="numero" placeholder="Ingrese el número de documento">
                                        </div>
                                       
                                    </form>
                                </div>
                            </div>
                            <div class="col-sm-12" align='right'>
                                <%
                                if(tsk.equals("operario"))
                                {
                                %>
                                <button  type='button' class='btn btn-primary' onclick="AddAdministrador('operario')">Agregar Operario a CB</button>
                                <%
                                }
                                if(tsk.equals("supervisor"))
                                {
                                %>
                                <button  type='button' class='btn btn-primary' onclick="AddAdministrador('supervisor')">Agregar Supervisor a CB</button>
                                <%
                                }
                                if(tsk.equals("administrador"))
                                {
                                %>
                                <button  type='button' class='btn btn-primary' onclick="AddAdministrador('administrador')">Agregar Administrador a CB</button>
                                <%
                                }
                                %>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
                               
</html>