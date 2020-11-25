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
    <!--<script src="assets/js/king-table.js"></script>-->
    <script src="js/jquery.loadingModal.min.js" type="text/javascript"></script>
    <link href="js/css/jquery.loadingModal.min.css" rel="stylesheet" type="text/css"/>



    <%
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String nombre = request.getParameter("nombre");
        String fechai = request.getParameter("fechai");
        String fechaf = request.getParameter("fechaf");
        ArrayList<Mantenimientos> listMantenimiento = new ArrayList<Mantenimientos>();
        ArrayList<Traspaso> listTraspaso = new ArrayList<Traspaso>();

        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {

                String serMantenimiento = sMantenimientoN.BuscarMantenimientoBienesFechas(nombre, fechai, fechaf);
                String resultadoMantenimiento = "{\"respuesta\":" + serMantenimiento + "}";
                JSONObject objMantenimiento = new JSONObject(resultadoMantenimiento);
                JSONArray arrayMantenimiento = objMantenimiento.getJSONArray("respuesta");
                for (int i = 0; i < arrayMantenimiento.length(); i++) {
                    JSONObject childJSONObject = arrayMantenimiento.getJSONObject(i);
                    Mantenimientos objMenus = new Gson().fromJson(childJSONObject.toString(), Mantenimientos.class);
                    listMantenimiento.add(objMenus);
                }
                String serTraspaso = sTraspaso.listaTodosTraspaso();
                String resultadoTraspaso = "{\"respuesta\":" + serTraspaso + "}";
                JSONObject objTraspaso = new JSONObject(resultadoTraspaso);
                JSONArray arrayTraspaso = objTraspaso.getJSONArray("respuesta");
                for (int i = 0; i < arrayTraspaso.length(); i++) {
                    JSONObject childJSONObject = arrayTraspaso.getJSONObject(i);
                    Traspaso objMenus = new Gson().fromJson(childJSONObject.toString(), Traspaso.class);
                    listTraspaso.add(objMenus);
                }
            } else {
                System.out.println("primero -----------------");
                response.sendRedirect("index.jsp");
            }
        } else {
            System.out.println("segundo -----------------");
            response.sendRedirect("index.jsp");
        }
    %>
    <script>
        $(document).ready(function () {
            $('#tablacsv').DataTable({
                "lengthMenu": [[-1, 5, 10, 20], ["All", 5, 10, 20]]
            });
        });

        function exportToCsv(nombreArchivo, filas) {
            var processRow = function (row) {
                var valorFinal = "";
                for (var j = 0; j < row.length; j++) {
                    var valorInner = row[j] === null ? "" : row[j].toString();
                    if (row[j] instanceof Date) {
                        valorInner = row[j].toLocaleString();
                    }
                    ;
                    var result = valorInner.replace(/"/g, '""');
                    if (result.search(/("|,|\n)/g) >= 0)
                        result = '"' + result + '"';
                    if (j > 0)
                        valorFinal += ',';
                    valorFinal += result;
                }
                return valorFinal + '\n';
            };
            var archivoCsv = '';
            for (var i = 0; i < filas.length; i++) {
                archivoCsv += processRow(filas[i]);
            }
            var blob = new Blob([archivoCsv], {type: 'text/csv;charset=utf-8;'});
            if (navigator.msSaveBlob) { // IE 10+
                navigator.msSaveBlob(blob, nombreArchivo);
            } else {
                var link = document.createElement("a");
                if (link.download !== undefined) {
                    // Navegadores que soportan el atributo de descarga de HTML5
                    var url = URL.createObjectURL(blob);
                    link.setAttribute("href", url);
                    link.setAttribute("download", nombreArchivo);
                    link.style.visibility = 'hidden';
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                }
            }
        }
        /* Esta función extrae el contenido de las celdas y crea un
         * objeto Array con ella, para luego enviárselas a
         * 'exportToCsv'.
         */
        function exportarACSV() {
            arreglo = Array()
            table = document.getElementById('tablacsv')
            for (var i = 0; i < table.rows.length; i++) {
                afilas = Array()
                nceldas = table.rows[i].getElementsByTagName("th")
                for (var j = 0; j < nceldas.length; j++) {
                    afilas.push(nceldas[j].innerHTML)
                }
                nceldas = table.rows[i].getElementsByTagName("td")
                for (var j = 0; j < nceldas.length; j++) {
                    afilas.push(nceldas[j].innerHTML)
                }
                arreglo.push(afilas)
            }
            resp = exportToCsv("ReporteMantenimientoPorBienes.csv", arreglo)
        }
//Asignamos una manejador del evento click al botón html:
        document.getElementById('exportar').addEventListener('click', exportarACSV, false);
    </script>
    <div class="main-header">
        <h2>Mantenimientos</h2>
        <em>Mantenimientos registrados en el sistema.</em>
    </div>
    <div class="main-content">
        <div class="tab-content">
            <div class="row">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> Mantenimientos Por Bienes.</h3> 
                    </div>
                    <div class="widget-content">
                        <div class="table-responsive">
                            <table id="tablacsv" class="table table-sorting table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>Número Orden</th>
                                        <th>Cod. Bien</th>
                                        <th>Nombre Bien</th>
                                        <th>Serie Bien</th>
                                        <th>Modelo Bien</th>
                                        <th>Marca Bien</th>
                                        <th>Ubicación</th>
                                        <th>Tipo de Servicio</th>
                                        <th>Tipo de Mantenimiento</th>
                                        <th>Problema</th>
                                        <th>Solución</th>
                                        <th>Técnico Ingreso</th>
                                        <th>Técnico Asignado</th>
                                        <th>Custodio</th>
                                        <th>Fecha Revisión</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Mantenimientos oPet : listMantenimiento) {
                                            for (Traspaso elem : listTraspaso) {
                                                if (oPet.getBienId().equals(elem.getBnCodBien())) {
                                                    out.println("<tr>");
                                                    out.println("<td>" + oPet.getMantNumOrden() + "</td>");
                                                    out.println("<td>" + oPet.getBienId().getBnCodBien() + "</td>");
                                                    out.println("<td>" + oPet.getBienId().getBnNombre() + "</td>");
                                                    out.println("<td>" + oPet.getBienId().getBnSerie() + "</td>");
                                                    out.println("<td>" + oPet.getBienId().getBnModelo() + "</td>");
                                                    out.println("<td>" + oPet.getBienId().getBnMarca() + "</td>");
                                                    out.println("<td>" + oPet.getNivelmId().getNivelDescripcion() + "</td>");
                                                    out.println("<td>" + oPet.getTipId().getTipDetalle() + "</td>");
                                                    out.println("<td>" + oPet.getBienId().getUbId().getUbDescripcion() + "</td>");
                                                    out.println("<td>" + oPet.getMantDescProblema() + "</td>");
                                                    out.println("<td>" + oPet.getMantDescSolucion() + "</td>");
                                                    out.println("<td>" + oPet.getMantTecnIngreso() + "</td>");
                                                    out.println("<td>" + oPet.getMantTecnRevision() + "</td>");
                                                    out.println("<td>" + elem.getPerId().getPerNombres() + " " + elem.getPerId().getPerApellido1() + " " + elem.getPerId().getPerApellido2() + "</td>");
                                                    out.println("<td>" + oPet.getMantFechaRevision() + "</td>");
                                                }
                                            }
                                        }%>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div align="center">
                    <input class='btn btn-primary' type="button" class="exportar" value="Exportar CSV" id="exportar">
                </div>
            </div>

        </div>

</html>