<%-- 
    Document   : report
    Created on : 18-sep-2020, 0:49:19
    Author     : Alex
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <% 
                    Connection  con;
       
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bienesdtic", "postgres", "postgres");        
                    
                    byte[] bytes = null;
                    //---Reporte de traspaso de Bienes
                    String btnTraspaso = request.getParameter("btnTraspaso");//value del boton del report de Traspasos
                    
                    //---Reporde de Bienes por Marca
                    String btnMarca = request.getParameter("btnMarca");//value del boton del reporte por Marca
                    String bienMarca = request.getParameter("bienMarca");
                    
                    //---Reporte de Bienes Desactivados
                    String btnDesactivado = request.getParameter("btnDesactivado"); //value del boton del reporte Bienes Desactivados
                    
                    //---Reporte de Bienes por Dependencia y Ubicacion
                    String btnDepUbic = request.getParameter("btnDepUbic");//value del boton del reporte por Dependencias y Ubicaciones
                    String UbicacionId = request.getParameter("UbicacionId");
                    String DependenciaId = request.getParameter("DependenciaId");
                    
                    File reportFile = null;
                    Map parametros = null;
                    
                    
//                    if(btnTraspaso.equals("btnTraspaso")){//Si es un reporte de Traspasos        
//                        reportFile = new File(application.getRealPath("Reportes/ReportBienTraspaso.jasper"));
//                        parametros = new HashMap();
//                        bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros,con);
//
//                        btnTraspaso = null;
//                        btnMarca = null;
//                        btnDepUbic = null;
//                        btnDesactivado = null;
//                    }
                    
                    if(btnDesactivado.equals("btnDesactivado")){//Si es un reporte de Traspasos        
                            reportFile = new File(application.getRealPath("Reportes/ReportBienesBaja.jasper"));
                            parametros = new HashMap();
                            bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros,con);
                            
                            btnTraspaso = null;
                            btnMarca = null;
                            btnDepUbic = null;
                            btnDesactivado = null;
                    }
//                    
//                    if(btnMarca.equals("btnMarca")){//Si es un reporte de Bienes por Marca        
//                            reportFile = new File(application.getRealPath("Reportes/ReportBienMarca.jasper")) ;
//                            parametros = new HashMap();
//                            parametros.put("marca", bienMarca);
//                            bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros,con);  
//                            btnTraspaso = null;
//                            btnMarca = null;
//                            btnDepUbic = null;
//                            btnDesactivado = null;
//                    }     
                    
//                    if(btnDepUbic.equals("btnDepUbic")){//Si es un reporte de Ubicacion y Dependencia       
//                            reportFile = new File(application.getRealPath("Reportes/ReportBienUbicDep.jasper")) ;
//                            parametros = new HashMap();
//                            parametros.put("ubicacion", UbicacionId);
//                            parametros.put("depend", DependenciaId);
//                            bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros,con);  
//                            btnTraspaso = null;
//                            btnMarca = null;
//                            btnDepUbic = null;
//                            btnDesactivado = null;
//                    }
                    
                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream output = response.getOutputStream();
                    response.getOutputStream();
                    output.write(bytes,0,bytes.length);
                    output.flush();
                    output.close();

       %>  
    </body>
    </html>
