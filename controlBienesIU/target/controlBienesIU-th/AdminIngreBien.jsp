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
        String OnOff = "";
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        ArrayList<Dependencia> listDependencia = new ArrayList<Dependencia>();
        ArrayList<Ubicacion> listUbicacion = new ArrayList<Ubicacion>();
        ArrayList<Tipoingreso> listTipoingreso = new ArrayList<Tipoingreso>();
        ArrayList<Baja> listBaja = new ArrayList<Baja>();
        ArrayList<Catalogo> listCatalogo = new ArrayList<Catalogo>();
        ArrayList<Persona> listPersona = new ArrayList<Persona>();
        Catalogo regisCatalogo = new Catalogo();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String idDato = request.getParameter("idDato");
                String serCatalogo = sCatalogo.listaCatalogoId(idDato);
                JSONObject req = new JSONObject(serCatalogo);
                regisCatalogo = new Gson().fromJson(req.toString(), Catalogo.class);
                
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
                String resultadoCatalogo = "{\"respuesta\":" + sCatalogo.listaTodosCatalogo() + "}";
                JSONObject objCatalogo = new JSONObject(resultadoCatalogo);
                JSONArray arrayCatalogo = objCatalogo.getJSONArray("respuesta");
                for (int i = 0; i < arrayCatalogo.length(); i++) {
                    JSONObject childJSONObject = arrayCatalogo.getJSONObject(i);
                    Catalogo objMenus = new Gson().fromJson(childJSONObject.toString(), Catalogo.class);
                    listCatalogo.add(objMenus);
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
       
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    
    <div class="main-header">
        <h2>Bienes</h2>
        <em>Ingreso de bienes informáticos en el sistema.</em>
    </div>
       
    
   <!--Modificaciones --> 
<div class="main-content">
    <div class="nav-tabs-custom">

       <script>
           function verOp(){
               $(document).ready(function(){
                    seleccion = $("input[name='exampleRadios1']:checked").val();
                    separador = "_",
                    cadenaseparada = seleccion.split(separador);//separando las cadenas 
                    
                    $("#custodioId").val(cadenaseparada[1]);//cadena de cod de la pesona
                    $("#cedNomCustodio").val(cadenaseparada[2]);//cadena de cedula y nombre
             });
           }
       </script>
        
        <div class="tab-content">
               
                <div class="active tab-pane" id="blk700100440001">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> INGRESAR.</h3> 
                            </div>
                        </div>
                    </div>

                   <div class="main-content">
                        <div class="well well-lg knowledge-recent-popular">
                        <div class="row">

                                <form role="form" id="FrmAddBien">
                                    
                                    <label for="bienCatalogoId"></label>
                                    <input value="<%= regisCatalogo.getCtId()%>" type="hidden" required="true" class="form-control" id="bienCatalogoId" name="bienCatalogoId" > 
                                    <%
                                    //Si es un Software
                                    if("700200210001".equals(regisCatalogo.getCtId()) || "170700350001".equals(regisCatalogo.getCtId())){
                                    %>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDependenciaId">Dependencia</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienDependenciaId' name='bienDependenciaId'>
                                                    <%
                                                        for (Dependencia oPet : listDependencia) {
                                                            out.println("<option value='" + oPet.getDpId() + "'>" + oPet.getDpDescripcion() + "</option>");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienUbicacionId">Ubicación</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='bienUbicacionId' name='bienUbicacionId'>
                                                    <%
                                                        for (Ubicacion oPet : listUbicacion) {
                                                            out.println("<option value='" + oPet.getUbId() + "'>" + oPet.getUbDescripcion() + "</option>");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienCodigo">Código del Software</label>
                                            <input value="" required="true" type="text" class="form-control" id="bienCodigo" name="bienCodigo" placeholder="Ingrese el código del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienNombre">Nombre del Software</label>
                                            <input value="" required="true" type="text" class="form-control" id="bienNombre" name="bienNombre" placeholder="Ingrese el nombre del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="softVersion">Version</label>
                                            <input value="" required="true" type="text" class="form-control" id="softVersion" name="softVersion" placeholder="Ingrese la serie del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="softVigencia">Vigencia</label>
                                            <input value="" required="true" type="number" class="form-control" id="softVigencia" name="softVigencia" placeholder="Ingrese el modelo del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="softCantLicen">Numero de Licencias</label>
                                            <input value="0" required="true" type="number" class="form-control" id="softCantLicen" name="softCantLicen" placeholder="Ingrese la cantidad de toner que ocupa">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienFecha">Fecha de compra</label>
                                            <input data-date-format="DD MMMM YYYY" value="2019-01-01" required="true" type="date" class="form-control" id="bienFecha" name="bienFecha" placeholder="Ingrese la fecha del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="softFinContr">Fecha de Fin de Contrato</label>
                                            <input data-date-format="DD MMMM YYYY" value="2019-01-01" required="true" type="date" class="form-control" id="softFinContr" name="softFinContr" placeholder="Ingrese la fecha del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienProveedor">Proveedor</label>
                                            <input value="" required="true" type="text" class="form-control" id="bienProveedor" name="bienProveedor" placeholder="Ingrese el proveedor del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="bienDescripcion">Descripción</label>
                                            <input value="" required="true" type="text" class="form-control" id="bienDescripcion" name="bienDescripcion" placeholder="Ingresela descripción del bien">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="softTipSoporte">Tipo de Soporte</label>
                                            <div class="caja">
                                                <select class='form-control Recursos' id='softTipSoporte' name='softTipSoporte'>
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
                                            <select class='form-control Recursos' id='bienDependenciaId' name='bienDependenciaId'>
                                                <%
                                                    for (Dependencia oPet : listDependencia) {
                                                        out.println("<option value='" + oPet.getDpId() + "'>" + oPet.getDpDescripcion() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienUbicacionId">Ubicación</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienUbicacionId' name='bienUbicacionId'>
                                                <%
                                                    for (Ubicacion oPet : listUbicacion) {
                                                        out.println("<option value='" + oPet.getUbId() + "'>" + oPet.getUbDescripcion() + "</option>");
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
                                                    for (Tipoingreso oPet : listTipoingreso) {
                                                        out.println("<option value='" + oPet.getTiId() + "'>" + oPet.getTiDetalle() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienCodigo">Código del bien</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienCodigo" name="bienCodigo" placeholder="Ingrese el código del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienNombre">Nombre del bien</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienNombre" name="bienNombre" placeholder="Ingrese el nombre del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienSerie">Serie del bien</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienSerie" name="bienSerie" placeholder="Ingrese la serie del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienModelo">Modelo del bien</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienModelo" name="bienModelo" placeholder="Ingrese el modelo del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienMarca">Marca</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienMarca" name="bienMarca" placeholder="Ingrese la marca del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienColor">Color</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienColor" name="bienColor" placeholder="Ingrese el color del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienPrecio">Precio</label>
                                        <input value="0" required="true" type="number" class="form-control" id="bienPrecio" name="bienPrecio" placeholder="Ingrese el precio del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienEstado">Estado del bien</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienEstado' name='bienEstado'>
                                                <option value='BUENO'>BUENO</option>
                                                <option value='REGULAR'>REGULAR</option>
                                                <option value='MALO'>MALO</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienFecha">Fecha de compra</label>
                                        <input data-date-format="DD MMMM YYYY" value="2019-01-01" required="true" type="date" class="form-control" id="bienFecha" name="bienFecha" placeholder="Ingrese la fecha del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienGarantia">Tiempo de garantia</label>
                                        <input value="0" required="true" type="number" class="form-control" id="bienGarantia" name="bienGarantia" placeholder="Ingrese el tiempo de garantia del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienProveedor">Proveedor</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienProveedor" name="bienProveedor" placeholder="Ingrese el proveedor del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienDescripcion">Descripción</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienDescripcion" name="bienDescripcion" placeholder="Ingresela descripción del bien">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienObservacion">Observacion</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienObservacion" name="bienObservacion" placeholder="Ingrese alguna observacion">
                                    </div>
                                   
                                <%
                                
                                if(regisCatalogo.getCtEstado() == 2){
                                    //Si es Monitor
                                    if("700100440001".equals(regisCatalogo.getCtId()) || "170700100001".equals(regisCatalogo.getCtId())){
                                %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienMoniTecno">Tecnología del monitor</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienMoniTecno" name="bienMoniTecno" placeholder="Ingrese la tecnología del monitor">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienMoniTamano">Tamaño de la Pantalla</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienMoniTamano" name="bienMoniTamano" placeholder="Ingrese el tamaño de la pantalla">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTipoConex">Tipo de Conexion</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienTipoConex" name="bienTipoConex" placeholder="Ingrese el tipo de conexion">
                                    </div>
                                    <%
                                    }
                                    //Si es CPU
                                    if("700100130001".equals(regisCatalogo.getCtId()) || "170700320001".equals(regisCatalogo.getCtId())){
                                    %> 
                                    <div class="form-group col-sm-6">
                                        <label for="bienRamTamano">Tamaño de la Ram</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienRamTamano" name="bienRamTamano" placeholder="Ingrese el tamaño de la RAM">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienRamTecno">Tecnología de la Ram</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienRamTecno" name="bienRamTecno" placeholder="Ingrese la tecnología de la RAM">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienDiscoTama">Tamaño del disco</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienDiscoTama" name="bienDiscoTama" placeholder="Ingrese el tamaño del disco duro">
                                    </div>

<!--                                    <div class="form-group col-sm-6">
                                        <label for="bienProcesador">Procesador</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienProcesador" name="bienProcesador" placeholder="Ingrese tipo de procesador del bien">
                                    </div>-->
                                    
                                    <div class="form-group col-sm-6">
                                        <label for="bienProcesador">Procesador</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienProcesador' name='bienProcesador'>
                                                <option value='IntelCore i3'>IntelCore i3</option>
                                                <option value='IntelCore i7'>IntelCore i7</option>
                                                <option value='IntelCore i9'>IntelCore i9</option>
                                                <option value='AMD Rysen 5'>AMD Rysen 5</option>
                                                <option value='AMD Rysen 7'>AMD Rysen 6</option>
                                                <option value='AMD Rysen 9'>AMD Rysen 7</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="bienTarjeRed">Tarjeta de red</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienTarjeRed' name='bienTarjeRed'>
                                                <option value='SI'>SI</option>
                                                <option value='NO'>NO</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienDvd">Lector de DVD</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienDvd' name='bienDvd'>
                                                <option value='SI'>SI</option>
                                                <option value='NO'>NO</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienSO">Sistema Operativo</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienSO' name='bienSO'>
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
                                    if(regisCatalogo.getCtId().indexOf("70010029000") > -1 || "170700090001".equals(regisCatalogo.getCtId())
                                       || "400503840001".equals(regisCatalogo.getCtId()) || "400505840001".equals(regisCatalogo.getCtId())){
                                    %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTipColor">Color</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienTipColor' name='bienTipColor'>
                                                <option value='B/N'>B/N</option>
                                                <option value='COLOR'>COLOR</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienToner">Modelo del toner</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienToner" name="bienToner" placeholder="Ingrese modelo del toner">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienNumFusor">Número de fusor</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienNumFusor" name="bienNumFusor" placeholder="Ingrese el número de fusor">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienCantToner">Cantidad de toner</label>
                                        <input value="0" required="true" type="number" class="form-control" id="bienCantToner" name="bienCantToner" placeholder="Ingrese la cantidad de toner que ocupa">
                                    </div>
                                    <%
                                    }
                                    //Si es Proyector
                                    if("400100440001".equals(regisCatalogo.getCtId()) || "170403000001".equals(regisCatalogo.getCtId())){
                                    %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTecProyec">Tecnología del proyector</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienTecProyec" name="bienTecProyec" placeholder="Ingrese la tecnología del proyector">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienNumLumenes">Número de lumenes</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienNumLumenes" name="bienNumLumenes" placeholder="Ingrese el número de lumenes">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTipLampa">Tipo de lámpara</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienTipLampa" name="bienTipLampa" placeholder="Ingrese el tipo de lámpara">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienResolucion">Tipo de Pantalla</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienResolucion' name='bienResolucion'>
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
                                    if("700100070001".equals(regisCatalogo.getCtId()) || "700100990001".equals(regisCatalogo.getCtId())
                                            || "170700490001".equals(regisCatalogo.getCtId())){
                                    %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienRamTamano">Tamaño de la Ram</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienRamTamano" name="bienRamTamano" placeholder="Ingrese el tamaño de la RAM">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienRamTecno">Tecnología de la Ram</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienRamTecno" name="bienRamTecno" placeholder="Ingrese la tecnología de la RAM">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienDiscoTama">Tamaño del disco</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienDiscoTama" name="bienDiscoTama" placeholder="Ingrese el tamaño del disco duro">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienDiscoTecno">Tecologia del disco</label>
                                        <input value="" required="true" type="number" class="form-control" id="bienDiscoTecno" name="bienDiscoTeno" placeholder="Ingrese la tecnologia disco duro">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienProcesador">Procesador</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienProcesador' name='bienProcesador'>
                                                <option value='IntelCore i3'>IntelCore i3</option>
                                                <option value='IntelCore i7'>IntelCore i7</option>
                                                <option value='IntelCore i9'>IntelCore i9</option>
                                                <option value='AMD Rysen 5'>AMD Rysen 5</option>
                                                <option value='AMD Rysen 7'>AMD Rysen 6</option>
                                                <option value='AMD Rysen 9'>AMD Rysen 7</option>
                                            </select>
                                        </div>
                                    </div>  
                                    <div class="form-group col-sm-6">
                                        <label for="bienTamPantalla">Tamaño de Pantalla</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienTamPantalla" name="bienTamPantalla" placeholder="Ingrese el tmaño de pantalla">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTipoPantalla">Tipo de Pantalla</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienTipoPantalla' name='bienTipoPantalla'>
                                                <option value='TACTIL'>TACTIL</option>
                                                <option value='NORMAL'>NORMAL</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTarjeRed">Tarjeta de red</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienTarjeRed' name='bienTarjeRed'>
                                                <option value='SI'>SI</option>
                                                <option value='NO'>NO</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienDvd">Lector de DVD</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienDvd' name='bienDvd'>
                                                <option value='SI'>SI</option>
                                                <option value='NO'>NO</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienSO">Sistema Operativo</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienSO' name='bienSO'>
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
                                    if("400100410002".equals(regisCatalogo.getCtId())){
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
                                    if("700100810001".equals(regisCatalogo.getCtId()) || "170700460001".equals(regisCatalogo.getCtId())){
                                    %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTamMemoInter">Tamaño de Memoria Interna</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienTamMemoInter" name="bienTamMemoInter" placeholder="Ingrese el tamaño de Memoria Interna">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTamMemoExter">Tamaño de Memoria Externa</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienTamMemoExter" name="bienTamMemoExter" placeholder="Ingrese el tamaño de Memoria Externa">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="bienProcesador">Procesador</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienProcesador" name="bienProcesador" placeholder="Ingrese tipo de procesador del bien">
                                    </div>
<!--                                    <div class="form-group col-sm-6">
                                        <label for="bienSO">Sistema Operativo</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienSO" name="bienSO" placeholder="Ingrese el Sistema Operativo del bien">
                                    </div>-->
                                    <div class="form-group col-sm-6">
                                        <label for="bienSO">Sistema Operativo</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienSO' name='bienSO'>
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
                                    if(regisCatalogo.getCtId().indexOf("7001007700") > -1 || "170700310001".equals(regisCatalogo.getCtId())){
                                    %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTipoBateria">Tipo de Bateria</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienTipoBateria" name="bienTipoBateria" placeholder="Ingrese el tipo de Bateria">
                                    </div>
                                <div class="form-group col-sm-6">
                                        <label for="bienNumConect">Numero de Conectores</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienNumConect" name="bienNumConect" placeholder="Ingrese el tamaño del Conector">
                                    </div>
                                    <%
                                    }
                                    //Si es Router
                                    if("700200170001".equals(regisCatalogo.getCtId())|| "170700040001".equals(regisCatalogo.getCtId())){
                                    %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienNumPuertos">Numero de puertos</label>
                                        <input value="" required="true" type="text" class="form-control" id="bienNumPuertos" name="bienNumPuertos" placeholder="Ingrese el numero el puertos">
                                    </div>
                                    <%
                                    }
                                    //Si es Lector
                                    if("170700370001".equals(regisCatalogo.getCtId())|| "700100360001".equals(regisCatalogo.getCtId())){
                                    %>
                                    <div class="form-group col-sm-6">
                                        <label for="bienTipLector">Tipo de Lector</label>
                                        <div class="caja">
                                            <select class='form-control Recursos' id='bienTipLector' name='bienTipLector'>
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
                                
                                <div class="form-group row">
                                    <div class="form-group col-sm-1">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#miModal">  
                                        Escoger Custodio
                                        </button>
                                    </div>   
                                    <div class="form-group col-sm-1">
                                        <label for="custodioId">Id custodio</label>
                                        <input value="" required="true" type="text" class="form-control" id="custodioId" name="custodioId" placeholder="Ingrese el tipo de Bateria" disabled>
                                    </div>
                                    <div class="form-group col-sm-4">
                                            <label for="cedNomCustodio">Nombre custodio</label>
                                            <input value="" required="true" type="text" class="form-control" id="cedNomCustodio" name="cedNomCustodio" placeholder="Ingrese el tamaño del Conector" disabled>
                                    </div>
                                </div>                            

                                <!-- Button para elegir custodio -->
                                    
    <!--                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#miModal">  
                                        Escoger Custodio
                                        </button>-->
                                    <!-- Modal de custodio -->
                                        <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">CUSTODIOS</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                                </button>
                                              </div>
                                              <form id ="formPersonas">  
                                                    <div class="modal-body" id="contenido">
                                                      <div class="widget widget-table">
                                                          <div class="widget-content">
                                                              <div class="table-responsive">
                                                                  <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                                                      <thead>
                                                                          <tr>                                                      
                                                                              <th>Cedula</th>
                                                                              <th>Nombre</th>
                                                                              <th>Item</th>
                                                                          </tr>
                                                                      </thead>                                 
                                                                      <tbody>
                                                                      <% 

                                                                          for (Persona oPet : listPersona) {
                                                                              out.println("<tr>");                                                                        
                                                                              out.println("<td>" + oPet.getPerCedula()+ "</td>");
                                                                              out.println("<td>" + oPet.getPerNombres()+ " " + oPet.getPerApellido1()+ " " + oPet.getPerApellido1()+ "</td>");
                                                                          %>
                                                                          <!--INICIO BONOTES DE ACCION-->
                                                                              <td align="center"> 
                                                                                  <div class="form-check">
                                                                                        <input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios1" value="<%= oPet.getPerId()+ "_"+ oPet.getPerCedula()+ "_" + oPet.getPerNombres()+ " " + oPet.getPerApellido1()+ " " + oPet.getPerApellido1()%>" checked>
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
                                                    </div>
                                              </form>
                                                 <div class="modal-footer">
                                                    <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>-->
                                                    <button type="button" id="btnElegPer" class="btn btn-primary" data-dismiss="modal" onclick="verOp()">Aceptar</button>
                                                </div>
                                            </div>
                                          </div>
                                        </div> 

                                    </form>
 
                                    
                                    <div class="col-sm-12" align='center'>
                                        <button  class='btn btn-danger' onclick="PreAddBien(), alertCancel()"><i class="fa fa-times"></i>Cancelar</button>
                                        <button  class='btn btn-primary' onclick="addBien()"><i class="fa fa-check-circle"></i>Agregar</button>
                                    </div>
                            </div>
                        </div>

                    </div>
                </div>
        </div>                    
    </div>
</div>  
</html>