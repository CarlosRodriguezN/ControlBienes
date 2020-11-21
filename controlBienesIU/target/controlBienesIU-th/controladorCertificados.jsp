<%@page import="java.util.Base64"%>
<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->

<%@page import="servicios.WSCentralizada"%>
<%@page import="servicios.sPersona"%>
<%@page import="entidades.CertificadoPK"%>
<%@page import="entidades.Persona"%>
<%@page import="servicios.sCertificado"%>
<%@page import="entidades.Certificado"%>
<%@page import="servicios.sTipoCertificado"%>
<%@page import="entidades.Tipocertificado"%>
<%@page import="servicios.sPeriodo"%>
<%@page import="entidades.Periodo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String strOpc = request.getParameter("opc");
    if (strOpc != null) {
        if (strOpc.equals("Periodo")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("agregarPeriodo")) {
                String idUser = request.getParameter("idUser");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Periodo objPeriodo = new Periodo();
                objPeriodo.setPerDescipcion(req.getString("DetaPeriodo").replace("+", " "));
                try {
                    if (req.getString("idEstadoPerio").equals("on")) {
                        objPeriodo.setPerEstado(1);
                    }
                } catch (Exception e) {
                    objPeriodo.setPerEstado(2);
                }
                String jsonPeriodo = new Gson().toJson(objPeriodo, Periodo.class);
                sPeriodo.InsertarPeriodo(jsonPeriodo);
            } else if (tsk.equals("eliminarPeriodo")) {
                String idUser = request.getParameter("idUser");
                String idDato = request.getParameter("idDato");

                Periodo objPeriSelec = new Periodo();
                JSONObject req = new JSONObject(sPeriodo.listaPeriodoId(Integer.parseInt(idDato)));
                objPeriSelec = new Gson().fromJson(req.toString(), Periodo.class);

                Periodo objPeriodo = new Periodo();
                objPeriodo.setPerId(objPeriSelec.getPerId());
                objPeriodo.setPerDescipcion(objPeriSelec.getPerDescipcion());
                objPeriodo.setPerEstado(2);
                String jsonPeriodo = new Gson().toJson(objPeriodo, Periodo.class);
                sPeriodo.ModficarPeriodo(jsonPeriodo, Integer.parseInt(idDato));

            } else if (tsk.equals("eliminarFisicoPeriodo")) {
                String idUser = request.getParameter("idUser");
                String idDato = request.getParameter("idDato");
                sPeriodo.EliminarPeriodo(Integer.parseInt(idDato));
            } else if (tsk.equals("editaPeriodo")) {
                String idUser = request.getParameter("idUser");
                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Periodo objPeriodo = new Periodo();
                objPeriodo.setPerId(Integer.parseInt(idDato));
                objPeriodo.setPerDescipcion(req.getString("DetaPeriodo").replace("+", " "));
                try {
                    if (req.getString("idEstadoPerio").equals("on")) {
                        objPeriodo.setPerEstado(1);
                    }
                } catch (Exception e) {
                    objPeriodo.setPerEstado(2);
                }
                String jsonPeriodo = new Gson().toJson(objPeriodo, Periodo.class);
                sPeriodo.ModficarPeriodo(jsonPeriodo, Integer.parseInt(idDato));
            }
        }
        if (strOpc.equals("TipoCertificado")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("agregarTipoCer")) {
                String idUser = request.getParameter("idUser");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Tipocertificado objTipoCer = new Tipocertificado();
                objTipoCer.setTicerDescripcion(req.getString("DetaTipCer").replace("+", " "));
                try {
                    if (req.getString("idEstadoTipCer").equals("on")) {
                        objTipoCer.setTicerEstado(1);
                    }
                } catch (Exception e) {
                    objTipoCer.setTicerEstado(2);
                }
                String jsonPeriodo = new Gson().toJson(objTipoCer, Tipocertificado.class);
                sTipoCertificado.InsertarTipoCert(jsonPeriodo);
            } else if (tsk.equals("eliminarTipoCer")) {
                String idUser = request.getParameter("idUser");
                String idDato = request.getParameter("idDato");

                Tipocertificado objCerSelec = new Tipocertificado();
                JSONObject req = new JSONObject(sTipoCertificado.listaTipoCertificadoId(Integer.parseInt(idDato)));
                objCerSelec = new Gson().fromJson(req.toString(), Tipocertificado.class);

                Tipocertificado objTipCer = new Tipocertificado();
                objTipCer.setTicerId(objCerSelec.getTicerId());
                objTipCer.setTicerDescripcion(objCerSelec.getTicerDescripcion());
                objTipCer.setTicerEstado(2);

                String jsonPeriodo = new Gson().toJson(objTipCer, Tipocertificado.class);
                sTipoCertificado.ModficarTipoCertificado(jsonPeriodo, Integer.parseInt(idDato));
            } else if (tsk.equals("eliminarFisicoTipoCer")) {
                String idUser = request.getParameter("idUser");
                String idDato = request.getParameter("idDato");
                sTipoCertificado.EliminarTipoCertificado(Integer.parseInt(idDato));
            } else if (tsk.equals("editaTipoCer")) {
                String idUser = request.getParameter("idUser");
                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Tipocertificado objTipCer = new Tipocertificado();
                objTipCer.setTicerId(Integer.parseInt(idDato));
                objTipCer.setTicerDescripcion(req.getString("DetaTipCer").replace("+", " "));

                try {
                    if (req.getString("idEstadoTipCer").equals("on")) {
                        objTipCer.setTicerEstado(1);
                    }
                } catch (Exception e) {
                    objTipCer.setTicerEstado(2);
                }
                String jsonPeriodo = new Gson().toJson(objTipCer, Tipocertificado.class);
                sTipoCertificado.ModficarTipoCertificado(jsonPeriodo, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Certificado")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("agregarCerti")) {
                String idUser = request.getParameter("idUser");
                String idDocente = request.getParameter("idDocente");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);

                Certificado objCertifi = new Certificado();
                //hacer un if para el tipo de certificado
                Periodo objPerio = new Periodo();
                objPerio.setPerId(req.getInt("idPeriodo"));

                Persona objPersona = new Persona();
                objPersona.setPersoId(Integer.parseInt(idDocente));

                Tipocertificado objTipCer = new Tipocertificado();
                CertificadoPK objCerPK = new CertificadoPK();

                String serTipocertificado = sTipoCertificado.listaTodosTipocertificado();
                String resultadoTipocertificado = "{\"respuesta\":" + serTipocertificado + "}";
                JSONObject objTipoCer = new JSONObject(resultadoTipocertificado);
                JSONArray arrayTipoCer = objTipoCer.getJSONArray("respuesta");
                ArrayList<Tipocertificado> listTipocertificado = new ArrayList<Tipocertificado>();
                for (int i = 0; i < arrayTipoCer.length(); i++) {
                    JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                    Tipocertificado objMenus = new Gson().fromJson(childJSONObject.toString(), Tipocertificado.class);
                    listTipocertificado.add(objMenus);
                }

                objTipCer.setTicerId(req.getInt("idTipoCer"));//cambiar

                objCerPK.setPerId(req.getInt("idPeriodo"));
                objCerPK.setPersoId(Integer.parseInt(idDocente));
                objCerPK.setTicerId(objTipCer.getTicerId());

                String fechas = req.getString("FechCertifi") + "T00:00:00-05:00";
                objCertifi.setCerEstado(1);
                objCertifi.setCont(0);
                objCertifi.setCerFecha(fechas);
                objCertifi.setAuditoria(Integer.parseInt(idDocente));
                objCertifi.setTipocertificado(objTipCer);
                objCertifi.setPeriodo(objPerio);
                objCertifi.setPersona(objPersona);
                objCertifi.setCertificadoPK(objCerPK);

                String jsonCertificado = new Gson().toJson(objCertifi, Certificado.class);
                String retorno = sCertificado.InsertarCertificado(jsonCertificado);

                String resPerso = sPersona.listaPersonaId(Integer.parseInt(idDocente));
                JSONObject jsonPerso = new JSONObject(resPerso);
                Persona objPerso = new Gson().fromJson(jsonPerso.toString(), Persona.class);

                if (retorno.isEmpty()) {

                    retorno = objPerso.getPersoCedula();
                } else {
                    retorno = retorno + "<!--" + objPerso.getPersoCedula();
                }
                response.setContentType("text/plain");
                response.getWriter().write(retorno);

            }

            if (tsk.equals("agregarCertiTabla")) {
                String StrTabla = request.getParameter("StrTabla");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);

                String[] datoTabla = StrTabla.split("-");
                String idDocente = "";
                String retIngre = "";
                String retError = "";
                for (int t = 1; t < datoTabla.length; t++) {
                    idDocente = datoTabla[t];
                    Certificado objCertifi = new Certificado();
                    //hacer un if para el tipo de certificado
                    Periodo objPerio = new Periodo();
                    objPerio.setPerId(req.getInt("idPeriodo"));

                    Persona objPersona = new Persona();
                    objPersona.setPersoId(Integer.parseInt(idDocente));

                    Tipocertificado objTipCer = new Tipocertificado();
                    CertificadoPK objCerPK = new CertificadoPK();

                    String serTipocertificado = sTipoCertificado.listaTodosTipocertificado();
                    String resultadoTipocertificado = "{\"respuesta\":" + serTipocertificado + "}";
                    JSONObject objTipoCer = new JSONObject(resultadoTipocertificado);
                    JSONArray arrayTipoCer = objTipoCer.getJSONArray("respuesta");
                    ArrayList<Tipocertificado> listTipocertificado = new ArrayList<Tipocertificado>();
                    for (int i = 0; i < arrayTipoCer.length(); i++) {
                        JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                        Tipocertificado objMenus = new Gson().fromJson(childJSONObject.toString(), Tipocertificado.class);
                        listTipocertificado.add(objMenus);
                    }

                    objTipCer.setTicerId(req.getInt("idTipoCer"));//cambiar

                    objCerPK.setPerId(req.getInt("idPeriodo"));
                    objCerPK.setPersoId(Integer.parseInt(idDocente));
                    objCerPK.setTicerId(objTipCer.getTicerId());

                    String fechas = req.getString("FechCertifi") + "T00:00:00-05:00";
                    objCertifi.setCerEstado(1);
                    objCertifi.setCont(0);
                    objCertifi.setCerFecha(fechas);
                    objCertifi.setAuditoria(Integer.parseInt(datoTabla[0]));
                    objCertifi.setTipocertificado(objTipCer);
                    objCertifi.setPeriodo(objPerio);
                    objCertifi.setPersona(objPersona);
                    objCertifi.setCertificadoPK(objCerPK);

                    String jsonCertificado = new Gson().toJson(objCertifi, Certificado.class);
                    String retorno = sCertificado.InsertarCertificado(jsonCertificado);

                    String resPerso = sPersona.listaPersonaId(Integer.parseInt(idDocente));
                    JSONObject jsonPerso = new JSONObject(resPerso);
                    Persona objPerso = new Gson().fromJson(jsonPerso.toString(), Persona.class);

                    if (retorno.isEmpty()) {

                        retError = retError + " " + objPerso.getPersoCedula();
                    } else {
                        retIngre = retIngre + " " + objPerso.getPersoCedula();
                    }

                }
                response.setContentType("text/plain");
                response.getWriter().write(retIngre + "-" + retError);

            }

            if (tsk.equals("agregarCertiCedula")) {
                Integer ban = 0;
                String cedDocente = request.getParameter("cedDocente");

                String result = sPersona.listaPersonaCedula(cedDocente);
                if (result.isEmpty()) {
                    String datospersona = WSCentralizada.BuscarPersona(cedDocente);
                    if (!datospersona.isEmpty()) {
                        JSONObject reqPerso = new JSONObject(datospersona);
                        Persona objpersona = new Persona();
                        objpersona.setPersoId(reqPerso.getInt("per_id"));
                        objpersona.setPersoNombres(reqPerso.getString("per_nombres").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                        objpersona.setPersoApellido1(reqPerso.getString("per_primerApellido").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                        objpersona.setPersoApellido2(reqPerso.getString("per_segundoApellido").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                        objpersona.setPersoCedula(cedDocente);
                        String strJsondocumento1 = new Gson().toJson(objpersona, Persona.class);
                        sPersona.InsertarPersona(strJsondocumento1);
                        ban = 1;
                    }

                }
                if ((!result.isEmpty()) || (ban != 0)) {
                    Persona objPerso = new Persona();
                    String serPersona = sPersona.listaPersonaCedula(cedDocente);
                    JSONObject reqPersona = new JSONObject(serPersona);
                    objPerso = new Gson().fromJson(reqPersona.toString(), Persona.class);

                    Integer idDocente = objPerso.getPersoId();

                    String idAdmin = request.getParameter("idAdmin");
                    String datos = request.getParameter("datos");
                    JSONObject req = new JSONObject(datos);

                    Certificado objCertifi = new Certificado();
                    //hacer un if para el tipo de certificado
                    Periodo objPerio = new Periodo();
                    objPerio.setPerId(req.getInt("idPeriodo"));

                    Persona objPersona = new Persona();
                    objPersona.setPersoId(idDocente);

                    Tipocertificado objTipCer = new Tipocertificado();
                    objTipCer.setTicerId(req.getInt("idTipoCer"));//cambiar

                    CertificadoPK objCerPK = new CertificadoPK();
                    objCerPK.setPerId(req.getInt("idPeriodo"));
                    objCerPK.setPersoId(idDocente);
                    objCerPK.setTicerId(objTipCer.getTicerId());

                    String fechas = req.getString("FechCertifi2") + "T00:00:00-05:00";
                    objCertifi.setCerEstado(1);
                    objCertifi.setCont(0);
                    objCertifi.setCerFecha(fechas);
                    objCertifi.setAuditoria(Integer.parseInt(idAdmin));
                    objCertifi.setTipocertificado(objTipCer);
                    objCertifi.setPeriodo(objPerio);
                    objCertifi.setPersona(objPersona);
                    objCertifi.setCertificadoPK(objCerPK);

                    String jsonCertificado = new Gson().toJson(objCertifi, Certificado.class);
                    String retorno = sCertificado.InsertarCertificado(jsonCertificado);
                    if (retorno.isEmpty()) {
                        retorno = cedDocente + "-Ya asignado";
                    }
                    response.setContentType("text/plain");
                    response.getWriter().write(retorno);

                } else {
                    response.setContentType("text/plain");
                    response.getWriter().write(cedDocente + "-Cédula incorrecta");
                }

                ban = 0;
            }

            if (tsk.equals("agregarCertiCedulaTabla")) {
                Integer ban = 0;
                String StCedulas = request.getParameter("StCedulas");

                String[] datoTabla = StCedulas.split("-");
                String cedDocente = "";
                String retErrIncorr = "";
                String retErrExiste = "";

                for (int t = 1; t < datoTabla.length; t++) {
                    cedDocente = datoTabla[t];
                    String result = sPersona.listaPersonaCedula(cedDocente);
                    if (result.isEmpty()) {
                        String datospersona = WSCentralizada.BuscarPersona(cedDocente);
                        if (!datospersona.isEmpty()) {
                            JSONObject reqPerso = new JSONObject(datospersona);
                            Persona objpersona = new Persona();
                            objpersona.setPersoId(reqPerso.getInt("per_id"));
                            objpersona.setPersoNombres(reqPerso.getString("per_nombres").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                            objpersona.setPersoApellido1(reqPerso.getString("per_primerApellido").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                            objpersona.setPersoApellido2(reqPerso.getString("per_segundoApellido").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                            objpersona.setPersoCedula(cedDocente);
                            String strJsondocumento1 = new Gson().toJson(objpersona, Persona.class);
                            sPersona.InsertarPersona(strJsondocumento1);
                            ban = 1;
                        }

                    }
                    if ((!result.isEmpty()) || (ban != 0)) {
                        Persona objPerso = new Persona();
                        String serPersona = sPersona.listaPersonaCedula(cedDocente);
                        JSONObject reqPersona = new JSONObject(serPersona);
                        objPerso = new Gson().fromJson(reqPersona.toString(), Persona.class);

                        Integer idDocente = objPerso.getPersoId();

                        String idAdmin = request.getParameter("idAdmin");
                        String datos = request.getParameter("datos");
                        JSONObject req = new JSONObject(datos);

                        Certificado objCertifi = new Certificado();
                        //hacer un if para el tipo de certificado
                        Periodo objPerio = new Periodo();
                        objPerio.setPerId(req.getInt("idPeriodo"));

                        Persona objPersona = new Persona();
                        objPersona.setPersoId(idDocente);

                        Tipocertificado objTipCer = new Tipocertificado();
                        objTipCer.setTicerId(req.getInt("idTipoCer"));//cambiar

                        CertificadoPK objCerPK = new CertificadoPK();
                        objCerPK.setPerId(req.getInt("idPeriodo"));
                        objCerPK.setPersoId(idDocente);
                        objCerPK.setTicerId(objTipCer.getTicerId());

                        String fechas = req.getString("FechCertifi2") + "T00:00:00-05:00";
                        objCertifi.setCerEstado(1);
                        objCertifi.setCerEstado(0);
                        objCertifi.setCerFecha(fechas);
                        objCertifi.setAuditoria(Integer.parseInt(datoTabla[0]));
                        objCertifi.setTipocertificado(objTipCer);
                        objCertifi.setPeriodo(objPerio);
                        objCertifi.setPersona(objPersona);
                        objCertifi.setCertificadoPK(objCerPK);

                        String jsonCertificado = new Gson().toJson(objCertifi, Certificado.class);
                        String retorno = sCertificado.InsertarCertificado(jsonCertificado);
                        if (retorno.isEmpty()) {
                            retErrExiste = retErrExiste + " " + cedDocente;
                        }

                    } else {
                        retErrIncorr = retErrIncorr + " " + cedDocente;
                    }

                    ban = 0;
                }
                response.setContentType("text/plain");
                response.getWriter().write(retErrExiste + "-" + retErrIncorr);

            } else if (tsk.equals("eliminaCert")) {
                String idPerio = request.getParameter("idPerio");
                String idTipoCer = request.getParameter("idTipoCer");
                String idPerso = request.getParameter("idPerso");
                sCertificado.EliminarCertificado(Integer.parseInt(idPerio), Integer.parseInt(idTipoCer), Integer.parseInt(idPerso));

            } else if (tsk.equals("updateCert")) {

                String stridDatos = request.getParameter("datos");
                byte[] decoded = Base64.getDecoder().decode(stridDatos);
                String decodedString = new String(decoded, "UTF-8");
                String[] datos = decodedString.split(":");
                String idPerio = datos[0];
                String idTipoCer = datos[1];
                String idPerso = datos[2];
                
                
                String resUpCerti = sCertificado.listaCertificadoId(Integer.parseInt(idPerio), Integer.parseInt(idTipoCer), Integer.parseInt(idPerso));
                Certificado objCertificado = new Gson().fromJson(resUpCerti, Certificado.class);
                Integer contador = objCertificado.getCont();
                objCertificado.setCont(contador+1);
                
                String jsonCertificado = new Gson().toJson(objCertificado, Certificado.class);
                sCertificado.UpdateCertificado(jsonCertificado, Integer.parseInt(idPerio), Integer.parseInt(idTipoCer), Integer.parseInt(idPerso));
                
                
              
            }

        }

        if (strOpc.equals("Docente")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("agregarDocente")) {

                String idUser = request.getParameter("idUser");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String[] cedula = req.getString("ingCed").split(",");
                Integer tope = cedula.length;

                for (int i = 0; i < tope; i++) {

                    String result = sPersona.listaPersonaCedula(cedula[i]);
                    if (result.isEmpty()) {
                        String datospersona = WSCentralizada.BuscarPersona(cedula[i]);
                        if (!datospersona.isEmpty()) {
                            JSONObject reqPerso = new JSONObject(datospersona);
                            Persona objpersona = new Persona();
                            objpersona.setPersoId(reqPerso.getInt("per_id"));
                            objpersona.setPersoNombres(reqPerso.getString("per_nombres").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                            objpersona.setPersoApellido1(reqPerso.getString("per_primerApellido").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                            objpersona.setPersoApellido2(reqPerso.getString("per_segundoApellido").replace("\"", "").replace("Á", "A").replace("É", "E").replace("Í", "I").replace("Ó", "O").replace("Ú", "U"));
                            objpersona.setPersoCedula(cedula[i]);
                            String strJsondocumento1 = new Gson().toJson(objpersona, Persona.class);
                            sPersona.InsertarPersona(strJsondocumento1);
                        }
                    }

                }

            }
        }

    } else {
        response.sendRedirect("index.jsp");
    }
%>