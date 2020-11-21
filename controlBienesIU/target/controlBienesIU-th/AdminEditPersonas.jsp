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
        String OnOff = "";
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        Persona objPersona = new Persona();
        ArrayList<Cargo> listCargo = new ArrayList<Cargo>();
        if (session.getAttribute("ingreso").toString().equals("true")) {
            String idDato = request.getParameter("idDato");
            String serPersona = sPersona.listaPersonaId(Integer.parseInt(idDato));
            JSONObject req = new JSONObject(serPersona);
            objPersona = new Gson().fromJson(req.toString(), Persona.class);
            if (objPersona.getPerEstado().equals(1)) {
                OnOff = "checked";
            }

            //Lista de cargos ACTIVOS
            String serCargo = sCargo.soloactivos();
            String resultadoCargo = "{\"respuesta\":" + serCargo + "}";
            JSONObject objPerio = new JSONObject(resultadoCargo);
            JSONArray arrayCargo = objPerio.getJSONArray("respuesta");
            for (int i = 0; i < arrayCargo.length(); i++) {
                JSONObject childJSONObject = arrayCargo.getJSONObject(i);
                Cargo objMenus = new Gson().fromJson(childJSONObject.toString(), Cargo.class);
                listCargo.add(objMenus);
            }

        } else {
            response.sendRedirect("index.jsp");
        }

    %>


    <div class="main-header">
        <h2>Tipos de Personas</h2>
        <em>Tipos de Personas registradas en el sistema.</em>
    </div>




    <div class="main-content">
        <div class="well well-lg knowledge-recent-popular">
            <div class="row">

                <form role="form" id="FrmEditPersona">
                    <div class="form-group col-sm-4">
                        <label for="CedulaPersona">Cedula</label>
                        <input value="<%= objPersona.getPerCedula()%>" readonly required="true" type="text" class="form-control" id="CedulaPersona" name="CedulaPersona" placeholder="Ingrese el detalle de la baja">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="NombrePersona">Apellidos y Nombres</label>
                        <input value="<%= objPersona.getPerApellido1()%> <%= objPersona.getPerApellido2()%> <%= objPersona.getPerNombres()%>" readonly required="true" type="text" class="form-control" id="NombrePersona" name="NombrePersona" placeholder="Ingrese el detalle de la baja">
                    </div>

                    <div class="form-group col-sm-4">
                        <label for="EmailPersona">Email</label>
                        <input value="<%= objPersona.getPerEmail()%>" required="true" type="text" class="form-control" id="EmailPersona" name="EmailPersona" placeholder="Ingrese el detalle de la baja">
                    </div>
                    <div class="form-group col-md-4" >
                        <label>Cargo</label>
                        <div class="caja">
                            <select class='form-control Recursos' id='CargoPersona' name='CargoPersona'>
                                <%
                                    out.println("<option value='" + objPersona.getCarId().getCarId() + "'>" + objPersona.getCarId().getCarDescripcion() + "</option>");
                                    for (Cargo oPet : listCargo) {
                                        if (oPet.getCarId() != objPersona.getCarId().getCarId()) {
                                            out.println("<option value='" + oPet.getCarId() + "'>" + oPet.getCarDescripcion() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-5">
                        <label for="TelefonoPersona">Telefono</label>
                        <input value="<%= objPersona.getPerTelefono()%>" required="true" type="text" class="form-control" id="TelefonoPersona" name="TelefonoPersona" placeholder="Ingrese el detalle de la baja">
                    </div>
                    <div class="form-group col-sm-2">
                        <label class="col-sm-12">Estado</label>
                        <div class="col-sm-12">
                            <div class="control-inline onoffswitch">
                                <input type="checkbox" class="onoffswitch-checkbox" id="EstPersona" name="EstPersona" <%out.println(OnOff);%>>
                                <label class="onoffswitch-label" for="EstPersona">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="col-sm-12" align='center'>
                    <button  class='btn btn-danger' onclick="verUsuarios(), alertCancel()"><i class="fa fa-times"></i>Cancelar</button>
                    <button  class='btn btn-primary' onclick="EditarUsuario(<%= objPersona.getPerId()%>)"><i class="fa fa-check-circle"></i>Editar</button>
                </div>
            </div>
        </div>

    </div>

</html>