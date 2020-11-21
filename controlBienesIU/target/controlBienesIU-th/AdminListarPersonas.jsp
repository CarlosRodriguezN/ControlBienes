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
        ArrayList<Persona> listPersona = new ArrayList<Persona>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serPersona = sPersona.listaTodosPersona();

                //Lista de idiomas de la persona seleccionada
                String resultadoPersona = "{\"respuesta\":" + serPersona + "}";
                JSONObject objPerso = new JSONObject(resultadoPersona);
                JSONArray arrayPerso = objPerso.getJSONArray("respuesta");
                for (int i = 0; i < arrayPerso.length(); i++) {
                    JSONObject childJSONObject = arrayPerso.getJSONObject(i);
                    Persona objMenus = new Gson().fromJson(childJSONObject.toString(), Persona.class);
                    listPersona.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Usuarios</h2>
        <em>Usuarios inscritos en la plataforma.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkUsuarios" data-toggle="tab">Usuarios</a></li>
                <li><a href="#blkAddUsuarios" data-toggle="tab">Importar usuarios al sistema</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkUsuarios">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Usuarios.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                        <thead>
                                            <tr>
                                                <th>Cédula</th>
                                                <th>Nombres</th>
                                                <th>Apellido paterno</th>
                                                <th>Apellido materno</th>
                                                <th>Correoelectrónico</th>
                                                <th>Teléfono</th>
                                                <th>Cargo</th>
                                                <th>Estado</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Persona oPet : listPersona) {
                                                    if (!oPet.getPerId().equals(Integer.parseInt(UsuLinea))) {
                                                        out.println("<tr>");
                                                        out.println("<td>" + oPet.getPerCedula() + "</td>");
                                                        out.println("<td>" + oPet.getPerNombres() + "</td>");
                                                        out.println("<td>" + oPet.getPerApellido1() + "</td>");
                                                        out.println("<td>" + oPet.getPerApellido2() + "</td>");
                                                        out.println("<td>" + oPet.getPerEmail() + "</td>");
                                                        out.println("<td>" + oPet.getPerTelefono() + "</td>");
                                                        out.println("<td>" + oPet.getCarId().getCarDescripcion() + "</td>");
                                                        if (oPet.getPerEstado() == 1) {
                                                            out.println("<td align='center'> <span class='badge badge-pill badge-success'>Activo</span> </td>");
                                                        }
                                                        if (oPet.getPerEstado() == 2) {
                                                            out.println("<td align='center'> <span class='badge badge-pill badge-danger'>Bloqueado</span> </td>");
                                                        }
                                                        if (oPet.getPerEstado() == 3) {
                                                            out.println("<td align='center'> <span class='badge badge-pill badge-warning'>Eliminado</span> </td>");
                                                        }


                                            %>
                                        <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-warning" title="Editar" onclick="PreEdiUsuario(<%= oPet.getPerId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                                <!--INICIO IF PARA ACTIVAR-->
                                                <%if (oPet.getPerEstado() == 2) {%>
                                                <button type="button" class="btn btn-primary" title="Habilitar" onclick="estUsuarios(<%= oPet.getPerId()%>, 1)"><i class="fa fa-check-circle" style="font-size: 17px;"></i></button>
                                                    <%}%>
                                                <!--FIN IF PARA ACTIVAR-->
                                                <!--INICIO IF PARA DESABILITAR-->
                                                <%if (oPet.getPerEstado() == 1) {%>
                                                <button type="button" class="btn btn-primary" title="Desabilitar" onclick="estUsuarios(<%= oPet.getPerId()%>, 2)"><i class="fa fa-times" style="font-size: 17px;"></i></button>
                                                    <%}%>
                                                <!--FIN IF PARA DESABILITAR-->
                                            </div>
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%                                                    out.println("</tr>");
                                                }
                                            }%>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane" id="blkAddUsuarios">
                    <div class="row">
                        <form role="form" id="FrmIngUsuarios">
                            <p class="lead">Por favor ingrese los números de cédula sin guión de los usuarios separados por una coma(,) para almacenarlos en el sistema.</p>
                            </br>
                            <div class="col-md-12" align='center'>

                                <div class="col-sm-12">
                                    <textarea class="form-control"  name="ingCed" id="ingCed" rows="5" cols="30" placeholder="Ingrese los numeros de cédula" style="width: 600px; height: 197px;" autofocus></textarea>
                                </div>
                                <div class="col-md-12" align='center'>
                                    <button  type='button' class='btn btn-primary' onclick="AddUsuarios()" >Agregar usuarios</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>