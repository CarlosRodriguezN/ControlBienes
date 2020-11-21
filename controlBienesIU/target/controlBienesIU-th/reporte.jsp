<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 10000000000 
huye ahora que puedes ve hsz tus maletas y vete a vivir en el monte y sé feliz
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
<%@ page import="java.sql.*" %>
<%
    String stridDatos = request.getParameter("cedulaUser");
    byte[] decoded = Base64.getDecoder().decode(stridDatos);
    String decodedString = new String(decoded,"UTF-8");
    String[] datos = decodedString.split(":");
    String datNombres = datos[0];
    String datIDPerio = datos[1];
    String datTipCert = datos[2];
    String datFechCer = datos[3];
    String datPeriodo = datos[4];

    String[] fecha = datFechCer.split("-");
    String FecAnio = fecha[0];
    String FecMes = fecha[1];
    String FecDia = fecha[2];

    if (Integer.parseInt(fecha[1]) == 1) {
        FecMes = "Enero";
    }
    if (Integer.parseInt(fecha[1]) == 2) {
        FecMes = "Febrero";
    }
    if (Integer.parseInt(fecha[1]) == 3) {
        FecMes = "Mazro";
    }
    if (Integer.parseInt(fecha[1]) == 4) {
        FecMes = "Abril";
    }
    if (Integer.parseInt(fecha[1]) == 5) {
        FecMes = "Mayo";
    }
    if (Integer.parseInt(fecha[1]) == 6) {
        FecMes = "Junio";
    }
    if (Integer.parseInt(fecha[1]) == 7) {
        FecMes = "Julio";
    }
    if (Integer.parseInt(fecha[1]) == 8) {
        FecMes = "Agosto";
    }
    if (Integer.parseInt(fecha[1]) == 9) {
        FecMes = "Septiembre";
    }
    if (Integer.parseInt(fecha[1]) == 10) {
        FecMes = "Octubre";
    }
    if (Integer.parseInt(fecha[1]) == 11) {
        FecMes = "Noviembre";
    }
    if (Integer.parseInt(fecha[1]) == 12) {
        FecMes = "Diciembre";
    }

    datFechCer = FecMes + ", " + FecDia + " del " + FecAnio;

    File reportFile = new File("");
    //a que certificado estoy apuntando este valor es el mas importante
    if (Integer.parseInt(datIDPerio) == 2) {
        reportFile = new File(application.getRealPath("Reportes/certifica.jasper"));
    }
    
    if (Integer.parseInt(datIDPerio) == 3) {
        reportFile = new File(application.getRealPath("Reportes/2018AbrilAgosto.jasper"));
    }
    
    if (Integer.parseInt(datIDPerio) == 4) {
        reportFile = new File(application.getRealPath("Reportes/2018Sep2019Feb.jasper"));
    }
    
    Map parameters = new HashMap();
    parameters.put("Nombres", datNombres);
//  parameters.put("Nombres", datPorcent);
    parameters.put("TipCert", datTipCert);
    parameters.put("FchCert", datFechCer);
    parameters.put("Periodo", datPeriodo);

    /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, new JREmptyDataSource());
    /*Indicamos que la respuesta va a ser en formato PDF*/

    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    /*Limpiamos y cerramos flujos de salida*/
    ouputStream.flush();
    ouputStream.close();

%>
