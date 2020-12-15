<%@page import="esntidadesSeg.Sistema"%>
<%@page import="esntidadesSeg.Rol"%>
<%@page import="esntidadesSeg.Grupo"%>
<%@page import="esntidadesSeg.Accion"%>
<%@page import="esntidadesSeg.Usuario"%>
<%@page import="esntidadesSeg.Funcion"%>
<%@page import="javax.print.attribute.IntegerSyntax"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Base64"%>
<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String UsuLinea = session.getAttribute("codigoPersona").toString();
    String UsuLineaCedula = session.getAttribute("cedulaPersona").toString();
    String strOpc = request.getParameter("opc");
    
    if (strOpc.equals("Administrador")) {
        String tsk = request.getParameter("tsk");
        if (tsk.equals("AddAdministrador")) {
            Funcion objfuncion = new Funcion();
            String datos = request.getParameter("datos");
            JSONObject req = new JSONObject(datos);
            String resultadopersona = sPersona.listaPersonaCedula(req.getString("numero"));


            if (resultadopersona.isEmpty()) {//SI LA PERSONA NO EXISTE EN LA TABLA PERSONA SE LA ADICIONA
                String datospersona = WSCentralizada.BuscarPersona(req.getString("numero"));
                if (!datospersona.isEmpty()) {
                    //asignar id de cargo a la tabla persona
                       Cargo objCargo = new Cargo();
                       String servNombreCargo = "";
                       try{
                            if(request.getParameter("rol").equals("supervisor"))   
                                servNombreCargo = sCargo.listaCargoNombre("Supervisor");
                       }catch(Exception e){       
                            servNombreCargo = sCargo.listaCargoNombre("Operario");
                       }
                       if (servNombreCargo.isEmpty()) {
                           objCargo.setCarEstado(1);
                           try{
                                if(request.getParameter("rol").equals("supervisor")) 
                                    objCargo.setCarDescripcion("Supervisor");
                           }catch(Exception e){ 
                               objCargo.setCarDescripcion("Operario");
                           }
                           String strJsonCargo = new Gson().toJson(objCargo, Cargo.class);
                           String retornoCargo = sCargo.InsertarCargo(strJsonCargo);
                           JSONObject objYaCargo = new JSONObject(retornoCargo);
                           objCargo.setCarId(objYaCargo.getInt("carId"));
                       } else {
                           JSONObject reqCargo = new JSONObject(servNombreCargo);
                           objCargo = new Gson().fromJson(reqCargo.toString(), Cargo.class);
                       }

                    //ingresar persona si no existe
                    Persona objPersona = new Persona();
                    JSONObject reqPerso = new JSONObject(datospersona);
                    objPersona.setPerId(reqPerso.getInt("per_id"));
                    objPersona.setPerCedula(req.getString("numero"));
                    objPersona.setPerNombres(reqPerso.getString("per_nombres").replace("\"", ""));
                    objPersona.setPerApellido1(reqPerso.getString("per_primerApellido").replace("\"", ""));
                    objPersona.setPerApellido2(reqPerso.getString("per_segundoApellido").replace("\"", ""));
                    if ((reqPerso.getString("per_email").replace("\"", "").toString().equals("")) || (reqPerso.getString("per_email").equals("null"))) {
                        objPersona.setPerEmail(" ");
                    } else {
                        objPersona.setPerEmail(reqPerso.getString("per_email").replace("\"", ""));
                    }
                    if ((reqPerso.getString("per_telefonoCelular").replace("\"", "").toString().equals("")) || (reqPerso.getString("per_telefonoCelular").equals("null"))) {
                        objPersona.setPerTelefono(" ");
                    } else {
                        objPersona.setPerTelefono(reqPerso.getString("per_telefonoCelular").replace("\"", ""));
                    }
                    objPersona.setPerEstado(1);
                    objPersona.setCarId(objCargo);
                    try{
                         if(request.getParameter("rol").equals("supervisor")) 
                             objPersona.setPerRol("supervisor");
                    }catch(Exception e){ 
                        objPersona.setPerRol("operativo");
                    }
                    String strJsondocumento1 = new Gson().toJson(objPersona, Persona.class);
                    sPersona.InsertarPersona(strJsondocumento1);
                    //perExiste = true;
                    }
                }   
            resultadopersona = sPersona.listaPersonaCedula(req.getString("numero"));
            Persona objpersona = new Gson().fromJson(resultadopersona, Persona.class);

             //verificar q el usuariono exista en la tabla Usuario
            //String jsonSeguridad = sSeguridad.listarRolesPersonas();

            Usuario objusuario = new Usuario();
            objusuario.setUsuBlnactivo(true);
            objusuario.setUsuCedula(objpersona.getPerCedula());
            if (objpersona.getPerEmail().isEmpty() || objpersona.getPerEmail().equals(" ")) {
                objusuario.setUsuCorreo(req.getString("numero") + "@espoch.edu.ec");

            } else {
                objusuario.setUsuCorreo(objpersona.getPerEmail());
            }


            objusuario.setUsuId(objpersona.getPerId());
            objusuario.setUsuNombre(objpersona.getPerNombres() + " " + objpersona.getPerApellido1()+ " " + objpersona.getPerApellido2());
            String strusuario = new Gson().toJson(objusuario, Usuario.class);
            sSeguridad.ServicioInsertarusuario(strusuario);
            objfuncion.setBlnactivo(true);
            objfuncion.setBlnpermisoagregar(true);
            objfuncion.setBlnpermisoeditar(true);
            objfuncion.setBlnpermisoeliminar(true);
            String resultadoaccion = sSeguridad.listarAccion(1);
            JSONObject objJSONrespuesta1 = new JSONObject(resultadoaccion);
            JSONArray arrayJSONrespuesta1 = objJSONrespuesta1.getJSONArray("objLista");
            Accion objaccion = new Accion();
            for (int i = 0; i < arrayJSONrespuesta1.length(); i++) {
                JSONObject childJSONObject = arrayJSONrespuesta1.getJSONObject(i);
                objaccion = new Gson().fromJson(childJSONObject.toString(), Accion.class);
            }
            objfuncion.setIntaccId(objaccion);

            String resultadogrupo = sSeguridad.listargrupo(1);
            JSONObject objJSONrespuesta2 = new JSONObject(resultadogrupo);
            JSONArray arrayJSONrespuesta2 = objJSONrespuesta2.getJSONArray("objLista");
            Grupo objgrupo = new Grupo();
            for (int i = 0; i < arrayJSONrespuesta2.length(); i++) {
                JSONObject childJSONObject = arrayJSONrespuesta2.getJSONObject(i);
                objgrupo = new Gson().fromJson(childJSONObject.toString(), Grupo.class);
            }
            objfuncion.setIntgruId(objgrupo);

            objfuncion.setIntorden(0);

            String resultadorol = "";
            if(request.getParameter("rol").equals("supervisor"))
            {
                resultadorol = sSeguridad.listarRol(52);
            }else 
                resultadorol = sSeguridad.listarRol(53);
            JSONObject objJSONrespuesta3 = new JSONObject(resultadorol);
            JSONArray arrayJSONrespuesta3 = objJSONrespuesta3.getJSONArray("objLista");
            Rol objrol = new Rol();
            for (int i = 0; i < arrayJSONrespuesta3.length(); i++) {
                JSONObject childJSONObject = arrayJSONrespuesta3.getJSONObject(i);
                objrol = new Gson().fromJson(childJSONObject.toString(), Rol.class);
            }
            objfuncion.setIntrolId(objrol);

            String resultadosistema = sSeguridad.listarSistema(3);
            JSONObject objJSONrespuesta4 = new JSONObject(resultadosistema);
            JSONArray arrayJSONrespuesta4 = objJSONrespuesta4.getJSONArray("objLista");
            Sistema objsistema = new Sistema();
            for (int i = 0; i < arrayJSONrespuesta4.length(); i++) {
                JSONObject childJSONObject = arrayJSONrespuesta4.getJSONObject(i);
                objsistema = new Gson().fromJson(childJSONObject.toString(), Sistema.class);
            }
            objfuncion.setSisId(objsistema);

            objfuncion.setUsuId(objusuario);
            String strresultado = new Gson().toJson(objfuncion, Funcion.class);
            sSeguridad.ServicioInsertarRol(strresultado);


            String listPersonaPermiso = sPermisoPersona.listaPermisoPersonaPorCodPersona(objpersona.getPerId());
            if(listPersonaPermiso.isEmpty() || listPersonaPermiso.equals("[]")){

                ArrayList<Permiso> cadPermisos = new ArrayList<Permiso>(); 
                String listPermisos = "";
//                    if(request.getParameter("rol").equals("supervisor"))   
                   listPermisos = "{\"respuesta\":" + sPermiso.listaTodosPermiso() + "}";
//                    else
//                       listPermisos = "{\"respuesta\":" + sPermiso.listaTodosPermisoOperario() + "}";

                JSONObject objJSONPermiso = new JSONObject(listPermisos);
                JSONArray arrayJSONPermisos = objJSONPermiso.getJSONArray("respuesta");

                for (int i = 0; i < arrayJSONPermisos.length(); i++) {
                    JSONObject childJSONObject = arrayJSONPermisos.getJSONObject(i);
                    Permiso objPermiso = new Gson().fromJson(childJSONObject.toString(), Permiso.class);
                    cadPermisos.add(objPermiso);
                }

                for(Permiso oPermiso:cadPermisos){
                    Personapermiso objPerPm = new Personapermiso();
                    objPerPm.setPmId(oPermiso);
                    objPerPm.setPerId(objpersona);

                    if(oPermiso.getPmCodigo().contains("PSU") && request.getParameter("rol").equals("operario"))
                        objPerPm.setPerpmEstado(false);
                    else
                        objPerPm.setPerpmEstado(true);

                    String nuevopermisos = new Gson().toJson(objPerPm, Personapermiso.class);
                    sPermisoPersona.InsertarPermisoPersona(nuevopermisos);
                }
            }

            objaccion = null;
            objfuncion = null;
            objgrupo = null;
            objpersona = null;
            objrol = null;
            objsistema = null;
            objusuario = null;
        } else if (tsk.equals("EditAdministrador")) {
            String datos = request.getParameter("datos");
            JSONObject req1 = new JSONObject(datos);
            Funcion objPerio = new Funcion();
            String resultadoaccion = sSeguridad.listarFuncion(Integer.parseInt(request.getParameter("idRef")));
            JSONObject objJSONrespuesta1 = new JSONObject(resultadoaccion);
            JSONArray arrayJSONrespuesta1 = objJSONrespuesta1.getJSONArray("objLista");
            for (int i = 0; i < arrayJSONrespuesta1.length(); i++) {
                JSONObject childJSONObject = arrayJSONrespuesta1.getJSONObject(i);
                objPerio = new Gson().fromJson(childJSONObject.toString(), Funcion.class);
            }
            try {
                if (req1.getString("TipoFlEsta").equals("on")) {
                    objPerio.setBlnactivo(true);
                }
            } catch (Exception e) {
                objPerio.setBlnactivo(false);
            }
            String strusuario = new Gson().toJson(objPerio, Funcion.class);
            sSeguridad.ServicioModficarRol(strusuario, Integer.parseInt(request.getParameter("idRef")));

        } else if (tsk.equals("EditPermisos")) {
            String datos = request.getParameter("datos");
            String selected = request.getParameter("selected");
            String[] parts = selected.split("_");
            String idDato = request.getParameter("idDato");

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
            Personapermiso objPerPm = new Personapermiso();
            String findPerPm = "";
            int modPePm = 0;
            for (Personapermiso oPerPm: cadPerPm) {
                if(oPerPm.getPerId().getPerId() == Integer.parseInt(idDato)){
                    findPerPm = sPermisoPersona.listaPermisoPersonaId(oPerPm.getIdPerPm());
                    JSONObject JSONPermiso = new JSONObject(findPerPm);
                    objPerPm =  new Gson().fromJson(JSONPermiso.toString(),Personapermiso.class);

                    if(!selected.isEmpty()){  
                        for (int i = 0; i < parts.length; i++) {
                            if(oPerPm.getIdPerPm() == Integer.parseInt(parts[i])){
                                objPerPm.setPerpmEstado(true);  
                                modPePm++;
                            }       
                        }
                    }
                    if(modPePm == 0){
                       objPerPm.setPerpmEstado(false);
                    }
                    String jsonPersonaPermiso  = new Gson().toJson(objPerPm, Personapermiso.class);
                    sPermisoPersona.ModficarPermisoPersona(jsonPersonaPermiso , oPerPm.getIdPerPm());
                    modPePm = 0;
                }
            }
        }
    }
    
    if (strOpc != null) {
        if (strOpc.equals("temporales")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("agregarTemp")) {
                String datos = request.getParameter("datos");

                String noIngreso = "";
                JSONObject objTEMP = new JSONObject(datos);
                JSONArray arrayTemporales = objTEMP.getJSONArray("respuesta");
                for (int i = 0; i < arrayTemporales.length(); i++) {
                    JSONObject childJSONObject = arrayTemporales.getJSONObject(i);
                    Temp objMenus = new Gson().fromJson(childJSONObject.toString(), Temp.class);

                    Date date = new Date();
                    DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                    String fecha = fechaHora.format(date);
                    DateFormat hora = new SimpleDateFormat("HH");

                    objMenus.setTempFechaSubida(fecha + " " + hora.format(date));
                    objMenus.setTempUsuario(UsuLineaCedula);

                    String strresultado = new Gson().toJson(objMenus, Temp.class);
                    JSONObject childJSONObjectSUBIDA = new JSONObject(strresultado);

                    String retorno = sTemporal.InsertarTemporales(childJSONObjectSUBIDA.toString());
                    if (retorno == null) {

                        if (noIngreso.length() < 1) {
                            noIngreso = "Los sigueintes codigos de sus bienes no han sido ingresados: ";
                        }

                        noIngreso = noIngreso + objMenus.getTempCodBien() + " - ";

                    }
                }
                response.setContentType("text/plain");
                response.getWriter().write(noIngreso);

            } else if (tsk.equals("eliminaTemp")) {
                String codBien = request.getParameter("codBien");
                String eliminacTemp = sTemporal.EliminarTemporales(codBien);
                response.setContentType("text/plain");
                response.getWriter().write("Se ha eliminado el bien de codigo " + codBien + " de la tabla remporal.");

            } else if (tsk.equals("editaTemp")) {

            }
        }

        if (strOpc.equals("CSV")) {
            String tsk = request.getParameter("tsk");
            Temp objTemp = new Temp();
            String codBien = "";
            Integer tope = 0;
            String[] partes = {};
            if (tsk.equals("precesarIndividual") || tsk.equals("procesarTodos")) {
                if (tsk.equals("procesarTodos")) {
                    codBien = request.getParameter("codBien");
                    partes = codBien.split("_");
                    tope = partes.length;
                } else {
                    tope = 1;
                    codBien = request.getParameter("codBien") + "_";
                    partes = codBien.split("_");
                    String b = "";
                }

                for (int i = 0; i < tope; i++) {
                    //String result = sPersona.listaPersonaCedula(cedula[i]);
                    //String jsonTemporal = sTemporal.listaTemporalesId(partes[i]);
                    JSONObject reqTemp = new JSONObject(sTemporal.listaTemporalesId(partes[i]));
                    objTemp = new Gson().fromJson(reqTemp.toString(), Temp.class);
                    String a = "";
                    // }    

                    //}
                    //if (tsk.equals("precesarIndividual")) {
                    //codBien = request.getParameter("codBien");
                    codBien = objTemp.getTempCodBien();

                    String estIngreso = "";

//                JSONObject reqTemp = new JSONObject(sTemporal.listaTemporalesId(codBien));
//                objTemp = new Gson().fromJson(reqTemp.toString(), Temp.class);
                    String resultCSV = sCsv.listaCsvId(codBien);
                    if (resultCSV.isEmpty()) {

                        Csv objCsv = new Csv();
                        objCsv.setCsvCodBien(objTemp.getTempCodBien());
                        objCsv.setCsvNombre(objTemp.getTempNombre());
                        objCsv.setCsvSerie(objTemp.getTempSerie());
                        objCsv.setCsvModelo(objTemp.getTempModelo());
                        objCsv.setCsvMarca(objTemp.getTempMarca());
                        objCsv.setCsvColor(objTemp.getTempColor());
                        objCsv.setCsvDependencia(objTemp.getTempDependencia());
                        objCsv.setCsvUbicacion(objTemp.getTempUbicacion());
                        objCsv.setCsvCedulaRuc(objTemp.getTempCedulaRuc());
                        objCsv.setCsvTipoIngreso(objTemp.getTempTipoIngreso());
                        objCsv.setCsvPrecio(objTemp.getTempPrecio());
                        objCsv.setCsvEstadoBien(objTemp.getTempEstadoBien());
                        objCsv.setCsvFechaCompra(objTemp.getTempFechaCompra());
                        objCsv.setCsvTiempoGarantia(objTemp.getTempTiempoGarantia());
                        objCsv.setCsvProveedor(objTemp.getTempProveedor());
                        objCsv.setCsvDescripcion(objTemp.getTempDescripcion());
                        objCsv.setCsvRamTamano(objTemp.getTempRamTamano());
                        objCsv.setCsvRamTecno(objTemp.getTempRamTecno());
                        objCsv.setCsvCantDisco(objTemp.getTempCantDisco());
                        objCsv.setCsvRed(objTemp.getTempRed());
                        objCsv.setCsvProcesador(objTemp.getTempProcesador());
                        objCsv.setCsvLectorDvd(objTemp.getTempLectorDvd());
                        objCsv.setCsvSistemaOperativo(objTemp.getTempSistemaOperativo());
                        objCsv.setCsvMonitorTecn(objTemp.getTempMonitorTecn());
                        objCsv.setCsvMonitorTama(objTemp.getTempMonitorTama());
                        objCsv.setCsvModeToner(objTemp.getTempModeToner());
                        objCsv.setCsvNumFusor(objTemp.getTempNumFusor());
                        objCsv.setCsvCantToner(objTemp.getTempCantToner());
                        objCsv.setCsvTecnProyector(objTemp.getTempTecnProyector());
                        objCsv.setCsvLumenes(objTemp.getTempLumenes());
                        objCsv.setCsvTipoLampara(objTemp.getTempTipoLampara());
                        objCsv.setCsvResolucion(objTemp.getTempResolucion());
                        objCsv.setCsvFechaSubida(objTemp.getTempFechaSubida());
                        objCsv.setCsvUsuario(objTemp.getTempUsuario());
                        objCsv.setCsvCargoUsuario(objTemp.getTempCargoUsuario());
                        objCsv.setCvsCatalogo(objTemp.getTempCatalogo());
                        objCsv.setCsvMonitorTipoConex(objTemp.getTempMonitorTipoConex());
                        objCsv.setCsvTipPantalla(objTemp.getTempTipPantalla());
                        objCsv.setCsvMemoInter(objTemp.getTempMemoInter());
                        objCsv.setCsvMemoExter(objTemp.getTempMemoExter());
                        objCsv.setCsvSwVersion(objTemp.getTempSwVersion());
                        objCsv.setCsvSwVigencia(objTemp.getTempSwVigencia());
                        objCsv.setCsvSwCantLicencia(objTemp.getTempSwCantLicencia());
                        objCsv.setCsvSwTipSoporte(objTemp.getTempSwTipSoporte());
                        objCsv.setCsvSwFechaContrat(objTemp.getTempSwFechaContrat());
                        objCsv.setCsvTipBateria(objTemp.getTempTipBateria());
                        objCsv.setCsvNumConect(objTemp.getTempNumConect());
                        objCsv.setCsvNumPuertRouter(objTemp.getTempNumPuertRouter());
                        objCsv.setCsvTipLector(objTemp.getTempTipLector());
                        objCsv.setCsvDiscoTecn(objTemp.getTempDiscoTecn());
                        objCsv.setCsvTamPantalla(objTemp.getTempTamPantalla());
                        objCsv.setCsvEstadoUso(objTemp.getTempEstadoUso());

                        //objCsv.setCsvBaja(objTemp.getTempBaja());
                        Boolean perExiste = false;
                        /*pasar el bien a las tablas antes de eliminarlo*/
 /*CARGO*/
                        Cargo objCargo = new Cargo();
                        String servNombreCargo = sCargo.listaCargoNombre(objTemp.getTempCargoUsuario());
                        if (servNombreCargo.isEmpty()) {
                            objCargo.setCarEstado(1);
                            objCargo.setCarDescripcion(objTemp.getTempCargoUsuario());
                            String strJsonCargo = new Gson().toJson(objCargo, Cargo.class);
                            String retornoCargo = sCargo.InsertarCargo(strJsonCargo);
                            JSONObject objYaCargo = new JSONObject(retornoCargo);
                            objCargo.setCarId(objYaCargo.getInt("carId"));
                        } else {
                            JSONObject reqCargo = new JSONObject(servNombreCargo);
                            objCargo = new Gson().fromJson(reqCargo.toString(), Cargo.class);
                        }

                        /*PERSONA*/
                        Persona objPersona = new Persona();
                        String cedRuc = objTemp.getTempCedulaRuc();
                        if (cedRuc.length() == 9) {
                            cedRuc = "0" + cedRuc;
                        }

                        String servNombrePersona = sPersona.listaPersonaCedula(cedRuc);
                        if (servNombrePersona.isEmpty()) {
                            String datospersona = WSCentralizada.BuscarPersona(cedRuc);
                            if (!datospersona.isEmpty()) {
                                JSONObject reqPerso = new JSONObject(datospersona);
                                objPersona.setPerId(reqPerso.getInt("per_id"));
                                objPersona.setPerCedula(cedRuc);
                                objPersona.setPerNombres(reqPerso.getString("per_nombres").replace("\"", ""));
                                objPersona.setPerApellido1(reqPerso.getString("per_primerApellido").replace("\"", ""));
                                objPersona.setPerApellido2(reqPerso.getString("per_segundoApellido").replace("\"", ""));
                                if ((reqPerso.getString("per_email").replace("\"", "").toString().equals("")) || (reqPerso.getString("per_email").equals("null"))) {
                                    objPersona.setPerEmail(" ");
                                } else {
                                    objPersona.setPerEmail(reqPerso.getString("per_email").replace("\"", ""));
                                }
                                if ((reqPerso.getString("per_telefonoCelular").replace("\"", "").toString().equals("")) || (reqPerso.getString("per_telefonoCelular").equals("null"))) {
                                    objPersona.setPerTelefono(" ");
                                } else {
                                    objPersona.setPerTelefono(reqPerso.getString("per_telefonoCelular").replace("\"", ""));
                                }
                                objPersona.setPerEstado(1);
                                objPersona.setCarId(objCargo);
                                String strJsondocumento1 = new Gson().toJson(objPersona, Persona.class);
                                sPersona.InsertarPersona(strJsondocumento1);
                                perExiste = true;
                            }
                        } else {
                            JSONObject reqPersona = new JSONObject(servNombrePersona);
                            objPersona = new Gson().fromJson(reqPersona.toString(), Persona.class);
                            perExiste = true;
                        }

                        String BienExiste = sBien.listaBienId(objTemp.getTempTipoIngreso());

                        if ((perExiste == true) && (BienExiste.isEmpty())) {
                            /*DEPENDENCIA*/
                            Dependencia objDependencia = new Dependencia();
                            String servNombreDependencia = sDependencia.listaDependenciaNombre(objTemp.getTempDependencia());
                            if (servNombreDependencia.isEmpty()) {
                                objDependencia.setDpEstado(1);
                                objDependencia.setDpDescripcion(objTemp.getTempDependencia());
                                String strJsonDependencia = new Gson().toJson(objDependencia, Dependencia.class);
                                String retornoDependencia = sDependencia.InsertarDependencia(strJsonDependencia);
                                JSONObject objYaDependencia = new JSONObject(retornoDependencia);
                                objDependencia.setDpId(objYaDependencia.getInt("dpId"));
                            } else {
                                JSONObject reqDependencia = new JSONObject(servNombreDependencia);
                                objDependencia = new Gson().fromJson(reqDependencia.toString(), Dependencia.class);
                            }

                            /*UBICACION*/
                            Ubicacion objUbicacion = new Ubicacion();
                            String servNombreUbicacion = sUbicacion.listaUbicacionNombre(objTemp.getTempUbicacion());
                            if (servNombreUbicacion.isEmpty()) {
                                objUbicacion.setUbEstado(1);
                                objUbicacion.setUbDescripcion(objTemp.getTempUbicacion());
                                String strJsonUbicacion = new Gson().toJson(objUbicacion, Ubicacion.class);
                                String retornoUbicacion = sUbicacion.InsertarUbicacion(strJsonUbicacion);
                                JSONObject objYaUbicacion = new JSONObject(retornoUbicacion);
                                objUbicacion.setUbId(objYaUbicacion.getInt("ubId"));
                            } else {
                                JSONObject reqUbicacion = new JSONObject(servNombreUbicacion);
                                objUbicacion = new Gson().fromJson(reqUbicacion.toString(), Ubicacion.class);
                            }

                            /*TIPO INGRESO*/
                            Tipoingreso objTipoingreso = new Tipoingreso();
                            String servNombreTipoingreso = sTipoIngreso.listaTipoingresoNombre(objTemp.getTempTipoIngreso());
                            if (servNombreTipoingreso.isEmpty()) {
                                objTipoingreso.setTiEstado(1);
                                objTipoingreso.setTiDetalle(objTemp.getTempTipoIngreso());
                                String strJsonTipoingreso = new Gson().toJson(objTipoingreso, Tipoingreso.class);
                                String retornoTipoingreso = sTipoIngreso.InsertarTipoingreso(strJsonTipoingreso);
                                JSONObject objYaTipoingreso = new JSONObject(retornoTipoingreso);
                                objTipoingreso.setTiId(objYaTipoingreso.getInt("tiId"));
                            } else {
                                JSONObject reqTipoingreso = new JSONObject(servNombreTipoingreso);
                                objTipoingreso = new Gson().fromJson(reqTipoingreso.toString(), Tipoingreso.class);
                            }

                            /*BAJA*/
                            Baja objBaja = new Baja();
                            String servNombreBaja = sBaja.listaBajaNombre("ACTIVO");
//                        if (servNombreBaja.isEmpty()) {
//                            objBaja.setBaEstado(1);
//                            objBaja.setBaDetalle(objTemp.getTempBaja());
//                            String strJsonBaja = new Gson().toJson(objBaja, Baja.class);
//                            String retornoBaja = sBaja.InsertarBaja(strJsonBaja);
//                            JSONObject objYaBaja = new JSONObject(retornoBaja);
//                            objBaja.setBaId(objYaBaja.getInt("baId"));
//                        } else {
                            JSONObject reqBaja = new JSONObject(servNombreBaja);
                            objBaja = new Gson().fromJson(reqBaja.toString(), Baja.class);
//                        }

                            /*CATALOGO*/
                            Catalogo objCatalogo = new Catalogo();
                            String servCodCatalogo = sCatalogo.listaCatalogoId(objTemp.getTempCatalogo());
                            if (servCodCatalogo.isEmpty()) {
                                objCatalogo.setCtEstado(1);
                                objCatalogo.setCtDescripcion(objTemp.getTempNombre());
                                objCatalogo.setCtId(objTemp.getTempCatalogo());
                                String strJsonCatalogo = new Gson().toJson(objCatalogo, Catalogo.class);
                                //String retornoCatalogoo = sCatalogo.
                                String retornoCatalogo = sCatalogo.InsertarCatalogo(strJsonCatalogo);
                                //JSONObject objYaCatalogo = new JSONObject(retornoCatalogo);
                                //objCatalogo.setCtId(objYaCatalogo.getString("ctId"));

                            } else {
                                JSONObject reqCatalogo = new JSONObject(servCodCatalogo);
                                objCatalogo = new Gson().fromJson(reqCatalogo.toString(), Catalogo.class);
                            }

                            /*BIEN*/
                            Bien objBien = new Bien();
                            String servCodigoBien = sBien.listaBienId(objTemp.getTempTipoIngreso());
                            if (servCodigoBien.isEmpty()) {
                                objBien.setBnCodBien(objTemp.getTempCodBien());
                                objBien.setBnNombre(objTemp.getTempNombre());
                                objBien.setBnSerie(objTemp.getTempSerie());
                                objBien.setBnModelo(objTemp.getTempModelo());
                                objBien.setBnMarca(objTemp.getTempMarca());
                                objBien.setBnColor(objTemp.getTempColor());
                                try {
                                    objBien.setBnPrecio(Float.parseFloat(objTemp.getTempPrecio().replace(" ", "").replace(",", "")));
                                } catch (Exception e) {
                                    objBien.setBnPrecio(Float.parseFloat("0"));
                                }
                                objBien.setBnEstadoBien(objTemp.getTempEstadoBien());
                                String fechacompra = "";
                                String fechagarantia = "";

                                try {
                                    String string = objTemp.getTempFechaCompra();
                                    String[] parts = string.split("/");
                                    fechacompra = parts[2] + "-" + parts[1] + "-" + parts[0];
                                    fechagarantia = (Integer.parseInt(parts[2]) + Integer.parseInt(objTemp.getTempTiempoGarantia())) + "-" + parts[1] + "-" + parts[0];
                                    objBien.setBnFechaCompra(fechacompra + "T00:00:00-05:00");
                                } catch (Exception e) {
                                    fechacompra = "2222-01-01";
                                    fechagarantia = "2222-01-01";
                                    objBien.setBnFechaCompra(fechacompra + "T00:00:00-05:00");
                                }

                                try {
                                    objBien.setBnTiempoGarantia(Integer.parseInt(objTemp.getTempTiempoGarantia()));
                                } catch (Exception e) {
                                    objBien.setBnTiempoGarantia(0);
                                }

                                objBien.setBnFechaGarantia(fechagarantia + "T00:00:00-05:00");
                                objBien.setBnProveedor(objTemp.getTempProveedor());
                                objBien.setBnDescripcion(objTemp.getTempDescripcion());
                                objBien.setBnRamTamano(objTemp.getTempRamTamano());
                                objBien.setBnRamTecno(objTemp.getTempRamTecno());
                                objBien.setBnDisco(objTemp.getTempCantDisco());
                                objBien.setBnRed(false);
                                String tembool = objTemp.getTempRed();
                                if ((tembool.equals("SI"))) {
                                    objBien.setBnRed(true);
                                }
                                objBien.setBnProcesador(objTemp.getTempProcesador());
                                objBien.setBnLectorDvd(false);
                                tembool = objTemp.getTempLectorDvd();
                                if (tembool.equals("SI")) {
                                    objBien.setBnLectorDvd(true);
                                }
                                objBien.setBnSo(objTemp.getTempSistemaOperativo());
                                objBien.setBnMonitorTecn(objTemp.getTempMonitorTecn());
                                objBien.setBnMonitorTama(objTemp.getTempMonitorTama());
                                objBien.setBnModeToner(objTemp.getTempModeToner());
                                objBien.setBnNumFusor(objTemp.getTempNumFusor());
                                try {
                                    objBien.setBnCantToner(Integer.parseInt(objTemp.getTempCantToner()));
                                } catch (Exception e) {
                                    objBien.setBnCantToner(0);
                                }

                                objBien.setBnTecnProyector(objTemp.getTempTecnProyector());
                                objBien.setBnLumenes(objTemp.getTempLumenes());
                                objBien.setBnTipoLampara(objTemp.getTempTipoLampara());
                                objBien.setBnResolucion(objTemp.getTempResolucion());

                                try {
                                    objBien.setBdCantDisco(Integer.parseInt(objTemp.getTempCantDisco()));
                                } catch (Exception e) {
                                    objBien.setBnCantToner(0);
                                }
                                objBien.setBnTipoConexion(objTemp.getTempMonitorTipoConex());
                                objBien.setBnObservacion(objTemp.getTempDescripcion());
                                objBien.setBnTipPantalla(objTemp.getTempTipPantalla());
                                objBien.setBnMemoInter(objTemp.getTempMemoInter());
                                objBien.setBnMemoExter(objTemp.getTempMemoExter());
                                objBien.setSwVersion(objTemp.getTempSwVersion());
                                objBien.setSwVigencia(objTemp.getTempSwVigencia());
                                try {
                                    objBien.setSwCantLicencia(Integer.parseInt(objTemp.getTempSwCantLicencia()));
                                } catch (Exception e) {
                                    objBien.setSwCantLicencia(0);
                                }
                                String fechacontrato = "";
                                try {

                                    String cadfecha = objTemp.getTempSwFechaContrat();
                                    String[] parts = cadfecha.split("/");
                                    fechacontrato = parts[2] + "-" + parts[1] + "-" + parts[0];
                                    objBien.setSwFechaContrat(fechacontrato + "T00:00:00-05:00");
                                } catch (Exception e) {
                                    fechacontrato = "1313-13-13";
                                    objBien.setSwFechaContrat(fechacontrato + "T00:00:00-05:00");
                                }
                                objBien.setSwTipSoporte(objTemp.getTempSwTipSoporte());
                                objBien.setBnTipBateria(objTemp.getTempTipBateria());
                                try {
                                    objBien.setBnNumConect(Integer.parseInt(objTemp.getTempNumConect()));
                                } catch (Exception e) {
                                    objBien.setBnNumConect(0);
                                }
                                try {
                                    objBien.setBnNumPuertRouter(Integer.parseInt(objTemp.getTempNumPuertRouter()));
                                } catch (Exception e) {
                                    objBien.setBnNumPuertRouter(0);
                                }
                                objBien.setBnTipLector(objTemp.getTempTipLector());
                                objBien.setBnDiscoTecn(objTemp.getTempDiscoTecn());
                                objBien.setBnTamPantalla(objTemp.getTempTipPantalla());
                                objBien.setBnEstadoUso(objTemp.getTempEstadoUso());

                                objBien.setDpId(objDependencia);
                                objBien.setUbId(objUbicacion);
                                objBien.setTiId(objTipoingreso);
                                objBien.setBaId(objBaja);
                                objBien.setCatId(objCatalogo);

                                String strJsonBien = new Gson().toJson(objBien, Bien.class);
                                String retornoBien = sBien.InsertarBien(strJsonBien);
                                JSONObject objYaBien = new JSONObject(retornoBien);
                                objBien.setBnCodBien(objYaBien.getString("bnCodBien"));
                            } else {
                                JSONObject reqBien = new JSONObject(servCodigoBien);
                                objBien = new Gson().fromJson(reqBien.toString(), Bien.class);
                            }

                            /*TRASPASO*/
                            Traspaso objTraspaso = new Traspaso();

                            Date date = new Date();
                            DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                            String fecha = fechaHora.format(date);

                            objTraspaso.setBnCodBien(objBien);
                            objTraspaso.setPerId(objPersona);
                            objTraspaso.setTraFechaInicio(fecha + "T00:00:00-05:00");
                            objTraspaso.setTraFechaFin("2222-01-01T00:00:00-05:00");
                            objTraspaso.setTraEstado(1);

                            String strJsonTraspaso = new Gson().toJson(objTraspaso, Traspaso.class);
                            String retornoTraspaso = sTraspaso.InsertarTraspaso(strJsonTraspaso);

                            String strJsonCSV = new Gson().toJson(objCsv, Csv.class);
                            String retorno = sCsv.InsertarCSV(strJsonCSV);
                            String eliminacTemp = sTemporal.EliminarTemporales(codBien);
                            if (i == tope - 1) {
                                estIngreso = "El bien ha sido ingresado correctamente, y se ha eliminado de su tabla temporal";
                            }
                        } else {
                            if (perExiste == false) {
                                estIngreso = "Verifiquela cédula del custodio, no se ha podido recuperar los datos del mismo";
                            } else {
                                estIngreso = "El bien ya se encuentra en sus DB";
                            }
                        }

                    } else {
                        estIngreso = "El bien ya se encuientra registrado en la DB principal. Por favor eliminelo de la lista";
                    }
                    String codBien1 = request.getParameter("codBien");
                    response.setContentType("text/plain");
                    response.getWriter().write(estIngreso);

                }

            } else if (tsk.equals("SbuTarea")) {

            }
        }

        if (strOpc.equals("Usuarios")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("agregarUsuarios")) {

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

                            objpersona.setPerId(reqPerso.getInt("per_id"));
                            objpersona.setPerCedula(cedula[i]);
                            objpersona.setPerNombres(reqPerso.getString("per_nombres").replace("\"", ""));
                            objpersona.setPerApellido1(reqPerso.getString("per_primerApellido").replace("\"", ""));
                            objpersona.setPerApellido2(reqPerso.getString("per_segundoApellido").replace("\"", ""));
                            if ((reqPerso.getString("per_email").toString().equals("null")) || (reqPerso.getString("per_email").replace("\"", "").toString().equals(""))) {
                                objpersona.setPerEmail(" ");
                            } else {
                                objpersona.setPerEmail(reqPerso.getString("per_email").replace("\"", ""));
                            }
                            if ((reqPerso.getString("per_telefonoCelular").toString().equals("null")) || (reqPerso.getString("per_telefonoCelular").replace("\"", "").toString().equals(""))) {
                                objpersona.setPerTelefono(" ");
                            } else {
                                objpersona.setPerTelefono(reqPerso.getString("per_telefonoCelular").replace("\"", ""));
                            }
                            objpersona.setPerEstado(1);

                            Cargo objCargo = new Cargo();
                            JSONObject reqCargo = new JSONObject(sCargo.listaCargoId(1));
                            objCargo = new Gson().fromJson(reqCargo.toString(), Cargo.class);

                            objpersona.setCarId(objCargo);

                            String strJsondocumento1 = new Gson().toJson(objpersona, Persona.class);
                            sPersona.InsertarPersona(strJsondocumento1);

                        }
                    }

                }

            } else if (tsk.equals("estUsuarios")) {
                String idPersona = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Persona objPersona = new Persona();
                JSONObject reqPersona = new JSONObject(sPersona.listaPersonaId(Integer.parseInt(idPersona)));
                objPersona = new Gson().fromJson(reqPersona.toString(), Persona.class);
                objPersona.setPerEstado(Integer.parseInt(estado));
                String jsonPersona = new Gson().toJson(objPersona, Persona.class);
                sPersona.ModficarPersona(jsonPersona, Integer.parseInt(idPersona));

            } else if (tsk.equals("editUsuarios")) {

                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Persona objPersona = new Persona();
                JSONObject reqPersona = new JSONObject(sPersona.listaPersonaId(Integer.parseInt(idDato)));
                objPersona = new Gson().fromJson(reqPersona.toString(), Persona.class);

                Cargo objCargo = new Cargo();
                String servCargo = sCargo.listaCargoId(req.getInt("CargoPersona"));
                JSONObject reqCargo = new JSONObject(servCargo);
                objCargo = new Gson().fromJson(reqCargo.toString(), Cargo.class);
                objPersona.setCarId(objCargo);

                objPersona.setPerEmail(req.getString("EmailPersona"));
                objPersona.setPerTelefono(req.getString("TelefonoPersona"));
                try {
                    if (req.getString("EstPersona").equals("on")) {
                        objPersona.setPerEstado(1);
                    }
                } catch (Exception e) {
                    objPersona.setPerEstado(2);
                }
                String jsonPersona = new Gson().toJson(objPersona, Persona.class);
                sPersona.ModficarPersona(jsonPersona, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Dependencia")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addDependencia")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String servNombreDependencia = sDependencia.listaDependenciaNombre(req.getString("DepenDescrip"));
                if (servNombreDependencia.isEmpty()) {
                    Dependencia objDependencia = new Dependencia();
                    objDependencia.setDpDescripcion(req.getString("DepenDescrip"));
                    try {
                        if (req.getString("DepenEstado").equals("on")) {
                            objDependencia.setDpEstado(1);
                        }
                    } catch (Exception e) {
                        objDependencia.setDpEstado(2);
                    }
                    String jsonDependencia = new Gson().toJson(objDependencia, Dependencia.class);
                    String retornoDependencia = sDependencia.InsertarDependencia(jsonDependencia);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estDependencia")) {
                String idDependencia = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Dependencia objDependencia = new Dependencia();
                JSONObject reqDependencia = new JSONObject(sDependencia.listaDependenciaId(Integer.parseInt(idDependencia)));
                objDependencia = new Gson().fromJson(reqDependencia.toString(), Dependencia.class);
                objDependencia.setDpEstado(Integer.parseInt(estado));
                String jsonDependencia = new Gson().toJson(objDependencia, Dependencia.class);
                sDependencia.ModficarDependencia(jsonDependencia, Integer.parseInt(idDependencia));

            } else if (tsk.equals("editDependencia")) {
                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Dependencia objDependencia = new Dependencia();
                objDependencia.setDpId(Integer.parseInt(idDato));
                objDependencia.setDpDescripcion(req.getString("DetaDependencia"));
                try {
                    if (req.getString("EstDependencia").equals("on")) {
                        objDependencia.setDpEstado(1);
                    }
                } catch (Exception e) {
                    objDependencia.setDpEstado(2);
                }
                String jsonDependencia = new Gson().toJson(objDependencia, Dependencia.class);
                sDependencia.ModficarDependencia(jsonDependencia, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Ubicacion")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addUbicacion")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String servNombreUbicacion = sUbicacion.listaUbicacionNombre(req.getString("UbicaDescrip"));
                if (servNombreUbicacion.isEmpty()) {
                    Ubicacion objUbicacion = new Ubicacion();
                    objUbicacion.setUbDescripcion(req.getString("UbicaDescrip"));
                    try {
                        if (req.getString("UbicaEstado").equals("on")) {
                            objUbicacion.setUbEstado(1);
                        }
                    } catch (Exception e) {
                        objUbicacion.setUbEstado(2);
                    }
                    String jsonUbicacion = new Gson().toJson(objUbicacion, Ubicacion.class);
                    String retornoUbicacion = sUbicacion.InsertarUbicacion(jsonUbicacion);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estUbicacion")) {
                String idUbicacion = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Ubicacion objUbicacion = new Ubicacion();
                JSONObject reqUbicacion = new JSONObject(sUbicacion.listaUbicacionId(Integer.parseInt(idUbicacion)));
                objUbicacion = new Gson().fromJson(reqUbicacion.toString(), Ubicacion.class);
                objUbicacion.setUbEstado(Integer.parseInt(estado));
                String jsonUbicacion = new Gson().toJson(objUbicacion, Ubicacion.class);
                sUbicacion.ModficarUbicacion(jsonUbicacion, Integer.parseInt(idUbicacion));

            } else if (tsk.equals("editUbicacion")) {

                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Ubicacion objUbicacion = new Ubicacion();
                objUbicacion.setUbId(Integer.parseInt(idDato));
                objUbicacion.setUbDescripcion(req.getString("DetaUbicacion"));
                try {
                    if (req.getString("EstUbicacion").equals("on")) {
                        objUbicacion.setUbEstado(1);
                    }
                } catch (Exception e) {
                    objUbicacion.setUbEstado(2);
                }
                String jsonUbicacion = new Gson().toJson(objUbicacion, Ubicacion.class);
                sUbicacion.ModficarUbicacion(jsonUbicacion, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Cargo")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addCargo")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String servNombreCargo = sCargo.listaCargoNombre(req.getString("CargoDescrip"));
                if (servNombreCargo.isEmpty()) {
                    Cargo objCargo = new Cargo();
                    objCargo.setCarDescripcion(req.getString("CargoDescrip"));
                    try {
                        if (req.getString("CargoEstado").equals("on")) {
                            objCargo.setCarEstado(1);
                        }
                    } catch (Exception e) {
                        objCargo.setCarEstado(2);
                    }
                    String jsonCargo = new Gson().toJson(objCargo, Cargo.class);
                    String retornoCargo = sCargo.InsertarCargo(jsonCargo);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estCargo")) {
                String idCargo = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Cargo objCargo = new Cargo();
                JSONObject reqCargo = new JSONObject(sCargo.listaCargoId(Integer.parseInt(idCargo)));
                objCargo = new Gson().fromJson(reqCargo.toString(), Cargo.class);
                objCargo.setCarEstado(Integer.parseInt(estado));
                String jsonCargo = new Gson().toJson(objCargo, Cargo.class);
                sCargo.ModficarCargo(jsonCargo, Integer.parseInt(idCargo));

            } else if (tsk.equals("editCargo")) {

                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Cargo objCargo = new Cargo();
                objCargo.setCarId(Integer.parseInt(idDato));
                objCargo.setCarDescripcion(req.getString("DetaCargo"));
                try {
                    if (req.getString("EstCargo").equals("on")) {
                        objCargo.setCarEstado(1);
                    }
                } catch (Exception e) {
                    objCargo.setCarEstado(2);
                }
                String jsonCargo = new Gson().toJson(objCargo, Cargo.class);
                sCargo.ModficarCargo(jsonCargo, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Motivoinforme")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addMotivoinforme")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String servNombreMotivoinforme = sMotivoInforme.listaMotivoinformeNombre(req.getString("MotInfDescrip"));
                if (servNombreMotivoinforme.isEmpty()) {
                    Motivoinforme objMotivoinforme = new Motivoinforme();
                    objMotivoinforme.setMotDetalle(req.getString("MotInfDescrip"));
                    try {
                        if (req.getString("MotInfEstado").equals("on")) {
                            objMotivoinforme.setMotEstado(1);
                        }
                    } catch (Exception e) {
                        objMotivoinforme.setMotEstado(2);
                    }
                    String jsonMotivoinforme = new Gson().toJson(objMotivoinforme, Motivoinforme.class);
                    String retornoMotivoinforme = sMotivoInforme.InsertarMotivoinforme(jsonMotivoinforme);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estMotivoinforme")) {
                String idMotivoinforme = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Motivoinforme objMotivoinforme = new Motivoinforme();
                JSONObject reqMotivoinforme = new JSONObject(sMotivoInforme.listaMotivoinformeId(Integer.parseInt(idMotivoinforme)));
                objMotivoinforme = new Gson().fromJson(reqMotivoinforme.toString(), Motivoinforme.class);
                objMotivoinforme.setMotEstado(Integer.parseInt(estado));
                String jsonMotivoinforme = new Gson().toJson(objMotivoinforme, Motivoinforme.class);
                sMotivoInforme.ModficarMotivoinforme(jsonMotivoinforme, Integer.parseInt(idMotivoinforme));

            } else if (tsk.equals("editMotivoinforme")) {

                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Motivoinforme objMotivoinforme = new Motivoinforme();
                objMotivoinforme.setMotId(Integer.parseInt(idDato));
                objMotivoinforme.setMotDetalle(req.getString("DetaMotivoinforme"));
                try {
                    if (req.getString("EstMotivoinforme").equals("on")) {
                        objMotivoinforme.setMotEstado(1);
                    }
                } catch (Exception e) {
                    objMotivoinforme.setMotEstado(2);
                }
                String jsonMotivoinforme = new Gson().toJson(objMotivoinforme, Motivoinforme.class);
                sMotivoInforme.ModficarMotivoinforme(jsonMotivoinforme, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Baja")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addBaja")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String servNombreBaja = sBaja.listaBajaNombre(req.getString("BajaDescrip"));
                if (servNombreBaja.isEmpty()) {
                    Baja objBaja = new Baja();
                    objBaja.setBaDetalle(req.getString("BajaDescrip"));
                    try {
                        if (req.getString("BajaEstado").equals("on")) {
                            objBaja.setBaEstado(1);
                        }
                    } catch (Exception e) {
                        objBaja.setBaEstado(2);
                    }
                    String jsonBaja = new Gson().toJson(objBaja, Baja.class);
                    String retornoBaja = sBaja.InsertarBaja(jsonBaja);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estBaja")) {
                String idBaja = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Baja objBaja = new Baja();
                JSONObject reqBaja = new JSONObject(sBaja.listaBajaId(Integer.parseInt(idBaja)));
                objBaja = new Gson().fromJson(reqBaja.toString(), Baja.class);
                objBaja.setBaEstado(Integer.parseInt(estado));
                String jsonBaja = new Gson().toJson(objBaja, Baja.class);
                sBaja.ModficarBaja(jsonBaja, Integer.parseInt(idBaja));

            } else if (tsk.equals("editBaja")) {

                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Baja objBaja = new Baja();
                objBaja.setBaId(Integer.parseInt(idDato));
                objBaja.setBaDetalle(req.getString("DetaBaja"));
                try {
                    if (req.getString("EstBaja").equals("on")) {
                        objBaja.setBaEstado(1);
                    }
                } catch (Exception e) {
                    objBaja.setBaEstado(2);
                }
                String jsonBaja = new Gson().toJson(objBaja, Baja.class);
                sBaja.ModficarBaja(jsonBaja, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Tipoingreso")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addTipoingreso")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String servNombreTipoingreso = sTipoIngreso.listaTipoingresoNombre(req.getString("TipoingresoDescrip"));
                if (servNombreTipoingreso.isEmpty()) {
                    Tipoingreso objTipoingreso = new Tipoingreso();
                    objTipoingreso.setTiDetalle(req.getString("TipoingresoDescrip"));
                    try {
                        if (req.getString("TipoingresoEstado").equals("on")) {
                            objTipoingreso.setTiEstado(1);
                        }
                    } catch (Exception e) {
                        objTipoingreso.setTiEstado(2);
                    }
                    String jsonTipoingreso = new Gson().toJson(objTipoingreso, Tipoingreso.class);
                    String retornoTipoingreso = sTipoIngreso.InsertarTipoingreso(jsonTipoingreso);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estTipoingreso")) {
                String idTipoingreso = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Tipoingreso objTipoingreso = new Tipoingreso();
                JSONObject reqTipoingreso = new JSONObject(sTipoIngreso.listaTipoingresoId(Integer.parseInt(idTipoingreso)));
                objTipoingreso = new Gson().fromJson(reqTipoingreso.toString(), Tipoingreso.class);
                objTipoingreso.setTiEstado(Integer.parseInt(estado));
                String jsonTipoingreso = new Gson().toJson(objTipoingreso, Tipoingreso.class);
                sTipoIngreso.ModficarTipoingreso(jsonTipoingreso, Integer.parseInt(idTipoingreso));

            } else if (tsk.equals("editTipoingreso")) {

                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Tipoingreso objTipoingreso = new Tipoingreso();
                objTipoingreso.setTiId(Integer.parseInt(idDato));
                objTipoingreso.setTiDetalle(req.getString("DetaTipoingreso"));
                try {
                    if (req.getString("EstTipoingreso").equals("on")) {
                        objTipoingreso.setTiEstado(1);
                    }
                } catch (Exception e) {
                    objTipoingreso.setTiEstado(2);
                }
                String jsonTipoingreso = new Gson().toJson(objTipoingreso, Tipoingreso.class);
                sTipoIngreso.ModficarTipoingreso(jsonTipoingreso, Integer.parseInt(idDato));

            }
        }

        if (strOpc.equals("Bien")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addBien") || tsk.equals("editBien")) {
                String detTransac = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);

                String idDato = "";
                if (tsk.equals("editBien")) { //modificar
                    idDato = request.getParameter("idDato");
                }

                Bien objBien = new Bien();
                String servCodigoBien = "";
                if (tsk.equals("addBien")) {
                    servCodigoBien = sBien.listaBienId(req.getString("bienCodigo"));
                }
                if (servCodigoBien.isEmpty() || tsk.equals("editBien")) {
                    try {
                        //Ingresar SOFTWARE
                        if (req.getString("bienCatalogoId").equals("700200210001") || req.getString("bienCatalogoId").equals("170700350001")) {
                            //dependencia 
                            //uicacion

                            objBien.setBnCodBien(req.getString("bienCodigo"));
//                            if (req.getString("bienNombre") == "") {
//                                objBien.setBnNombre(" ");
//                            }
                            objBien.setBnNombre(req.getString("bienNombre"));
//                            if (req.getString("bienSerie") == "") {
//                                objBien.setBnSerie(" ");
//                            }
                            objBien.setSwVersion(req.getString("softVersion"));
                            objBien.setSwVigencia(req.getString("softVigencia"));
                            objBien.setSwCantLicencia(Integer.parseInt(req.getString("softCantLicen")));
                            objBien.setBnFechaCompra(req.getString("bienFecha") + "T00:00:00-05:00");
                            //objBien.setSwFechaContrat(req.getString("softFinContr") + "T00:00:00-05:00");
                            objBien.setSwFechaContrat(req.getString("softFinContr") + "T00:00:00-05:00");
                            objBien.setBnProveedor(req.getString("bienProveedor"));
                            objBien.setBnDescripcion(req.getString("bienDescripcion"));
                            objBien.setSwTipSoporte(req.getString("softTipSoporte"));
                        } else {
                            objBien.setBnCodBien(req.getString("bienCodigo"));
                            if (req.getString("bienNombre") == "") {
                                objBien.setBnNombre(" ");
                            }
                            objBien.setBnNombre(req.getString("bienNombre"));
                            if (req.getString("bienSerie") == "") {
                                objBien.setBnSerie(" ");
                            }
                            objBien.setBnSerie(req.getString("bienSerie"));
                            if (req.getString("bienModelo") == "") {
                                objBien.setBnModelo(" ");
                            }
                            objBien.setBnModelo(req.getString("bienModelo"));
                            if (req.getString("bienMarca") == "") {
                                objBien.setBnMarca(" ");
                            }
                            objBien.setBnMarca(req.getString("bienMarca"));

                            objBien.setBnColor(req.getString("bienColor"));
                            objBien.setBnPrecio(Float.parseFloat(req.getString("bienPrecio")));
                            objBien.setBnEstadoBien(req.getString("bienEstado"));
                            objBien.setBnFechaCompra(req.getString("bienFecha") + "T00:00:00-05:00");
                            objBien.setBnTiempoGarantia(Integer.parseInt(req.getString("bienGarantia")));
                            String string = req.getString("bienFecha");
                            String[] parts = string.split("-");
                            Integer Anio = Integer.parseInt(parts[0]) + Integer.parseInt(req.getString("bienGarantia"));
                            objBien.setBnFechaGarantia(Anio + "-" + parts[1] + "-" + parts[2] + "T00:00:00-05:00");
                            objBien.setBnProveedor(req.getString("bienProveedor"));
                            objBien.setBnDescripcion(req.getString("bienDescripcion"));
                            objBien.setBnObservacion(req.getString("bienObservacion"));
                            //Ingresar un CPU
                            if (req.getString("bienCatalogoId").equals("700100130001") || req.getString("bienCatalogoId").equals("170700320001")) {
                                objBien.setBnRamTamano(req.getString("bienRamTamano"));
                                objBien.setBnRamTecno(req.getString("bienRamTecno"));
                                objBien.setBnDisco(req.getString("bienDiscoTama"));
                                objBien.setBnProcesador(req.getString("bienProcesador"));
                                objBien.setBnRed(false);
                                if ((req.getString("bienTarjeRed").equals("SI"))) {
                                    objBien.setBnRed(true);
                                }
                                objBien.setBnLectorDvd(false);
                                if ((req.getString("bienDvd").equals("SI"))) {
                                    objBien.setBnLectorDvd(true);
                                }
                                objBien.setBnSo(req.getString("bienSO"));
                            }

                            //Ingresar Impresora
                            if (req.getString("bienCatalogoId").indexOf("70010029000") > -1 || req.getString("bienCatalogoId").equals("170700090001")) {
                                //color
                                objBien.setBnModeToner(req.getString("bienToner"));
                                objBien.setBnNumFusor(req.getString("bienNumFusor"));
                                try {
                                    String impcolbool = req.getString("bienTipColor");
                                    if ((impcolbool.equals("SI"))) {
                                        objBien.setBnImpColor(true);
                                    }
                                    if ((impcolbool.equals("NO"))) {
                                        objBien.setBnImpColor(false);
                                    }
                                } catch (Exception e) {
                                    objBien.setBnImpColor(null);
                                }

                                objBien.setBnCantToner(Integer.parseInt(req.getString("bienCantToner")));
                            }
                            //Ingresar Monitor
                            if (req.getString("bienCatalogoId").equals("700100440001") || req.getString("bienCatalogoId").equals("170700100001")) {
                                objBien.setBnMonitorTecn(req.getString("bienMoniTecno"));
                                objBien.setBnMonitorTama(req.getString("bienMoniTamano"));
                                objBien.setBnTipoConexion(req.getString("bienTipoConex"));
                            }
                            //Ingresar Proyector
                            if (req.getString("bienCatalogoId").equals("400100440001")) {
                                objBien.setBnTecnProyector(req.getString("bienTecProyec"));
                                objBien.setBnLumenes(req.getString("bienNumLumenes"));
                                objBien.setBnTipoLampara(req.getString("bienTipLampa"));
                                objBien.setBnResolucion(req.getString("bienResolucion"));
                            }
                            //Ingresar Portatil
                            if (req.getString("bienCatalogoId").equals("700100070001") || req.getString("bienCatalogoId").equals("700100990001")
                                    || req.getString("bienCatalogoId").equals("170700490001")) {
                                objBien.setBnRamTamano(req.getString("bienRamTamano"));
                                objBien.setBnRamTecno(req.getString("bienRamTecno"));
                                objBien.setBnDisco(req.getString("bienDiscoTama"));
                                //poner tecnologia 
                                //objBien.setTecnoId(Integer.parseInt(req.getString("bienDiscoTecno")));
                                objBien.setBnProcesador(req.getString("bienProcesador"));
                                objBien.setBnMonitorTama(req.getString("bienTamPantalla"));
                                objBien.setBnTipPantalla(req.getString("bienTipoPantalla"));
                                objBien.setBnRed(false);
                                if ((req.getString("bienTarjeRed").equals("SI"))) {
                                    objBien.setBnRed(true);
                                }
                                objBien.setBnLectorDvd(false);
                                if ((req.getString("bienDvd").equals("SI"))) {
                                    objBien.setBnLectorDvd(true);
                                }
                                objBien.setBnSo(req.getString("bienSO"));

                            }
                            //Ingresar Movil 
                            if (req.getString("bienCatalogoId").equals("400100410002")) {
                                objBien.setBnMemoInter(req.getString("bienTamMemoInter"));
                                objBien.setBnMemoExter(req.getString("bienTamMemoExter"));
                            }
                            //Ingresar Tablet
                            if (req.getString("bienCatalogoId").equals("700100810001") || req.getString("bienCatalogoId").equals("170700460001")) {
                                objBien.setBnMemoInter(req.getString("bienTamMemoInter"));
                                objBien.setBnMemoExter(req.getString("bienTamMemoExter"));
                                objBien.setBnProcesador(req.getString("bienProcesador"));
                                objBien.setBnSo(req.getString("bienSO"));
                            }
                        }
                        String cedCustodio = "";
                        if (tsk.equals("addBien")) {
                            String custodioCad = req.getString("exampleRadios1");
                            String[] arrayDatCustodio = custodioCad.split("_");
                            cedCustodio = arrayDatCustodio[0];
                        }

                        /*DEPENDECIA*/
                        Dependencia objDependencia = new Dependencia();
                        String servNombreDependencia = sDependencia.listaDependenciaId(Integer.parseInt(req.getString("bienDependenciaId")));
                        JSONObject reqDependencia = new JSONObject(servNombreDependencia);
                        objDependencia = new Gson().fromJson(reqDependencia.toString(), Dependencia.class);

                        /*UBICACION*/
                        Ubicacion objUbicacion = new Ubicacion();
                        String servNombreUbicacion = sUbicacion.listaUbicacionId(Integer.parseInt(req.getString("bienUbicacionId")));
                        JSONObject reqUbicacion = new JSONObject(servNombreUbicacion);
                        objUbicacion = new Gson().fromJson(reqUbicacion.toString(), Ubicacion.class);

                        /*Tipoingreso*/
                        Tipoingreso objTipoingreso = new Tipoingreso();
                        if (req.getString("bienCatalogoId").equals("700200210001") == false || req.getString("bienCatalogoId").equals("170700350001") == false) {
                            String servNombreTipoingreso = sTipoIngreso.listaTipoingresoId(Integer.parseInt(req.getString("bienTipIngreId")));
                            JSONObject reqTipoingreso = new JSONObject(servNombreTipoingreso);
                            objTipoingreso = new Gson().fromJson(reqTipoingreso.toString(), Tipoingreso.class);
                        }

                        /*BAJA*/
                        Baja objBaja = new Baja();
                        String servNombreBaja = sBaja.listaBajaId(1);
                        JSONObject reqBaja = new JSONObject(servNombreBaja);
                        objBaja = new Gson().fromJson(reqBaja.toString(), Baja.class);

                        /*CATALOGO*/
                        Catalogo objCatalogo = new Catalogo();
                        String servNombreCatalogo = sCatalogo.listaCatalogoId(req.getString("bienCatalogoId"));
                        JSONObject reqCatalogo = new JSONObject(servNombreCatalogo);
                        objCatalogo = new Gson().fromJson(reqCatalogo.toString(), Catalogo.class);

                        objBien.setDpId(objDependencia);
                        objBien.setUbId(objUbicacion);
                        objBien.setBaId(objBaja);
                        objBien.setCatId(objCatalogo);
                        if (req.getString("bienCatalogoId").equals("700200210001") == false || req.getString("bienCatalogoId").equals("170700350001") == false) {
                            objBien.setTiId(objTipoingreso);
                        }

                        String retornoBien = "";
                        if (tsk.equals("addBien")) {
                            String strJsonBien = new Gson().toJson(objBien, Bien.class);
                            retornoBien = sBien.InsertarBien(strJsonBien);

                            /*BIEN*/
                            Bien objetoBien = new Bien();
                            String serBien = sBien.listaBienId(req.getString("bienCodigo"));
                            JSONObject reqBien = new JSONObject(serBien);
                            objetoBien = new Gson().fromJson(reqBien.toString(), Bien.class);

                            /*PERSONA*/
                            Persona objPersona = new Persona();
                            String serPersona = sPersona.listaPersonaId(Integer.parseInt(cedCustodio));
                            JSONObject reqPersona = new JSONObject(serPersona);
                            objPersona = new Gson().fromJson(reqPersona.toString(), Persona.class);

                            Traspaso objTraspaso = new Traspaso();

                            //Aqui falta un IF para comparar
                            Date date = new Date();
                            DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                            String fecha = fechaHora.format(date);

                            objTraspaso.setBnCodBien(objBien);
                            objTraspaso.setPerId(objPersona);
                            objTraspaso.setTraFechaInicio(fecha + "T00:00:00-05:00");
                            objTraspaso.setTraFechaFin("2222-01-01T00:00:00-05:00");
                            objTraspaso.setTraEstado(1);

                            String strJsonTraspaso = new Gson().toJson(objTraspaso, Traspaso.class);
                            String retornoTraspaso = sTraspaso.InsertarTraspaso(strJsonTraspaso);
                        }
                        if (tsk.equals("editBien")) {
                            String jsonModBien = new Gson().toJson(objBien, Bien.class);
                            sBien.ModficBien(jsonModBien, idDato);
                        }
                        detTransac = retornoBien;

                        detTransac = "SI";
                    } catch (Exception e) {
                        detTransac = "ERROR";
                    }
                } else {

                    detTransac = "NO";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detTransac);

            } else if (tsk.equals("deleteBien")) {

            }
        }

        if (strOpc.equals("Tarea")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("SbuTarea")) {

            } else if (tsk.equals("SbuTarea")) {

            }
        }

        if (strOpc.equals("BienMotivoBaja")) {
            String datos = request.getParameter("datos");

            JSONObject req = new JSONObject(datos);
            //String idDato = req.getString("codigoBienId");

            Bien objBien = new Bien();
            String cadBienId = sBien.listaBienId(req.getString("codigoBienId"));
            JSONObject jsonBien = new JSONObject(cadBienId);
            objBien = new Gson().fromJson(jsonBien.toString(), Bien.class);

            objBien.setBnCodMotBaja(Integer.parseInt(req.getString("bienMotivoInformeId")));

            Date date = new Date();
            DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
            String fecha = fechaHora.format(date);

            objBien.setBnFechaBaja(fecha + "T00:00:00-05:00");

            /*BAJA*/
            Baja objBaja = new Baja();
            String servNombreBaja = sBaja.listaBajaId(2);
            JSONObject reqBaja = new JSONObject(servNombreBaja);
            objBaja = new Gson().fromJson(reqBaja.toString(), Baja.class);

            objBien.setBaId(objBaja);

            String jsonModBien = new Gson().toJson(objBien, Bien.class);
            sBien.ModficBien(jsonModBien, req.getString("codigoBienId"));
        }

        if (strOpc.equals("Traspaso")) {
            Traspaso objTras = new Traspaso();
            //sPersona objPer = new sPersona();
            String tsk = request.getParameter("tsk");
            if (tsk.equals("editTraspaso")) {
                //String detOpera = "NO";

//                String datos = request.getParameter("datos");
//                JSONObject req = new JSONObject(datos);

                String datosP = request.getParameter("datosP");
                JSONObject req = new JSONObject(datosP);

                String datosUbDp = request.getParameter("datosUbDp");
                JSONObject req1 = new JSONObject(datosUbDp);
                
                Date date = new Date();
                DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                String fecha = fechaHora.format(date);

                //objTras.setTraId(Integer.parseInt(req.getString("traspasoId")));
                objTras.setTraId(Integer.parseInt(request.getParameter("traCodigo")));
                objTras.setTraFechaInicio(fecha + "T00:00:00-05:00");
                objTras.setTraFechaFin("2222-01-01T00:00:00-05:00");
                objTras.setTraEstado(1);
                objTras.setTraObservacion(req1.getString("trasObservacion"));

//                String cedCustodio = "";
//                String custodioCad = req.getString("exampleRadios1");
//                String[] arrayDatCustodio = custodioCad.split("_");
//                cedCustodio = arrayDatCustodio[0];

                /*PERSONA*/
                Persona objPersona = new Persona();
                String cadPersonaId = sPersona.listaPersonaId(Integer.parseInt(req.getString("exampleRadios1")));
                JSONObject jsonPersona = new JSONObject(cadPersonaId);
                objPersona = new Gson().fromJson(jsonPersona.toString(), Persona.class);

                /*BIEN*/
                Bien objBien = new Bien();
                String cadBienId = sBien.listaBienId(request.getParameter("bnCodigo"));
                JSONObject jsonBien = new JSONObject(cadBienId);
                objBien = new Gson().fromJson(jsonBien.toString(), Bien.class);

                objTras.setPerId(objPersona);
                objTras.setBnCodBien(objBien);

                String jsonTrasCutodio = new Gson().toJson(objTras, Traspaso.class);
                sTraspaso.ModficTraspaso(jsonTrasCutodio, Integer.parseInt(request.getParameter("traCodigo")));

                objBien.setBnCodBien(request.getParameter("bnCodigo"));

                /*UBICACION*/
                Ubicacion objUbicacion = new Ubicacion();
                String cadUbicacionId = sUbicacion.listaUbicacionId(Integer.parseInt(req1.getString("bienUbicacionId")));
                JSONObject jsonUbicacion = new JSONObject(cadUbicacionId);
                objUbicacion = new Gson().fromJson(jsonUbicacion.toString(), Ubicacion.class);

                /*DEPENDENCIA*/
                Dependencia objDependencia = new Dependencia();
                String cadDependenciaId = sDependencia.listaDependenciaId(Integer.parseInt(req1.getString("bienDependenciaId")));
                JSONObject jsonDependencia = new JSONObject(cadDependenciaId);
                objDependencia = new Gson().fromJson(jsonDependencia.toString(), Dependencia.class);

                objBien.setUbId(objUbicacion);
                objBien.setDpId(objDependencia);

                String jsonBienCust = new Gson().toJson(objBien, Bien.class);
                sBien.ModficBien(jsonBienCust, request.getParameter("bnCodigo"));

            } else {

            }
        }

        if (strOpc.equals("Tecnico")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addTecnico")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);

                String servNombreTecnico = sTecnico.listaTecnicoCedula(req.getString("TecCedula"));
                if (servNombreTecnico.isEmpty()) {
                    Tecnico objTecnico = new Tecnico();
                    objTecnico.setTecCedula(req.getString("TecCedula"));
                    objTecnico.setTecNombre(req.getString("TecNombre"));
                    objTecnico.setTecDepartamento(req.getString("TecDepart"));
                    objTecnico.setTecTelefono(req.getString("TecTelef"));
//                    try {
//                        if (req.getString("UbicaEstado").equals("on")) {
//                            objTecnico.setUbEstado(1);
//                        }
//                    } catch (Exception e) {
//                        objUbicacion.setUbEstado(2);
//                    }
                    String jsonTecnico = new Gson().toJson(objTecnico, Tecnico.class);
                    String retornoTecnico = sTecnico.InsertarTecnico(jsonTecnico);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estUbicacion")) {
                String idUbicacion = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Ubicacion objUbicacion = new Ubicacion();
                JSONObject reqUbicacion = new JSONObject(sUbicacion.listaUbicacionId(Integer.parseInt(idUbicacion)));
                objUbicacion = new Gson().fromJson(reqUbicacion.toString(), Ubicacion.class);
                objUbicacion.setUbEstado(Integer.parseInt(estado));
                String jsonUbicacion = new Gson().toJson(objUbicacion, Ubicacion.class);
                sUbicacion.ModficarUbicacion(jsonUbicacion, Integer.parseInt(idUbicacion));

            } else if (tsk.equals("editUbicacion")) {

                String idDato = request.getParameter("idDato");

                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Ubicacion objUbicacion = new Ubicacion();
                objUbicacion.setUbId(Integer.parseInt(idDato));
                objUbicacion.setUbDescripcion(req.getString("DetaUbicacion"));
                try {
                    if (req.getString("EstUbicacion").equals("on")) {
                        objUbicacion.setUbEstado(1);
                    }
                } catch (Exception e) {
                    objUbicacion.setUbEstado(2);
                }
                String jsonUbicacion = new Gson().toJson(objUbicacion, Ubicacion.class);
                sUbicacion.ModficarUbicacion(jsonUbicacion, Integer.parseInt(idDato));

            } else if (tsk.equals("deleteTecnico")) {
                String codTecnico = request.getParameter("codTecnico");
                String eliminarMant = sTecnico.EliminarTecnico(Integer.parseInt(codTecnico));
                response.setContentType("text/plain");
                response.getWriter().write("Se ha eliminado el bien de codigo " + codTecnico + " de la tabla remporal.");
            }
        }
        if (strOpc.equals("MantenimientoBienN")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addMantenimiento")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Integer NroDeOrden;
                String serMantenimientoOrden = sMantenimientoN.lastNumOrdenMantenimiento();
                if (serMantenimientoOrden.isEmpty()) {
                    NroDeOrden = 0;
                } else {
                    JSONObject objMant = new JSONObject(serMantenimientoOrden);
                    Mantenimientos oMantenimiento = new Gson().fromJson(objMant.toString(), Mantenimientos.class);
                    NroDeOrden = Integer.parseInt(oMantenimiento.getMantNumOrden());
                }
                NroDeOrden = NroDeOrden + 1;
                if (NroDeOrden != -1) {
                    System.out.println(NroDeOrden);
                    Mantenimientos objMantenimiento = new Mantenimientos();

                    objMantenimiento.setMantNumOrden(String.valueOf(NroDeOrden));
                    objMantenimiento.setMantEstado(1);
                    objMantenimiento.setMantFechaIngreso(req.getString("MantFechaIng") + "T00:00:00-05:00");
                    objMantenimiento.setMantDescProblema(req.getString("MantDescripProblema"));
                    objMantenimiento.setMantTecnIngreso(req.getString("NombreTecnicoIngreso"));
                    Tipomantenimiento oTipomantenimiento = new Tipomantenimiento();
                    oTipomantenimiento.setTipId(Integer.parseInt(req.getString("TipId")));
                    objMantenimiento.setTipId(oTipomantenimiento);

                    Nivelmantenimiento oNivelmantenimiento = new Nivelmantenimiento();
                    oNivelmantenimiento.setNivelId(Integer.parseInt(req.getString("NivId")));
                    objMantenimiento.setNivelmId(oNivelmantenimiento);

                    Bien oBien = new Bien();
                    oBien.setBnCodBien(req.getString("bienId"));
                    objMantenimiento.setBienId(oBien);

                    String jsonMantenimiento = new Gson().toJson(objMantenimiento, Mantenimientos.class);
                    sMantenimientoN.InsertarMantenimiento(jsonMantenimiento);
                    detOpera = "SI";

                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("asignarTecnicoMantenimiento")) {

                String idMantenimiento = request.getParameter("idDato");

                String serMantenimiento = serMantenimiento = sMantenimientoN.DetallesMantenimiento(idMantenimiento);
                JSONObject objMant = new JSONObject(serMantenimiento);
                Mantenimientos oMantenimiento = new Gson().fromJson(objMant.toString(), Mantenimientos.class);
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                System.out.println(req.getString("NombreTecnicoRevision"));
                Mantenimientos objMantenimientos = new Mantenimientos();
                objMantenimientos.setMantId(Integer.parseInt(idMantenimiento));
                objMantenimientos.setMantNumOrden(oMantenimiento.getMantNumOrden());
                objMantenimientos.setMantEstado(1);
                objMantenimientos.setMantFechaIngreso(oMantenimiento.getMantFechaIngreso());
                objMantenimientos.setMantDescProblema(oMantenimiento.getMantDescProblema());
                objMantenimientos.setMantTecnIngreso(oMantenimiento.getMantTecnIngreso());
                objMantenimientos.setMantTecnRevision(req.getString("NombreTecnicoRevision"));

                objMantenimientos.setTipId(oMantenimiento.getTipId());
                objMantenimientos.setNivelmId(oMantenimiento.getNivelmId());
                objMantenimientos.setBienId(oMantenimiento.getBienId());

                String jsonMatenimiento = new Gson().toJson(objMantenimientos, Mantenimientos.class);
                sMantenimientoN.ProcesoMantenimiento(jsonMatenimiento, Integer.parseInt(idMantenimiento));

            } else if (tsk.equals("doMantenimiento")) {

                String idMantenimiento = request.getParameter("idDato");

                String serMantenimiento = "";
                serMantenimiento = sMantenimientoN.DetallesMantenimiento(idMantenimiento);
                JSONObject objMant = new JSONObject(serMantenimiento);
                Mantenimientos oMantenimiento = new Gson().fromJson(objMant.toString(), Mantenimientos.class);
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Mantenimientos objMantenimientos = new Mantenimientos();
                objMantenimientos.setMantId(Integer.parseInt(idMantenimiento));
                objMantenimientos.setMantNumOrden(oMantenimiento.getMantNumOrden());
                objMantenimientos.setMantEstado(2);
                objMantenimientos.setMantFechaIngreso(oMantenimiento.getMantFechaIngreso());
                objMantenimientos.setMantFechaRevision(req.getString("MantFechaRev") + "T00:00:00-05:00");
                objMantenimientos.setMantDescProblema(oMantenimiento.getMantDescProblema());
                objMantenimientos.setMantDescSolucion(req.getString("DescSolucion"));
                objMantenimientos.setMantTecnIngreso(oMantenimiento.getMantTecnIngreso());
                objMantenimientos.setMantTecnRevision(oMantenimiento.getMantTecnRevision());

                objMantenimientos.setTipId(oMantenimiento.getTipId());
                objMantenimientos.setNivelmId(oMantenimiento.getNivelmId());
                objMantenimientos.setBienId(oMantenimiento.getBienId());

                String jsonMatenimiento = new Gson().toJson(objMantenimientos, Mantenimientos.class);
                sMantenimientoN.ProcesoMantenimiento(jsonMatenimiento, Integer.parseInt(idMantenimiento));

            } else if (tsk.equals("entregarMantenimiento")) {

                String idMantenimiento = request.getParameter("idDato");

                String serMantenimiento = "";
                serMantenimiento = sMantenimientoN.DetallesMantenimiento(idMantenimiento);
                JSONObject objMant = new JSONObject(serMantenimiento);
                Mantenimientos oMantenimiento = new Gson().fromJson(objMant.toString(), Mantenimientos.class);
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Mantenimientos objMantenimientos = new Mantenimientos();
                objMantenimientos.setMantId(Integer.parseInt(idMantenimiento));
                objMantenimientos.setMantNumOrden(oMantenimiento.getMantNumOrden());
                objMantenimientos.setMantEstado(3);
                objMantenimientos.setMantFechaIngreso(oMantenimiento.getMantFechaIngreso());
                objMantenimientos.setMantFechaRevision(oMantenimiento.getMantFechaRevision());
                objMantenimientos.setMantDescProblema(oMantenimiento.getMantDescProblema());
                objMantenimientos.setMantDescSolucion(oMantenimiento.getMantDescSolucion());
                objMantenimientos.setMantFechaEntrega(req.getString("MantFechaEnt") + "T00:00:00-05:00");
                objMantenimientos.setMantTecnIngreso(oMantenimiento.getMantTecnIngreso());
                objMantenimientos.setMantTecnRevision(oMantenimiento.getMantTecnRevision());
                objMantenimientos.setMantTecnEntrega(req.getString("NombreTecnicoEntrega"));
                objMantenimientos.setMantResponsableRecibo(req.getString("nombresRes"));

                objMantenimientos.setTipId(oMantenimiento.getTipId());
                objMantenimientos.setNivelmId(oMantenimiento.getNivelmId());
                objMantenimientos.setBienId(oMantenimiento.getBienId());

                String jsonMatenimiento = new Gson().toJson(objMantenimientos, Mantenimientos.class);
                sMantenimientoN.ProcesoMantenimiento(jsonMatenimiento, Integer.parseInt(idMantenimiento));

            } else if (tsk.equals("quitarMantenimiento")) {
                String idMantenimiento = request.getParameter("idDato");

                String serMantenimiento = "";
                serMantenimiento = sMantenimientoN.DetallesMantenimiento(idMantenimiento);
                JSONObject objMant = new JSONObject(serMantenimiento);
                Mantenimientos oMantenimiento = new Gson().fromJson(objMant.toString(), Mantenimientos.class);
                Mantenimientos objMantenimientos = new Mantenimientos();
                objMantenimientos.setMantId(Integer.parseInt(idMantenimiento));
                objMantenimientos.setMantNumOrden(oMantenimiento.getMantNumOrden());
                objMantenimientos.setMantEstado(0);
                objMantenimientos.setMantFechaIngreso(oMantenimiento.getMantFechaIngreso());
                objMantenimientos.setMantFechaRevision(oMantenimiento.getMantFechaRevision());
                objMantenimientos.setMantFechaEntrega(oMantenimiento.getMantFechaEntrega());
                objMantenimientos.setMantDescProblema(oMantenimiento.getMantDescProblema());
                objMantenimientos.setMantDescSolucion(oMantenimiento.getMantDescSolucion());
                objMantenimientos.setMantTecnIngreso(oMantenimiento.getMantTecnIngreso());
                objMantenimientos.setMantTecnRevision(oMantenimiento.getMantTecnRevision());
                objMantenimientos.setMantTecnEntrega(oMantenimiento.getMantTecnEntrega());
                objMantenimientos.setMantResponsableRecibo(oMantenimiento.getMantResponsableRecibo());

                objMantenimientos.setTipId(oMantenimiento.getTipId());
                objMantenimientos.setNivelmId(oMantenimiento.getNivelmId());
                objMantenimientos.setBienId(oMantenimiento.getBienId());

                String jsonMatenimiento = new Gson().toJson(objMantenimientos, Mantenimientos.class);
                sMantenimientoN.ProcesoMantenimiento(jsonMatenimiento, Integer.parseInt(idMantenimiento));
            }
        }
        if (strOpc.equals("NivelMantenimiento")) {
            String tsk = request.getParameter("tsk");
            if (tsk.equals("addNivelMantenimiento")) {
                String detOpera = "NO";
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                String servNombreNivelMantenimiento = sNivelmantenimiento.listaNivelMantenimientoNombre(req.getString("DepenDescrip"));
                if (servNombreNivelMantenimiento.isEmpty()) {
                    Nivelmantenimiento objNivelmantenimiento = new Nivelmantenimiento();
                    objNivelmantenimiento.setNivelDescripcion(req.getString("DepenDescrip"));
                    try {
                        if (req.getString("DepenEstado").equals("on")) {
                            objNivelmantenimiento.setNivelEstado(1);
                        }
                    } catch (Exception e) {
                        objNivelmantenimiento.setNivelEstado(2);
                    }
                    String jsonNivelmantenimiento = new Gson().toJson(objNivelmantenimiento, Nivelmantenimiento.class);
                    String retornoNivelmantenimiento = sNivelmantenimiento.InsertarNivelMantenimiento(jsonNivelmantenimiento);
                    detOpera = "SI";
                }
                response.setContentType("text/plain");
                response.getWriter().write(detOpera);

            } else if (tsk.equals("estNivelMantenimiento")) {
                String idNivelMantenimiento = request.getParameter("idDato");
                String estado = request.getParameter("estado");
                Nivelmantenimiento objNivelMantenimiento = new Nivelmantenimiento();
                JSONObject reqNivelMantenimiento = new JSONObject(sNivelmantenimiento.DetallesNivelMantenimiento(Integer.parseInt(idNivelMantenimiento)));
                objNivelMantenimiento = new Gson().fromJson(reqNivelMantenimiento.toString(), Nivelmantenimiento.class);
                objNivelMantenimiento.setNivelEstado(Integer.parseInt(estado));
                String jsonDependencia = new Gson().toJson(objNivelMantenimiento, Nivelmantenimiento.class);
                sNivelmantenimiento.ModificarNivelMantenimiento(jsonDependencia, Integer.parseInt(idNivelMantenimiento));

            } else if (tsk.equals("editNivelMantenimiento")) {
                String idDato = request.getParameter("idDato");
                String datos = request.getParameter("datos");
                JSONObject req = new JSONObject(datos);
                Nivelmantenimiento objNivelMantenimiento = new Nivelmantenimiento();
                objNivelMantenimiento.setNivelId(Integer.parseInt(idDato));
                objNivelMantenimiento.setNivelDescripcion(req.getString("DetaDependencia"));
                try {
                    if (req.getString("EstDependencia").equals("on")) {
                        objNivelMantenimiento.setNivelEstado(1);
                    }
                } catch (Exception e) {
                    objNivelMantenimiento.setNivelEstado(2);
                }
                String jsonNivelMantenimiento = new Gson().toJson(objNivelMantenimiento, Nivelmantenimiento.class);
                sNivelmantenimiento.ModificarNivelMantenimiento(jsonNivelMantenimiento, Integer.parseInt(idDato));

            }
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>