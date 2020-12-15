<%@page import="esntidadesSeg.Funcion"%>
<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    <link href="assets/css/skins/fulldark.css" rel="stylesheet" type="text/css"/>

    <script src="dtic/dtic.filtrar.js" type="text/javascript"></script>
    <script src="dtic/grafica.js" type="text/javascript"></script>
    <link href="datatable/bootstrap-table.min.css" rel="stylesheet" type="text/css"/>
    <script src="datatable/bootstrap-table.min.js" type="text/javascript"></script>


    <%
        String OnOff = "";
        String strUsuLinea = session.getAttribute("codigoPersona").toString();
        Funcion objPerio = new Funcion();
        if (session.getAttribute("ingreso").toString().equals("true")) {
            String idDato = request.getParameter("idRef");
            String resultadoaccion = sSeguridad.listarFuncion(Integer.parseInt(idDato));
            JSONObject objJSONrespuesta1 = new JSONObject(resultadoaccion);
            JSONArray arrayJSONrespuesta1 = objJSONrespuesta1.getJSONArray("objLista");
            for (int i = 0; i < arrayJSONrespuesta1.length(); i++) {
                JSONObject childJSONObject = arrayJSONrespuesta1.getJSONObject(i);
                objPerio = new Gson().fromJson(childJSONObject.toString(), Funcion.class);
            }
            if (objPerio.getBlnactivo() == true) {
                OnOff = "checked";
            }

        } else {
            response.sendRedirect("index.jsp");
        }

    %>

    <div class="main-header">
                            <%
                    if(objPerio.getIntrolId().getIntid() == 52)
                    {
                    %>
                        <h2>Administrador del sistema Control de  Bienes</h2>
                        <em>Editar el estado del Supervisor</em>
                    <%
                    }
                    if(objPerio.getIntrolId().getIntid() == 53)
                    {
                    %>
                        <h2>Administrador del sistema Control de  Bienes</h2>
                        <em>Editar el estado del Operario</em>
                    <%
                    }
                    %>
    </div>
    <div class="main-content">
        <div class="well well-lg knowledge-recent-popular">
            <div class="row">

                <form role="form" id="FrmEditTipoFlujo">
                    <div class="form-group col-sm-4">
                        <label for="TipoFlNomb">Nombre</label>
                        <input value="<%= objPerio.getUsuId().getUsuNombre() %>" required="true" type="text" class="form-control" id="TipoFlNomb" name="TipoFlNomb"  placeholder="Ingrese el nombre" readonly="true">
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="TipoFlDesc">Rol</label>
                        <input value="<%= objPerio.getIntrolId().getStrnombre() %>" required="true" type="text" class="form-control" id="TipoFlDesc" name="TipoFlDesc" placeholder="Ingrese la descripción" readonly="true">
                    </div>
                    <div class="form-group col-sm-2">
                        <label class="col-sm-12">Estado</label>
                        <div class="col-sm-12">
                            <div class="control-inline onoffswitch">
                                <input type="checkbox" class="onoffswitch-checkbox" id="TipoFlEsta" name="TipoFlEsta" <%out.println(OnOff);%>>
                                <label class="onoffswitch-label" for="TipoFlEsta">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="col-sm-12" align='right'>
                    <%
                    if(objPerio.getIntrolId().getIntid() == 52)
                    {
                    %>
                    
                    <button  type='button' class='btn btn-danger' onclick="AdminSupervisores(),alertCancel()">Cancelar</button>
                    <button  type='button' class='btn btn-primary' onclick="EditRol(<%= objPerio.getIntid()%>,'supervisor')">Editar</button>
                    <%
                    }
                    if(objPerio.getIntrolId().getIntid() == 53)
                    {
                    %>
                    <button  type='button' class='btn btn-danger' onclick="AdminOperarios(),alertCancel()">Cancelar</button>
                    <button  type='button' class='btn btn-primary' onclick="EditRol(<%= objPerio.getIntid()%>,'operario')">Editar</button>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>

    </div>

</html>
