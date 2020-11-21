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
        String idMant = request.getParameter("idMant");
        Mantenimientos oMantenimiento = new Mantenimientos();
        ArrayList<Persona> listPersona = new ArrayList<Persona>();

        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serMantenimiento = "";
                serMantenimiento = sMantenimientoN.DetallesMantenimiento(idMant);
                JSONObject objMant = new JSONObject(serMantenimiento);
                oMantenimiento = new Gson().fromJson(objMant.toString(), Mantenimientos.class);

                //Lista de Personas
                String resultadoPersona = "{\"respuesta\":" + sPersona.listaTodosPersona() + "}";
                JSONObject objPersona = new JSONObject(resultadoPersona);
                JSONArray arrayPersona = objPersona.getJSONArray("respuesta");
                for (int i = 0; i < arrayPersona.length(); i++) {
                    JSONObject childJSONObject = arrayPersona.getJSONObject(i);
                    Persona objMenus = new Gson().fromJson(childJSONObject.toString(), Persona.class);
                    listPersona.add(objMenus);
                }
            } else {
                System.out.println("primero -----------------");
                response.sendRedirect("index.jsp");
            }
        } else {
            System.out.println("segundo -----------------");
            response.sendRedirect("index.jsp");
        }
    %>
    <script>
        $(document).ready(function () {
            var date = new Date();

            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();

            if (month < 10)
                month = "0" + month;
            if (day < 10)
                day = "0" + day;

            var today = year + "-" + month + "-" + day;
            $("#MantFechaRev").attr("value", today);
        });
        function validarEntrega(codigo) {
            DescSolucion = document.getElementsByName("DescSolucion")[0].value;
            if (DescSolucion !== "") {
                DarServicioMantenimiento(codigo);
            } else {
                alertErrorValidacion(" Ingrese todos los campos ");
            }
        }
    </script>
    <div class="main-header">
        <h2>Mantenimientos</h2>
        <em>Mantenimientos registrados en el sistema.</em>
    </div>
    <div class="main-content">
        <div class="well well-lg knowledge-recent-popular">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nro de Orden</label>
                <div class="col-sm-10">
                    <label class="col-sm-2 col-form-label"><%=oMantenimiento.getMantNumOrden()%></label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nombre del Bien</label>
                <div class="col-sm-10">
                    <label class="col-sm-2 col-form-label"><%=oMantenimiento.getBienId().getBnNombre()%></label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Fecha de Ingreso del Mantenimiento</label>
                <div class="col-sm-10">
                    <label class="col-sm-2 col-form-label"><%=oMantenimiento.getMantFechaIngreso()%></label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Descripcion del Problema</label>
                <div class="col-sm-10">
                    <label class="col-sm-2 col-form-label"><%=oMantenimiento.getMantDescProblema()%></label>
                </div>
            </div>
            <form role="form" id="FrmDarServicio">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Descripción de la Solución</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" placeholder="Descripción de la Solución" name="DescSolucion"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="form-group col-sm-5">
                        <label for="MantFechaRevision">Fecha de Revisión</label>
                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="MantFechaRev" name="MantFechaRev" readonly>
                    </div>
                </div>
            </form>
            <div class="form-group row">
                <div class="col-sm-12" align='center'>
                    <button  class='btn btn-danger' onclick="verTodosBienesMantenimientos(), alertCancel()"><i class="fa fa-times"></i>Cancelar</button>
                    <button  class='btn btn-primary' onclick="validarEntrega(<%=oMantenimiento.getMantId()%>)"><i class="fa fa-check-circle"></i>Guardar</button>
                </div>
            </div>
        </div>

    </div>

</html>