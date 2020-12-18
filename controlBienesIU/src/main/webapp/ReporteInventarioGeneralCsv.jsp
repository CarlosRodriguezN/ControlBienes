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
        String bnCodigo = request.getParameter("bnCodigo");
        String bnNombre= request.getParameter("bnNombre");
        String bnModelo = request.getParameter("bnModelo");
        String bnSerie = request.getParameter("bnSerie");
        String bnMarca = request.getParameter("bnMarca");
        String bnColor = request.getParameter("bnColor");
        String bnPrecio = request.getParameter("bnPrecio");;
        String bnEstado = request.getParameter("bnEstado");
        String bnFechaCompra = request.getParameter("bnFechaCompra");
        String bnFechaGarantia = request.getParameter("bnFechaGarantia");
        String bnProveedor = request.getParameter("bnProveedor");
        String bnDescripcion = request.getParameter("bnDescripcion");
        String bnDependencia = request.getParameter("bnDependencia");
        String bnUbicacion = request.getParameter("bnUbicacion");
        String bnCodCatalogo = request.getParameter("bnCodCatalogo");
        String bnNombreCatalogo = request.getParameter("bnNombreCatalogo");
        String prCedula = request.getParameter("prCedula");
        String prNombre = request.getParameter("prNombre");
        String prFechaTraspaso = request.getParameter("prFechaTraspaso");
        String prEmail = request.getParameter("prEmail");
        String prTelefono = request.getParameter("prTelefono");
        String prCargo = request.getParameter("prCargo");
       

        ArrayList<Traspaso> listTraspaso = new ArrayList<Traspaso>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
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
            resp = exportToCsv("ReporteInventarioPersonalizado.csv", arreglo)
        }
//Asignamos una manejador del evento click al botón html:
        document.getElementById('exportar').addEventListener('click', exportarACSV, false);
    </script>
    <div class="main-header">
        <h2>Bienes</h2>
        <em>Bienes registrados en el sistema.</em>
    </div>
    <div class="main-content">
        <div class="tab-content">
            <div class="row">
                <%if(listTraspaso.size() > 20){%>
                    <div align="center">
                        <input class='btn btn-primary' type="button" class="exportar" value="Exportar CSV" id="exportar">
                    </div>
                <%}%>
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> Reporte General.</h3> 
                    </div>
                    <div class="widget-content">
                        <div class="table-responsive">
                            <table id="tablacsv" class="table table-sorting table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <%if(bnCodigo!= null){%>
                                        <th>Código Bien</th>
                                        <%}if(bnNombre!= null){%>
                                        <th>Nombre</th>
                                        <%}if(bnSerie!= null){%>
                                        <th>Serie</th>
                                        <%}if(bnModelo!= null){%>
                                        <th>Modelo</th>
                                        <%}if(bnMarca!= null){%>
                                        <th>Marca</th>
                                        <%}if(bnColor!= null){%>
                                        <th>Color</th>
                                        <%}if(bnPrecio!= null){%>
                                        <th>Precio</th>
                                        <%}if(bnEstado!= null){%>
                                        <th>Estado</th>
                                        <%}if(bnFechaCompra!= null){%>
                                        <th>Fecha Compra</th>
                                        <%}if(bnFechaGarantia!= null){%>
                                        <th>Fecha Garantía</th>
                                        <%}if(bnProveedor!= null){%>
                                        <th>Proveedor</th>
                                        <%}if(bnDescripcion!= null){%>
                                        <th>Descripción/th>
                                        <%}if(bnDependencia!= null){%>
                                        <th>Dependencia</th>
                                        <%}if(bnUbicacion!= null){%>
                                        <th>Ubicación</th>
                                        <%}if(bnCodCatalogo!= null){%>
                                        <th>Código Catalogo</th>
                                        <%}if(bnNombreCatalogo!= null){%>
                                        <th>Catalodo</th>
                                        <%}if(prCedula!= null){%>
                                        <th>Cedula</th>
                                        <%}if(prNombre!= null){%>
                                        <th>Custodio</th>
                                        <%}if(prFechaTraspaso!= null){%>
                                        <th>Fecha Traspaso</th>
                                        <%}if(prEmail!= null){%>
                                        <th>Email</th>
                                        <%}if(prTelefono!= null){%>
                                        <th>Telefono</th>
                                        <%}if(prCargo!= null){%>
                                        <th>Cargo</th>
                                        <%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Traspaso oPet : listTraspaso) {
                                            out.println("<tr>");
                                            if(bnCodigo!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnCodBien()+ "</td>");
                                            if(bnNombre!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnNombre() + "</td>");
                                            if(bnSerie!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnSerie() + "</td>");
                                            if(bnModelo!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnModelo() + "</td>");
                                            if(bnMarca!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnMarca() + "</td>");
                                            if(bnColor!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnColor() + "</td>");
                                            if(bnPrecio!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnPrecio() + "</td>");
                                            if(bnEstado!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnEstadoBien() + "</td>");
                                            if(bnFechaCompra!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnFechaCompra() + "</td>");
                                            if(bnFechaGarantia!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnFechaGarantia() + "</td>");
                                            if(bnProveedor!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnProveedor() + "</td>");
                                            if(bnDescripcion!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getBnDescripcion()+ "</td>");
                                            if(bnDependencia!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getDpId().getDpDescripcion() + "</td>");
                                            if(bnUbicacion!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getUbId().getUbDescripcion() + "</td>");
                                            if(bnCodCatalogo!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getCatId().getCtId() + "</td>");
                                            if(bnNombreCatalogo!= null)
                                            out.println("<td>" + oPet.getBnCodBien().getCatId().getCtDescripcion() + "</td>");
                                            if(prCedula!= null)
                                            out.println("<td>" + oPet.getPerId().getPerCedula() + "</td>");
                                            if(prNombre!= null)
                                            out.println("<td>" + oPet.getPerId().getPerNombres() +" "+oPet.getPerId().getPerApellido1() +" "+oPet.getPerId().getPerApellido2() +"</td>");
                                            if(prFechaTraspaso!= null)
                                            out.println("<td>" + oPet.getTraFechaInicio()+ "</td>");
                                            if(prEmail!= null)
                                            out.println("<td>" + oPet.getPerId().getPerEmail()+ "</td>");
                                            if(prTelefono!= null)
                                            out.println("<td>" + oPet.getPerId().getPerTelefono() + "</td>");
                                            if(prCargo!= null)
                                            out.println("<td>" + oPet.getPerId().getCarId().getCarDescripcion() + "</td>");
                                            
                                            out.println("</tr>");
                                        }%>
                                    <!--</tr>-->
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


