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
        String TipoDeBusqueda ="";
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        String tipoBusqueda = request.getParameter("tipoBusqueda");
        String datos = request.getParameter("datos");
        JSONObject req = new JSONObject(datos);

        ArrayList<Bien> listBien = new ArrayList<Bien>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {

                String resultadoBien = "";
                if (tipoBusqueda.equals("DependenciaId")) {
                    resultadoBien = "{\"respuesta\":" + sBien.BienDependenciaId(req.getInt("DependenciaId")) + "}";
                    TipoDeBusqueda = "Por dependencia";
                }
                if (tipoBusqueda.equals("UbicacionId")) {
                    resultadoBien = "{\"respuesta\":" + sBien.BienUbicacionId(req.getInt("UbicacionId")) + "}";
                    TipoDeBusqueda = "Por ubicación";
                }
                if (tipoBusqueda.equals("BajaId")) {
                    resultadoBien = "{\"respuesta\":" + sBien.BienBajaId(req.getInt("BajaId")) + "}";
                    TipoDeBusqueda = "Por tipo de baja";
                }

                JSONObject objBien = new JSONObject(resultadoBien);
                JSONArray arrayBien = objBien.getJSONArray("respuesta");
                for (int i = 0; i < arrayBien.length(); i++) {
                    JSONObject childJSONObject = arrayBien.getJSONObject(i);
                    Bien objMenus = new Gson().fromJson(childJSONObject.toString(), Bien.class);
                    listBien.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Bienes</h2>
        <em><% out.println(TipoDeBusqueda);%></em>
        
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkUsuarios" data-toggle="tab">Bienes</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkUsuarios">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> <% out.println(TipoDeBusqueda);%></h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                        <thead>
                                            <tr>
                                                <th>Codigo Bien</th>
                                                <th>Nombre del Bien</th>
                                                <th>Dependencia</th>
                                                <th>Ubicación</th>
                                                <th>Tipo baja</th>

                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Bien oPet : listBien) {
                                                    out.println("<tr>");

                                                    out.println("<td>" + oPet.getBnCodBien() + "</td>");
                                                    out.println("<td>" + oPet.getBnNombre() + "</td>");
                                                    out.println("<td>" + oPet.getDpId().getDpDescripcion() + "</td>");
                                                    out.println("<td>" + oPet.getUbId().getUbDescripcion() + "</td>");
                                                    out.println("<td>" + oPet.getBaId().getBaDetalle() + "</td>");


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

            </div>
        </div>
    </div>
</html>