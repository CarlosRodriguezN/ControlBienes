<%@page import="esntidadesSeg.Funcion"%>
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
        String strUsuLinea = session.getAttribute("codigoPersona").toString();
        String idDato = request.getParameter("idRef");
        String rol = request.getParameter("rol");
        
        //Listar personas por el codigo de la tabla persona
        ArrayList<Personapermiso> cadPerPm = new ArrayList<Personapermiso>();    
        String resultadoaccion = "{\"respuesta\":" + sPermisoPersona.listaTodosPermisoPersona() + "}";
        JSONObject objJSONpermPersona = new JSONObject(resultadoaccion);
        JSONArray arrayJSONrespuesta1 = objJSONpermPersona.getJSONArray("respuesta");
        for (int i = 0; i < arrayJSONrespuesta1.length(); i++) {
            JSONObject childJSONObject = arrayJSONrespuesta1.getJSONObject(i);
            Personapermiso objPerPm = new Gson().fromJson(childJSONObject.toString(), Personapermiso.class);
            cadPerPm.add(objPerPm);
        }

    %>
    
    
     <div class="main-header">
        <h2>Editar Permisos</h2>
        <em>Permisos registrados en el sistema.</em>
    </div>
    
 
    <div class="main-content">
        <div class="well well-lg knowledge-recent-popular">
            <div class="row">

                <form role="form" id="FrmEditPermisos">
                    <table class="table">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            int cont = 0;
                            for (Personapermiso oPerPm: cadPerPm) {
                                if(oPerPm.getPerId().getPerId() == Integer.parseInt(idDato)){
                                    cont++;
                                    if(cont==1)
                                        out.println("<tr>"); 
                                    
                            %>
                                        <td align="center"> 
                                            <div class="form-check form-check-inline">
                                                
                                                <%if(oPerPm.getPerpmEstado()){%>
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name ="nombre" value="<%= oPerPm.getIdPerPm() %>" checked>
                                                <%}else{%>
                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name ="nombre" value="<%= oPerPm.getIdPerPm() %>" >
                                                <%}%>
                                                <label class="form-check-label" for="inlineCheckbox1"><%= oPerPm.getPmId().getPmNombre() %></label>
                                            </div>
                                        </td>                                  
                            <%
                                    
                                    if(cont==4){
                                        out.println("</tr>");  
                                        cont = 0;
                                    }
                                }
                            }
                                if(cont>0)
                                    out.println("</tr>"); 
                            %>
                          
                </form>
                    
                    
                    </br></br>
                <div class="col-sm-12" align='center'>
                    <%
                    if(rol.equals("supervisor")){
                    %>
                        <button  class='btn btn-danger' onclick="AdminSupervisores()"><i class="fa fa-times"></i>Cancelar</button>
                    <%
                    }
                    if(rol.equals("operario")){
                    %>
                        <button  class='btn btn-danger' onclick="AdminOperarios()"><i class="fa fa-times"></i>Cancelar</button>
                    <%
                    }
                    %>
                    <button  class='btn btn-primary' onclick="EditCheck(<%= idDato %>)"><i class="fa fa-check-circle"></i>Editar</button>
                </div>
            </div>
        </div>
    </div>
</html>
