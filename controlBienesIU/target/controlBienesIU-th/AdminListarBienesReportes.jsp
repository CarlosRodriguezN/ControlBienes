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
    
    <form action = "report.jsp" target="_blank" method = "post">
        <div class="main-content">
            <div class="col-sm-4">
                <div class="well well-lg knowledge-recent-popular">
                    <div class="row">                     
                            <div class="form-group col-md-6" >
                                <label><b>Reporte de traspaso de Bienes</b></label>
                            </div>
                        <button class='btn btn-outline-warning' type = 'submit' name = 'btnTraspaso' value='btnTraspaso'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                        <!--<input  type = 'submit' name = 'btnTraspaso' value='' class='btn btn-outline-warning'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></input>--> 
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                    <div class="row">
                <div class="well well-lg knowledge-recent-popular">
        <!--                    <form role="form" id="FrmBienUbicacionId">-->
                            <div class="form-group col-sm-12">
                                <label><b>Reporde de Bienes por Marca</b></label>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="bienMarca" class="col-sm-4">Marca</label>
                                <input value="ASUS" required="true" type="text" class="form-control col-sm-4" id="bienMarca" name="bienMarca" placeholder="Ingrese la marca del bien">
                            </div>

        <!--                    </form>--> 
                        <div align='center'>
                            <button class='btn btn-outline-warning' type = 'submit' name = 'btnMarca' value='btnMarca'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                            <!--<button  class='btn btn-outline-warning' onclick="BienesBusqueda('UbicacionId')"><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button>-->
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="well well-lg knowledge-recent-popular">
                    <div class="row">
                        <div class="form-group col-md-6" >
                            <label><b>Reporte de Bienes Desactivados</b></label>
                        </div>
                        <button class='btn btn-outline-warning' type = 'submit' name = 'btnDesactivado' value='btnDesactivado'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="well well-lg knowledge-recent-popular">
                    <div class="row">
                        <form role="form" id="FrmBienBajaId">
                            <div class="form-group col-md-10" >
                                    <div class="col-md-10" >
                                        <label><b>Reporte de Bienes por Dependencia y Ubicacion</b></label>
                                    </div>
                                    <div class="caja col-sm-10" >
                                            <select class='form-control Recursos' id='UbicacionId' name='UbicacionId'>
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
                                            <select class='form-control Recursos' id='DependenciaId' name='DependenciaId'>
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
                            <button class='btn btn-outline-warning' type = 'submit' name = 'btnDepUbic' value='btnDepUbic'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </form>
                                        
<!--        <div class="btn-group btn-group-xs">
            <button type="button" class="btn btn-primary" target="_blank" title="Editar" onclick="repotesBien('pdf','baja')"><i class="fa fa-file-pdf-o" style="font-size: 17px;"></i></button>
        </div>                                  
                                    
                                     
                                        
                                        
       
       <a href = "report.jsp" target="_blank">Reporte</a>
       <p>holassssss</p>-->
</html>