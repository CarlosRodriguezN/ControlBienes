<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Base64"%>
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
        String fechai = request.getParameter("fechai");
        String fechaf = request.getParameter("fechaf");
        
        session.setAttribute("fechai", fechai);
        session.setAttribute("fechaf", fechaf);

        ArrayList<Auditoria> listAuditoria = new ArrayList<Auditoria>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serAuditoria = sAuditoria.listaAuditoriaPorFecha(fechai, fechaf);
                String resultadoAuditoria = "{\"respuesta\":" + serAuditoria + "}";
                JSONObject objAuditoria = new JSONObject(resultadoAuditoria);
                JSONArray arrayAuditoria = objAuditoria.getJSONArray("respuesta");
                for (int i = 0; i < arrayAuditoria.length(); i++) {
                    JSONObject childJSONObject = arrayAuditoria.getJSONObject(i);
                    Auditoria objMenus = new Gson().fromJson(childJSONObject.toString(), Auditoria.class);
                    listAuditoria.add(objMenus);
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
            resp = exportToCsv("ReporteInventarioAudiSistema.csv", arreglo)
        }
//Asignamos una manejador del evento click al botón html:
        document.getElementById('exportar').addEventListener('click', exportarACSV, false);
    </script>
    <div class="main-header">
        <h2>Auditorias</h2>
        <em> Auditorias registrados en el sistema.</em>
    </div>
    <div class="main-content">
        <div class="tab-content">
            <div class="row">
                <%if(listAuditoria.size() > 20){%>
                    <div align="center">
                        <button  type='button' class='btn btn-danger' onclick="ReportesBien()">Cancelar</button>
                        <input class='btn btn-primary' type="button" class="exportar" value="Exportar CSV" id="exportar">
                    </div>
                <%}%>
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> Auditorias del Sistemas.</h3> 
                    </div>
                    <div class="widget-content">
                        <div class="table-responsive">
                            <table id="tablacsv" class="table table-sorting table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>Código Auditoria</th>
                                        <th>Detalle</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Responsable</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Auditoria oPet : listAuditoria) {
//                                        if(!oPet.getAudMetodo().equals("UPDATE_TRASPASO"))
//                                        {
                                            out.println("<tr>");
                                            out.println("<td>" + oPet.getAudId()+ "</td>");
                                            out.println("<td>" + oPet.getAudDetalle() + "</td>");
                                                String[] parts = oPet.getAudFecha().split(" ");
                                            
                                            out.println("<td>" + parts[0] + "</td>");
                                            out.println("<td>" + parts[1] + "</td>");
                                            
                                                
                                                Persona objPersona = new Persona();
                                                JSONObject reqPersona = new JSONObject(sPersona.listaPersonaId(Integer.parseInt(oPet.getUsuId())));
                                                objPersona = new Gson().fromJson(reqPersona.toString(), Persona.class);
                            
                                            out.println("<td>" + objPersona.getPerNombres() + " " + objPersona.getPerApellido1() + " " + objPersona.getPerApellido2() + "</td>");
                                            out.println("</tr>");
//                                        }    
                                    }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div align="center">
                    <button  type='button' class='btn btn-danger' onclick="ReportesBien()">Cancelar</button>
                    <input class='btn btn-primary' type="button" class="exportar" value="Exportar CSV" id="exportar">
                </div>
            </div>

        </div>

</html>

