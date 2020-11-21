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
        String OnOff = "";
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        ArrayList<Dependencia> listDependencia = new ArrayList<Dependencia>();
        ArrayList<Ubicacion> listUbicacion = new ArrayList<Ubicacion>();
        ArrayList<Tipoingreso> listTipoingreso = new ArrayList<Tipoingreso>();
        ArrayList<Baja> listBaja = new ArrayList<Baja>();
        ArrayList<Catalogo> listCatalogo = new ArrayList<Catalogo>();
        ArrayList<Persona> listPersona = new ArrayList<Persona>();
        Bien objBien = new Bien();
        if (session.getAttribute("ingreso").toString().equals("true")) {
            String codBien = request.getParameter("codBien");
            String codPersona = request.getParameter("codPersona");
            String codCatalogo = request.getParameter("codCatalogo");

            String serBien = sBien.listaBienId(codBien);
            JSONObject req = new JSONObject(serBien);
            objBien = new Gson().fromJson(req.toString(), Bien.class);
            //objBien.getBnCodBien();
//            if (objTraspaso.getUbEstado().equals(1)) {
//                OnOff = "checked";
//            }
            
            //Lista de dependencias
                String resultadoDependencia = "{\"respuesta\":" + sDependencia.listaTodosDependencia() + "}";
                JSONObject objDependencia = new JSONObject(resultadoDependencia);
                JSONArray arrayDependencia = objDependencia.getJSONArray("respuesta");
                for (int i = 0; i < arrayDependencia.length(); i++) {
                    JSONObject childJSONObject = arrayDependencia.getJSONObject(i);
                    Dependencia objMenus = new Gson().fromJson(childJSONObject.toString(), Dependencia.class);
                    listDependencia.add(objMenus);
                }

                //Lista de ubicacion
                String resultadoUbicacion = "{\"respuesta\":" + sUbicacion.listaTodosUbicacion() + "}";
                JSONObject objUbicacion = new JSONObject(resultadoUbicacion);
                JSONArray arrayUbicacion = objUbicacion.getJSONArray("respuesta");
                for (int i = 0; i < arrayUbicacion.length(); i++) {
                    JSONObject childJSONObject = arrayUbicacion.getJSONObject(i);
                    Ubicacion objMenus = new Gson().fromJson(childJSONObject.toString(), Ubicacion.class);
                    listUbicacion.add(objMenus);
                }

                //Lista de Tipo Ingreso
                String resultadoTipoingreso = "{\"respuesta\":" + sTipoIngreso.listaTodosTipoingreso() + "}";
                    JSONObject objTipoingreso = new JSONObject(resultadoTipoingreso);
                JSONArray arrayTipoingreso = objTipoingreso.getJSONArray("respuesta");
                for (int i = 0; i < arrayTipoingreso.length(); i++) {
                    JSONObject childJSONObject = arrayTipoingreso.getJSONObject(i);
                    Tipoingreso objMenus = new Gson().fromJson(childJSONObject.toString(), Tipoingreso.class);
                    listTipoingreso.add(objMenus);
                }
                
                //Lista de tipo Bajas
                String resultadoBaja = "{\"respuesta\":" + sBaja.listaTodosBaja() + "}";
                JSONObject objBaja = new JSONObject(resultadoBaja);
                JSONArray arrayBaja = objBaja.getJSONArray("respuesta");
                for (int i = 0; i < arrayBaja.length(); i++) {
                    JSONObject childJSONObject = arrayBaja.getJSONObject(i);
                    Baja objMenus = new Gson().fromJson(childJSONObject.toString(), Baja.class);
                    listBaja.add(objMenus);
                }
                        
                //Lista de Catalogos
//                String resultadoCatalogo = "{\"respuesta\":" + sCatalogo.listaTodosCatalogo() + "}";
//                JSONObject objCatalogo = new JSONObject(resultadoCatalogo);
//                JSONArray arrayCatalogo = objCatalogo.getJSONArray("respuesta");
//                for (int i = 0; i < arrayCatalogo.length(); i++) {
//                    JSONObject childJSONObject = arrayCatalogo.getJSONObject(i);
//                    Catalogo objMenus = new Gson().fromJson(childJSONObject.toString(), Catalogo.class);
//                    listCatalogo.add(objMenus);
//                }
                
                //Lista de Personas
                String resultadoPersona = "{\"respuesta\":" + sPersona.listaTodosPersona() + "}";
                JSONObject objPersona = new JSONObject(resultadoPersona);
                JSONArray arrayPersona = objPersona.getJSONArray("respuesta");
                for (int i = 0; i < arrayPersona.length(); i++) {
                    JSONObject childJSONObject = arrayPersona.getJSONObject(i);
                    Persona objMenus = new Gson().fromJson(childJSONObject.toString(), Persona.class);
                    listPersona.add(objMenus);
                }
                objBien.getSwVersion();
                objBien.getSwVigencia();
                
        } else {
            response.sendRedirect("index.jsp");
        }

    %>
    
    
    <div class="main-header">
        <h2>Actualizacion de la Informacion</h2>
        <em>Actualizacion del bien registrado   en el sistema.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">

            <div class="tab-content">

                    <div class="active tab-pane" id="blk700100440001">
                        <div class="row">
                            <div class="widget widget-table">
                                <div class="widget-header">
                                    <h3><i class="fa fa-table"></i> MODIFICAR.</h3> 
                                </div>
                            </div>
                        </div>

                       <div class="main-content">
                            <div class="well well-lg knowledge-recent-popular">
                            <div class="row">

                                    <form role="form" id="FrmActualizarBien">

                                        <label for="bienCatalogoId"></label>
                                        <input value="<%=objBien.getCatId().getCtId() %>" type="hidden" required="true" class="form-control" id="bienCatalogoId" name="bienCatalogoId"> 
                                        <%
                                        //Si es un Software
                                        if("700200210001".equals(objBien.getCatId().getCtId()) || "170700350001".equals(objBien.getCatId().getCtId())){
                                        %>
                                            <div class="form-group col-sm-6">
                                                <label for="bienDependenciaId">Dependencia</label>
                                                <div class="caja">
                                                    <select class='form-control Recursos' id='bienDependenciaId' name='bienDependenciaId' disable>
                                                        <%
                                                            out.println("<option value='" + objBien.getDpId().getDpId() + "'>" + objBien.getDpId().getDpDescripcion() + "</option>");
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="bienUbicacionId">Ubicación</label>
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
                                            <div class="form-group col-sm-6">
                                                <label for="bienCodigo">Código del Software</label>
                                                <input value="<%= objBien.getBnCodBien()%>" required="true" type="text" class="form-control" id="bienCodigo" name="bienCodigo" placeholder="Ingrese el código del bien" disabled>
                                            </div>
                                            <!--Dato Codigo del Bien escondido-->
                                                <label for="bienCodigo"></label>
                                                <input value="<%=objBien.getBnCodBien() %>" type="hidden" required="true" class="form-control" id="bienCodigo" name="bienCodigo"> 
                                            <!--|-->
                                            <div class="form-group col-sm-6">
                                                <label for="bienNombre">Nombre del Software</label>
                                                <input value="<%=objBien.getBnNombre()%>" required="true" type="text" class="form-control" id="bienNombre" name="bienNombre" placeholder="Ingrese el nombre del bien" disabled>
                                            </div>
                                            <!--Dato Nombre del Bien escondido-->
                                                <label for="bienNombre"></label>
                                                <input value="<%=objBien.getBnNombre()%>" type="hidden" required="true" class="form-control" id="bienNombre" name="bienNombre"> 
                                            <!--|-->
                                            <div class="form-group col-sm-6">
                                                <label for="softVersion">Version</label>
                                                <input value="<%=objBien.getSwVersion()%>" required="true" type="text" class="form-control" id="softVersion" name="softVersion" placeholder="Ingrese la serie del bien">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="softVigencia">Vigencia</label>
                                                <input value="<%=objBien.getSwVigencia()%>" required="true" type="number" class="form-control" id="softVigencia" name="softVigencia" placeholder="Ingrese el modelo del bien">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="softCantLicen">Numero de Licencias</label>
                                                <input value="<%=objBien.getSwCantLicencia() %>" required="true" type="number" class="form-control" id="softCantLicen" name="softCantLicen" placeholder="Ingrese la cantidad de toner que ocupa">
                                            </div>
                                            <%
                                            String fechaCad = objBien.getBnFechaCompra();
                                            String[] arrayDatFecha = fechaCad.split("T");
                                            String fechaCompra = arrayDatFecha[0];
                                            %>
                                            <div class="form-group col-sm-6">
                                                <label for="bienFecha">Fecha de compra</label>
                                                <input value="<%=fechaCompra%>" required="true" type="text" class="form-control" id="bienFecha" name="bienFecha" placeholder="Ingrese la fecha del bien">
                                            </div>
                                            <!--Dato fecha Compra escondida-->
                                                <label for="bienFecha"></label>
                                                <input data-date-format="DD MMMM YYYY" value="<%=fechaCompra %>" type="hidden" required="true" class="form-control" id="bienFecha" name="bienFecha"> 
                                            <!--|-->
                                            <div class="form-group col-sm-6">
                                                <label for="softFinContr">Fecha de Fin de Contrato</label>
                                                <input data-date-format="DD MMMM YYYY" value="<%=objBien.getSwFechaContrat() %>" required="true" type="date" class="form-control" id="softFinContr" name="softFinContr" placeholder="Ingrese la fecha del bien">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="bienProveedor">Proveedor</label>
                                                <input value="<%=objBien.getBnProveedor() %>" required="true" type="text" class="form-control" id="bienProveedor" name="bienProveedor" placeholder="Ingrese el proveedor del bien">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="bienDescripcion">Descripción</label>
                                                <input value="<%=objBien.getBnDescripcion() %>" required="true" type="text" class="form-control" id="bienDescripcion" name="bienDescripcion" placeholder="Ingresela descripción del bien">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="softTipSoporte">Tipo de Soporte</label>
                                                <div class="caja">
                                                    <select class='form-control Recursos' id='softTipSoporte' name='softTipSoporte'>
                                                        <%
                                                            out.println("<option value='" + objBien.getSwTipSoporte() + "'>" + objBien.getSwTipSoporte() + "</option>");
                                                        %>
                                                        <option value='32bits'>32bits</option>
                                                        <option value='64bits'>64bits</option>
                                                    </select>
                                                </div>
                                            </div>
                                        <%
                                        }else{
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDependenciaId">Dependencia</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienDependenciaId' name='bienDependenciaId' disable>
                                                    <%
                                                        out.println("<option value='" + objBien.getDpId().getDpId() + "'>" + objBien.getDpId().getDpDescripcion() + "</option>");
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienUbicacionId">Ubicación</label>
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
                                        <div class="form-group col-sm-6">
                                            <label for="bienTipIngreId">Tipo de ingreso</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienTipIngreId' name='bienTipIngreId'>
                                                    <%
                                                            out.println("<option value='" + objBien.getTiId().getTiId() + "'>" + objBien.getTiId().getTiDetalle() + "</option>");
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienCodigo">Código del bien</label>
                                            <input value="<%=objBien.getBnCodBien() %>" required="true" type="text" class="form-control" id="bienCodigo" name="bienCodigo" placeholder="Ingrese el código del bien"  disabled>
                                        </div>
                                        <!--Dato Codigo del Bien escondido-->
                                            <label for="bienCodigo"></label>
                                            <input value="<%=objBien.getBnCodBien() %>" type="hidden" required="true" class="form-control" id="bienCodigo" name="bienCodigo"> 
                                        <!--|-->
                                        <div class="form-group col-sm-6">
                                            <label for="bienNombre">Nombre del bien</label>
                                            <input value="<%=objBien.getBnNombre() %>" required="true" type="text" class="form-control" id="bienNombre" name="bienNombre" placeholder="Ingrese el nombre del bien" disabled>
                                        </div>
                                        <!--Dato Nombre del Bien escondido-->
                                            <label for="bienNombre"></label>
                                            <input value="<%=objBien.getBnNombre()%>" type="hidden" required="true" class="form-control" id="bienNombre" name="bienNombre"> 
                                        <!--|-->
                                        <div class="form-group col-sm-6">
                                            <label for="bienSerie">Serie del bien</label>
                                            <input value="<%=objBien.getBnSerie() %>" required="true" type="text" class="form-control" id="bienSerie" name="bienSerie" placeholder="Ingrese la serie del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienModelo">Modelo del bien</label>
                                            <input value="<%=objBien.getBnModelo() %>" required="true" type="text" class="form-control" id="bienModelo" name="bienModelo" placeholder="Ingrese el modelo del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienMarca">Marca</label>
                                            <input value="<%=objBien.getBnMarca() %>" required="true" type="text" class="form-control" id="bienMarca" name="bienMarca" placeholder="Ingrese la marca del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienColor">Color</label>
                                            <input value="<%=objBien.getBnColor() %>" required="true" type="text" class="form-control" id="bienColor" name="bienColor" placeholder="Ingrese el color del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienPrecio">Precio</label>
                                            <input value="<%=objBien.getBnPrecio() %>" required="true" type="number" class="form-control" id="bienPrecio" name="bienPrecio" placeholder="Ingrese el precio del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienEstado">Estado del bien</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienEstado' name='bienEstado'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnEstadoBien() + "'>" + objBien.getBnEstadoBien() + "</option>");
                                                    %>
                                                    <option value='BUENO'>BUENO</option>
                                                    <option value='REGULAR'>REGULAR</option>
                                                    <option value='MALO'>MALO</option>
                                                </select>
                                            </div>
                                        </div>
                                        <%
                                            String fechaCad = objBien.getBnFechaCompra();
                                            String[] arrayDatFecha = fechaCad.split("T");
                                            String fechaCompra = arrayDatFecha[0];
                                         %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienFecha">Fecha de compra</label>
                                            <input data-date-format="DD MMMM YYYY" value="<%=fechaCompra %>" required="date" type="text" class="form-control" id="bienFecha" name="bienFecha" placeholder="Ingrese la fecha del bien" disabled>
                                        </div>
                                        <!--Dato fecha Compra escondida-->
                                            <label for="bienFecha"></label>
                                            <input data-date-format="DD MMMM YYYY" value="<%=fechaCompra %>" type="hidden" required="true" class="form-control" id="bienFecha" name="bienFecha"> 
                                        <!--|-->
                                        <div class="form-group col-sm-6">
                                            <label for="bienGarantia">Tiempo de garantia</label>
                                            <input value="<%=objBien.getBnTiempoGarantia() %>" required="true" type="number" class="form-control" id="bienGarantia" name="bienGarantia" placeholder="Ingrese el tiempo de garantia del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienProveedor">Proveedor</label>
                                            <input value="<%=objBien.getBnProveedor() %>" required="true" type="text" class="form-control" id="bienProveedor" name="bienProveedor" placeholder="Ingrese el proveedor del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDescripcion">Descripción</label>
                                            <input value="<%=objBien.getBnDescripcion() %>" required="true" type="text" class="form-control" id="bienDescripcion" name="bienDescripcion" placeholder="Ingresela descripción del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienObservacion">Observacion</label>
                                            <input value="<%=objBien.getBnObservacion() %>" required="true" type="text" class="form-control" id="bienObservacion" name="bienObservacion" placeholder="Ingrese alguna observacion">
                                        </div>

                                    <%
                                    //Si es Monitor
                                    //if(regisCatalogo.getCtEstado() == 2){
                                    if(objBien.getCatId().getCtEstado() == 2){                  
                                        if("700100440001".equals(objBien.getCatId().getCtId()) || "170700100001".equals(objBien.getCatId().getCtId())){
                                    %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienMoniTecno">Tecnología del monitor</label>
                                            <input value="<%=objBien.getBnMonitorTecn() %>" required="true" type="text" class="form-control" id="bienMoniTecno" name="bienMoniTecno" placeholder="Ingrese la tecnología del monitor">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienMoniTamano">Tamaño de la Pantalla</label>
                                            <input value="<%=objBien.getBnMonitorTama() %>" required="true" type="text" class="form-control" id="bienMoniTamano" name="bienMoniTamano" placeholder="Ingrese el tamaño de la pantalla">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTipoConex">Tipo de Conexion</label>
                                            <input value="<%=objBien.getBnTipoConexion() %>" required="true" type="text" class="form-control" id="bienTipoConex" name="bienTipoConex" placeholder="Ingrese el tipo de conexion">
                                        </div>
                                        <%
                                        }
                                        //Si es CPU
                                        if("700100130001".equals(objBien.getCatId().getCtId()) || "170700320001".equals(objBien.getCatId().getCtId())){
                                        %> 
                                        <div class="form-group col-sm-6">
                                            <label for="bienRamTamano">Tamaño de la Ram</label>
                                            <input value="<%=objBien.getBnRamTamano() %>" required="true" type="text" class="form-control" id="bienRamTamano" name="bienRamTamano" placeholder="Ingrese el tamaño de la RAM">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienRamTecno">Tecnología de la Ram</label>
                                            <input value="<%=objBien.getBnRamTecno() %>" required="true" type="text" class="form-control" id="bienRamTecno" name="bienRamTecno" placeholder="Ingrese la tecnología de la RAM">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDiscoTama">Tamaño del disco</label>
                                            <input value="<%=objBien.getBnMonitorTama() %>" required="true" type="text" class="form-control" id="bienDiscoTama" name="bienDiscoTama" placeholder="Ingrese el tamaño del disco duro">
                                        </div>

                                        <div class="form-group col-sm-6">
                                            <label for="bienProcesador">Procesador</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienProcesador' name='bienProcesador'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnProcesador() + "'>" + objBien.getBnProcesador() + "</option>");
                                                    %>
                                                    <option value='IntelCore i3'>IntelCore i3</option>
                                                    <option value='IntelCore i7'>IntelCore i7</option>
                                                    <option value='IntelCore i9'>IntelCore i9</option>
                                                    <option value='AMD Rysen 5'>AMD Rysen 5</option>
                                                    <option value='AMD Rysen 7'>AMD Rysen 7</option>
                                                    <option value='AMD Rysen 9'>AMD Rysen 9</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group col-sm-6">
                                            <label for="bienTarjeRed">Tarjeta de red</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienTarjeRed' name='bienTarjeRed'>
                                                    <%
                                                        String tarjetaRed = "";
                                                        if(objBien.getBnRed())
                                                            tarjetaRed = "SI";
                                                        else
                                                            tarjetaRed = "NO";
                                                        out.println("<option value='" + tarjetaRed + "'>" + tarjetaRed + "</option>");
                                                    %>
                                                    <option value='SI'>SI</option>
                                                    <option value='NO'>NO</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDvd">Lector de DVD</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienDvd' name='bienDvd'>
                                                    <%
                                                        String dvd = "";
                                                        if(objBien.getBnLectorDvd())
                                                            dvd = "SI";
                                                        else
                                                            dvd = "NO";
                                                        out.println("<option value='" + dvd + "'>" + dvd + "</option>");
                                                    %>
                                                    <option value='SI'>SI</option>
                                                    <option value='NO'>NO</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienSO">Sistema Operativo</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienSO' name='bienSO'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnSo() + "'>" + objBien.getBnSo() + "</option>");
                                                    %>
                                                    <option value='Windows XP '>Windows XP</option>
                                                    <option value='Windows Vista'>Windows Vista</option>
                                                    <option value='Windows 7'>Windows 7</option>
                                                    <option value='Windows 8'>Windows 8</option>
                                                    <option value='Windows 10'>Windows 10</option>
                                                    <option value='Ubuntu'>Ubuntu</option
                                                    <option value='Debian'>Debian</option>
                                                    <option value='Fedora'>Fedora</option>
                                                    <option value='Centos'>Centos</option>
                                                    <option value='Mac OS Catalina'>Mac OS Catalina</option>
                                                    <option value='Mac OS Mojave'>Mac OS Mojave</option>
                                                    <option value='Mac OS High Sierra'>Mac OS High Sierra</option>
                                                    <option value='Mac OS Sierra'>Mac OS Sierra</option>
                                                </select>
                                            </div>
                                        </div>

                                        <%
                                        }
                                        //Si es Impresora
                                        if(objBien.getCatId().getCtId().indexOf("70010029000") > -1 || "170700090001".equals(objBien.getCatId().getCtId())
                                                || "400503840001".equals(objBien.getCatId().getCtId()) || "400505840001".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTipColor">Color</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienTipColor' name='bienTipColor'>
                                                    <%                                                                                                
                                                        String impcol = "";
                                                        if(objBien.getBnImpColor() != null){
                                                            if(objBien.getBnImpColor())
                                                                impcol = "SI";
                                                            else
                                                                impcol = "NO";
                                                            out.println("<option value='" + impcol + "'>" + impcol + "</option>");
                                                        }
                                                    %>
                                                    <option value='B/N'>B/N</option>
                                                    <option value='COLOR'>COLOR</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienToner">Modelo del toner</label>
                                            <input value="<%=objBien.getBnCantToner() %>" required="true" type="text" class="form-control" id="bienToner" name="bienToner" placeholder="Ingrese modelo del toner">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienNumFusor">Número de fusor</label>
                                            <input value="<%=objBien.getBnNumFusor() %>" required="true" type="text" class="form-control" id="bienNumFusor" name="bienNumFusor" placeholder="Ingrese el número de fusor">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienCantToner">Cantidad de toner</label>
                                            <input value="<%=objBien.getBnCantToner() %>" required="true" type="number" class="form-control" id="bienCantToner" name="bienCantToner" placeholder="Ingrese la cantidad de toner que ocupa">
                                        </div>
                                        <%
                                        }
                                        //Si es Proyector
                                        if("400100440001".equals(objBien.getCatId().getCtId()) || "170403000001".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTecProyec">Tecnología del proyector</label>
                                            <input value="<%=objBien.getBnTecnProyector() %>" required="true" type="text" class="form-control" id="bienTecProyec" name="bienTecProyec" placeholder="Ingrese la tecnología del proyector">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienNumLumenes">Número de lumenes</label>
                                            <input value="<%=objBien.getBnLumenes() %>" required="true" type="text" class="form-control" id="bienNumLumenes" name="bienNumLumenes" placeholder="Ingrese el número de lumenes">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTipLampa">Tipo de lámpara</label>
                                            <input value="<%=objBien.getBnTipoLampara() %>" required="true" type="text" class="form-control" id="bienTipLampa" name="bienTipLampa" placeholder="Ingrese el tipo de lámpara">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienResolucion">Tipo de Pantalla</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienResolucion' name='bienResolucion'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnResolucion() + "'>" + objBien.getBnResolucion() + "</option>");
                                                    %>
                                                    <option value='VGA'>VGA</option>
                                                    <option value='HDMI'>HDMI</option>
                                                    <option value='SVGA'>SVGA</option>
                                                    <option value='XGA'>XGA</option>
                                                    <option value='UXGA'>XGA</option>
                                                    <option value='HD'>HD</option>
                                                    <option value='Full HD'>Full HD</option>
                                                </select>
                                            </div>
                                        </div>

                                        <%
                                        }
                                        //Si es una Portatil
                                        if("700100070001".equals(objBien.getCatId().getCtId()) || "700100990001".equals(objBien.getCatId().getCtId())
                                                || "170700490001".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienRamTamano">Tamaño de la Ram</label>
                                            <input value="<%=objBien.getBnRamTamano() %>" required="true" type="text" class="form-control" id="bienRamTamano" name="bienRamTamano" placeholder="Ingrese el tamaño de la RAM">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienRamTecno">Tecnología de la Ram</label>
                                            <input value="<%=objBien.getBnRamTecno() %>" required="true" type="text" class="form-control" id="bienRamTecno" name="bienRamTecno" placeholder="Ingrese la tecnología de la RAM">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDiscoTama">Tamaño del disco</label>
                                            <input value="<%=objBien.getBdCantDisco() %>" required="true" type="text" class="form-control" id="bienDiscoTama" name="bienDiscoTama" placeholder="Ingrese el tamaño del disco duro">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDiscoTecno">Tecologia del disco</label>
                                            <input value="<%=objBien.getTecnoId() %>" required="true" type="number" class="form-control" id="bienDiscoTecno" name="bienDiscoTeno" placeholder="Ingrese la tecnologia disco duro">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienProcesador">Procesador</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienProcesador' name='bienProcesador'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnProcesador() + "'>" + objBien.getBnProcesador() + "</option>");
                                                    %>
                                                    <option value='IntelCore i3'>IntelCore i3</option>
                                                    <option value='IntelCore i7'>IntelCore i7</option>
                                                    <option value='IntelCore i9'>IntelCore i9</option>
                                                    <option value='AMD Rysen 5'>AMD Rysen 5</option>
                                                    <option value='AMD Rysen 7'>AMD Rysen 7</option>
                                                    <option value='AMD Rysen 9'>AMD Rysen 9</option>
                                                </select>
                                            </div>
                                        </div>  
                                        <div class="form-group col-sm-6">
                                            <label for="bienTamPantalla">Tamaño de Pantalla</label>
                                            <input value="<%=objBien.getBnMonitorTama() %>" required="true" type="text" class="form-control" id="bienTamPantalla" name="bienTamPantalla" placeholder="Ingrese el tmaño de pantalla">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTipoPantalla">Tipo de Pantalla</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienTipoPantalla' name='bienTipoPantalla'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnTipPantalla() + "'>" + objBien.getBnTipPantalla() + "</option>");
                                                    %>
                                                    <option value='TACTIL'>TACTIL</option>
                                                    <option value='NORMAL'>NORMAL</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTarjeRed">Tarjeta de red</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienTarjeRed' name='bienTarjeRed'>
                                                    <%
                                                        String tarjetaRed1 = "";
                                                        if(objBien.getBnRed())
                                                            tarjetaRed1 = "SI";
                                                        else
                                                            tarjetaRed1 = "NO";
                                                        out.println("<option value='" + tarjetaRed1 + "'>" + tarjetaRed1 + "</option>");
                                                    %>
                                                    <option value='SI'>SI</option>
                                                    <option value='NO'>NO</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDvd">Lector de DVD</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienDvd' name='bienDvd'>
                                                    <%
                                                        String dvd1 = "";
                                                        if(objBien.getBnLectorDvd())
                                                            dvd1 = "SI";
                                                        else
                                                            dvd1 = "NO";
                                                        out.println("<option value='" + dvd1 + "'>" + dvd1 + "</option>");
                                                    %>
                                                    <option value='SI'>SI</option>
                                                    <option value='NO'>NO</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienSO">Sistema Operativo</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienSO' name='bienSO'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnSo() + "'>" + objBien.getBnSo() + "</option>");
                                                    %>
                                                    <option value='Windows XP '>Windows XP</option>
                                                    <option value='Windows Vista'>Windows Vista</option>
                                                    <option value='Windows 7'>Windows 7</option>
                                                    <option value='Windows 8'>Windows 8</option>
                                                    <option value='Windows 10'>Windows 10</option>
                                                    <option value='Ubuntu'>Ubuntu</option
                                                    <option value='Debian'>Debian</option>
                                                    <option value='Fedora'>Fedora</option>
                                                    <option value='Centos'>Centos</option>
                                                    <option value='Mac OS Catalina'>Mac OS Catalina</option>
                                                    <option value='Mac OS Mojave'>Mac OS Mojave</option>
                                                    <option value='Mac OS High Sierra'>Mac OS High Sierra</option>
                                                    <option value='Mac OS Sierra'>Mac OS Sierra</option>
                                                </select>
                                            </div>
                                        </div>
                                        <%
                                        }
                                        //Si es un Movil
                                        if("400100410002".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTamMemoInter">Tamaño de Memoria Interna</label>
                                            <input value="" required="true" type="text" class="form-control" id="bienTamMemoInter" name="bienTamMemoInter" placeholder="Ingrese el tamaño de Memoria Interna">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTamMemoExter">Tamaño de Memoria Externa</label>
                                            <input value="" required="true" type="text" class="form-control" id="bienTamMemoExter" name="bienTamMemoExter" placeholder="Ingrese el tamaño de Memoria Externa">
                                        </div>
                                        <%
                                        }
                                        //Si es una Tablet
                                        if("700100810001".equals(objBien.getCatId().getCtId()) || "170700460001".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTamMemoInter">Tamaño de Memoria Interna</label>
                                            <input value=" " required="true" type="text" class="form-control" id="bienTamMemoInter" name="bienTamMemoInter" placeholder="Ingrese el tamaño de Memoria Interna">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTamMemoExter">Tamaño de Memoria Externa</label>
                                            <input value=" " required="true" type="text" class="form-control" id="bienTamMemoExter" name="bienTamMemoExter" placeholder="Ingrese el tamaño de Memoria Externa">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienProcesador">Procesador</label>
                                            <input value="<%=objBien.getBnProcesador() %>" required="true" type="text" class="form-control" id="bienProcesador" name="bienProcesador" placeholder="Ingrese tipo de procesador del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienSO">Sistema Operativo</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienSO' name='bienSO'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnSo() + "'>" + objBien.getBnSo() + "</option>");
                                                    %>
                                                    <option value='Android'>Android</option>
                                                    <option value='IOS'>IOS</option>
                                                    <option value='Harmony OS'>Harmony OS</option>
                                                    <option value='Windows Phone'>Windows Phone</option>
                                                </select>
                                            </div>
                                        </div>
                                        <%
                                        }
                                        //Si es un UPS
                                        if(objBien.getCatId().getCtId().indexOf("7001007700") > -1 || "170700310001".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTipoBateria">Tipo de Bateria</label>
                                            <input value=" " required="true" type="text" class="form-control" id="bienTipoBateria" name="bienTipoBateria" placeholder="Ingrese el tipo de Bateria">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienNumConect">Numero de Conectores</label>
                                            <input value=" " required="true" type="text" class="form-control" id="bienNumConect" name="bienNumConect" placeholder="Ingrese el tamaño del Conector">
                                        </div>
                                        <%
                                        }
                                        //Si es Router
                                        if("700200170001".equals(objBien.getCatId().getCtId())|| "170700040001".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienNumPuertos">Numero de puertos</label>
                                            <input value=" " required="true" type="text" class="form-control" id="bienNumPuertos" name="bienNumPuertos" placeholder="Ingrese el numero el puertos">
                                        </div>
                                        <%
                                        }
                                        //Si es Lector
                                        if("170700370001".equals(objBien.getCatId().getCtId())|| "700100360001".equals(objBien.getCatId().getCtId())){
                                        %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienTipLector">Tipo de Lector</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienTipLector' name='bienTipLector'>
                                                    <%
                                                        out.println("<option value='" + objBien.getBnTipLector() + "'>" + objBien.getBnTipLector() + "</option>");
                                                    %>
                                                    <option value='INTERNO'>INTERNO</option>
                                                    <option value='EXTERNO'>EXTERNO</option>
                                                </select>
                                            </div>
                                        </div>
                                        <%
                                        }
                                        %>
                                    <%
                                    }
                                    %> 
                                    <%
                                    }
                                    %>

                                    </form>


                                        <div class="col-sm-12" align='center'>
                                            <button  class='btn btn-danger' onclick="verTodosBienes(),alertCancel()"><i class="fa fa-times"></i>Cancelar</button>
                                            <button  class='btn btn-primary' onclick="actualizarBien(<%= objBien.getBnCodBien() %>)"><i class="fa fa-check-circle"></i>Editar</button>
                                        </div>
                                </div>
                            </div>

                        </div>
                    </div>
            </div>                    
        </div>
    </div>  
</html>