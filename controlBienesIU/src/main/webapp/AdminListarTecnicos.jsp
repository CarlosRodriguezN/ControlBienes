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
        ArrayList<Tecnico> listTecnico = new ArrayList<Tecnico>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serTecnico = sTecnico.listaTodosTecnicos();
                //serTecnico =  "[{\"tecTelefono\":\"telef1\"," + "\"tecDepartamento\":\"dep1\","
                  //              + "\"tecNombre\":\"nomb1\","+ "\"tecId\":1}]";
                
                //Lista de idiomas de la persona seleccionada
                String resultadoTecnico = "{\"respuesta\":" + serTecnico + "}";
                JSONObject objTecnico = new JSONObject(resultadoTecnico);
                JSONArray arrayTecnico = objTecnico.getJSONArray("respuesta");
                for (int i = 0; i < arrayTecnico.length(); i++) {
                    JSONObject childJSONObject = arrayTecnico.getJSONObject(i);
                    Tecnico objMenus = new Gson().fromJson(childJSONObject.toString(), Tecnico.class);
                    listTecnico.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Tecnicos</h2>
        <em>Tecnicos registrados en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkTecnico" data-toggle="tab">Tecnicos</a></li>
                <li><a href="#blkNewTecnico" data-toggle="tab">Agregar nuevo</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkTecnico">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Tecnico.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Tecnico</th>
                                                <th>Cedula</th>
                                                <th>Departamento</th>
                                                <th>Telefono</th>
                                                <th>Accion</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Tecnico oPet : listTecnico) {

                                                    out.println("<tr>");
                                                    out.println("<td>" + oPet.getTecId() + "</td>");
                                                    out.println("<td>" + oPet.getTecCedula() + "</td>");
                                                    out.println("<td>" + oPet.getTecNombre() + "</td>");
                                                    out.println("<td>" + oPet.getTecDepartamento() + "</td>");
                                                    out.println("<td>" + oPet.getTecTelefono() + "</td>");

                                                    
                                                    /*if (oPet.getUbEstado() == 1) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                    }
                                                    if (oPet.getUbEstado() == 2) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                    }
                                                    if (oPet.getUbEstado() == 3) {
                                                        out.println("<td align='center'> <span class='badge badge-pill badge-warning'>Bloqueado</span> </td>");
                                                    }*/


                                            %>
                                        <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-warning" title="Editar" onclick="PreEditUbicacion(<%= oPet.getTecId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                            </div>
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-primary" title="Eliminar Tecnico" onclick="deleteTecnico(<%= oPet.getTecId()%>)"><i class="fa fa-times" style="font-size: 17px;"></i></button>
                                            </div>  
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%                                                    out.println("</tr>");

                                            }%>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="blkNewTecnico">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="addTecnico" >
                                    <div class="form-group col-sm-10">
                                        <label for="TecCedula">Cedula</label>
                                        <input required="true" type="text" class="form-control" id="TecCedula" name="TecCedula" placeholder="Ingrese el numero de Cedula">
                                        <label for="TecNombre">Nombre</label>
                                        <input required="true" type="text" class="form-control" id="TecNombre" name="TecNombre" placeholder="Ingrese el nombre del Tecnico">
                                        <label for="TecDepart">Departamento</label>
                                        <input required="true" type="text" class="form-control" id="TecDepart" name="TecDepart" placeholder="Ingrese el departamento">
                                        <label for="TecTelef">Telefono</label>
                                        <input required="true" type="text" class="form-control" id="TecTelef" name="TecTelef" placeholder="Ingrese el telefono">
                                    </div>
                                    
                                    <div class="form-group col-sm-2">
                                        <label class="col-sm-12">""</label><!--Estado</label>-->
                                        <div class="col-sm-12">
                                            <div class="control-inline onoffswitch">
                                                <!--<input type="checkbox" class="onoffswitch-checkbox" id="TecEstado" name="TecEstado" checked>
                                                <label class="onoffswitch-label" for="TecEstado">
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
                            <button  type='button' class='btn btn-primary' onclick="addTecnico()">Agregar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>

