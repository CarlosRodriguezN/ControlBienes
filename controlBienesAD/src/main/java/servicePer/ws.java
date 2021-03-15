/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicePer;

import ejb.*;
import entidades.*;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Stateless
@Path("")
public class ws {

    @EJB
    private PersonaFacadeLocal persona;

    @EJB
    private CargoFacadeLocal cargo;

    @EJB
    private DependenciaFacadeLocal dependencia;

    @EJB
    private UbicacionFacadeLocal ubicacion;

    @EJB
    private TipoingresoFacadeLocal tipoingreso;

    @EJB
    private MotivoinformeFacadeLocal motivoinforme;

    @EJB
    private BajaFacadeLocal baja;

    @EJB
    private TecnicoFacadeLocal tecnico;

    @EJB
    private MantenimientoFacadeLocal mantenimiento;

    @EJB
    private MantenimientosFacadeLocal mantenimientos;

    @EJB
    private NivelmantenimientoFacadeLocal nivelmatenimiento;

    @EJB
    private CatalogoFacadeLocal catalogo;

    @EJB    
    private TraspasoFacadeLocal traspaso;
    
    @EJB
    private BienFacadeLocal bien;
    
    @EJB
    private InformeFacadeLocal informe;
    
    @EJB
    private PersonapermisoFacadeLocal perpm;

    @EJB
    private PermisoFacadeLocal permiso;
    
    @EJB
    private BienFacadeLocal listaBienBaja;
    
    @EJB
    private BienFacadeLocal listaBienUbicacion;

    @EJB
    private BienFacadeLocal listaBienDependencia;
    
    @EJB
    private CargoFacadeLocal listaCargosActivos;

    @EJB
    private AuditoriaFacadeLocal auditoria;
    
    @GET
    @Path("personadadocedula/{cedula}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Persona personadadocedula(@PathParam("cedula") String cedula) {
        Persona lstReturn = new Persona();
        try {
            lstReturn = persona.obtenerpersona(cedula);
            return lstReturn;
        } catch (Exception e) {
            lstReturn = null;
            return lstReturn;
        }
    }

    @GET
    @Path("idCargo/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Cargo idCargo(@PathParam("nombre") String nombre) throws UnsupportedEncodingException {
        Cargo objcargo = new Cargo();
        try {
            String nombreq = java.net.URLDecoder.decode(nombre, "UTF-8");
            objcargo = cargo.idcargo(nombreq);
            return objcargo;
        } catch (Exception e) {
            objcargo = null;
            return objcargo;
        }
    }

    @GET
    @Path("idDependencia/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Dependencia idDependencia(@PathParam("nombre") String nombre) throws UnsupportedEncodingException {
        Dependencia objDependencia = new Dependencia();
        try {
            String nombreq = java.net.URLDecoder.decode(nombre, "UTF-8");
            objDependencia = dependencia.iddependencia(nombreq);
            return objDependencia;
        } catch (Exception e) {
            objDependencia = null;
            return objDependencia;
        }
    }

    @GET
    @Path("idUbicacion/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Ubicacion idUbicacion(@PathParam("nombre") String nombre) throws UnsupportedEncodingException {
        Ubicacion objUbicacion = new Ubicacion();
        try {
            String nombreq = java.net.URLDecoder.decode(nombre, "UTF-8");
            objUbicacion = ubicacion.idubicacion(nombreq);
            return objUbicacion;
        } catch (Exception e) {
            objUbicacion = null;
            return objUbicacion;
        }
    }

    @GET
    @Path("idTipoingreso/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Tipoingreso idTipoingreso(@PathParam("nombre") String nombre) throws UnsupportedEncodingException {
        Tipoingreso objTipoingreso = new Tipoingreso();
        try {
            String nombreq = java.net.URLDecoder.decode(nombre, "UTF-8");
            objTipoingreso = tipoingreso.idtipoingreso(nombreq);
            return objTipoingreso;
        } catch (Exception e) {
            objTipoingreso = null;
            return objTipoingreso;
        }
    }

