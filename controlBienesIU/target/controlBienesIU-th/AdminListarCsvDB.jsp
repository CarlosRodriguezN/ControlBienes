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
        ArrayList<Csv> listCsv = new ArrayList<Csv>();

        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serCertificados = sCsv.listaTodosCSV();

                //Lista de csv
                String resultadoCertifi = "{\"respuesta\":" + serCertificados + "}";
                JSONObject objCsv = new JSONObject(resultadoCertifi);
                JSONArray arrayCsv = objCsv.getJSONArray("respuesta");
                for (int i = 0; i < arrayCsv.length(); i++) {
                    JSONObject childJSONObject = arrayCsv.getJSONObject(i);
                    Csv objMenus = new Gson().fromJson(childJSONObject.toString(), Csv.class);
                    listCsv.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Detalle de Importación mediante DSV </h2>
        <em>registro de las importaciones realizadas</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkCertificados" data-toggle="tab">Detalles</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkCertificados">
                    <div class="row">

                        <!-- SCROLLING DATA TABLE -->
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Detalle de importaciones generales</h3>
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-striped table-hover datatable" style="font-size:12px;">
                                        <thead>
                                            <tr>
                                                <th>CodBien</th>
                                                <th>Nombre</th>
                                                <th>Serie</th>
                                                <th>Modelo</th>
                                                <th>Marca</th>                                                    
                                                <th>Color</th>
                                                <th>Dependencia</th>
                                                <th>Ubicacion</th>
                                                <th>CedulaRuc</th>
                                                <th>Cargo</th>
                                                <th>TipoIngreso</th>
                                                <th>Precio</th>
                                                <th>EstadoBien</th>
                                                <th>FechaCompra</th>
                                                <th>TiempoGarantia</th>
                                                <th>Proveedor</th>
                                                <th>Descripcion</th>
                                                <th>RamTamano</th>
                                                <th>RamTecno</th>
                                                <th>Disco</th>
                                                <th>Red</th>
                                                <th>Procesador</th>
                                                <th>LectorDvd</th>
                                                <th>So</th>
                                                <th>MonitorTecn</th>
                                                <th>MonitorTama</th>
                                                <th>ModeToner</th>
                                                <th>NumFusor</th>
                                                <th>CantToner</th>
                                                <th>TecnProyector</th>
                                                <th>Lumenes</th>
                                                <th>TipoLampara</th>
                                                <th>Resolucion</th>
                                                <th>FechaSubida</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (Csv oPet : listCsv) {

                                                    out.println("<tr>");
                                                    out.println("<td>" + oPet.getCsvCodBien() + "</td>");
                                                    out.println("<td>" + oPet.getCsvNombre() + "</td>");
                                                    out.println("<td>" + oPet.getCsvSerie() + "</td>");
                                                    out.println("<td>" + oPet.getCsvModelo() + "</td>");
                                                    out.println("<td>" + oPet.getCsvMarca() + "</td>");
                                                    out.println("<td>" + oPet.getCsvColor() + "</td>");
                                                    out.println("<td>" + oPet.getCsvDependencia() + "</td>");
                                                    out.println("<td>" + oPet.getCsvUbicacion() + "</td>");
                                                    out.println("<td>" + oPet.getCsvCedulaRuc() + "</td>");
                                                    out.println("<td>" + oPet.getCsvCargoUsuario() + "</td>");
                                                    out.println("<td>" + oPet.getCsvTipoIngreso() + "</td>");
                                                    out.println("<td>" + oPet.getCsvPrecio() + "</td>");
                                                    out.println("<td>" + oPet.getCsvEstadoBien() + "</td>");
                                                    out.println("<td>" + oPet.getCsvFechaCompra() + "</td>");
                                                    out.println("<td>" + oPet.getCsvTiempoGarantia() + "</td>");
                                                    out.println("<td>" + oPet.getCsvProveedor() + "</td>");
                                                    out.println("<td>" + oPet.getCsvDescripcion() + "</td>");
                                                    out.println("<td>" + oPet.getCsvRamTamano() + "</td>");
                                                    out.println("<td>" + oPet.getCsvRamTecno() + "</td>");
                                                    out.println("<td>" + oPet.getCsvCantDisco() + "</td>");
                                                    out.println("<td>" + oPet.getCsvRed() + "</td>");
                                                    out.println("<td>" + oPet.getCsvProcesador() + "</td>");
                                                    out.println("<td>" + oPet.getCsvLectorDvd() + "</td>");
                                                    out.println("<td>" + oPet.getCsvSistemaOperativo() + "</td>");
                                                    out.println("<td>" + oPet.getCsvMonitorTecn() + "</td>");
                                                    out.println("<td>" + oPet.getCsvMonitorTama() + "</td>");
                                                    out.println("<td>" + oPet.getCsvModeToner() + "</td>");
                                                    out.println("<td>" + oPet.getCsvNumFusor() + "</td>");
                                                    out.println("<td>" + oPet.getCsvCantToner() + "</td>");
                                                    out.println("<td>" + oPet.getCsvTecnProyector() + "</td>");
                                                    out.println("<td>" + oPet.getCsvLumenes() + "</td>");
                                                    out.println("<td>" + oPet.getCsvTipoLampara() + "</td>");
                                                    out.println("<td>" + oPet.getCsvResolucion() + "</td>");
                                                    out.println("<td>" + oPet.getCsvFechaSubida() + "</td>");

                                            %><td>&nbsp;&nbsp;<i style='cursor: pointer' onclick='clicCSVdetalle();' class='fa fa-eye' title='Aceptar' ></i> </td>

                                        <%                                            out.println("</tr>");
                                            }%>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                        </div>
                        <!-- END SCROLLING DATA TABLE -->


                    </div>
                </div>
            </div>
        </div>
    </div>
</html>