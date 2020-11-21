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
        function verOp() {
            $(document).ready(function () {
                seleccion = $("input[name='exampleRadios1']:checked").val();
                $("#nombresRes").val(seleccion);//cadena de cod de la pesona
            });
        }
        function find() {
            codigo = document.getElementsByName("search")[0].value;
            if (codigo === "") {
                alertErrorBusqueda(" Ingrese todos los campos de búsqueda ");
            } else {
                selectTipo = $("#selectTipo option:selected").val();
                verPersonaEncontradas(codigo, selectTipo);
            }
        }
        $("#selectTipo").on("change", function () {
            var selectTipo = $("#selectTipo option:selected").val();
            valor = parseInt(selectTipo, 10);
            var selectTipoPlaceholder = "";
            if (valor === 0) {
                selectTipoPlaceholder = "Ingrese Cédula";
            }
            if (valor === 1) {
                selectTipoPlaceholder = "Ingrese Nombre";
            }
            if (valor === 2) {
                selectTipoPlaceholder = "Ingrese Serie";
            }
            $("#search").attr("placeholder", selectTipoPlaceholder);
        });
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
            $("#MantFechaEnt").attr("value", today);
        });
        function validarEntrega(codigo) {
            responsable = document.getElementsByName("nombresRes")[0].value;
            if (responsable !== "") {
                EntregarEquipoMantenimiento(codigo);
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
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Fecha de Realización del Mantenimiento</label>
                <div class="col-sm-10">
                    <label class="col-sm-2 col-form-label"><%=oMantenimiento.getMantFechaRevision()%></label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Descripcion de la Solución</label>
                <div class="col-sm-10">
                    <label class="col-sm-2 col-form-label"><%=oMantenimiento.getMantDescSolucion()%></label>
                </div>
            </div>
            <form role="form" id="FrmEntrega">
                <div class="form-group row">
                    <div class="form-group col-sm-5">
                        <label for="MantFechaEnt">Fecha de Entrega</label>
                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="MantFechaEnt" name="MantFechaEnt" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="form-group col-sm-5">
                        <label for="NombreTecnicoEntrega">Técnico Entrega</label>
                        <input value="<%if (session.getAttribute("ingreso").toString().equals("true")) {
                                for (Persona oPer : listPersona) {
                                    if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {
                                        out.println(oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2());
                                    }
                                }
                            }
                               %>" 
                               required="true" type="text" class="form-control" id="NombreTecnicoEntrega" name="NombreTecnicoEntrega" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="form-group col-sm-5">
                        <label>Seleccionar Responsable</label>
                        <button  type='button' class='btn btn-primary' data-toggle="modal" data-target="#miModalU">Buscar Persona</button>
                        <input id="nombresRes" type="text" class="form-control" name="nombresRes" placeholder="Busque Responsable" readonly>
                    </div>
                </div>
            </form>
            <!--Modal-->
            <div class="modal fade" id="miModalU" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" style="width:800px;" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div id="alertdtic">
                                </div>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id ="formBienes">  
                            <div class="modal-body" id="contenido">
                                <h1>Buscar Personas</h1>
                                <form class="navbar-form " role="search">
                                    <div class="form-group">
                                        <select id="selectTipo" class="form-control" name="select">
                                            <option value="0">Por Cédula</option> 
                                            <!--                                            <option value="1">Por Nombre</option>
                                                                                        <option value="2">Por Serie</option>-->
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input id="search" type="text" class="form-control" name="search" placeholder="Ingrese Cédula">
                                    </div>
                                    <button type="button" class="btn btn-default" onclick="find()">Buscar</button>
                                </form>
                                <div id="modalPersonas">

                                </div>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>-->
                            <button type="button" id="btnElegPer" class="btn btn-primary" data-dismiss="modal" onclick="verOp()">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div> 
            <div class="form-group row">
                <div class="col-sm-12" align='center'>
                    <button  class='btn btn-danger' onclick="verTodosBienesMantenimientos(), alertCancel()"><i class="fa fa-times"></i>Cancelar</button>
                    <button  class='btn btn-primary' onclick="validarEntrega(<%=oMantenimiento.getMantId()%>)"><i class="fa fa-check-circle"></i>Guardar</button>
                </div>
            </div>
        </div>

    </div>

</html>