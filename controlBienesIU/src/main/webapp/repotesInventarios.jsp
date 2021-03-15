<%@page import="servicios.sPersona"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="utils.Conexion"%>
<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

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
        String UsuLinea = session.getAttribute("codigoPersona").toString();
        String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();

        String stridDatos = request.getParameter("cert");
        byte[] decoded = Base64.getDecoder().decode(stridDatos);
        String decodedString = new String(decoded, "UTF-8");
        String[] datos = decodedString.split("__");
        String parametros  =  datos[0];
        String rangofecha  =  datos[1];
        String tiporeporte =  datos[2];
        
        String[] fechas = rangofecha.split(",");
        String fechai = fechas[0].replaceAll("\\{", "").replaceAll("\"", "").replaceAll(":", "").replaceAll("fechai", "");
        String fechaf = fechas[1].replaceAll("\"", "").replaceAll(":", "").replaceAll("fechaf", "").replaceAll("\\}", "");
        String v ="";
        
        //Obtener Responsable q genera el reporte
        Persona objPersona = new Persona();
        String servNombrePersona = sPersona.listaPersonaCedula(UsuLineaCedula);
        JSONObject reqPersona = new JSONObject(servNombrePersona);
        objPersona = new Gson().fromJson(reqPersona.toString(), Persona.class);

        String PersonQueGenera = objPersona.getPerNombres() + " " + objPersona.getPerApellido1() + " " + objPersona.getPerApellido2();
        String cargoPersona = objPersona.getCarId().getCarDescripcion();
        
        //Obteniendo fecha actual
        Date date = new Date();
        DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
        String fecha = fechaHora.format(date);
        
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date di = null, df = null;
         
        if(!tiporeporte.equals("garantia")){
            di = formatter.parse(fechai);
            df = formatter.parse(fechaf);
        }
  
        Date dfactual = formatter.parse(fecha);
        
        File reportFile = null;
        
        Map parameters = new HashMap();
        if(!tiporeporte.equals("garantia"))
        {
            parameters.put("fechai", di);
            parameters.put("fechaf", df);
        }
        
        parameters.put("responsable",PersonQueGenera);
        parameters.put("cargo",cargoPersona);
        
        if(tiporeporte.equals("traspaso"))
        {    
            fnAuditoria(UsuLinea,tiporeporte);
            reportFile = new File(application.getRealPath("Reportes/ReporteInventarioTraspasos.jasper"));
        }                                                         
        
        if(tiporeporte.equals("marca"))
        {
            fnAuditoria(UsuLinea,tiporeporte);
            String datmarca = parametros.replaceAll("\\{", "").replaceAll("\"", "").replaceAll(":", "").replaceAll("marca", "").replaceAll("\\}", "");
            parameters.put("marca", datmarca);
            reportFile = new File(application.getRealPath("Reportes/ReporteInventarioMarca.jasper"));
        }
        
        if(tiporeporte.equals("desactivado"))
        {
            fnAuditoria(UsuLinea,tiporeporte);
            reportFile = new File(application.getRealPath("Reportes/ReporteInventarioDesactivado.jasper"));
        }                                                                    
        
        if(tiporeporte.equals("ubicadep"))
        {
            fnAuditoria(UsuLinea,tiporeporte);
            String[] datoDepUbic = parametros.split(",");
            String ubicacion = datoDepUbic[0].replaceAll("\"", "").replaceAll(":", "").replaceAll("ubicacion", "").replaceAll("\\{", "");
            String dependencia = datoDepUbic[1].replaceAll("\"", "").replaceAll(":", "").replaceAll("dependencia", "").replaceAll("\\}", "");
            parameters.put("ubicacion", ubicacion);
            parameters.put("dependencia", dependencia);
            reportFile = new File(application.getRealPath("Reportes/ReporteInventarioUbicDep.jasper"));
        }
        
        if(tiporeporte.equals("garantia"))
        {
            fnAuditoria(UsuLinea,tiporeporte);
            parameters.put("fechactual", dfactual);
            reportFile = new File(application.getRealPath("Reportes/ReporteInventarioGarantia.jasper"));
        }

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
        System.out.println("className.methodName()" + e.getMessage());
    }

%>
<!--</html>-->
<%!
    //Funcion Auditoria
    void fnAuditoria(String UsuLinea, String opc)
    {
        Auditoria objAuditoria = new Auditoria();
        objAuditoria.setUsuId(UsuLinea);

        if(opc.equals("traspaso")){ 
            objAuditoria.setAudMetodo("REPORTE_TRASPASO");
            objAuditoria.setAudDetalle("Generacion de Reporte Traspaso");
        }
        if(opc.equals("marca")){
            objAuditoria.setAudMetodo("REPORTE_MARCA");
            objAuditoria.setAudDetalle("Generacion de Reporte por Marca");
        }
        if(opc.equals("desactivado")){
            objAuditoria.setAudMetodo("REPORTE_DESACTIVADO");
            objAuditoria.setAudDetalle("Generacion de Reporte de Bienes Desactivados");
        }
        if(opc.equals("ubicadep")){
            objAuditoria.setAudMetodo("REPORTE_UBICDEP");
            objAuditoria.setAudDetalle("Generacion de Reporte por Ubicación y Dependencia");
        }
        if(opc.equals("garantia")){
            objAuditoria.setAudMetodo("REPORTE_GARANTIA");
            objAuditoria.setAudDetalle("Generacion de Reporte por Garantia");
        }
      
        //Obteniendo fecha actual
        Date date = new Date();
        DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
        String fecha = fechaHora.format(date);
        DateFormat hora = new SimpleDateFormat("HH:mm");
        
        objAuditoria.setAudFecha(fecha + " " + hora.format(date));
        objAuditoria.setAudIp("");
        objAuditoria.setAudDatosmod("");
        objAuditoria.setAudMac("");
        objAuditoria.setAudDate(fecha  + "T00:00:00-05:00");
       try{
        String jsonArmado = new Gson().toJson(objAuditoria, Auditoria.class);
        String retornoJSON = sAuditoria.InsertarAuditoria(jsonArmado);
        String d;
        }  catch (Exception e) {
//             out.println ( "Ocurrió una excepción:" + e.getMessage ());   
        }
    }
%>

