<%@page import="esntidadesSeg.Funcion"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
        String rol1,rol2,rol3;
  
        try{
            rol1 = session.getAttribute("Rol0").toString();
        }catch(Exception e)
        {
            rol1 = "";
        }
        try{
            rol2 = session.getAttribute("Rol1").toString();
        }catch(Exception e)
        {
            rol2 = "";
        }
        try{
            rol3 = session.getAttribute("Rol2").toString();
        }catch(Exception e)
        {
            rol3 = "";
        }
        
        ArrayList<Traspaso> listTraspaso = new ArrayList<Traspaso>();
        ArrayList<Persona> listPersona = new ArrayList<Persona>();
        ArrayList<Dependencia> listDependencia = new ArrayList<Dependencia>();
        ArrayList<Ubicacion> listUbicacion = new ArrayList<Ubicacion>();
        ArrayList<Motivoinforme> listMotInforme = new ArrayList<Motivoinforme>();
        if (UsuLinea != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serTraspaso = sTraspaso.listaTodosTraspaso();
                
                    //Lista de idiomas de la persona seleccionada
                String resultadoTraspaso = "{\"respuesta\":" + serTraspaso + "}";
                JSONObject objTraspaso = new JSONObject(resultadoTraspaso);
                JSONArray arrayTraspaso = objTraspaso.getJSONArray("respuesta");
                for (int i = 0; i < arrayTraspaso.length(); i++) {
                    JSONObject childJSONObject = arrayTraspaso.getJSONObject(i);
                    Traspaso objMenus = new Gson().fromJson(childJSONObject.toString(), Traspaso.class);
                    listTraspaso.add(objMenus);
                }
                
                //Lista de Personas
                String resultadoPersona = "{\"respuesta\":" + sPersona.listaTodosPersona() + "}";
                JSONObject objPersona = new JSONObject(resultadoPersona);
                JSONArray arrayPersona = objPersona.getJSONArray("respuesta");
                for (int i = 0; i < arrayPersona.length(); i++) {
                    JSONObject childJSONObject = arrayPersona.getJSONObject(i);
                    Persona objMenuPer = new Gson().fromJson(childJSONObject.toString(), Persona.class);
                     listPersona.add(objMenuPer);
                }
                
                //Lista de dependencias
                String resultadoDependencia = "{\"respuesta\":" + sDependencia.listaTodosDependencia() + "}";
                JSONObject objDependencia = new JSONObject(resultadoDependencia);
                JSONArray arrayDependencia = objDependencia.getJSONArray("respuesta");
                for (int i = 0; i < arrayDependencia.length(); i++) {
                    JSONObject childJSONObject = arrayDependencia.getJSONObject(i);
                    Dependencia objMenuDep = new Gson().fromJson(childJSONObject.toString(), Dependencia.class);
                    listDependencia.add(objMenuDep);
                }
                
                //Lista de ubicacion
                String resultadoUbicacion = "{\"respuesta\":" + sUbicacion.listaTodosUbicacion() + "}";
                JSONObject objUbicacion = new JSONObject(resultadoUbicacion);
                JSONArray arrayUbicacion = objUbicacion.getJSONArray("respuesta");
                for (int i = 0; i < arrayUbicacion.length(); i++) {
                    JSONObject childJSONObject = arrayUbicacion.getJSONObject(i);
                    Ubicacion objMenuUbic = new Gson().fromJson(childJSONObject.toString(), Ubicacion.class);
                    listUbicacion.add(objMenuUbic);
                }
                
                //Lista de Motivo
                String resultadoMotivo = "{\"respuesta\":" + sMotivoInforme.listaTodosMotivoinforme() + "}";
                JSONObject objMotivo = new JSONObject(resultadoMotivo);
                JSONArray arrayMotivo = objMotivo.getJSONArray("respuesta");
                for (int i = 0; i < arrayMotivo.length(); i++) {
                    JSONObject childJSONObject = arrayMotivo.getJSONObject(i);
                    Motivoinforme objMenuMotivo = new Gson().fromJson(childJSONObject.toString(), Motivoinforme.class);
                    listMotInforme.add(objMenuMotivo);
                }
                    
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
    
    <%
        //Pemisos Pesona
        ArrayList<Personapermiso> cadPerPm = new ArrayList<Personapermiso>();  
        String listPerPm = sPermisoPersona.listaPermisoPersonaPorCodPersona(Integer.parseInt(UsuLinea));
        String resultadoaccion = "{\"respuesta\":" + listPerPm + "}";
        JSONObject objJSONrespuesta1 = new JSONObject(resultadoaccion);
        JSONArray arrayJSONrespuesta1 = objJSONrespuesta1.getJSONArray("respuesta");
        for (int i = 0; i < arrayJSONrespuesta1.length(); i++) {
            JSONObject childJSONObject = arrayJSONrespuesta1.getJSONObject(i);
            Personapermiso objPerPm = new Gson().fromJson(childJSONObject.toString(), Personapermiso.class);
            cadPerPm.add(objPerPm);
        }
    %>
    
    
    <script>
      function verOp(idTraspaso,codBien){
            $("#traspasoId").val(idTraspaso);
            $("#codBienId").val(codBien);
            $("#codigoBienId").val(codBien);
            
            //alert("Hello!!!!!! "+idTraspaso+" !!!!I am an alert box!!");
       }
   </script>
 
    <div class="main-header">
        <h2>Bienes</h2>
        <em>Bienes y usuarios.</em>
    </div>

    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkUsuarios" data-toggle="tab">Bienes</a></li>
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
                                                <th>Numero Traspaso</th>
                                                <th>Codigo Bien</th>
                                                <th>Nombre del Bien</th>
                                                <th>Fecha compra</th>
                                                <th>Fecha garantia</th>
                                                <th>Cedula custodio</th>
                                                <th>Nombres</th>
                                                <th>Apellidos</th>
                                                <th>Fecha traspaso</th>
                                                <th>Condicion</th>
                                                <th>Estado</th> 
                                                <%if(getPermisos(cadPerPm ,"POP_MODBIEN")||rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){%>
                                                <th>Editar</th>
                                                <%}
                                                 if(getPermisos(cadPerPm ,"POP_DESBIEN")||rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){
                                                %>
                                                <th>Estado</th>
                                                <% 
                                                }    
                                                //if((getPermisos(cadPerPm ,"PSU_TRABIEN") && (rol1.equals("SUPEVISOR") || rol2.equals("SUPERVISOR") || rol3.equals("SUPERVISOR"))) || rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){
                                                if(getPermisos(cadPerPm ,"PSU_TRABIEN")||rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){%>
                                                    <th>Traspaso</th>
                                                <%}%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Traspaso oPet : listTraspaso) {
                                                   if(oPet.getBnCodBien().getBaId().getBaDetalle().equals("ACTIVO")){
                                                        out.println("<tr>");
                                                        
                                                        String str1FecIn = oPet.getTraFechaInicio().replace("/Date(", "");
                                                        String[] palabrasSeparadas = str1FecIn.split("T");
                                                        String datFecha = palabrasSeparadas[0];
                                                        
                                                        String str1FecCompra = oPet.getBnCodBien().getBnFechaCompra().replace("/Date(", "");
                                                        String[] palabrasFecCompra = str1FecCompra.split("T");
                                                        String datFechaFecCompra = palabrasFecCompra[0];
                                                        
                                                        String str1FecGaran = oPet.getBnCodBien().getBnFechaGarantia().replace("/Date(", "");
                                                        String[] palabrasFecGaran = str1FecGaran.split("T");
                                                        String datFechaFecGaran = palabrasFecGaran[0];
                                                        
                                                        
                                                        out.println("<td>" + oPet.getTraId() + "</td>");
                                                        out.println("<td>" + oPet.getBnCodBien().getBnCodBien() + "</td>");
                                                        out.println("<td>" + oPet.getBnCodBien().getBnNombre() + "</td>");
                                                        out.println("<td>" + datFechaFecCompra + "</td>");
                                                        out.println("<td>" + datFechaFecGaran + "</td>");
                                                        out.println("<td>" + oPet.getPerId().getPerCedula() + "</td>");
                                                        out.println("<td>" + oPet.getPerId().getPerNombres() + "</td>");
                                                        out.println("<td>" + oPet.getPerId().getPerApellido1() +" "+ oPet.getPerId().getPerApellido2() + "</td>");
                                                        out.println("<td>" + datFecha + "</td>");
                                                        out.println("<td>" + oPet.getBnCodBien().getBnEstadoBien() + "</td>");
                                                        out.println("<td>" + oPet.getBnCodBien().getBaId().getBaDetalle() + "</td>");                                                      
                                            %>
                                            <!--INICIO BONOTES DE ACCION-->
                                            <%if(getPermisos(cadPerPm ,"POP_MODBIEN")||rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){%>
                                                <td align="center"> 
                                                    <div class="btn-group btn-group-xs">
                                                        <button type="button" class="btn btn-warning" title="Editar" onclick="editarBien(<%=oPet.getBnCodBien().getBnCodBien()%>,<%=oPet.getPerId().getPerId()%>,<%=oPet.getBnCodBien().getCatId().getCtId()%>)"><i class="fa  fa-pencil-square-o" style="font-size: 17px;"></i></button>
                                                    </div>
                                                </td>
                                            <%}
                                            if(getPermisos(cadPerPm ,"POP_DESBIEN")||rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){
                                            %>
                                            <!-- BONOTES DE ACCION HABILITAR DESABILITAR-->
                                            <td align="center"> 
                                                <div class="btn-group btn-group-xs">
                                                    <!--INICIO IF PARA ACTIVAR-->
                                                    <%if (oPet.getBnCodBien().getBaId().getBaId()>= 2) {%>
                                                    <button type="button" class="btn btn-primary" title="Habilitar" onclick=""><i class="fa fa-check-circle" style="font-size: 17px;"></i></button>
                                                        <%}%>
                                                    <!--FIN IF PARA ACTIVAR-->
                                                    <!--INICIO IF PARA DESABILITAR-->
                                                    <%if (oPet.getBnCodBien().getBaId().getBaId() == 1) {%>
                                                    <button type="button" class="btn btn-primary" title="Desabilitar" onclick = "verOp(<%=oPet.getTraId() %>,<%=oPet.getBnCodBien().getBnCodBien() %>)"  id="idBtnDesactivar" name= "idBtnDesactivar" type="button" class="btn btn-success" data-toggle="modal" data-target="#modalBaja" ><i class="fa fa-times" style="font-size: 17px;"></i></button>
                                                        <%}%>
                                                    <!--FIN IF PARA DESABILITAR-->
                                                </div>
                                            </td>
                                            <% 
                                                }
                                                //if((getPermisos(cadPerPm ,"PSU_TRABIEN") && (rol1.equals("SUPEVISOR") || rol2.equals("SUPERVISOR") || rol3.equals("SUPERVISOR"))) || rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){
                                                if(getPermisos(cadPerPm ,"PSU_TRABIEN")||rol1.equals("ADMINISTRADOR") || rol2.equals("ADMINISTRADOR") || rol3.equals("ADMINISTRADOR")){
                                            %>
                                                <!--BOTON ACCION TRANSPASO-->
                                                <td align="center"> 
                                                    <div class="btn-group btn-group-xs">
                                                        <button  onclick = "bnTraspasoPersona(<%=oPet.getTraId() %>,<%=oPet.getBnCodBien().getBnCodBien() %>)" name= "idBtnTraspaso" type="button" class="btn btn-success" data-toggle="modal" data-target="#miModal" ><i class="fa fa-pencil-square" style="font-size: 17px;"></i></button>
                                                    </div>
                                                </td>
                                            <%  
                                                }
                                                out.println("</tr>");
                                                }
                                            }   
                                            %>
                                            </tr>
                                        </tbody>                                         
                                    </table>           
                                          
                                    <!--Modal de Baja de un Bien-->    
                                    <div class="modal fade" id="modalBaja" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                      <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                          <div class="modal-header p-3 mb-2 bg-primary text-white text-center">
                                            <h5 class="modal-title" id="exampleModalLabel">BAJA DE UN BIEN</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                                </button>
                                          </div>
                                          <form id ="FrmMotivoBaja">     
                                                <div class="modal-body" id="contenido">
                                                    
                                                    <div class="form-group col-sm-6">
                                                        <label for="bienMotivoInformeId">Motivo del la Baja del Bien</label>
                                                        <div class="caja">
                                                            <select class='form-control Recursos' id='bienMotivoInformeId' name='bienMotivoInformeId'>
                                                                 <%
                                                                    for (Motivoinforme oPet : listMotInforme) {
                                                                        out.println("<option value='" + oPet.getMotId() + "'>" + oPet.getMotDetalle() + "</option>");
                                                                    }
                                                                 %>
                                                            </select>
                                                        </div>
                                                    </div>                                                  
                                                     
                                                     <label for="codigoBienId"></label>
                                                     <input value="" required="true" type="hidden" class="form-control" id="codigoBienId" name="codigoBienId">
                                                     
                                                </div>
                                          </form>
                                            <div class="modal-footer">
                                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                              <button type="button" id="btnElegPer" class="btn btn-primary" data-dismiss="modal" onclick="editarMotivoBaja()">Aceptar</button>
                                            </div>
                                        </div>
                                      </div>                           
                                    </div>
                                                                      
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>  
    <%!
        public Boolean getPermisos(ArrayList<Personapermiso> cadPerPm, String codPermiso)
        {
            Boolean bandera = false;
            String usuPermiso = "";
            for (Personapermiso oPerPm: cadPerPm) {
                usuPermiso = oPerPm.getPmId().getPmCodigo().replaceAll("\n","");
                if(oPerPm.getPerpmEstado() && usuPermiso.equals(codPermiso))
                {
                        bandera = true;
                }
            }
            return bandera; 
        }
    %>
</html>