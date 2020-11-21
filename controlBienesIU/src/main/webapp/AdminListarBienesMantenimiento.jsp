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
        ArrayList<Mantenimiento> listMantenimiento = new ArrayList<Mantenimiento>();
        ArrayList<Tipomantenimiento> listTipoMantenimiento = new ArrayList<Tipomantenimiento>();
        ArrayList<Tecnico> listTecnico = new ArrayList<Tecnico>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                
                //Obtener Registros del Tipo de Mantenimiento
                String serTipoMantenimiento = sTipoMantenimiento.listaTodosTipoMantenimiento();
                String resultadoTipoMantenimiento = "{\"respuesta\":" + serTipoMantenimiento + "}";
                JSONObject objTipoMantenimiento = new JSONObject(resultadoTipoMantenimiento);
                JSONArray arrayTipoMantenimiento = objTipoMantenimiento.getJSONArray("respuesta");
                for (int i = 0; i < arrayTipoMantenimiento.length(); i++) {
                    JSONObject childJSONObject = arrayTipoMantenimiento.getJSONObject(i);
                    Tipomantenimiento objMenus = new Gson().fromJson(childJSONObject.toString(), Tipomantenimiento.class);
                    listTipoMantenimiento.add(objMenus);
                }
                
                    
                //Obtener Registros de Mantenimiento
                //String serMantenimiento = sMantenimiento.listaTodosMantenimientos();  
                String serMantenimiento = sMantenimiento.listarBienesEnMantenimientos(1);          
                String resultadoMantenimiento = "{\"respuesta\":" + serMantenimiento + "}";
                //String resultadoMantenimiento = "{\"respuesta\":" +"["+ serMantenimiento +"]"+ "}";
                JSONObject objMantenimiento = new JSONObject(resultadoMantenimiento);
                JSONArray arrayMantenimiento = objMantenimiento.getJSONArray("respuesta");
                for (int i = 0; i < arrayMantenimiento.length(); i++) {
                    JSONObject childJSONObject = arrayMantenimiento.getJSONObject(i);
                    Mantenimiento objMenus = new Gson().fromJson(childJSONObject.toString(), Mantenimiento.class);
                    listMantenimiento.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Mantenimientos</h2>
        <em>Mantenimientos registrados en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkMantenimientos" data-toggle="tab">Mantenimientos</a></li>
                <li><a href="#blkBuscarMantenimientos" data-toggle="tab">Buscar</a></li>
                <li><a href="#blkNewMantenimientos" data-toggle="tab">Agregar nuevo</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkMantenimientos">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Mantenimientos.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                        <thead>
                                            <tr>
                                                <th>Cod. Mantenimiento</th>
                                                <th>Numero Orden</th>
                                                <th>Cod. Bien</th>
                                                <th>Bien</th>
                                                <th>Problema</th>
                                                <th>Solucion</th>
                                                <th>Tecnico</th>
                                                <th>Fecha Revision</th>
                                                <th>Fecha Ingreso</th>
                                                <th>Fecha Entrega</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Mantenimiento oPet : listMantenimiento) {
                                                    out.println("<tr>");
                                                    String[] MuestraFechEntrega = oPet.getMantFechaEntrega().toString().replace("/Date(", "").split("T");
                                                    String[] MuestraFechIng = oPet.getMantFechaIng().toString().replace("/Date(", "").split("T");
                                                    String[] MuestraFechRevision = oPet.getMantFechaRevision().toString().replace("/Date(", "").split("T");
//                                                        String str1FecEntr = oPet.getMantFechaEntrega().replace("/Date(", "");
//                                                        String[] palabrasSeparadas = str1FecEntr.split("T");
//                                                        String datFecha = palabrasSeparadas[0];       
                                                    
                                                    out.println("<td>" + oPet.getMantId() + "</td>");
                                                    out.println("<td>" + oPet.getMantNumOrden() + "</td>");
                                                    out.println("<td>" + oPet.getBienId().getBnCodBien()+ "</td>");
                                                    out.println("<td>" + oPet.getBienId().getBnNombre() + "</td>");
                                                    out.println("<td>" + oPet.getMantDescripProblema() + "</td>");
                                                    out.println("<td>" + oPet.getMantDescripSolucion() + "</td>");
                                                    out.println("<td>" + oPet.getTecnId().getTecNombre() + "</td>");
                                                    out.println("<td>" + MuestraFechRevision[0] + "</td>");
                                                    out.println("<td>" + MuestraFechIng [0] + "</td>");
                                                    out.println("<td>" + MuestraFechEntrega[0] + "</td>");


//                                                    if (oPet.getUbEstado() == 1) {
//                                                        out.println("<td align='center'> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
//                                                    }
//                                                    if (oPet.getUbEstado() == 2) {
//                                                        out.println("<td align='center'> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
//                                                    }
//                                                    if (oPet.getUbEstado() == 3) {
//                                                        out.println("<td align='center'> <span class='badge badge-pill badge-warning'>Bloqueado</span> </td>");
//                                                    }


                                            %>
                                        <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-warning" title="Editar" onclick="PreEditUbicacion(<%= oPet.getMantId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                            </div>
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-primary" title="Dejar Mantenimiento" onclick="quitarDeMantenimiento(<%= oPet.getMantId()%>)"><i class="fa fa-times" style="font-size: 17px;"></i></button>
                                            </div>   
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%            out.println("</tr>");

                                            }%>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                <!Buscar----->
                <div class="tab-pane" id="blkBuscarMantenimientos">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="buscarMantenimiento" >
                                    <div class="form-group col-sm-5">
                                        <label for="MantFechaInicial">Fecha Inicial</label>
                                        <input data-date-format="DD MMMM YYYY" value="2020-07-27" required="true" type="date" class="form-control" id="MantFechaInicial" name="MantFechaInicial" placeholder="Ingrese la Fecha Inicial">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="MantFechaFinal">Fecha Final</label>
                                        <input data-date-format="DD MMMM YYYY" value="2020-07-27" required="true" type="date" class="form-control" id="MantFechaFinal" name="MantFechaFinal" placeholder="Ingrese la Fecha Final">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="MantenimientosBusqueda()">Buscar</button>
                        </div>
                        <%
                              String mantFechaRango = sMantenimiento.buscarMantenimientosFechas("MantFechaInicial","MantFechaFinal");               
                        
                        %>
                    </div>
                </div>                   
                <!--Buscar-----> 
                <div class="tab-pane" id="blkNewMantenimientos">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="addMantenimiento" >
                                    <div class="form-group col-sm-5">
                                        <label for="MantNumOrden">Numero de Orden</label>
                                        <input required="true" type="text" class="form-control" id="MantNumOrden" name="MantNumOrden" placeholder="Ingrese el numero de Orden">
                                    </div> 
                                    <div class="form-group col-sm-5">
                                        <label for="MantDescripProblema">Descripcion del Problema</label>
                                        <input required="true" type="text" class="form-control" id="MantDescripProblema" name="MantDescripProblema" placeholder="Ingrese la Descripcion del Problema">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="MantDescripSolucion">Descripcion de la Solucion</label>
                                        <input required="true" type="text" class="form-control" id="MantDescripSolucion" name="MantDescripSolucion" placeholder="Ingrese la Descripcion de la Solucion">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="MantFechaIng">Fecha de Ingreso</label>
                                        <input data-date-format="DD MMMM YYYY" value="2020-07-20" required="true" type="date" class="form-control" id="MantFechaIng" name="MantFechaIng" placeholder="Ingrese la Fecha de Ingreso">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="MantFechaRevision">Fecha de Entrega</label>
                                        <input data-date-format="DD MMMM YYYY" value="2020-07-20" required="true" type="date" class="form-control" id="MantFechaRevision" name="MantFechaRevision" placeholder="Ingrese la Fecha de Revision">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="MantFechaEntrega">Fecha de Revision</label>
                                        <input data-date-format="DD MMMM YYYY" value="2020-07-20" required="true" type="date" class="form-control" id="MantFechaEntrega" name="MantFechaEntrega" placeholder="Ingrese la Fecha de Entrega">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="CedTecnId">Cedula del Tecnico</label>
                                        <input required="true" type="text" class="form-control" id="CedTecnId" name="CedTecnId" placeholder="Ingrese la cedula del Tecnico">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="BienId">Codigo del Bien</label>
                                        <input required="true" type="text" class="form-control" id="BienId" name="BienId" placeholder="Ingrese Codigo del Bien">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="TipId">Tipo de Mantenimiento</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='TipId' name='TipId'>
                                                    <%
                                                        for(Tipomantenimiento oTip : listTipoMantenimiento)
                                                        {
                                                            out.println("<option value='" + oTip.getTipId() + "'>"+ oTip.getTipDetalle() + "</option>");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        <!--<input required="true" type="text" class="form-control" id="TipId" name="TipId" placeholder="Ingrese Codigo del tipo de Mantenimiento">-->
                                    </div>
                                    <div class="form-group col-sm-2">
                                        <label class="col-sm-12">""</label><!--Estado</label>-->
                                        <div class="col-sm-12">
                                            <div class="control-inline onoffswitch">
                                                <!--<input type="checkbox" class="onoffswitch-checkbox" id="UbicaEstado" name="UbicaEstado" checked>
                                                <label class="onoffswitch-label" for="UbicaEstado">
                                                    <span class="onoffswitch-inner"></span>
                                                    <span class="onoffswitch-switch"></span>
                                                </label>-->
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="addMantenimiento()">Agregar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>
