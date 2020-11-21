<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<%@page import="java.util.Base64"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.*"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.*"%>

<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    
    <link href="assets/css/skins/darkblue.css" rel="stylesheet" type="text/css"/>

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
    
    


    <%
        String strOpc = session.getAttribute("codigoPersona").toString();
        Integer Analidato = Integer.parseInt(session.getAttribute("codigoPersona").toString());
        ArrayList<Certificado> listCertificado = new ArrayList<Certificado>();
        

        ArrayList<Periodo> listPeriodo = new ArrayList<Periodo>();

        String FechCert = "";
        if (strOpc != null) {
            if (session.getAttribute("ingreso").toString().equals("true")) {
                String serCertPersona = sCertificado.listaCertificadoPersona(Analidato);

                //Lista de certificados de la persona seleccionada
                String resultadoCertifi = "{\"respuesta\":" + serCertPersona + "}";
                JSONObject objCertif = new JSONObject(resultadoCertifi);
                JSONArray arrayCertif = objCertif.getJSONArray("respuesta");
                for (int i = 0; i < arrayCertif.length(); i++) {
                    JSONObject childJSONObject = arrayCertif.getJSONObject(i);
                    Certificado objMenus = new Gson().fromJson(childJSONObject.toString(), Certificado.class);
                    listCertificado.add(objMenus);
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>




    <div class="main-header">
        <h2>Mis certificados</h2>
        <em>Certificados que he obtenido en la ESPOCH</em>
    </div>
    <div class="main-content">
        <div class="widget widget-table">
            <div class="widget-header">
                <h3><i class="fa fa-table"></i> Certificados al desempeño docente</h3> 
            </div>
            <div class="widget-content">

                <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">

                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Período</th>
                            <th>Detalle</th>
                            <th>N. Descargas</th>
                            <th>Descargar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Certificado oPet : listCertificado) {
                                String strFechaInicio = oPet.getCerFecha();
                                String str1FecIn = strFechaInicio.replace("/Date(", "");
                                String[] palabrasSeparadas = str1FecIn.split("T");
                                String datFecha = palabrasSeparadas[0];
                                String datNomb = oPet.getPersona().getPersoNombres() + " " + oPet.getPersona().getPersoApellido1() + " " + oPet.getPersona().getPersoApellido2();
                                String datTipoCer = oPet.getTipocertificado().getTicerDescripcion();
                                Integer datIDTipoCer = oPet.getTipocertificado().getTicerId();
                                Integer datIDPerio = oPet.getPeriodo().getPerId();
                                String datPerio = oPet.getPeriodo().getPerDescipcion();

                                
                                
                                String datos = datNomb + ":" + datIDPerio + ":" + datTipoCer + ":" + datFecha + ":" + datPerio;
                                String Update = datIDPerio + ":" + datIDTipoCer + ":" + Analidato ;
                                out.println("<tr id=" + datos + ">");
                                out.println("<td>" + datFecha + "</td>");
                                out.println("<td>" + oPet.getPeriodo().getPerDescipcion() + "</td>");
                                out.println("<td>" + oPet.getTipocertificado().getTicerDescripcion() + "</td>");
                                out.println("<td>" + oPet.getCont() + "</td>");%>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick="UpdateCer('<%= Update%>');clicCertificadoPDF('<%= datos%>')" class='fa fa-file-pdf-o' title='Descargar' ></i></td>
                        <%out.println("</tr>");
                            }%>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</html>