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
    <!--    <script src="assets/js/plugins/datatable/jquery.dataTables.min.js"></script>
        <script src="assets/js/plugins/datatable/exts/dataTables.colVis.bootstrap.js"></script>
        <script src="assets/js/plugins/datatable/exts/dataTables.colReorder.min.js"></script>
        <script src="assets/js/plugins/datatable/exts/dataTables.tableTools.min.js"></script>
        <script src="assets/js/plugins/datatable/dataTables.bootstrap.js"></script>
        <script src="assets/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
        <script src="assets/js/plugins/jqgrid/i18n/grid.locale-en.js"></script>
        <script src="assets/js/plugins/jqgrid/jquery.jqGrid.fluid.js"></script>
        <script src="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
        <script src="assets/js/king-table.js"></script>-->

    <script src="js/jquery.loadingModal.min.js" type="text/javascript"></script>
    <link href="js/css/jquery.loadingModal.min.css" rel="stylesheet" type="text/css"/>



    <%
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();

        ArrayList<Tipomantenimiento> listTipoMantenimiento = new ArrayList<Tipomantenimiento>();
        ArrayList<Tecnico> listTecnico = new ArrayList<Tecnico>();
        ArrayList<Persona> listPersona = new ArrayList<Persona>();
        ArrayList<String> versionSO = new ArrayList<String>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {

                //Lista de Personas
                String resultadoPersona = "{\"respuesta\":" + sPersona.listaTodosPersona() + "}";
                JSONObject objPersona = new JSONObject(resultadoPersona);
                JSONArray arrayPersona = objPersona.getJSONArray("respuesta");
                for (int i = 0; i < arrayPersona.length(); i++) {
                    JSONObject childJSONObject = arrayPersona.getJSONObject(i);
                    Persona objMenus = new Gson().fromJson(childJSONObject.toString(), Persona.class);
                    listPersona.add(objMenus);
                }

                String version = "{\"respuesta\":" + sMantenimientoN.listaVerSo() + "}";
                JSONObject objversion = new JSONObject(version);
                JSONArray arrayversion = objversion.getJSONArray("respuesta");
                System.out.println(arrayversion);
                for (int i = 0; i < arrayversion.length(); i++) {
                    versionSO.add(arrayversion.getString(i));
                }

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

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="main-header">
        <h2>Historiales</h2>
        <em>Historial de Mantenimientos registrados en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#rprtBienesMantenimientoGeneral" data-toggle="tab">General</a></li>
                <li><a href="#blkHistorialMant" data-toggle="tab">Por Técnico</a></li>
                <li><a href="#rprtBienesMantenimiento" data-toggle="tab">Por Bien</a></li>
                <li><a href="#rprtBienesMantenimientoPreventivo" data-toggle="tab">Por Tipo</a></li>
                <li><a href="#rprtBienesVersionSO" data-toggle="tab">Version SO</a></li>
            </ul>
            <div class="tab-content">
                <!--Buscar----->
                <div class="tab-pane" id="blkHistorialMant">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="buscarMantenimientoCodigo" >
                                    <div class="form-group col-sm-5">
                                        <label for="mantnombre">Técnicos</label>
                                        <div class="caja">
                                            <select class='form-control Persona' id='tecmantnombre' name='mantnombre'>
                                                <%
                                                    for (Persona oPet : listPersona) {
//                                                        if (oPet.getCarId().getCarId() == 3) {
                                                        out.println("<option value='" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "'>" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "</option>");
//                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechai">Fecha Inicial</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="tecmantfechai" name="mantfechai">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechaf">Fecha Final</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="tecmantfechaf" name="mantfechaf">
                                    </div>
                                    <%
                                        for (Persona oPer : listPersona) {
                                            if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {

                                    %>
                                    <input value="<%=oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2()%>" 
                                           required="true" type="hidden" class="form-control" id="nombresUsuarioA" name="nombresUsuarioA">
                                    <input value="<%=oPer.getCarId().getCarDescripcion()%>" 
                                           required="true" type="hidden" class="form-control" id="cargoUsuarioA" name="cargoUsuarioA">
                                    <%                                            }
                                        }
                                    %>
                                    <div class="form-group col-sm-5">
                                        <label for="responsableReciboA">Responsable Revisión</label>
                                        <select class='form-control Persona' id='responsableReciboA' name='responsableReciboA'>
                                            <%
                                                for (Persona oPet : listPersona) {
                                                    if (oPet.getCarId().getCarId() == 3) {
                                                        out.println("<option value='" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "_" + oPet.getCarId().getCarDescripcion() + "'>" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="verclicReportes()">Generar PDF</button>
                            <button  type='button' class='btn btn-primary' onclick="mantTecnicoCSV()">Generar CSV</button>
                        </div>
                    </div>
                </div>                   
                <div class="tab-pane" id="rprtBienesMantenimiento">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="buscarMantenimientoBienes" >
                                    <div class="form-group col-sm-5">    
                                        <label for="bienId">Código del Bien</label>
                                        <input required="true" type="text" class="form-control" id="bbienId" name="bienId" placeholder="Código del Bien">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechai">Fecha Inicial</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="bmantfechai" name="mantfechai">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechaf">Fecha Final</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="bmantfechaf" name="mantfechaf">
                                    </div>
                                    <%
                                        for (Persona oPer : listPersona) {
                                            if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {

                                    %>
                                    <input value="<%=oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2()%>" 
                                           required="true" type="hidden" class="form-control" id="nombresUsuario" name="nombresUsuario">
                                    <input value="<%=oPer.getCarId().getCarDescripcion()%>" 
                                           required="true" type="hidden" class="form-control" id="cargoUsuario" name="cargoUsuario">
                                    <%                                            }
                                        }
                                    %>
                                    <div class="form-group col-sm-5">
                                        <label for="responsableRecibo">Responsable Revisión</label>
                                        <select class='form-control Persona' id='responsableRecibo' name='responsableRecibo'>
                                            <%
                                                for (Persona oPet : listPersona) {
                                                    if (oPet.getCarId().getCarId() == 3) {
                                                        out.println("<option value='" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "_" + oPet.getCarId().getCarDescripcion() + "'>" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="verclicReportesMantBienes()">Generar PDF</button>
                            <button  type='button' class='btn btn-primary' onclick="mantBienesCSV()">Generar CSV</button>

                        </div>
                    </div>
                </div>                   
                <div class="tab-pane" id="rprtBienesMantenimientoPreventivo">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="buscarMantenimientoTipo">
                                    <div class="form-group col-sm-5">
                                        <label for="TipId">Tipo de Mantenimiento</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='tTipId' name='TipId'>
                                                <%for (Tipomantenimiento oTip : listTipoMantenimiento) {
                                                        out.println("<option value='" + oTip.getTipId() + "'>" + oTip.getTipDetalle() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechai">Fecha Inicial</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="tmantfechai" name="mantfechai">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechaf">Fecha Final</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="tmantfechaf" name="mantfechaf">
                                    </div>
                                    <%
                                        for (Persona oPer : listPersona) {
                                            if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {

                                    %>
                                    <input value="<%=oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2()%>" 
                                           required="true" type="hidden" class="form-control" id="nombresUsuario" name="nombresUsuario">
                                    <input value="<%=oPer.getCarId().getCarDescripcion()%>" 
                                           required="true" type="hidden" class="form-control" id="cargoUsuario" name="cargoUsuario">
                                    <%                                            }
                                        }
                                    %>
                                    <div class="form-group col-sm-5">
                                        <label for="responsableRecibo">Responsable Revisión</label>
                                        <select class='form-control Persona' id='responsableRecibo' name='responsableRecibo'>
                                            <%
                                                for (Persona oPet : listPersona) {
                                                    if (oPet.getCarId().getCarId() == 3) {
                                                        out.println("<option value='" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "_" + oPet.getCarId().getCarDescripcion() + "'>" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="verclicReportesMantTipo()">Generar PDF</button>
                            <button  type='button' class='btn btn-primary' onclick="mantTipoCSV()">Generar CSV</button>

                        </div>
                    </div>
                </div>                   
                <div class="active tab-pane" id="rprtBienesMantenimientoGeneral">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="buscarMantenimientoGeneral" >
                                    <input name='mantnombre'value="NONE" type="hidden">
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechai">Fecha Inicial</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="gmantfechai" name="mantfechai">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechaf">Fecha Final</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="gmantfechaf" name="mantfechaf">
                                    </div>
                                    <%
                                        for (Persona oPer : listPersona) {
                                            if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {

                                    %>
                                    <input value="<%=oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2()%>" 
                                           required="true" type="hidden" class="form-control" id="nombresUsuarioA" name="nombresUsuarioA">
                                    <input value="<%=oPer.getCarId().getCarDescripcion()%>" 
                                           required="true" type="hidden" class="form-control" id="cargoUsuarioA" name="cargoUsuarioA">
                                    <%                                            }
                                        }
                                    %>
                                    <div class="form-group col-sm-5">
                                        <label for="responsableReciboA">Responsable Revisión</label>
                                        <select class='form-control Persona' id='responsableReciboA' name='responsableReciboA'>
                                            <%
                                                for (Persona oPet : listPersona) {
                                                    if (oPet.getCarId().getCarId() == 3) {
                                                        out.println("<option value='" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "_" + oPet.getCarId().getCarDescripcion() + "'>" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="verclicReportesMantGeneral()">Generar PDF</button>
                            <button  type='button' class='btn btn-primary' onclick="mantGeneralCSV()">Generar CSV</button>

                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="rprtBienesVersionSO">
                    <div class="row">   
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="buscarMantenimientoSO" >
                                    <div class="form-group col-sm-5">
                                        <label for="sobienSO">Version SO</label>
                                        <select class='form-control sobienSO' id='sobienSO' name='bienSO'>
                                            <%
                                                for (String oPet : versionSO) {
//                                                    if (oPet.getCarId().getCarId() == 3) {
                                                    out.println("<option value='" + oPet.toUpperCase() + "'>" + oPet.toUpperCase() + "</option>");
//                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechai">Fecha Inicial</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="somantfechai" name="mantfechai">
                                    </div>
                                    <div class="form-group col-sm-5">
                                        <label for="mantfechaf">Fecha Final</label>
                                        <input data-date-format="DD-MM-YYYY" required type="date" class="form-control" id="somantfechaf" name="mantfechaf">
                                    </div>
                                    <%
                                        for (Persona oPer : listPersona) {
                                            if (oPer.getPerCedula().equals(session.getAttribute("cedulaPersona").toString())) {

                                    %>
                                    <input value="<%=oPer.getPerNombres() + " " + oPer.getPerApellido1() + " " + oPer.getPerApellido2()%>" 
                                           required="true" type="hidden" class="form-control" id="nombresUsuarioA" name="nombresUsuarioA">
                                    <input value="<%=oPer.getCarId().getCarDescripcion()%>" 
                                           required="true" type="hidden" class="form-control" id="cargoUsuarioA" name="cargoUsuarioA">
                                    <%                                            }
                                        }
                                    %>
                                    <div class="form-group col-sm-5">
                                        <label for="responsableReciboA">Responsable Revisión</label>
                                        <select class='form-control Persona' id='responsableReciboA' name='responsableReciboA'>
                                            <%
                                                for (Persona oPet : listPersona) {
                                                    if (oPet.getCarId().getCarId() == 3) {
                                                        out.println("<option value='" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "_" + oPet.getCarId().getCarDescripcion() + "'>" + oPet.getPerNombres() + " " + oPet.getPerApellido1() + " " + oPet.getPerApellido2() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12" align='center'>
                            <button  type='button' class='btn btn-primary' onclick="verclicReportesSO()">Generar PDF</button>
                            <button  type='button' class='btn btn-primary' onclick="mantVersionSOCSV()">Generar CSV</button>
                        </div>
                    </div>
                </div>                 
            </div>
        </div>
    </div>
    <script>
        function verclicReportes() {
            seleccion = $("select[id='tecmantnombre']").val();
            fechai = $("input[id='tecmantfechai']").val();
            fechaf = $("input[id='tecmantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                clicReportes();
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function verclicReportesMantBienes() {
            seleccion = $("input[id='bbienId']").val();
            fechai = $("input[id='bmantfechai']").val();
            fechaf = $("input[id='bmantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                clicReportesMantBienes();
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function verclicReportesMantTipo() {
            seleccion = $("select[id='tTipId']").val();
            fechai = $("input[id='tmantfechai']").val();
            fechaf = $("input[id='tmantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                clicReportesMantTipo();
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function verclicReportesSO() {
            seleccion = $("select[id='sobienSO']").val();
            fechai = $("input[id='somantfechai']").val();
            fechaf = $("input[id='somantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                clicReportesSO();
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function verclicReportesMantGeneral() {
            fechai = $("input[id='gmantfechai']").val();
            fechaf = $("input[id='gmantfechaf']").val();
            if (fechai !== "" && fechaf !== "") {
                clicReportesMantGeneral();
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function mantBienesCSV() {
            seleccion = $("input[id='bbienId']").val();
            fechai = $("input[id='bmantfechai']").val();
            fechaf = $("input[id='bmantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                verTodosReportesMantenimientoPorBienes(seleccion, fechai, fechaf);
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function mantGeneralCSV() {
            fechai = $("input[id='gmantfechai']").val();
            fechaf = $("input[id='gmantfechaf']").val();
            if (fechai !== "" && fechaf !== "") {
                verTodosReportesMantenimientoGeneral(fechai, fechaf);
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function mantTipoCSV() {
            seleccion = $("select[id='tTipId']").val();
            fechai = $("input[id='tmantfechai']").val();
            fechaf = $("input[id='tmantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                verTodosReportesMantenimientoTipo(seleccion, fechai, fechaf);
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function mantVersionSOCSV() {
            seleccion = $("select[id='sobienSO']").val();
            fechai = $("input[id='somantfechai']").val();
            fechaf = $("input[id='somantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                verTodosReportesMantenimientoVersionSO(seleccion, fechai, fechaf);
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
        function mantTecnicoCSV() {
            seleccion = $("select[id='tecmantnombre']").val();
            fechai = $("input[id='tecmantfechai']").val();
            fechaf = $("input[id='tecmantfechaf']").val();
            if (seleccion !== "" && fechai !== "" && fechaf !== "") {
                verTodosReportesMantenimientoPorTecnico(seleccion, fechai, fechaf);
            } else {
                alertErrorValidacion(" Ingrese todos los campos de búsqueda ");
            }
        }
    </script>
</html>