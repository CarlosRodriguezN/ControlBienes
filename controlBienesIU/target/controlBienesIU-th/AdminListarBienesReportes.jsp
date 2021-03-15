<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        String rol1,rol2,rol3;
  
        try{
            rol1 = session.getAttribute("Rol0").toString();
        }catch(Exception e)
        {
            rol1 = "";
        }
        try{
            rol2 = session.getAttribute("Rol1").toString();
        }catch(Exception e)
        {
            rol2 = "";
        }
        try{
            rol3 = session.getAttribute("Rol2").toString();
        }catch(Exception e)
        {
            rol3 = "";
        }
        
        String fechInicial  = session.getAttribute("fechai").toString();
        String fechFinal    = session.getAttribute("fechaf").toString();
        Date fi = null, ff = null;
            if(fechInicial != "" && fechFinal != ""){
                SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy");
                fi = formatter.parse(fechInicial);
                ff = formatter.parse(fechFinal);
            }
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
                        <div class="row justify-content-center">
                            <form role="form" id="FrmRangoFecha" >
                                <div class="form-group col-sm-2 ">
                                    <label for="fechai">Fecha Inicial</label>
                                    <%if(fechInicial != ""){%>
                                        <input data-date-format="DD-MM-YYYY" value="<%=fechInicial%>" required type="date" class="form-control" id="fechai" name="fechai">
                                    <%}else{%>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="fechai" name="fechai">
                                    <%}%>
                                </div>

                                <div class="form-group col-sm-2">
                                    <label for="fechaf">Fecha Final</label>
                                    <%if(fechFinal != ""){%>
                                        <input data-date-format="DD-MM-YYYY" value="<%=fechFinal%>" required type="date" class="form-control" id="fechaf" name="fechaf">
                                    <%}else{%>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="fechaf" name="fechaf">
                                    <%}%>
                                </div>
                            </form>
                        </div>

                        <div class="col-sm-4">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">  
                                    <form role="form" id="FrmBienTaspaso">
                                        <div class="form-group col-md-6" >
                                            <label for="repotTraspaso"><b>Reporte de Traspaso de Bienes</b></label>
                                            <input value="traspaso" required="true" type="hidden" class="form-control" id="repotTraspaso" name="repotTraspaso">
                                        </div>
                                    </form>                           
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnTraspaso' onclick="invTraspasoPDF()" value='btnTraspaso'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button>
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnTraspaso' onclick="invTraspasoCSV()" value='btnTraspaso'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button> 
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">  
                                    <form role="form" id="FrmBienMarca">
                                        <label for="repotTraspaso"><b>Reporte por Marca de Bienes</b></label>
                                        <div class="form-group col-md-6" >
                                            <input value="ASUS" required="true" type="text" class="form-control" id="idmarca" name="marca">
                                        </div>
                                    </fom>
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnMarca' onclick="invMarcaPDF()" value='btnMarca'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnMarcaCsv' onclick="invMarcaCSV()" value='btnMarcaCsv'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button>  
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
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnDesactivado' onclick="invDesactivadosPDF()" value='btnDesactivado'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                    <button class='btn btn-outline-warning' type = 'button' name = 'invDesactivadosCSV' onclick="invDesactivadosCSV()" value='invDesactivadosCSV'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button> 
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">
                                    <form role="form" id="FrmBienDependenciaUbicacion">
                                        <div class="form-group col-md-10" >
                                            <div class="col-md-10" >
                                                <label><b>Reporte de Bienes por Dependencia y Ubicación</b></label>
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
                                        <button class='btn btn-outline-warning' type = 'button' name = 'btnDepUbic' onclick="invUbicDepPDF()" value='btnDepUbic'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                        <button class='btn btn-outline-warning' type = 'button' name = 'invUbicDepCSV' onclick="invUbicDepCSV()" value='invUbicDepCSV'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button> 
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <%if(rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){%>
                            <!--Reporte de Auditoria del Sistema-->
                            <div class="col-sm-2">
                                <div class="well well-lg knowledge-recent-popular">
                                    <div class="row">  
                                        <form role="form" id="FrmAudiSistema">
                                            <div class="form-group col-md-6" >
                                                <label for="repotAudiSistema"><b>Auditoria del Sistema</b></label>
                                                <input value="audiSistema" required="true" type="hidden" class="form-control" id="repotAudiSistema" name="repotAudiSistema">
                                            </div>
                                        </form>                           
                                        <!--<button class='btn btn-outline-warning' type = 'button' name = 'btnTraspaso' onclick="invTraspasoPDF()" value='btnTraspaso'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button>-->
                                        <button class='btn btn-outline-warning' type = 'button' name = 'btnSistema' onclick="invAudiSistemaCSV()" value='btnAudiSistema'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button> 
                                    </div>
                                </div>
                            </div>

                            <!--Reporte de Auditoia de Traspasos-->  
                            <div class="col-sm-2">
                                <div class="well well-lg knowledge-recent-popular">
                                    <div class="row">  
                                        <form role="form" id="FrmAudiTaspaso">
                                            <div class="form-group col-md-6" >
                                                <label for="repotAudiTraspaso"><b>Auditoria de Traspasos</b></label>
                                                <input value="audiTaspaso" required="true" type="hidden" class="form-control" id="repotAudiTraspaso" name="repotAudiTraspaso">
                                            </div>
                                        </form>                           
                                        <!--<button class='btn btn-outline-warning' type = 'button' name = 'btnTraspaso' onclick="invTraspasoPDF()" value='btnTraspaso'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button>-->
                                        <button class='btn btn-outline-warning' type = 'button' name = 'btnAudiTraspaso' onclick="invAudiTraspasoCSV()" value='btnAudiTraspaso'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button> 
                                    </div>
                                </div>
                            </div>
                        <%}%>
                    </div>       
                     
                    <!--Pestana 2-->                                   
                    <div class="tab-pane" id="blkReportesSinFecha">
                        <div class="col-sm-4">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">  
                                    <form role="form" id="FrmBienGarantia">
                                        <div class="form-group col-md-6" >
                                            <label for="repotGarantia"><b>Reporte de Bienes con Garantía</b></label>
                                            <input value="garantia" required="true" type="hidden" class="form-control" id="repotGarantia" name="repotGarantia">
                                        </div>
                                    </form>
                                    <button class='btn btn-outline-warning' type = 'button' name = 'btnGarantia' onclick="clicReportesInvBienes('FrmBienGarantia','garantia')" value='btnGarantia'><i class="fa fa-file-pdf-o" style="font-size: 25px;"></i></button> 
                                    <button class='btn btn-outline-warning' type = 'button' name = 'invGarantiaUbicDepCSV' onclick="verTodosReportesInvGarantia()" value='invGarantiaCSV'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button> 
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">  
                                    <form role="form" id="FrmEditPermisos">
                                       <table class="table">
                                           <thead>
                                               <tr>
                                                   <th></th>
                                                   <th></th>
                                                   <th></th>
                                                   <th></th>
                                                   <th></th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                                <div class="form-check form-check-inline">
                                                    <tr class="bg-primary"><td colspan="5" align="center"> Reporte General Personalizado</td></tr>
                                                    <tr><td colspan="5" align="center"> Datos del Bien </td></tr>
                                                     <tr>  
                                                     <td>  <input class="form-check-input" type="checkbox" id="bnCod" name ="nombre" value="bnCod" checked/>
                                                           <label class="form-check-label" for="inlineCheckbox1">Código</label></td>
                                                     <td>  <input class="form-check-input" type="checkbox" id="bnNombre" name ="nombre" value="bnNombre" checked/>
                                                           <label class="form-check-label" for="inlineCheckbox1">Nombre</label></td>                                                                                                                                     
                                                     <td>  <input class="form-check-input" type="checkbox" id="bnSerie" name ="nombre" value="bnSerie" checked/>
                                                           <label class="form-check-label" for="inlineCheckbox1">Serie</label></td>
                                                     <td>  <input class="form-check-input" type="checkbox" id="bnModelo" name ="nombre" value="bnModelo" checked/>
                                                           <label class="form-check-label" for="inlineCheckbox1">Modelo</label></td>
                                                     <td>  <input class="form-check-input" type="checkbox" id="bnMarca" name ="nombre" value="bnMarca" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Marca</label></td> 
                                                     </tr><tr>
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnColor" name ="nombre" value="bnColor" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Color</label></td>
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnPrecio" name ="nombre" value="bnPrecio" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Precio</label></td> 
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnEstado" name ="nombre" value="bnEstado" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Estado</label></td> 
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnFechaCompra" name ="nombre" value="bnFechaCompra" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Fecha Compra</label></td> 
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnFechaGarantia" name ="nombre" value="bnFechaGarantia" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Fecha Garantía</label></td>  
                                                     </tr><tr>
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnProveedor" name ="nombre" value="bnProveedor" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Proveedor</label></td> 
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnDescripcion" name ="nombre" value="bnDescripcion" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Descripción</label></td> 
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnDependencia" name ="nombre" value="bnDependencia" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Dependencia</label></td> 
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnUbicacion" name ="nombre" value="bnUbicacion" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Ubicacion</label></td>                                                                                                                                      
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnCodCatalogo" name ="nombre" value="bnCodCatalogo" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Cod Catalogo</label> </td>
                                                     </tr><tr>
                                                     <td>    <input class="form-check-input" type="checkbox" id="bnNombreCatalogo" name ="nombre" value="bnNombreCatalogo" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Catalogo</label> </td>
                                                     </tr>
                                                         <tr><td  class="table-primary" colspan="5" align="center"> Datos del Custodio </td></tr>
                                                     <tr>
                                                     <td>    <input class="form-check-input" type="checkbox" id="prCedula" name ="nombre" value="prCedula" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Cedula </label> </td>
                                                     <td>    <input class="form-check-input" type="checkbox" id="prNombre" name ="nombre" value="prNombre" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Nombre</label> </td>                                                                                                                              
                                                     <td>    <input class="form-check-input" type="checkbox" id="prFechaTraspaso" name ="nombre" value="prFechaTraspaso" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Fecha Traspaso</label> </td>
                                                     <td>    <input class="form-check-input" type="checkbox" id="prEmail" name ="nombre" value="prEmail" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Email</label> </td>
                                                     <td>    <input class="form-check-input" type="checkbox" id="prTelefono" name ="nombre" value="prTelefono" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Telefono</label> </td>
                                                     </tr><tr>
                                                     <td>    <input class="form-check-input" type="checkbox" id="prCargo" name ="nombre" value="prCargo" checked/>
                                                         <label class="form-check-label" for="inlineCheckbox1">Cargo</label> </td>                                                                                                                       
                                                     </tr>
                                                </div>                 
                                            </tbody>    
                                        </table>
                                   </form>                         
                                    <button class='btn btn-outline-warning' type = 'button' name = 'invReporteGeneralCSV' onclick="invGeneralCSV()" value='invGarantiaCSV'><i class="fa fa-file-excel-o" style="font-size: 25px;"></i></button> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                                                                                                                                                                                                                                                                                                                                                                              
        </div>
                                               
        <script>
            function invTraspasoPDF() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                if (fechai !== "" && fechaf !== "") {
                    clicReportesInvBienes('FrmBienTaspaso','traspaso');
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invUbicDepPDF() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                ubicacion = $("select[id='UbicacionId']").val();
                dependencia = $("select[id='DependenciaId']").val();
                if (fechai !== "" && fechaf !== "") {
                    clicReportesInvBienes('FrmBienDependenciaUbicacion','ubicadep')
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invMarcaPDF() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                marca = $("input[id='idmarca']").val();
                if (fechai !== "" && fechaf !== "" && marca !== "") {
                    clicReportesInvBienes('FrmBienMarca','marca')
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invDesactivadosPDF() {
                    fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                if (fechai !== "" && fechaf !== "") {
                    clicReportesInvBienes('FrmBienDesactivado','desactivado')
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invTraspasoCSV() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                if (fechai !== "" && fechaf !== "") {
                    verTodosReportesInvTraspaso(fechai, fechaf);
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invUbicDepCSV() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                ubicacion = $("select[id='UbicacionId']").val();
                dependencia = $("select[id='DependenciaId']").val();
                if (fechai !== "" && fechaf !== "") {
                    verTodosReportesInvUbicDep(fechai, fechaf, ubicacion, dependencia);
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invMarcaCSV() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                marca = $("input[id='idmarca']").val();
                if (fechai !== "" && fechaf !== "" && marca !== "") {
                    verTodosReportesInvMarca(fechai, fechaf, marca);
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invDesactivadosCSV() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                if (fechai !== "" && fechaf !== "") {
                    verTodosReportesInvDesactivados(fechai, fechaf);
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invGeneralCSV() {
                bnCodigo = $( "input[type=checkbox][id='bnCod']:checked" ).val();
                bnNombre = $( "input[type=checkbox][id='bnNombre']:checked" ).val();
                bnModelo = $( "input[type=checkbox][id='bnModelo']:checked" ).val();
                bnSerie = $( "input[type=checkbox][id='bnSerie']:checked" ).val();
                bnMarca = $( "input[type=checkbox][id='bnMarca']:checked" ).val();
                bnColor = $( "input[type=checkbox][id='bnColor']:checked" ).val();
                bnPrecio = $( "input[type=checkbox][id='bnPrecio']:checked" ).val();
                bnEstado = $( "input[type=checkbox][id='bnEstado']:checked" ).val();
                bnFechaCompra = $( "input[type=checkbox][id='bnFechaCompra']:checked" ).val();
                bnFechaGarantia = $( "input[type=checkbox][id='bnFechaGarantia']:checked" ).val();
                bnProveedor = $( "input[type=checkbox][id='bnProveedor']:checked" ).val();
                bnDescripcion = $( "input[type=checkbox][id='bnDescripcion']:checked" ).val();
                bnDependencia = $( "input[type=checkbox][id='bnDependencia']:checked" ).val();
                bnUbicacion = $( "input[type=checkbox][id='bnUbicacion']:checked" ).val();
                bnCodCatalogo = $( "input[type=checkbox][id='bnCodCatalogo']:checked" ).val();
                bnNombreCatalogo = $( "input[type=checkbox][id='bnNombreCatalogo']:checked" ).val();
                prCedula = $( "input[type=checkbox][id='prCedula']:checked" ).val();
                prNombre = $( "input[type=checkbox][id='prNombre']:checked" ).val();
                prFechaTraspaso = $( "input[type=checkbox][id='prFechaTraspaso']:checked" ).val();
                prEmail = $( "input[type=checkbox][id='prEmail']:checked" ).val();
                prTelefono = $( "input[type=checkbox][id='prTelefono']:checked" ).val();
                prCargo = $( "input[type=checkbox][id='prCargo']:checked" ).val();

                    verTodosReportesInvGeneral(bnCodigo, bnNombre, bnModelo, bnSerie, bnMarca,
                                               bnColor, bnPrecio, bnEstado, bnFechaCompra, bnFechaGarantia,
                                               bnProveedor, bnDescripcion, bnDependencia, bnUbicacion, bnCodCatalogo,
                                               bnNombreCatalogo, prCedula, prNombre, prFechaTraspaso, prEmail,
                                               prTelefono, prCargo);
            }                              
            function invAudiSistemaCSV() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                if (fechai !== "" && fechaf !== "") {
                    verTodosReportesInvAudiSistema(fechai, fechaf);
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
            
            function invAudiTraspasoCSV() {
                fechai = $("input[id='fechai']").val();
                fechaf = $("input[id='fechaf']").val();
                if (fechai !== "" && fechaf !== "") {
                    verTodosReportesInvAudiTraspaso(fechai, fechaf);
                } else {
                    alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
                }
            }
        </script>
</html>