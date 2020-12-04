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
    <link href="js/css/dtic.css" rel="stylesheet" type="text/css"/>



    <%
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        ArrayList<Dependencia> listDependencia = new ArrayList<Dependencia>();
        ArrayList<Ubicacion> listUbicacion = new ArrayList<Ubicacion>();
        ArrayList<Baja> listBaja = new ArrayList<Baja>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {

                //Lista de dependencias
                String resultadoDependencia = "{\"respuesta\":" + sDependencia.listaTodosDependencia() + "}";
                JSONObject objDependencia = new JSONObject(resultadoDependencia);
                JSONArray arrayDependencia = objDependencia.getJSONArray("respuesta");
                for (int i = 0; i < arrayDependencia.length(); i++) {
                    JSONObject childJSONObject = arrayDependencia.getJSONObject(i);
                    Dependencia objMenus = new Gson().fromJson(childJSONObject.toString(), Dependencia.class);
                    listDependencia.add(objMenus);
                }
                
                //Lista de Ubicaciones
                String resultadoUbicacion = "{\"respuesta\":" + sUbicacion.listaTodosUbicacion() + "}";
                JSONObject objUbicacion = new JSONObject(resultadoUbicacion);
                JSONArray arrayUbicacion = objUbicacion.getJSONArray("respuesta");
                for (int i = 0; i < arrayUbicacion.length(); i++) {
                    JSONObject childJSONObject = arrayUbicacion.getJSONObject(i);
                    Ubicacion objMenus = new Gson().fromJson(childJSONObject.toString(), Ubicacion.class);
                    listUbicacion.add(objMenus);
                }
                
                
                //Lista de tipo Bajas
                String resultadoBaja = "{\"respuesta\":" + sBaja.listaTodosBaja() + "}";
                JSONObject objBaja = new JSONObject(resultadoBaja);
                JSONArray arrayBaja = objBaja.getJSONArray("respuesta");
                for (int i = 0; i < arrayBaja.length(); i++) {
                    JSONObject childJSONObject = arrayBaja.getJSONObject(i);
                    Baja objMenus = new Gson().fromJson(childJSONObject.toString(), Baja.class);
                    listBaja.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Reportes de Bienes</h2>
        <em>De acuerdo a la selección del usuario.</em>
    </div>
    
        <div class="main-content">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#blkReportePorFecha" data-toggle="tab">Por Rango de Fecha</a></li>
                    <li><a href="#blkReportesSinFecha" data-toggle="tab">Otros Reportes</a></li>
                </ul>
                <div class="tab-content">
                    <div class="active tab-pane" id="blkReportePorFecha">

                        <!--<div class="well well-lg knowledge-recent-popular ">-->
                            <div class="row justify-content-center">
                                    <form role="form" id="FrmRangoFecha" >
                                        <div class="form-group col-sm-2 ">
                                            <label for="fechai">Fecha Inicial</label>
                                            <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="fechai" name="fechai">
                                        </div>
                                        <div class="form-group col-sm-2">
                                            <label for="fechaf">Fecha Final</label>
                                            <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="fechaf" name="fechaf">
                                        </div>
                                    </form>
                            <!--</div>-->
                        </div>

                        <div class="col-sm-4">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">  
                                    <form role="form" id="FrmBienTaspaso">
                                        <div class="form-group col-md-6" >
                                            <label for="repotTraspaso"><b>Reporte de traspaso de Bienes</b></label>
                                            <input value="traspaso" required="true" type="hidden" class="form-control" id="repotTraspaso" name="repotTraspaso">
                                        </div>
                                    </fom>
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnTraspaso' onclick="clicReportesInvBienes('FrmBienTaspaso','traspaso')" value='btnTraspaso'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                    <!--<input  type = 'submit' name = 'btnTraspaso' value='' class='btn btn-outline-warning'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></input>--> 
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">  
                                    <form role="form" id="FrmBienMarca">
                                        <label for="repotTraspaso"><b>Repote por Marca de Bienes</b></label>
                                        <div class="form-group col-md-6" >
                                            
                                            <input value="ASUS" required="true" type="text" class="form-control" id="FrmBienMarca" name="marca">
                                        </div>
                                    </fom>
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnMarca' onclick="clicReportesInvBienes('FrmBienMarca','marca')" value='btnMarca'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                    <!--<input  type = 'submit' name = 'btnTraspaso' value='' class='btn btn-outline-warning'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></input>--> 
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">
                                    <form role="form" id="FrmBienDesactivado">
                                        <div class="form-group col-md-6" >
                                            <label><b>Reporte de Bienes Desactivados</b></label>
                                        </div>
                                    </form>
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnDesactivado' onclick="clicReportesInvBienes('FrmBienDesactivado','desactivado')" value='btnDesactivado'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">
                                    <form role="form" id="FrmBienDependenciaUbicacion">
                                        <div class="form-group col-md-10" >
                                                <div class="col-md-10" >
                                                    <label><b>Reporte de Bienes por Dependencia y Ubicacion</b></label>
                                                </div>
                                                <div class="caja col-sm-10" >
                                                        <select class='form-control Recursos' id='UbicacionId' name='ubicacion'>
                                                            <%
                                                                for (Ubicacion oPet : listUbicacion) {
                                                                    out.println("<option value='" + oPet.getUbDescripcion()+ "'>" + oPet.getUbDescripcion() + "</option>");
                                                                }
                                                            %>
                                                        </select>

                                                </div>
                                                       <br></br>
                                                        <hr></hr>
                                                <div class="caja col-sm-10" >   
                                                        <select class='form-control Recursos' id='DependenciaId' name='dependencia'>
                                                            <%
                                                                for (Dependencia oPet : listDependencia) {
                                                                    out.println("<option value='" + oPet.getDpDescripcion() + "'>" + oPet.getDpDescripcion() + "</option>");
                                                                }
                                                            %>
                                                        </select>
                                                </div>

                                        </div>
                                    </form>
                                    <div align='center'>    
                                        <button class='btn btn-outline-warning' type = 'button' name = 'btnDepUbic' onclick="clicReportesInvBienes('FrmBienDependenciaUbicacion','ubicadep')" value='btnDepUbic'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                    </div>
                                </div>
                            </div>
                        </div>   
                    </div>
                    <!--Pestana 2-->                                   
                    <div class="active tab-pane" id="blkReportesSinFecha">
                        <div class="col-sm-4">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">  
                                    <form role="form" id="FrmBienGarantia">
                                        <div class="form-group col-md-6" >
                                            <label for="repotGarantia"><b>Reporte de Bienes con Grantia</b></label>
                                            <input value="garantia" required="true" type="hidden" class="form-control" id="repotGarantia" name="repotGarantia">
                                        </div>
                                    </fom>
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnGarantia' onclick="clicReportesInvBienes('FrmBienGarantia','garantia')" value='btnGarantia'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                    <!--<input  type = 'submit' name = 'btnTraspaso' value='' class='btn btn-outline-warning'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></input>--> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                                            
        </div>

                                        
<!--        <div class="btn-group btn-group-xs">
            <button type="button" class="btn btn-primary" target="_blank" title="Editar" onclick="repotesBien('pdf','baja')"><i class="fa fa-file-pdf-o" style="font-size: 17px;"></i></button>
        </div>                                  
                                    
                                     
                                        
                                        
       
       <a href = "report.jsp" target="_blank">Reporte</a>
       <p>holassssss</p>-->
</html>