    @GET
    @Path("idMotivoinforme/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Motivoinforme idMotivoinforme(@PathParam("nombre") String nombre) throws UnsupportedEncodingException {
        Motivoinforme objMotivoinforme = new Motivoinforme();
        try {
            String nombreq = java.net.URLDecoder.decode(nombre, "UTF-8");
            objMotivoinforme = motivoinforme.idmotivoinforme(nombreq);
            return objMotivoinforme;
        } catch (Exception e) {
            objMotivoinforme = null;
            return objMotivoinforme;
        }
    }

    @GET
    @Path("idBaja/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Baja idBaja(@PathParam("nombre") String nombre) throws UnsupportedEncodingException {
        Baja objBaja = new Baja();
        try {
            String nombreq = java.net.URLDecoder.decode(nombre, "UTF-8");
            objBaja = baja.idbaja(nombreq);
            return objBaja;
        } catch (Exception e) {
            objBaja = null;
            return objBaja;
        }
    }

    @GET
    @Path("cedulaTecnico/{cedula}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Tecnico idTecnico(@PathParam("cedula") String cedula) throws UnsupportedEncodingException {
        Tecnico objTecnico = new Tecnico();
        try {
            String cedulaq = java.net.URLDecoder.decode(cedula, "UTF-8");
            objTecnico = tecnico.idtecnico(cedulaq);
            return objTecnico;
        } catch (Exception e) {
            objTecnico = null;
            return objTecnico;
        }
    }

