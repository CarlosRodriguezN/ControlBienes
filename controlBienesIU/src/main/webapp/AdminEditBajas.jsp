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
        Baja objBaja = new Baja();
        if (session.getAttribute("ingreso").toString().equals("true")) {
            String idDato = request.getParameter("idDato");
            String serBaja = sBaja.listaBajaId(Integer.parseInt(idDato));
            JSONObject req = new JSONObject(serBaja);
            objBaja = new Gson().fromJson(req.toString(), Baja.class);
            if (objBaja.getBaEstado().equals(1)) {
                OnOff = "checked";
            }

        } else {
            response.sendRedirect("index.jsp");
        }

    %>
    
    
     <div class="main-header">
        <h2>Tipos de Bajas</h2>
        <em>Tipos de Bajas registradas en el sistema.</em>
    </div>

    
    
 
    <div class="main-content">
        <div class="well well-lg knowledge-recent-popular">
            <div class="row">

                <form role="form" id="FrmEditBaja">
                    <div class="form-group col-sm-10">
                        <label for="DetaBaja">Detalle de la baja</label>
                        <input value="<%= objBaja.getBaDetalle()%>" required="true" type="text" class="form-control" id="DetaBaja" name="DetaBaja" placeholder="Ingrese el detalle de la baja">
                    </div>
                    <div class="form-group col-sm-2">
                        <label class="col-sm-12">Estado</label>
                        <div class="col-sm-12">
                            <div class="control-inline onoffswitch">
                                <input type="checkbox" class="onoffswitch-checkbox" id="EstBaja" name="EstBaja" <%out.println(OnOff);%>>
                                <label class="onoffswitch-label" for="EstBaja">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="col-sm-12" align='center'>
                    <button  class='btn btn-danger' onclick="verBaja(),alertCancel()"><i class="fa fa-times"></i>Cancelar</button>
                    <button  class='btn btn-primary' onclick="EditarBaja(<%= objBaja.getBaId()%>)"><i class="fa fa-check-circle"></i>Editar</button>
                </div>
            </div>
        </div>

    </div>

</html>