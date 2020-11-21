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
        ArrayList<Informe> listInforme = new ArrayList<Informe>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serInforme = sInforme.listaTodosInforme();

                //Lista de idiomas de la persona seleccionada
                String resultadoInforme = "{\"respuesta\":" + serInforme + "}";
                JSONObject objInforme = new JSONObject(resultadoInforme);
                JSONArray arrayInforme = objInforme.getJSONArray("respuesta");
                for (int i = 0; i < arrayInforme.length(); i++) {
                    JSONObject childJSONObject = arrayInforme.getJSONObject(i);
                    Informe objMenus = new Gson().fromJson(childJSONObject.toString(), Informe.class);
                    listInforme.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Informe</h2>
        <em>Informes registradas en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkInforme" data-toggle="tab">Informe</a></li>
                <li><a href="#blkNewInformes" data-toggle="tab">Agregar nuevo</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkInforme">
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
                                                <th>Numero Informe</th>
                                                <th>Fecha de elaboración</th>
                                                <th>Solicitante</th>
                                                <th>Tecnico</th>
                                                <th>Codigo del bien</th>
                                                <th>Motivo Informe</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Informe oPet : listInforme) {

                                                    String[] MuestraFechElabora = oPet.getInfFechaElabora().replace("/Date(", "").split("T");

                                                    String Solicitante = sPersona.listaPersonaId(oPet.getInfSolicitanteId());
                                                    JSONObject reqSolicitante = new JSONObject(Solicitante);
                                                    String Tecnico = sPersona.listaPersonaId(oPet.getInfTecnicoId());
                                                    JSONObject reqTecnico = new JSONObject(Tecnico);

                                                    out.println("<tr>");
                                                    out.println("<td>" + oPet.getInfId() + "</td>");
                                                    out.println("<td>" + MuestraFechElabora[0] + "</td>");
                                                    out.println("<td>" + reqSolicitante.getString("perNombres") + " " + reqSolicitante.getString("perApellido1") + " " + reqSolicitante.getString("perApellido2") + "</td>");
                                                    out.println("<td>" + reqTecnico.getString("perNombres") + " " + reqTecnico.getString("perApellido1") + " " + reqTecnico.getString("perApellido2") + "</td>");
                                                    out.println("<td>" + oPet.getBnCodBien().getBnCodBien() + "</td>");
                                                    out.println("<td>" + oPet.getMotId().getMotDetalle() + "</td>");

                                            %>
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-success" title="Activar"onclick=""><i class="fa fa-check-circle" style="font-size: 17px;"></i></button>
                                                <button type="button" class="btn btn-warning" title="Editar" onclick=""><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                                <button type="button" class="btn btn-danger" title="Desactivar" onclick=""><i class="fa fa-times" style="font-size: 17px;"></i></button>
                                            </div>
                                        </td>

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
                <div class="tab-pane" id="blkNewInformes">
                    <div class="row">
                        <form role="form" id="FrmIngInforme">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>