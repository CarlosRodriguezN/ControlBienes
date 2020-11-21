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
        ArrayList<Cargo> listCargo = new ArrayList<Cargo>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serCargo = sCargo.listaTodosCargo();

                //Lista de idiomas de la persona seleccionada
                String resultadoCargo = "{\"respuesta\":" + serCargo + "}";
                JSONObject objCargo = new JSONObject(resultadoCargo);
                JSONArray arrayCargo = objCargo.getJSONArray("respuesta");
                for (int i = 0; i < arrayCargo.length(); i++) {
                    JSONObject childJSONObject = arrayCargo.getJSONObject(i);
                    Cargo objMenus = new Gson().fromJson(childJSONObject.toString(), Cargo.class);
                    listCargo.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Cargos</h2>
        <em>Cargos registradas en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkCargos" data-toggle="tab">Cargos</a></li>
                <li><a href="#blkNewCargos" data-toggle="tab">Agregar nuevo</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkCargos">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Cargo.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                        <thead>
                                            <tr>
                                                <th>Numero Cargo</th>
                                                <th>Detalle cargo</th>
                                                <th>Estado</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Cargo oPet : listCargo) {

                                                    out.println("<tr>");
                                                    out.println("<td>" + oPet.getCarId() + "</td>");
                                                    out.println("<td>" + oPet.getCarDescripcion() + "</td>");

                                                    if (oPet.getCarEstado() == 1) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-success'>Activo</span> </td>");
                                                    }
                                                    if (oPet.getCarEstado() == 2) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-danger'>Bloqueado</span> </td>");
                                                    }
                                                    if (oPet.getCarEstado() == 3) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-warning'>Eliminado</span> </td>");
                                                    }


                                            %>
                                        <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-warning" title="Editar" onclick="PreEditCargo(<%= oPet.getCarId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                                <!--INICIO IF PARA ACTIVAR-->
                                                <%if (oPet.getCarEstado()== 2) {%>
                                                <button type="button" class="btn btn-primary" title="Habilitar" onclick="estCargo(<%= oPet.getCarId()%>, 1)"><i class="fa fa-check-circle" style="font-size: 17px;"></i></button>
                                                    <%}%>
                                                <!--FIN IF PARA ACTIVAR-->
                                                <!--INICIO IF PARA DESABILITAR-->
                                                <%if (oPet.getCarEstado() == 1) {%>
                                                <button type="button" class="btn btn-primary" title="Desabilitar" onclick="estCargo(<%= oPet.getCarId()%>, 2)"><i class="fa fa-times" style="font-size: 17px;"></i></button>
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
                <div class="tab-pane" id="blkNewCargos">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="addCargo" >
                                    <div class="form-group col-sm-10">
                                        <label for="CargoDescrip">Descripción del Cargo </label>
                                        <input required="true" type="text" class="form-control" id="CargoDescrip" name="CargoDescrip" placeholder="Ingrese el nuev cargo">
                                    </div>
                                    <div class="form-group col-sm-2">
                                        <label class="col-sm-12">Estado</label>
                                        <div class="col-sm-12">
                                            <div class="control-inline onoffswitch">
                                                <input type="checkbox" class="onoffswitch-checkbox" id="CargoEstado" name="CargoEstado" checked>
                                                <label class="onoffswitch-label" for="CargoEstado">
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
                            <button  type='button' class='btn btn-primary' onclick="addCargo()">Agregar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>