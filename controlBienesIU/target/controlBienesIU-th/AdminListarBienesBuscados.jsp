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
        ArrayList<Bien> listBien = new ArrayList<Bien>();
        String codigo = request.getParameter("codigo");
        String tipo = request.getParameter("tipo");
        Integer tipoc = Integer.parseInt(tipo);
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serBienes = "";
                if (tipoc == 0) {
                    serBienes = sBien.buscarbiencodigo(codigo);
                }
                if (tipoc == 1) {
                    serBienes = sBien.buscarbiennombre(codigo);
                }
                if (tipoc == 2) {
                    serBienes = sBien.buscarbienserie(codigo);
                }
                String resultadoBien = "{\"respuesta\":" + serBienes + "}";
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
    <script>
        $('#tb2').DataTable({
            "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]]
        });
    </script>
    <div class="tab-content">
        <div class="active tab-pane">
            <div class="row">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> Bienes.</h3> 
                    </div>
                    <div class="widget-content">
                        <div class="table-responsive">
                            <table  id="tb2" class="table table-sorting table-hover table-bordered datatable">
                                <thead>
                                    <tr>
                                        <th>Action</th>
                                        <th>Código</th>
                                        <th>Dependencia</th>
                                        <th>Ubicación</th>
                                        <th>Fecha Finalización Garantía</th>
                                        <th>Nombre</th>
                                        <th>Marca</th>
                                        <th>Modelo</th>
                                        <th>Serie</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Bien oBien : listBien) {
                                            out.println("<tr>");
                                    %>
                                    <!--INICIO BONOTES DE ACCION-->
                                <td align="center">
                                    <input class="form-check-input" type="radio" name="exampleRadios1" value="<%= oBien.getBnCodBien() + "_" + oBien.getBnNombre()%>">
                                </td> 
                                <!--FIN BONOTES DE ACCION-->

                                <%
                                        out.println("<td>" + oBien.getBnCodBien() + "</td>");
                                        out.println("<td>" + oBien.getDpId().getDpDescripcion() + "</td>");
                                        out.println("<td>" + oBien.getUbId().getUbDescripcion() + "</td>");
                                        out.println("<td>" + oBien.getBnFechaGarantia() + "</td>");
                                        out.println("<td>" + oBien.getBnNombre() + "</td>");
                                        out.println("<td>" + oBien.getBnMarca() + "</td>");
                                        out.println("<td>" + oBien.getBnModelo() + "</td>");
                                        out.println("<td>" + oBien.getBnSerie() + "</td>");
                                        out.println("</tr>");
                                    }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>