    @GET
    @Path("idOdenMantenimiento/{orden}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Mantenimiento idOrdenMantenimiento(@PathParam("orden") String orden) throws UnsupportedEncodingException {
        Mantenimiento objMantenimiento = new Mantenimiento();
        try {
            java.net.URLDecoder.decode(orden, "UTF-8");
            String ordenq = java.net.URLDecoder.decode(orden, "UTF-8");
            objMantenimiento = mantenimiento.idordenmantenimiento(ordenq);
            return objMantenimiento;
        } catch (Exception e) {
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @GET
    @Path("rango/{fechinicial}/{fechfinal}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Mantenimiento rangoMantenimiento(@PathParam("fechinicial") String fechinicial, @PathParam("fechfinal") String fechfinal) throws UnsupportedEncodingException {
        Mantenimiento objMantenimiento = new Mantenimiento();
        try {
            String fechinicialq = java.net.URLDecoder.decode(fechinicial, "UTF-8");
            String fechfinalq = java.net.URLDecoder.decode(fechfinal, "UTF-8");
            objMantenimiento = mantenimiento.mantenimientoRango(fechinicialq, fechfinalq);
            return objMantenimiento;
        } catch (Exception e) {
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @DELETE
    @Path("wsmantenimiento/{codigo}")
//    @Produces({"application/json; charset=utf-8"})
//    @Consumes({"application/json; charset=utf-8"})
    public void EliminarMantenimiento(@PathParam("codigo") Integer codigo) throws UnsupportedEncodingException {
        mantenimiento.eliminarmant(codigo);

    }

    @DELETE
    @Path("wstecnico/{codigo}")
//    @Produces({"application/json; charset=utf-8"})
//    @Consumes({"application/json; charset=utf-8"})
    public void EliminarTecnico(@PathParam("codigo") Integer codigo) throws UnsupportedEncodingException {
        try {
            tecnico.eliminartecn(codigo);
        } catch (Exception e) {
            System.out.println("Atensionnnnn El error es: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @PUT
    @Path("wsmantenimiento/{codigo}")
//    @Produces({"application/json; charset=utf-8"})
//    @Consumes({"application/json; charset=utf-8"})
    public void ModificarMatenimiento(@PathParam("codigo") Integer codigo) throws UnsupportedEncodingException {
        try {
            mantenimiento.modificarmant(codigo);
        } catch (Exception e) {
            System.out.println("Atensionnnnn El error es: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @GET
    @Path("bienesenmantenimiento/{opcion}")
    @Produces({"application/json; charset=utf-8"})
    //@Consumes({"application/json; charset=utf-8"})
    public List<Mantenimiento> listarBienesEnMantenimiento(@PathParam("opcion") Integer opcion) throws UnsupportedEncodingException {
        List<Mantenimiento> objMantenimiento = new ArrayList<Mantenimiento>();
        try {
            objMantenimiento = mantenimiento.listbienesmantenimiento(opcion);
            return objMantenimiento;
        } catch (Exception e) {
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    //listar catalogos por el id cedula
    @GET
    @Path("wscatalogo/{codigo}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Catalogo listarCatalogoId(@PathParam("codigo") String codigo) throws UnsupportedEncodingException {
        Catalogo lstReturn = new Catalogo();
        try {
            String codigoq = java.net.URLDecoder.decode(codigo, "UTF-8");
            lstReturn = catalogo.obtenercatalogo(codigoq);
            return lstReturn;
        } catch (Exception e) {
            lstReturn = null;
            return lstReturn;
        }
    }

    @GET
    @Path("buscarbienes/{codigo}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> searchBien(@PathParam("codigo") String codigo) {
        List<Bien> listBienes = new ArrayList<>();
        try {
            listBienes = bien.findBienes(codigo);
            return listBienes;
        } catch (Exception e) {
            listBienes = null;
            return listBienes;
        }
    }

    @GET
    @Path("buscarbienesnombre/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> searchBienNombre(@PathParam("nombre") String nombre) {
        List<Bien> listBienes = new ArrayList<>();
        try {
            listBienes = bien.findBienesNombre(nombre);
            return listBienes;
        } catch (Exception e) {
            listBienes = null;
            return listBienes;
        }
    }

    @GET
    @Path("buscarbienesserie/{serie}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> searchBienSerie(@PathParam("serie") String serie) {
        List<Bien> listBienes = new ArrayList<>();
        try {
            listBienes = bien.findBienesSerie(serie);
            return listBienes;
        } catch (Exception e) {
            listBienes = null;
            return listBienes;
        }
    }

    @GET
    @Path("idOdenMantenimientos/{orden}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Mantenimientos idOrdenMantenimientoN(@PathParam("orden") String orden) {
        Mantenimientos objMantenimiento = new Mantenimientos();
        try {
            objMantenimiento = mantenimientos.idordenmantenimiento(orden);
            return objMantenimiento;
        } catch (Exception e) {
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @GET
    @Path("bienesestado/{estado}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Mantenimientos> listarBienesPorEstado(@PathParam("estado") Integer estado) {
        List<Mantenimientos> objMantenimiento = new ArrayList<Mantenimientos>();
        try {
            objMantenimiento = mantenimientos.listMantenimientosEstado(estado);
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @GET
    @Path("mantenimientosfechatecnico/{nombre}/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Mantenimientos> listarMantenimientosFechaTecnico(@PathParam("nombre") String nombre, @PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Mantenimientos> objMantenimiento = new ArrayList<Mantenimientos>();

        try {
            objMantenimiento = mantenimientos.findMantenimientosTecnicoFecha(nombre.replaceAll("_", " "), fechai, fechaf);
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }
    
    @GET
    @Path("mantenimientosfechabienes/{nombre}/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Mantenimientos> listarMantenimientosFechaBienes(@PathParam("nombre") String nombre, @PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Mantenimientos> objMantenimiento = new ArrayList<Mantenimientos>();

        try {
            objMantenimiento = mantenimientos.findMantenimientosBienesFecha(nombre, fechai, fechaf);
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }
    
    @GET
    @Path("mantenimientosfechaversionso/{nombre}/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> listarMantenimientosFechaVersionSo(@PathParam("nombre") String nombre, @PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Bien> objMantenimiento = new ArrayList<Bien>();

        try {
            objMantenimiento = mantenimientos.findMantenimientosVersionSOFecha(nombre.replaceAll("_", " "), fechai, fechaf);
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }
    
    @GET
    @Path("mantenimientosfechatipo/{nombre}/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Mantenimientos> listarMantenimientosFechaTipo(@PathParam("nombre") Integer nombre, @PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Mantenimientos> objMantenimiento = new ArrayList<Mantenimientos>();

        try {
            objMantenimiento = mantenimientos.findMantenimientosTipoFecha(nombre, fechai, fechaf);
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }
    
    @GET
    @Path("mantenimientosfechageneral/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Mantenimientos> listarMantenimientosGeneralBienes(@PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Mantenimientos> objMantenimiento = new ArrayList<Mantenimientos>();

        try {
            objMantenimiento = mantenimientos.findMantenimientosGeneralFecha(fechai, fechaf);
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @GET
    @Path("mantenimientosbiencodigo/{codigo}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Mantenimientos> listarMantenimientosBienCodigo(@PathParam("codigo") String codigo) {
        List<Mantenimientos> objMantenimiento = new ArrayList<Mantenimientos>();
        try {
            objMantenimiento = mantenimientos.findMantenimientosBienCodigo(codigo);
            return objMantenimiento;
        } catch (Exception e) {
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @GET
    @Path("mantenimientostipo/{tipo}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Mantenimientos> listarMantenimientosPorTipo(@PathParam("tipo") Integer tipo) {
        List<Mantenimientos> objMantenimiento = new ArrayList<Mantenimientos>();
        try {
            objMantenimiento = mantenimientos.listMantenimientosTipo(tipo);
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @GET
    @Path("nrodeordenmantenimiento")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Mantenimientos numOrdenMant() {
        Mantenimientos objMantenimiento;
        try {
            objMantenimiento = mantenimientos.lastNrodeOrden();
            return objMantenimiento;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objMantenimiento = null;
            return objMantenimiento;
        }
    }

    @GET
    @Path("nombreNivelMantenimiento/{nombre}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Nivelmantenimiento nombreNivelMantenimiento(@PathParam("nombre") String nombre) throws UnsupportedEncodingException {
        Nivelmantenimiento objNivelMantenimiento = new Nivelmantenimiento();
        try {
            String nombreq = java.net.URLDecoder.decode(nombre, "UTF-8");
            objNivelMantenimiento = nivelmatenimiento.getNombreNivelMantenimiento(nombreq);
            return objNivelMantenimiento;
        } catch (Exception e) {
            objNivelMantenimiento = null;
            return objNivelMantenimiento;
        }
    }

    @GET
    @Path("versionso")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public String getVersionSO() throws UnsupportedEncodingException {
        String objBien;
        try {
            objBien = bien.getVersionSO();
            return objBien;
        } catch (Exception e) {
            objBien = null;
            return objBien;
        }
    }

    @GET
    @Path("wsPersonaPermiso/{codPer}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Personapermiso> listarPersonaPermisoPorCedula(@PathParam("codPer") Integer codPer) {
        List<Personapermiso> objPersonapermiso = new ArrayList<>();
        try {
            objPersonapermiso = perpm.listPersonaPermosoCedula(codPer);
            return objPersonapermiso;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objPersonapermiso = null;
            return objPersonapermiso;
        }
    }
    
        @GET
    @Path("wsPermiso")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Permiso> listPermisosOperario() {
        List<Permiso> objPermiso = new ArrayList<>();
        try {
            objPermiso = permiso.listaPermisosOperario();
            return objPermiso;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objPermiso = null;
            return objPermiso;
        }
    }
    
    @GET
    @Path("BienBajaId/{bajaId}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> BienBajaId(@PathParam("bajaId") int bajaId) {
        List<Bien> lstReturn = new ArrayList<>();
        lstReturn = listaBienBaja.BienBajaId(bajaId);
        if (lstReturn.isEmpty()) {
            // MENSAJE SIN DATOS
        }
            return lstReturn;
    }
    
    @GET
    @Path("BienUbicacionId/{ubicacionId}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> BienUbicacionId(@PathParam("ubicacionId") int ubicacionId) {
        List<Bien> lstReturn = new ArrayList<>();
        lstReturn = listaBienUbicacion.BienUbicacionId(ubicacionId);
        if (lstReturn.isEmpty()) {
            // MENSAJE SIN DATOS
        }
        return lstReturn;
    }
    
    @GET
    @Path("BienDependenciaId/{DependenciaId}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> BienDependenciaId(@PathParam("DependenciaId") int DependenciaId) {
        List<Bien> lstReturn = new ArrayList<>();
        lstReturn = listaBienDependencia.BienDependenciaId(DependenciaId);
        if (lstReturn.isEmpty()) {
            // MENSAJE SIN DATOS
        }
        return lstReturn;
    }
    
    @GET
    @Path("listacargosactivos")
    @Produces({"application/json;  charset=utf-8"})
    @Consumes({"application/json;  charset=utf-8"})
    public List<Cargo> listacargosactivos() {
        List<Cargo> lstReturn = new ArrayList<>();
        lstReturn = listaCargosActivos.listaCargoActivo();
        if (lstReturn.isEmpty()) {
            // MENSAJE SIN DATOS
        }
        return lstReturn;
    }
    
    @GET
    @Path("invtraspasofecha/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Traspaso> listarInvTraspasoFecha(@PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Traspaso> objTraspaso = new ArrayList<Traspaso>();

        try {
            objTraspaso = traspaso.findInvTraspasoFecha(fechai, fechaf);
            return objTraspaso;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objTraspaso = null;
            return objTraspaso;
        }
    }
    
    @GET
    @Path("invtraspasoUbicDepfecha/{ubicacion}/{dependencia}/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Traspaso> listarInvTraspasoUbicDepFecha(@PathParam("ubicacion") String ubicacion, @PathParam("dependencia") String dependencia, @PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Traspaso> objTraspaso = new ArrayList<Traspaso>();

        try {
            objTraspaso = traspaso.findInvTraspasoUbicDepFecha(ubicacion.replaceAll("_", " "), dependencia.replaceAll("_", " "), fechai, fechaf);
            return objTraspaso;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objTraspaso = null;
            return objTraspaso;
        }
    }
    
    @GET
    @Path("invtraspasoMarcafecha/{marca}/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Traspaso> listarInvTraspasoUbicDepFecha(@PathParam("marca") String marca, @PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Traspaso> objTraspaso = new ArrayList<Traspaso>();

        try {
            objTraspaso = traspaso.findInvTraspasoMarcaFecha(marca, fechai, fechaf);
            return objTraspaso;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objTraspaso = null;
            return objTraspaso;
        }
    }  
            
    @GET
    @Path("invGarantiafecha/{fechactual}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> listarGarantiaFecha(@PathParam("fechactual") String fechact) {
        List<Bien> objBien = new ArrayList<Bien>();

        try {
            objBien = bien.findInvGarantiaFecha(fechact);
            return objBien;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objBien = null;
            return objBien;
        }
    }
    
    @GET
    @Path("invBienDesactivadosfecha/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Bien> listarInvBienDesactivadosFecha(@PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Bien> objBien = new ArrayList<Bien>();

        try {
            objBien = bien.findInvBienDesactivadosMotFecha(fechai, fechaf);
            return objBien;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objBien = null;
            return objBien;
        }
    } 
    
    @GET
    @Path("invBienAuditoriafecha/{fechai}/{fechaf}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Auditoria> listarInvAuditoriaFecha(@PathParam("fechai") String fechai, @PathParam("fechaf") String fechaf) {
        List<Auditoria> objAuditoria = new ArrayList<Auditoria>();

        try {
            objAuditoria = auditoria.findInvAuditoriaFecha(fechai, fechaf);
            return objAuditoria;
        } catch (Exception e) {
            e.getLocalizedMessage();
            objAuditoria = null;
            return objAuditoria;
        }
    }
    //consultar transpasos por una codigo del bien y codigo de persona
//    @GET
//    @Path("wstraspaso/{codBien}/{codPer}")
//    @Produces({"application/json; charset=utf-8"})
//    @Consumes({"application/json; charset=utf-8"})
//    public Traspaso listarTranspasoId(@PathParam("codBien") String codBien, @PathParam("codPer") String codPer)throws UnsupportedEncodingException{
//        Traspaso lstReturn = new Traspaso();
//        try {
//            String codBienq = java.net.URLDecoder.decode(codBien, "UTF-8");
//            String codPerq = java.net.URLDecoder.decode(codPer, "UTF-8");
//            lstReturn = traspaso.obtenertraspaso(codBienq ,codPerq);
//            return lstReturn;
//        } catch (Exception e) {
//            lstReturn = null;
//            return lstReturn;
//        }
//    }
}
