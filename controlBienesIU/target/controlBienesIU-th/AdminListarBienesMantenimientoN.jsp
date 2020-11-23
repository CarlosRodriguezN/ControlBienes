<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    <!--<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->
    <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
    <!--Tablas--> 
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
        String TecnicoActual = "";
        ArrayList<Mantenimientos> listMantenimiento = new ArrayList<Mantenimientos>();
        ArrayList<Tipomantenimiento> listTipoMantenimiento = new ArrayList<Tipomantenimiento>();
        ArrayList<Nivelmantenimiento> listNivelMantenimiento = new ArrayList<Nivelmantenimiento>();
        ArrayList<Persona> listPersona = new ArrayList<Persona>();
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
                //Obtener Registros del Tipo de Mantenimiento
                String serNivelMantenimiento = sNivelmantenimiento.listaTodosNivelMantenimiento();
                String resultadoNivelMantenimiento = "{\"respuesta\":" + serNivelMantenimiento + "}";
                JSONObject objNivelMantenimiento = new JSONObject(resultadoNivelMantenimiento);
                JSONArray arrayNivelMantenimiento = objNivelMantenimiento.getJSONArray("respuesta");
                for (int i = 0; i < arrayNivelMantenimiento.length(); i++) {
                    JSONObject childJSONObject = arrayNivelMantenimiento.getJSONObject(i);
                    Nivelmantenimiento objMenus = new Gson().fromJson(childJSONObject.toString(), Nivelmantenimiento.class);
                    listNivelMantenimiento.add(objMenus);
                }

                //Obtener Registros de Mantenimiento
                //String serMantenimiento = sMantenimiento.listaTodosMantenimientos();  
                String serMantenimiento = sMantenimientoN.listaTodosMantenimientos();
                String resultadoMantenimiento = "{\"respuesta\":" + serMantenimiento + "}";
                JSONObject objMantenimiento = new JSONObject(resultadoMantenimiento);
                JSONArray arrayMantenimiento = objMantenimiento.getJSONArray("respuesta");
                for (int i = 0; i < arrayMantenimiento.length(); i++) {
                    JSONObject childJSONObject = arrayMantenimiento.getJSONObject(i);
                    Mantenimientos objMenus = new Gson().fromJson(childJSONObject.toString(), Mantenimientos.class);
                    listMantenimiento.add(objMenus);
                }

                //Lista de Personas
                String resultadoPersona = "{\"respuesta\":" + sPersona.listaTodosPersona() + "}";
                JSONObject objPersona = new JSONObject(resultadoPersona);
                JSONArray arrayPersona = objPersona.getJSONArray("respuesta");
                for (int i = 0; i < arrayPersona.length(); i++) {
                    JSONObject childJSONObject = arrayPersona.getJSONObject(i);
                    Persona objMenus = new Gson().fromJson(childJSONObject.toString(), Persona.class);
                    listPersona.add(objMenus);
                }

                //tecnico actual
                for (Persona oPer : listPersona) {
                    if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {
                        TecnicoActual = oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2();
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
        function verOp() {
            $(document).ready(function () {
                seleccion = $("input[name='exampleRadios1']:checked").val();
                if (codigo !== "") {
                    separador = "_";
                    cadenaseparada = seleccion.split(separador);//separando las cadenas 
                    $("#bienId").val(cadenaseparada[0]);//cadena de cod de la pesona
                    $("#bienNombre").val(cadenaseparada[1]);//cadena de cedula y nombre
                } else {
                    alertErrorBusqueda(" Seleccione un bien ");
                }
            });
        }
        function find() {
            codigo = document.getElementsByName("search")[0].value;
            if (codigo === "") {
                alertErrorBusqueda(" Ingrese todos los campos de búsqueda ");
            } else {
                selectTipo = $("#selectTipo option:selected").val();
                verBienesEncontrados(codigo, selectTipo);
            }
        }
        $("#selectTipo").on("change", function () {
            var selectTipo = $("#selectTipo option:selected").val();
            valor = parseInt(selectTipo, 10);
            var selectTipoPlaceholder = "";
            if (valor === 0) {
                selectTipoPlaceholder = "Ingrese Código";
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
            todayDate();
//            var table = $('#tb').DataTable({
//                "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]],
//                buttons: ['copy', 'excel', 'pdf', 'csv', 'colvis']
//            });
//            table.buttons().container()
//                    .appendTo('#tb_wrapper .col-md-6:eq(0)');

            $('#tb').DataTable({
                "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]]
            });
            $('#tb3').DataTable({
                "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]]
            });
            $('#tb4').DataTable({
                "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]]
            });
            $('#tb5').DataTable({
                "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]]
            });
        });

        function validarAdd() {
            bien = document.getElementsByName("bienId")[0].value;
            descripcion = document.getElementsByName("MantDescripProblema")[0].value;
            tecnico = document.getElementsByName("NombreTecnicoIngreso")[0].value;
            if (bien !== "" && descripcion !== "" && tecnico !== "") {
                addMantenimientoN();
            } else {
                alertErrorValidacion(" Ingrese todos los campos ");
            }
        }
        function todayDate() {
            var date = new Date();

            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();

            if (month < 10)
                month = "0" + month;
            if (day < 10)
                day = "0" + day;

            var today = year + "-" + month + "-" + day;
            $("#MantFechaIng").attr("value", today);
        }
    </script>
    <div class="main-header">
        <h2>Mantenimientos</h2>
        <em>Mantenimientos registrados en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkMantenimientos" data-toggle="tab">Historial Mantenimientos</a></li>
                <li><a href="#blkNewMantenimientos" data-toggle="tab">Ingresar Mantenimiento</a></li>
                <li><a href="#blkAsignTecnicos" data-toggle="tab">Mantenimientos sin Asignar</a></li>
                <li><a href="#blkMantenimientosIngresados" data-toggle="tab">Mantenimientos Asignados</a></li>
                <li><a href="#blkMantenimientosRealizados" data-toggle="tab">Mantenimientos Realizados</a></li>
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
                                    <table id="tb" class="table table-sorting table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <!--   <th>Cod. Mantenimiento</th>-->
                                                <th>Numero Orden</th>
                                                <th>Cod. Bien</th>
                                                <!--<th>Bien</th>-->
                                                <th>Problema</th>
                                                <th>Solucion</th>
                                                <th>Tecnico</th>
                                                <th>Fecha Ingreso</th>
                                                <th>Fecha Revision</th>
                                                <th>Fecha Entrega</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Mantenimientos oPet : listMantenimiento) {
                                                    if (oPet.getMantEstado() == 3) {
                                                        String fechaI = oPet.getMantFechaIngreso().toString();
                                                        String fechaIF = fechaI.replaceAll("T00:00:00-05:00", "");
                                                        String fechaR = oPet.getMantFechaRevision().toString();
                                                        String fechaRF = fechaR.replaceAll("T00:00:00-05:00", "");
                                                        String fechaE = oPet.getMantFechaEntrega().toString();
                                                        String fechaEF = fechaE.replaceAll("T00:00:00-05:00", "");
                                                        out.println("<tr>");
                                                        out.println("<td>" + oPet.getMantNumOrden() + "</td>");
                                                        out.println("<td>" + oPet.getBienId().getBnCodBien() + "</td>");
//                                                        out.println("<td>" + oPet.getBienId().getBnNombre() + "</td>");
                                                        out.println("<td>" + oPet.getMantDescProblema() + "</td>");
                                                        out.println("<td>" + oPet.getMantDescSolucion() + "</td>");
                                                        out.println("<td>" + oPet.getMantTecnIngreso() + "</td>");
                                                        out.println("<td>" + fechaIF + "</td>");
                                                        out.println("<td>" + fechaRF + "</td>");
                                                        out.println("<td>" + fechaEF + "</td>");

                                            %>
                                            <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <!--                                            <div class="btn-group btn-group-xs">
                                                                                            <button type="button" class="btn btn-warning" title="Editar" onclick="PreEditUbicacion(<%= oPet.getMantId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                                                                        </div>-->
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-danger" title="Dejar Mantenimiento" onclick="quitarDeMantenimiento(<%= oPet.getMantId()%>)"><i class="fa fa-times" style="font-size: 17px;"></i></button>
                                            </div>   
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%            out.println("</tr>");
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
                <div class="tab-pane" id="blkMantenimientosIngresados">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Mantenimientos.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="tb3" class="table table-sorting table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <!--   <th>Cod. Mantenimiento</th>-->
                                                <th>Numero Orden</th>
                                                <th>Cod. Bien</th>
                                                <!--<th>Bien</th>-->
                                                <th>Problema</th>
                                                <th>Técnico Responsable</th>
                                                <th>Fecha Ingreso</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Mantenimientos oPet : listMantenimiento) {
                                                    if (oPet.getMantEstado() == 1 && oPet.getMantTecnRevision() != null) {
                                                        out.println("<tr>");
                                                        out.println("<td>" + oPet.getMantNumOrden() + "</td>");
                                                        out.println("<td>" + oPet.getBienId().getBnCodBien() + "</td>");
//                                                        out.println("<td>" + oPet.getBienId().getBnNombre() + "</td>");
                                                        out.println("<td>" + oPet.getMantDescProblema() + "</td>");
                                                        out.println("<td>" + oPet.getMantTecnRevision() + "</td>");
                                                        out.println("<td>" + oPet.getMantFechaIngreso() + "</td>");

                                            %>
                                            <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-primary" title="Reasignar Técnico" onclick="DetalleAsignarTecnicoMantenimiento(<%=oPet.getMantId()%>)"><i class="fa fa-arrow-circle-o-left" style="font-size: 17px;"></i></button>
                                            </div>
                                            <div class="btn-group btn-group-xs">
                                                <%if (TecnicoActual.equals(oPet.getMantTecnRevision())) {%>
                                                <button type="button" class="btn btn-success" title="Dar Servicio" onclick="DetalleMantenimiento(<%=oPet.getMantId()%>)"><i class="fa  fa-check-square" style="font-size: 17px;"></i></button>
                                                    <%}%>
                                            </div>
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%
                                                    out.println("</tr>");
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
                <div class="tab-pane" id="blkAsignTecnicos">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Mantenimientos.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="tb5" class="table table-sorting table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <!--   <th>Cod. Mantenimiento</th>-->
                                                <th>Numero Orden</th>
                                                <th>Cod. Bien</th>
                                                <th>Bien</th>
                                                <th>Problema</th>
                                                <th>Técnico</th>
                                                <!--<th>Fecha Ingreso</th>-->
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Mantenimientos oPet : listMantenimiento) {
                                                    if (oPet.getMantEstado() == 1 && oPet.getMantTecnRevision() == null) {
                                                        out.println("<tr>");
                                                        out.println("<td>" + oPet.getMantNumOrden() + "</td>");
                                                        out.println("<td>" + oPet.getBienId().getBnCodBien() + "</td>");
                                                        out.println("<td>" + oPet.getBienId().getBnNombre() + "</td>");
                                                        out.println("<td>" + oPet.getMantDescProblema() + "</td>");
                                                        out.println("<td>" + oPet.getMantTecnIngreso() + "</td>");
//                                                        out.println("<td>" + oPet.getMantFechaIngreso() + "</td>");

                                            %>
                                            <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-success" title="Asignar Técnico" onclick="DetalleAsignarTecnicoMantenimiento(<%=oPet.getMantId()%>)"><i class="fa fa-user-circle" style="font-size: 17px;"></i></button>
                                            </div>
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%            out.println("</tr>");
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
                <div class="tab-pane" id="blkMantenimientosRealizados">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Mantenimientos.</h3> 
                            </div>
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="tb4" class="table table-sorting table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Numero Orden</th>
                                                <th>Cod. Bien</th>
                                                <!--<th>Bien</th>-->
                                                <th>Problema</th>
                                                <th>Solución</th>
                                                <th>Técnico Revision</th>
                                                <!--<th>Fecha Ingreso</th>-->
                                                <th>Fecha Revisión</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Mantenimientos oPet : listMantenimiento) {
                                                    if (oPet.getMantEstado() == 2) {
                                                        out.println("<tr>");
                                                        out.println("<td>" + oPet.getMantNumOrden() + "</td>");
                                                        out.println("<td>" + oPet.getBienId().getBnCodBien() + "</td>");
//                                                        out.println("<td>" + oPet.getBienId().getBnNombre() + "</td>");
                                                        out.println("<td>" + oPet.getMantDescProblema() + "</td>");
                                                        out.println("<td>" + oPet.getMantDescSolucion() + "</td>");
                                                        out.println("<td>" + oPet.getMantTecnIngreso() + "</td>");
//                                                        out.println("<td>" + oPet.getMantFechaIngreso() + "</td>");
                                                        out.println("<td>" + oPet.getMantFechaRevision() + "</td>");

                                            %>
                                            <!--INICIO BONOTES DE ACCION-->
                                        <td align="center"> 
                                            <div class="btn-group btn-group-xs">
                                                <button type="button" class="btn btn-success" title="Realizar Entrega" onclick="DetalleEntrega(<%=oPet.getMantId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                            </div> 
                                        </td>
                                        <!--FIN BONOTES DE ACCION-->

                                        <%            out.println("</tr>");
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
                <!-- Modales----------

                    Modal de Bienes -->
                <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <h1>Buscar Bien</h1>
                                    <form class="navbar-form " role="search">
                                        <div class="form-group">
                                            <select id="selectTipo" class="form-control" name="select">
                                                <option value="0">Por Código</option> 
                                                <option value="1">Por Nombre</option>
                                                <option value="2">Por Serie</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input id="search" type="text" class="form-control" name="search" placeholder="Ingrese Código">
                                        </div>
                                        <button type="button" class="btn btn-default" onclick="find();">Buscar</button>
                                    </form>
                                    <div id="modalBien">

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
                <!--Agregar Mantenimiento-----> 
                <div class="tab-pane" id="blkNewMantenimientos">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="addMantenimiento" >
                                    <div class="form-group col-sm-5">
                                        <label>Seleccionar Bien</label>
                                        <button  type='button' class='btn btn-primary' data-toggle="modal" data-target="#miModal">Buscar Bien</button>
                                    </div>
                                    <div class="form-group col-sm-5">    
                                        <label for="bienId">Código del Bien</label>
                                        <input required="true" type="text" class="form-control" id="bienId" name="bienId" placeholder="Código del Bien" readonly>
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="MantDescripProblema">Descripcion del Problema</label>
                                        <textarea  required="true" class="form-control" id="MantDescripProblema" name="MantDescripProblema" placeholder="Ingrese la Descripcion del Problema"></textarea>
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="MantFechaIng">Fecha de Ingreso</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="MantFechaIng" name="MantFechaIng" placeholder="Ingrese la Fecha de Ingreso" readonly>
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="NombreTecnico">Técnico Ingreso</label>
                                        <input value="<% if (session.getAttribute("ingreso").toString().equals("true")) {
                                                for (Persona oPer : listPersona) {
                                                    if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {
                                                        out.println(oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2());
                                                    }
                                                }
                                            }
                                               %>" 
                                               required="true" type="text" class="form-control" id="NombreTecnicoIng" name="NombreTecnicoIngreso" readonly>
                                    </div>

                                    <div class="form-group col-sm-5">
                                        <label for="TipId">Tipo de Mantenimiento</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='TipId' name='TipId'>
                                                <%for (Tipomantenimiento oTip : listTipoMantenimiento) {
                                                        out.println("<option value='" + oTip.getTipId() + "'>" + oTip.getTipDetalle() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="NivId">Tipo de Servicio</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='NivId' name='NivId'>
                                                <%for (Nivelmantenimiento oNiv : listNivelMantenimiento) {
                                                        if (oNiv.getNivelEstado() == 1) {
                                                            out.println("<option value='" + oNiv.getNivelId() + "'>" + oNiv.getNivelDescripcion() + "</option>");
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                                <div class="col-sm-12" align='center'>
                                    <button  type='button' class='btn btn-primary' onclick="validarAdd()">Agregar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>
