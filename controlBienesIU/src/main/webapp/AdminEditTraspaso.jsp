<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <script src="js/validacion.js" type="text/javascript"></script>
        <link href="js/css/jquery.loadingModal.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/css/dtic.css" rel="stylesheet" type="text/css"/>


    <%
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        String traCodigo = request.getParameter("traCodigo");
        String bnCodigo = request.getParameter("bnCodigo");
        
        ArrayList<Traspaso> listTraspaso = new ArrayList<Traspaso>();
        ArrayList<Persona> listPersona = new ArrayList<Persona>();
        ArrayList<Dependencia> listDependencia = new ArrayList<Dependencia>();
        ArrayList<Ubicacion> listUbicacion = new ArrayList<Ubicacion>();
        Bien objBien = new Bien();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                
                /*TRASPASO*/
                Traspaso objTraspaso = new Traspaso();
                String servNombreTraspaso = sTraspaso.listaTraspasoId(Integer.parseInt(traCodigo));
                JSONObject reqTraspaso = new JSONObject(servNombreTraspaso);
                objTraspaso = new Gson().fromJson(reqTraspaso.toString(), Traspaso.class);
                
                /*BIEN*/
                String servNombreBien = sBien.listaBienId(bnCodigo);
                JSONObject reqBien = new JSONObject(servNombreBien);
                objBien = new Gson().fromJson(reqBien.toString(), Bien.class);
                
                //Lista de Personas
                String resultadoPersona = "{\"respuesta\":" + sPersona.listaTodosPersona() + "}";
                JSONObject objPersona = new JSONObject(resultadoPersona);
                JSONArray arrayPersona = objPersona.getJSONArray("respuesta");
                for (int i = 0; i < arrayPersona.length(); i++) {
                    JSONObject childJSONObject = arrayPersona.getJSONObject(i);
                    Persona objMenuPer = new Gson().fromJson(childJSONObject.toString(), Persona.class);
                     listPersona.add(objMenuPer);
                }
                
                //Lista de dependencias
                String resultadoDependencia = "{\"respuesta\":" + sDependencia.listaTodosDependencia() + "}";
                JSONObject objDependencia = new JSONObject(resultadoDependencia);
                JSONArray arrayDependencia = objDependencia.getJSONArray("respuesta");
                for (int i = 0; i < arrayDependencia.length(); i++) {
                    JSONObject childJSONObject = arrayDependencia.getJSONObject(i);
                    Dependencia objMenuDep = new Gson().fromJson(childJSONObject.toString(), Dependencia.class);
                    listDependencia.add(objMenuDep);
                }
                
                //Lista de ubicacion
                String resultadoUbicacion = "{\"respuesta\":" + sUbicacion.listaTodosUbicacion() + "}";
                JSONObject objUbicacion = new JSONObject(resultadoUbicacion);
                JSONArray arrayUbicacion = objUbicacion.getJSONArray("respuesta");
                for (int i = 0; i < arrayUbicacion.length(); i++) {
                    JSONObject childJSONObject = arrayUbicacion.getJSONObject(i);
                    Ubicacion objMenuUbic = new Gson().fromJson(childJSONObject.toString(), Ubicacion.class);
                    listUbicacion.add(objMenuUbic);
                }
                
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
       
    <div class="main-header">
        <h2>Traspaso Bienes</h2>
        <em>Cambio de Custodio.</em>
    </div>

    <div class="main-content">

        <div class="row">
            <div class="col-lg-6">
                <form id ="FrmTraspPersona"> 
                    <div class="widget widget-table">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> Usuarios.</h3> 
                        </div>
                        <div class="widget-content">
                            <div class="table-responsive">
                                <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                    <thead>
                                        <tr>
                                            <th>Cedula custodio</th>
                                            <th>Nombre</th>
                                            <th>Item</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Persona oPet : listPersona) {
                                                    out.println("<tr>");
                                                    out.println("<td>" + oPet.getPerCedula() + "</td>");
                                                    out.println("<td>" + oPet.getPerNombres() +" "+ oPet.getPerApellido1() +" "+ oPet.getPerApellido2() + "</td>");
                                        %>
                                    <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="form-check">

                                                <input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios1" value="<%= oPet.getPerId() %>" checked>  
                                                <label class="form-check-label" for="exampleRadios1"></label>
                                            </div>
                                        </td> 
                                          </tr>    
                                    <%
                                     }
                                    %>    
                                    </tbody>                                       
                                </table>                                          
                            </div>
                        </div>
                    </div>
                </form>
            </div>
                                
            <div class="col-lg-6">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> Cambio.</h3> 
                    </div>
                    <div class="widget-content">
                        <form id ="FrmTraspCustodio">                               
                            <div class="form-group col-sm-8">
                                <label for="bienDependenciaId">Dependencia</label>
                                <div class="caja">
                                    <select class='form-control Recursos' id='bienDependenciaId' name='bienDependenciaId'>
                                         <%
                                            out.println("<option value='" + objBien.getDpId().getDpId() + "'>" + objBien.getDpId().getDpDescripcion() + "</option>");
                                            for (Dependencia oPet : listDependencia) {
                                                if(oPet.getDpId() != objBien.getDpId().getDpId()){
                                                    out.println("<option value='" + oPet.getDpId() + "'>" + oPet.getDpDescripcion() + "</option>");
                                                }
                                            }
                                         %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-sm-8">
                                <label for="bienUbicacionId">Ubicacion</label>
                                <div class="caja">
                                    <select class='form-control Recursos' id='bienUbicacionId' name='bienUbicacionId'>
                                        <%
                                           out.println("<option value='" + objBien.getUbId().getUbId() + "'>" + objBien.getUbId().getUbDescripcion() + "</option>");
                                            for (Ubicacion oPet : listUbicacion) {
                                                if(oPet.getUbId() != objBien.getUbId().getUbId()){
                                                    out.println("<option value='" + oPet.getUbId() + "'>" + oPet.getUbDescripcion() + "</option>");
                                                }
                                            }

                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-sm-12">
                                <div class="form-group ">
                                    <label for="trasObservacion">Observacion</label>
                                        <textarea value="" required="true" type="text" class="form-control" id="trasObservacion" name="trasObservacion" placeholder="Ingrese alguna Oservacion"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>   
        <div class="form-group row">
            <div class="col-sm-12" align='center'>
                <button  class='btn btn-danger' onclick="verTodosBienes(), alertCancel()"><i class="fa fa-times"></i>Cancelar</button>
                <button  class='btn btn-primary' onclick="editarTrasCustodio(<%=traCodigo %>,<%=bnCodigo %>)"><i class="fa fa-check-circle"></i>Guardar</button>
            </div>
        </div>
    </div>

</html>
