<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%> 
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
        
        ArrayList<Auditoria> listAuditoria = new ArrayList<Auditoria>();
        Persona objPersona = new Persona();
        Traspaso objTraspaso = new Traspaso();
        
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serAuditoria = sAuditoria.listaTodosAuditoria();
                String resultadoAuditoria = "{\"respuesta\":" + serAuditoria + "}";
                JSONObject objAuditoria = new JSONObject(resultadoAuditoria);
                JSONArray arrayAuditoria = objAuditoria.getJSONArray("respuesta");
                for (int i = 0; i < arrayAuditoria.length(); i++) {
                    JSONObject childJSONObject = arrayAuditoria.getJSONObject(i);
                    Auditoria objMenus = new Gson().fromJson(childJSONObject.toString(), Auditoria.class);
                    listAuditoria.add(objMenus);
                }
                

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    
<script>
    $(document).ready(function () {
         $('table.display').DataTable();
    });
</script>    
    
    <div class="main-header">
        <h2>Auditorias</h2>
        <em>Auditorias registradas en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkUsuarios" data-toggle="tab">Inventarios</a></li>
                <li><a href="#blkAuditorias" data-toggle="tab">Traspasos</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkUsuarios">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Auditoria Inventario.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="" class="display table table-sorting table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Usuario</th>
                                                <th>Rol</th>
                                                <th>Proceso</th>
                                                <th>Fecha</th>
                                                <th>Hora</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Auditoria oPet : listAuditoria) {
                                                if(!oPet.getAudMetodo().equals("UPDATE_TRASPASO"))
                                                {
                                                    out.println("<tr>");
                                                        String cadPersonaId = sPersona.listaPersonaId(Integer.parseInt(oPet.getUsuId()));
                                                        JSONObject jsonPersona = new JSONObject(cadPersonaId);
                                                        objPersona = new Gson().fromJson(jsonPersona.toString(), Persona.class);
                                                    out.println("<td>" + objPersona.getPerNombres()+ " " + objPersona.getPerApellido1() + " " + objPersona.getPerApellido2() + "</td>");
                                                    out.println("<td>" + objPersona.getCarId().getCarDescripcion() + "</td>");
                                                    out.println("<td>" + oPet.getAudDetalle() + "</td>");
                                                        String[] parts = oPet.getAudFecha().split(" ");
                                                    out.println("<td>" + parts[0] + "</td>");
                                                    out.println("<td>" + parts[1] + "</td>");   
                                                    out.println("</tr>");
                                                }
                                            }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                        
                <div class="tab-pane" id="blkAuditorias">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Auditoria Traspaso.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="" class="display table table-sorting table-hover table-bordered">
                                       <thead>
                                             <tr>
                                                 <th>Usuario</th>
                                                 <th>Rol</th>
                                                 <th>Cod Bien</th>
                                                 <th>Bien</th>
                                                 <th>Fecha</th>
                                                 <th>Hora</th>
                                             </tr>
                                        </thead>
                                        <tbody>
                                             <%for (Auditoria oPet : listAuditoria) {
                                                 
                                                 if(oPet.getAudMetodo().equals("UPDATE_TRASPASO"))
                                                 {
                                                    out.println("<tr>");
                                                       String cadPersonaId = sPersona.listaPersonaId(Integer.parseInt(oPet.getUsuId()));
                                                       JSONObject jsonPersona = new JSONObject(cadPersonaId);
                                                       objPersona = new Gson().fromJson(jsonPersona.toString(), Persona.class);
                                                    out.println("<td>" + objPersona.getPerNombres()+ " " + objPersona.getPerApellido1() + " " + objPersona.getPerApellido2() + "</td>");
                                                    out.println("<td>" + objPersona.getCarId().getCarDescripcion() + "</td>");

                                                    /*TRASPASO*/
                                                       String cadTraspasoId = sTraspaso.listaTraspasoId(Integer.parseInt(oPet.getAudIp()));
                                                       JSONObject jsonTraspaso = new JSONObject(cadTraspasoId);
                                                       objTraspaso = new Gson().fromJson(jsonTraspaso.toString(), Traspaso.class);

                                                    out.println("<td>" + objTraspaso.getBnCodBien().getBnCodBien() + "</td>");
                                                    out.println("<td>" + objTraspaso.getBnCodBien().getBnNombre() + "</td>");
                                                       String[] parts = oPet.getAudFecha().split(" ");
                                                    out.println("<td>" + parts[0] + "</td>");
                                                    out.println("<td>" + parts[1] + "</td>");
                                                    out.println("</tr>");
                                                 }
                                            }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                                         
            </div>
        </div>
    </div>
</html>
