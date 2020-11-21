<%@page import="java.text.SimpleDateFormat"%>
<%@page import="utils.Conexion"%>
<!--
que fácil este jueguito

-->

<%@page import="net.sf.jasperreports.engine.export.JRPdfExporter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
    try {
        String stridDatos = request.getParameter("cert");
        byte[] decoded = Base64.getDecoder().decode(stridDatos);
        String decodedString = new String(decoded, "UTF-8");
        String[] datos = decodedString.split(",");
        for (int i = 0; i < datos.length; i++) {
            System.out.println(datos[i]);
        }
        String datCodigo = datos[0].replaceAll("\\{", "").replaceAll("\"", "").replaceAll(":", "").replace("TipId", "");
        String datFechai = datos[1].replaceAll("\"", "").replaceAll(":", "").replaceAll("mantfechai", "");
        String datFechaf = datos[2].replaceAll("\"", "").replaceAll(":", "").replaceAll("mantfechaf", "");
        String datNombres = datos[3].replaceAll("\"", "").replaceAll(":", "").replaceAll("nombresUsuario", "");
        String datCargo = datos[4].replaceAll("\"", "").replaceAll(":", "").replaceAll("cargoUsuario", "");
        String[] datRevision = datos[5].split("_");
        String datResRevision = datRevision[0].replaceAll("\"", "").replaceAll(":", "").replaceAll("responsableRecibo", "");;
        String datResCargo = datRevision[1].replaceAll("\\}", "").replaceAll("\"", "");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date di = formatter.parse(datFechai);
        Date df = formatter.parse(datFechaf);
        File reportFile = new File(application.getRealPath("Reportes/ReporteMantenimientoPorTipoTable.jasper"));

        Map parameters = new HashMap();
        parameters.put("tipoM", Integer.parseInt(datCodigo));
        parameters.put("fechai", di);
        parameters.put("fechaf", df);
        parameters.put("tgenerado", datNombres);
        parameters.put("tgeneradocargo", datCargo);
        parameters.put("trevisado", datResRevision);
        parameters.put("trevisadocargo", datResCargo);
        /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/
        Conexion c = new Conexion();
        byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, c.connectDatabase());

        /*Indicamos que la respuesta va a ser en formato PDF*/
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream ouputStream = response.getOutputStream();
        ouputStream.write(bytes, 0, bytes.length);
        /*Limpiamos y cerramos flujos de salida*/
        ouputStream.flush();
        ouputStream.close();
    } catch (Exception e) {
        System.out.println("className.methodName()" + e.getLocalizedMessage());
    }

%>
