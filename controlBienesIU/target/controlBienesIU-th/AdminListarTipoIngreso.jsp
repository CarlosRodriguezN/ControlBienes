<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
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
        ArrayList<Tipoingreso> listTipoingreso = new ArrayList<Tipoingreso>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serTipoingreso = sTipoIngreso.listaTodosTipoingreso();

                //Lista de idiomas de la persona seleccionada
                String resultadoTipoingreso = "{\"respuesta\":" + serTipoingreso + "}";
                JSONObject objTipoingreso = new JSONObject(resultadoTipoingreso);
                JSONArray arrayTipoingreso = objTipoingreso.getJSONArray("respuesta");
                for (int i = 0; i < arrayTipoingreso.length(); i++) {
                    JSONObject childJSONObject = arrayTipoingreso.getJSONObject(i);
                    Tipoingreso objMenus = new Gson().fromJson(childJSONObject.toString(), Tipoingreso.class);
                    listTipoingreso.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Tipos de ingresos</h2>
        <em>Tipos de ingresos registradas en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkTipoingreso" data-toggle="tab">Tipos de ingresos</a></li>
                <li><a href="#blkNewTipoingresos" data-toggle="tab">Agregar nuevo</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkTipoingreso">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i></h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                        <thead>
                                            <tr>
                                                <th>Numero Tipo Ingreso</th>
                                                <th>Detalle Tipo Ingreso</th>
                                                <th>Estado</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Tipoingreso oPet : listTipoingreso) {

                                                    out.println("<tr>");
                                                    out.println("<td>" + oPet.getTiId() + "</td>");
                                                    out.println("<td>" + oPet.getTiDetalle()+ "</td>");

                                                    if (oPet.getTiEstado() == 1) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-success'>Activo</span> </td>");
                                                    }
                                                    if (oPet.getTiEstado() == 2) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-danger'>Bloqueado</span> </td>");
                                                    }
                                                    if (oPet.getTiEstado() == 3) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-warning'>Eliminado</span> </td>");
                                                    }


                                            %>
                                        <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-warning" title="Editar" onclick="PreEdiTipoingreso(<%= oPet.getTiId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                                <!--INICIO IF PARA ACTIVAR-->
                                                <%if (oPet.getTiEstado() == 2) {%>
                                                <button type="button" class="btn btn-primary" title="Habilitar" onclick="estTipoingreso(<%= oPet.getTiId()%>, 1)"><i class="fa fa-check-circle" style="font-size: 17px;"></i></button>
                                                    <%}%>
                                                <!--FIN IF PARA ACTIVAR-->
                                                <!--INICIO IF PARA DESABILITAR-->
                                                <%if (oPet.getTiEstado() == 1) {%>
                                                <button type="button" class="btn btn-primary" title="Desabilitar" onclick="estTipoingreso(<%= oPet.getTiId()%>, 2)"><i class="fa fa-times" style="font-size: 17px;"></i></button>
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
                <div class="tab-pane" id="blkNewTipoingresos">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="addTipoingreso" >
                                    <div class="form-group col-sm-10">
                                        <label for="TipoingresoDescrip">Descripción del  Tipo de ingreso </label>
                                        <input required="true" type="text" class="form-control" id="TipoingresoDescrip" name="TipoingresoDescrip" placeholder="Ingrese el nuevo tipo de ingreso">
                                    </div>
                                    <div class="form-group col-sm-2">
                                        <label class="col-sm-12">Estado</label>
                                        <div class="col-sm-12">
                                            <div class="control-inline onoffswitch">
                                                <input type="checkbox" class="onoffswitch-checkbox" id="TipoingresoEstado" name="TipoingresoEstado" checked>
                                                <label class="onoffswitch-label" for="TipoingresoEstado">
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
                            <button  type='button' class='btn btn-primary' onclick="addTipoingreso()">Agregar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>