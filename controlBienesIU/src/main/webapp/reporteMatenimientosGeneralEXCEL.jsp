<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>
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

        String stridDatos = request.getParameter("cert");
        byte[] decoded = Base64.getDecoder().decode(stridDatos);
        String decodedString = new String(decoded, "UTF-8");
        String[] datos = decodedString.split(",");
        String datNombres = datos[0].replaceAll("\\{", "").replaceAll("\"", "").replaceAll(":", "").replace("mantnombre", "");
        String datFechai = datos[1].replaceAll("\"", "").replaceAll(":", "").replaceAll("mantfechai", "");
        String datFechaf = datos[2].replaceAll("\"", "").replaceAll(":", "").replaceAll("mantfechaf", "");
        String datNombresG = datos[3].replaceAll("\"", "").replaceAll(":", "").replaceAll("nombresUsuarioA", "");
        String datCargoG = datos[4].replaceAll("\"", "").replaceAll(":", "").replaceAll("cargoUsuarioA", "");
        String[] datRevision = datos[5].split("_");
        String datResRevision = datRevision[0].replaceAll("\"", "").replaceAll(":", "").replaceAll("responsableReciboA", "");;
        String datResCargo = datRevision[1].replaceAll("\\}", "").replaceAll("\"", "");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date di = formatter.parse(datFechai);
        Date df = formatter.parse(datFechaf);

        File f = new File(application.getRealPath("Reportes/ReporteMantenimientoGeneral.jasper"));
        int bit;
        Map parameters = new HashMap();
//A nuestro informe de prueba le vamos a enviar la fecha de hoy
        parameters.put("fechai", di);
        parameters.put("fechaf", df);
        parameters.put("tgenerado", datNombresG);
        parameters.put("tgeneradocargo", datCargoG);
        parameters.put("trevisado", datResRevision);
        parameters.put("trevisadocargo", datResCargo);

//        File f;
        InputStream in;

        JasperPrint jasperPrint;
        Connection conexion;
        Class.forName("org.postgresql.Driver").newInstance();
        conexion = (Connection) DriverManager.getConnection("jdbc:postgresql://localhost:5432/bienesdtic",
                    "postgres", "postgres");
//        Conexion c = new Conexion();
        jasperPrint = JasperFillManager.fillReport(f.getPath(), parameters, conexion);
        String xlsFileName = "informeDemo.xls";

//Creacion del XLS
        JRXlsExporter exporter = new JRXlsExporter();
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, xlsFileName);
        exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);
        exporter.exportReport();

// En este punto ya esta Creado el XLS
// Ahora leemos el fichero y forzamos al navegador a que nos descargue el fichero.
        f = new File(xlsFileName);

        response.setContentType("application/vnd.ms-excel"); //Tipo de fichero.
        response.setHeader("Content-Disposition", "attachment;filename=" + xlsFileName + ""); //Configurar cabecera http

        in = new FileInputStream(f);
        ServletOutputStream ouputStream = response.getOutputStream();

        bit = 256;
        while ((bit) >= 0) {
            bit = in.read();
            ouputStream.write(bit);
        }

        ouputStream.flush();
        ouputStream.close();
        in.close();
    } catch (Exception e) {
        System.out.println("className.methodName()" + e.getMessage());
    }

%>
