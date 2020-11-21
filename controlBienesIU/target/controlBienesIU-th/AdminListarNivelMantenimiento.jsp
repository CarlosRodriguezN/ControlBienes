<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
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
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        ArrayList<Nivelmantenimiento> listNivelMantenimiento = new ArrayList<Nivelmantenimiento>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serNivelMantenimiento = sNivelmantenimiento.listaTodosNivelMantenimiento();

                String resultadoNivelMantenimiento = "{\"respuesta\":" + serNivelMantenimiento + "}";
                JSONObject objNivelMantenimiento = new JSONObject(resultadoNivelMantenimiento);
                JSONArray arrayNivelMantenimiento = objNivelMantenimiento.getJSONArray("respuesta");
                for (int i = 0; i < arrayNivelMantenimiento.length(); i++) {
                    JSONObject childJSONObject = arrayNivelMantenimiento.getJSONObject(i);
                    Nivelmantenimiento objMenus = new Gson().fromJson(childJSONObject.toString(), Nivelmantenimiento.class);
                    listNivelMantenimiento.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Tipo de Servicio</h2>
        <em>Tipo de Servicio registradas en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkUsuarios" data-toggle="tab">Tipo de Servicio</a></li>
                <li><a href="#blkNewDependencias" data-toggle="tab">Agregar nuevo</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkUsuarios">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Tipo de Servicio.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                        <thead>
                                            <tr>
                                                <!--<th>Numero Dependencia</th>-->
                                                <th>Descripción</th>
                                                <th>Estado</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Nivelmantenimiento oPet : listNivelMantenimiento) {
                                                    out.println("<tr>");
//                                                    out.println("<td>" + oPet.getNivelId() + "</td>");
                                                    out.println("<td>" + oPet.getNivelDescripcion() + "</td>");
                                                    if (oPet.getNivelEstado() == 1) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                    }
                                                    if (oPet.getNivelEstado() == 2) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                    }
                                                    if (oPet.getNivelEstado() == 3) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-warning'>Bloqueado</span> </td>");
                                                    }
                                            %>
                                        <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-warning" title="Editar" onclick="PreEditNivelMantenimiento(<%= oPet.getNivelId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                                <!--INICIO IF PARA ACTIVAR-->
                                                <%if (oPet.getNivelEstado() == 2) {%>
                                                <button type="button" class="btn btn-primary" title="Habilitar" onclick="estNivelMantenimiento(<%= oPet.getNivelId()%>, 1)"><i class="fa fa-check-circle" style="font-size: 17px;"></i></button>
                                                    <%}%>
                                                <!--FIN IF PARA ACTIVAR-->
                                                <!--INICIO IF PARA DESABILITAR-->
                                                <%if (oPet.getNivelEstado() == 1) {%>
                                                <button type="button" class="btn btn-primary" title="Desabilitar" onclick="estNivelMantenimiento(<%= oPet.getNivelId()%>, 2)"><i class="fa fa-times" style="font-size: 17px;"></i></button>
                                                    <%}%>
                                                <!--FIN IF PARA DESABILITAR-->
                                            </div>
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%                                                    out.println("</tr>");

                                            }%>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane" id="blkNewDependencias">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="FrmNewDependencia" >
                                    <div class="form-group col-sm-10">
                                        <label for="DepenDescrip">Descripción Tipo de Servicio</label>
                                        <input required="true" type="text" class="form-control" id="DepenDescrip" name="DepenDescrip" placeholder="Ingrese el nuevo Tipo de Servicio">
                                    </div>
                                    <div class="form-group col-sm-2">
                                        <label class="col-sm-12">Estado</label>
                                        <div class="col-sm-12">
                                            <div class="control-inline onoffswitch">
                                                <input type="checkbox" class="onoffswitch-checkbox" id="DepenEstado" name="DepenEstado" checked>
                                                <label class="onoffswitch-label" for="DepenEstado">
                                                    <span class="onoffswitch-inner"></span>
                                                    <span class="onoffswitch-switch"></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="addNivelMantenimiento()">Agregar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>