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
        Persona objpersona = new Persona();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String cedula = request.getParameter("cedula");
                String datospersona = WSCentralizada.BuscarPersona(cedula);
                if (!datospersona.isEmpty()) {
                    JSONObject reqPerso = new JSONObject(datospersona);
                    objpersona.setPerId(reqPerso.getInt("per_id"));
                    objpersona.setPerCedula(cedula);
                    objpersona.setPerNombres(reqPerso.getString("per_nombres").replace("\"", ""));
                    objpersona.setPerApellido1(reqPerso.getString("per_primerApellido").replace("\"", ""));
                    objpersona.setPerApellido2(reqPerso.getString("per_segundoApellido").replace("\"", ""));
                    if ((reqPerso.getString("per_email").toString().equals("null")) || (reqPerso.getString("per_email").replace("\"", "").toString().equals(""))) {
                        objpersona.setPerEmail(" ");
                    } else {
                        objpersona.setPerEmail(reqPerso.getString("per_email").replace("\"", ""));
                    }
                    if ((reqPerso.getString("per_telefonoCelular").toString().equals("null")) || (reqPerso.getString("per_telefonoCelular").replace("\"", "").toString().equals(""))) {
                        objpersona.setPerTelefono(" ");
                    } else {
                        objpersona.setPerTelefono(reqPerso.getString("per_telefonoCelular").replace("\"", ""));
                    }

                }
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <script>
        $('#tb2').DataTable({
            "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]]
        });
    </script>
    <div class="tab-content">
        <div class="active tab-pane">
            <div class="row">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> Bienes.</h3> 
                    </div>
                    <div class="widget-content">
                        <div class="table-responsive">
                            <table  id="tb2" class="table table-sorting table-hover table-bordered datatable">
                                <thead>
                                    <tr>
                                        <th>Cédula</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  out.println("<tr>");
                                        out.println("<td>" + objpersona.getPerCedula() + "</td>");
                                        out.println("<td>" + objpersona.getPerNombres() + "</td>");
                                        out.println("<td>" + objpersona.getPerApellido1() + " " + objpersona.getPerApellido2() + "</td>");
                                    %>
                                    <!--INICIO BONOTES DE ACCION-->
                                <td align="center">
                                    <input class="form-check-input" type="radio" name="exampleRadios1" value="<%= objpersona.getPerNombres() + " " + objpersona.getPerApellido1() + " " + objpersona.getPerApellido2()%>">
                                </td> 
                                <!--FIN BONOTES DE ACCION-->
                                <%out.println("</tr>");
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>