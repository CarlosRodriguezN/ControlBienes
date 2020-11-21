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
        ArrayList<Temp> listTemp = new ArrayList<Temp>();

        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serTemp = sTemporal.listaTodosTemporales();

                //Lista de csv
                String resultadoTemp = "{\"respuesta\":" + serTemp + "}";
                JSONObject objTemp = new JSONObject(resultadoTemp);
                JSONArray arrayTemp = objTemp.getJSONArray("respuesta");
                for (int i = 0; i < arrayTemp.length(); i++) {
                    JSONObject childJSONObject = arrayTemp.getJSONObject(i);
                    Temp objMenus = new Gson().fromJson(childJSONObject.toString(), Temp.class);
                    listTemp.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
        String codigos = "";
    %>
    <div class="main-header">
        <h2>Detalle csv importados</h2>
        <em></em>
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
                                                
                                               
                                                <th>Catalogo</th>
                                                <th>CantidadDisco</th>
                                                <th>ConexionMonitor</th>
                                                <th>TipoPantalla</th>
                                                <th>MemoriaInterna</th>
                                                <th>MemoriaExterna</th>
                                                <th>SWversion</th>
                                                <th>SWvigencia</th>
                                                <th>SWnumLicencias</th>
                                                <th>SWfechaContrato</th>
                                                <th>SWtipoSoporte</th>
                                                <th>TipoBateria</th>
                                                <th>NumConectores</th>
                                                <th>RouterNumPuertos</th>
                                                <th>TipoLector</th>
                                                <th>TecnologiaDisco</th>
                                                <th>TamañoPantalla</th>
                                                <th>EstadoUso</th>
                                                
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                
                                                for (Temp oPet : listTemp) {
                                                    out.println("<tr>");
                                                    codigos = (oPet.getTempCodBien() + "_" + codigos); 
                                                    out.println("<td>" + oPet.getTempCodBien() + "</td>");
                                                    out.println("<td>" + oPet.getTempNombre() + "</td>");
                                                    out.println("<td>" + oPet.getTempSerie() + "</td>");
                                                    out.println("<td>" + oPet.getTempModelo() + "</td>");
                                                    out.println("<td>" + oPet.getTempMarca() + "</td>");
                                                    out.println("<td>" + oPet.getTempColor() + "</td>");
                                                    out.println("<td>" + oPet.getTempDependencia() + "</td>");
                                                    out.println("<td>" + oPet.getTempUbicacion() + "</td>");
                                                    out.println("<td>" + oPet.getTempCedulaRuc() + "</td>");
                                                    out.println("<td>" + oPet.getTempCargoUsuario() + "</td>");
                                                    out.println("<td>" + oPet.getTempTipoIngreso() + "</td>");
                                                    out.println("<td>" + oPet.getTempPrecio() + "</td>");
                                                    out.println("<td>" + oPet.getTempEstadoBien() + "</td>");
                                                    out.println("<td>" + oPet.getTempFechaCompra() + "</td>");
                                                    out.println("<td>" + oPet.getTempTiempoGarantia() + "</td>");
                                                    out.println("<td>" + oPet.getTempProveedor() + "</td>");
                                                    out.println("<td>" + oPet.getTempDescripcion() + "</td>");
                                                    out.println("<td>" + oPet.getTempRamTamano() + "</td>");
                                                    out.println("<td>" + oPet.getTempRamTecno() + "</td>");
                                                    out.println("<td>" + oPet.getTempCantDisco() + "</td>");
                                                    out.println("<td>" + oPet.getTempRed() + "</td>");
                                                    out.println("<td>" + oPet.getTempProcesador() + "</td>");
                                                    out.println("<td>" + oPet.getTempLectorDvd() + "</td>");
                                                    out.println("<td>" + oPet.getTempSistemaOperativo() + "</td>");
                                                    out.println("<td>" + oPet.getTempMonitorTecn() + "</td>");
                                                    out.println("<td>" + oPet.getTempMonitorTama() + "</td>");
                                                    out.println("<td>" + oPet.getTempModeToner() + "</td>");
                                                    out.println("<td>" + oPet.getTempNumFusor() + "</td>");
                                                    out.println("<td>" + oPet.getTempCantToner() + "</td>");
                                                    out.println("<td>" + oPet.getTempTecnProyector() + "</td>");
                                                    out.println("<td>" + oPet.getTempLumenes() + "</td>");
                                                    out.println("<td>" + oPet.getTempTipoLampara() + "</td>");
                                                    out.println("<td>" + oPet.getTempResolucion() + "</td>");
                                                    out.println("<td>" + oPet.getTempFechaSubida() + "</td>");
                                                    
                                                    
                                                    out.println("<td>" + oPet.getTempCatalogo() + "</td>");
                                                    out.println("<td>" + oPet.getTempCantDisco() + "</td>");
                                                    out.println("<td>" + oPet.getTempMonitorTipoConex() + "</td>");
                                                    out.println("<td>" + oPet.getTempTipPantalla() + "</td>");
                                                    out.println("<td>" + oPet.getTempMemoInter() + "</td>");
                                                    out.println("<td>" + oPet.getTempMemoExter() + "</td>");
                                                    out.println("<td>" + oPet.getTempSwVersion() + "</td>");
                                                    out.println("<td>" + oPet.getTempSwVigencia() + "</td>");
                                                    out.println("<td>" + oPet.getTempSwCantLicencia() + "</td>");
                                                    out.println("<td>" + oPet.getTempSwFechaContrat() + "</td>");
                                                    out.println("<td>" + oPet.getTempSwTipSoporte() + "</td>");
                                                    out.println("<td>" + oPet.getTempTipBateria() + "</td>");
                                                    out.println("<td>" + oPet.getTempNumConect() + "</td>");
                                                    out.println("<td>" + oPet.getTempNumPuertRouter() + "</td>");
                                                    out.println("<td>" + oPet.getTempTipLector() + "</td>");
                                                    out.println("<td>" + oPet.getTempDiscoTecn() + "</td>");
                                                    out.println("<td>" + oPet.getTempTamPantalla() + "</td>");
                                                    out.println("<td>" + oPet.getTempEstadoUso() + "</td>");
                                                    
                                            %><td>&nbsp;&nbsp;<i style='cursor: pointer' onclick='procesTemp("<%=  oPet.getTempCodBien()%>");' class='fa fa-check' title='Procesar' ></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='eliminaTemp("<%=  oPet.getTempCodBien()%>");' class='fa fa-trash' title='Eliminar' ></i></td>

                                        <%                                            out.println("</tr>");
                                            }%>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  class='btn btn-primary' onclick = 'importarTodos("<%=codigos%>");'><i class="fa fa-check-circle"></i> Importar Todos</button>
                        </div>
                        <!-- END SCROLLING DATA TABLE -->


                    </div>
                </div>
            </div>
        </div>
    </div>
</html>