 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Alex
 */
@Entity
@Table(name = "bien", catalog = "bienesdtic", schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bien.findAll", query = "SELECT b FROM Bien b"),
    @NamedQuery(name = "Bien.findByBnCodBien", query = "SELECT b FROM Bien b WHERE b.bnCodBien = :bnCodBien"),
    @NamedQuery(name = "Bien.findByBnNombre", query = "SELECT b FROM Bien b WHERE b.bnNombre = :bnNombre"),
    @NamedQuery(name = "Bien.findByBnSerie", query = "SELECT b FROM Bien b WHERE b.bnSerie = :bnSerie"),
    @NamedQuery(name = "Bien.findByBnModelo", query = "SELECT b FROM Bien b WHERE b.bnModelo = :bnModelo"),
    @NamedQuery(name = "Bien.findByBnMarca", query = "SELECT b FROM Bien b WHERE b.bnMarca = :bnMarca"),
    @NamedQuery(name = "Bien.findByBnColor", query = "SELECT b FROM Bien b WHERE b.bnColor = :bnColor"),
    @NamedQuery(name = "Bien.findByBnPrecio", query = "SELECT b FROM Bien b WHERE b.bnPrecio = :bnPrecio"),
    @NamedQuery(name = "Bien.findByBnEstadoBien", query = "SELECT b FROM Bien b WHERE b.bnEstadoBien = :bnEstadoBien"),
    @NamedQuery(name = "Bien.findByBnFechaCompra", query = "SELECT b FROM Bien b WHERE b.bnFechaCompra = :bnFechaCompra"),
    @NamedQuery(name = "Bien.findByBnTiempoGarantia", query = "SELECT b FROM Bien b WHERE b.bnTiempoGarantia = :bnTiempoGarantia"),
    @NamedQuery(name = "Bien.findByBnFechaGarantia", query = "SELECT b FROM Bien b WHERE b.bnFechaGarantia = :bnFechaGarantia"),
    @NamedQuery(name = "Bien.findByBnProveedor", query = "SELECT b FROM Bien b WHERE b.bnProveedor = :bnProveedor"),
    @NamedQuery(name = "Bien.findByBnDescripcion", query = "SELECT b FROM Bien b WHERE b.bnDescripcion = :bnDescripcion"),
    @NamedQuery(name = "Bien.findByBnRamTamano", query = "SELECT b FROM Bien b WHERE b.bnRamTamano = :bnRamTamano"),
    @NamedQuery(name = "Bien.findByBnRamTecno", query = "SELECT b FROM Bien b WHERE b.bnRamTecno = :bnRamTecno"),
    @NamedQuery(name = "Bien.findByBnDisco", query = "SELECT b FROM Bien b WHERE b.bnDisco = :bnDisco"),
    @NamedQuery(name = "Bien.findByBnRed", query = "SELECT b FROM Bien b WHERE b.bnRed = :bnRed"),
    @NamedQuery(name = "Bien.findByBnProcesador", query = "SELECT b FROM Bien b WHERE b.bnProcesador = :bnProcesador"),
    @NamedQuery(name = "Bien.findByBnLectorDvd", query = "SELECT b FROM Bien b WHERE b.bnLectorDvd = :bnLectorDvd"),
    @NamedQuery(name = "Bien.findByBnSo", query = "SELECT b FROM Bien b WHERE b.bnSo = :bnSo"),
    @NamedQuery(name = "Bien.findByBnMonitorTecn", query = "SELECT b FROM Bien b WHERE b.bnMonitorTecn = :bnMonitorTecn"),
    @NamedQuery(name = "Bien.findByBnMonitorTama", query = "SELECT b FROM Bien b WHERE b.bnMonitorTama = :bnMonitorTama"),
    @NamedQuery(name = "Bien.findByBnModeToner", query = "SELECT b FROM Bien b WHERE b.bnModeToner = :bnModeToner"),
    @NamedQuery(name = "Bien.findByBnNumFusor", query = "SELECT b FROM Bien b WHERE b.bnNumFusor = :bnNumFusor"),
    @NamedQuery(name = "Bien.findByBnCantToner", query = "SELECT b FROM Bien b WHERE b.bnCantToner = :bnCantToner"),
    @NamedQuery(name = "Bien.findByBnTecnProyector", query = "SELECT b FROM Bien b WHERE b.bnTecnProyector = :bnTecnProyector"),
    @NamedQuery(name = "Bien.findByBnLumenes", query = "SELECT b FROM Bien b WHERE b.bnLumenes = :bnLumenes"),
    @NamedQuery(name = "Bien.findByBnTipoLampara", query = "SELECT b FROM Bien b WHERE b.bnTipoLampara = :bnTipoLampara"),
    @NamedQuery(name = "Bien.findByBnResolucion", query = "SELECT b FROM Bien b WHERE b.bnResolucion = :bnResolucion"),
    @NamedQuery(name = "Bien.findByBdCantDisco", query = "SELECT b FROM Bien b WHERE b.bdCantDisco = :bdCantDisco"),
    @NamedQuery(name = "Bien.findByBnTipoConexion", query = "SELECT b FROM Bien b WHERE b.bnTipoConexion = :bnTipoConexion"),
    @NamedQuery(name = "Bien.findByBnObservacion", query = "SELECT b FROM Bien b WHERE b.bnObservacion = :bnObservacion"),
    @NamedQuery(name = "Bien.findByBnTipPantalla", query = "SELECT b FROM Bien b WHERE b.bnTipPantalla = :bnTipPantalla"),
    @NamedQuery(name = "Bien.findByBnMemoInter", query = "SELECT b FROM Bien b WHERE b.bnMemoInter = :bnMemoInter"),
    @NamedQuery(name = "Bien.findByBnMemoExter", query = "SELECT b FROM Bien b WHERE b.bnMemoExter = :bnMemoExter"),
    @NamedQuery(name = "Bien.findBySwVersion", query = "SELECT b FROM Bien b WHERE b.swVersion = :swVersion"),
    @NamedQuery(name = "Bien.findBySwVigencia", query = "SELECT b FROM Bien b WHERE b.swVigencia = :swVigencia"),
    @NamedQuery(name = "Bien.findBySwCantLicencia", query = "SELECT b FROM Bien b WHERE b.swCantLicencia = :swCantLicencia"),
    @NamedQuery(name = "Bien.findBySwFechaContrat", query = "SELECT b FROM Bien b WHERE b.swFechaContrat = :swFechaContrat"),
    @NamedQuery(name = "Bien.findBySwTipSoporte", query = "SELECT b FROM Bien b WHERE b.swTipSoporte = :swTipSoporte"),
    @NamedQuery(name = "Bien.findByBnCodMotBaja", query = "SELECT b FROM Bien b WHERE b.bnCodMotBaja = :bnCodMotBaja"),
    @NamedQuery(name = "Bien.findByBnFechaBaja", query = "SELECT b FROM Bien b WHERE b.bnFechaBaja = :bnFechaBaja"),
    @NamedQuery(name = "Bien.findByBnTipBateria", query = "SELECT b FROM Bien b WHERE b.bnTipBateria = :bnTipBateria"),
    @NamedQuery(name = "Bien.findByBnNumConect", query = "SELECT b FROM Bien b WHERE b.bnNumConect = :bnNumConect"),
    @NamedQuery(name = "Bien.findByBnNumPuertRouter", query = "SELECT b FROM Bien b WHERE b.bnNumPuertRouter = :bnNumPuertRouter"),
    @NamedQuery(name = "Bien.findByBnTipLector", query = "SELECT b FROM Bien b WHERE b.bnTipLector = :bnTipLector"),
    @NamedQuery(name = "Bien.findByBnDiscoTecn", query = "SELECT b FROM Bien b WHERE b.bnDiscoTecn = :bnDiscoTecn"),
    @NamedQuery(name = "Bien.findByBnTamPantalla", query = "SELECT b FROM Bien b WHERE b.bnTamPantalla = :bnTamPantalla"),
    @NamedQuery(name = "Bien.findByBnEstadoUso", query = "SELECT b FROM Bien b WHERE b.bnEstadoUso = :bnEstadoUso"),
    @NamedQuery(name = "Bien.findByBnImpColor", query = "SELECT b FROM Bien b WHERE b.bnImpColor = :bnImpColor")})
public class Bien implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "bn_cod_bien")
    private String bnCodBien;
    @Size(max = 500)
    @Column(name = "bn_nombre")
    private String bnNombre;
    @Size(max = 100)
    @Column(name = "bn_serie")
    private String bnSerie;
    @Size(max = 100)
    @Column(name = "bn_modelo")
    private String bnModelo;
    @Size(max = 100)
    @Column(name = "bn_marca")
    private String bnMarca;
    @Size(max = 2147483647)
    @Column(name = "bn_color")
    private String bnColor;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "bn_precio")
    private Float bnPrecio;
    @Size(max = 100)
    @Column(name = "bn_estado_bien")
    private String bnEstadoBien;
    @Column(name = "bn_fecha_compra")
    //@Temporal(TemporalType.DATE)
    private String bnFechaCompra;
    @Column(name = "bn_tiempo_garantia")
    private Integer bnTiempoGarantia;
    @Column(name = "bn_fecha_garantia")
    //@Temporal(TemporalType.DATE)
    private String bnFechaGarantia;
    @Size(max = 100)
    @Column(name = "bn_proveedor")
    private String bnProveedor;
    @Size(max = 1000)
    @Column(name = "bn_descripcion")
    private String bnDescripcion;
    @Size(max = 25)
    @Column(name = "bn_ram_tamano")
    private String bnRamTamano;
    @Size(max = 25)
    @Column(name = "bn_ram_tecno")
    private String bnRamTecno;
    @Size(max = 25)
    @Column(name = "bn_disco")
    private String bnDisco;
    @Column(name = "bn_red")
    private Boolean bnRed;
    @Size(max = 100)
    @Column(name = "bn_procesador")
    private String bnProcesador;
    @Column(name = "bn_lector_dvd")
    private Boolean bnLectorDvd;
    @Size(max = 100)
    @Column(name = "bn_so")
    private String bnSo;
    @Size(max = 25)
    @Column(name = "bn_monitor_tecn")
    private String bnMonitorTecn;
    @Size(max = 25)
    @Column(name = "bn_monitor_tama")
    private String bnMonitorTama;
    @Size(max = 100)
    @Column(name = "bn_mode_toner")
    private String bnModeToner;
    @Size(max = 100)
    @Column(name = "bn_num_fusor")
    private String bnNumFusor;
    @Column(name = "bn_cant_toner")
    private Integer bnCantToner;
    @Size(max = 100)
    @Column(name = "bn_tecn_proyector")
    private String bnTecnProyector;
    @Size(max = 100)
    @Column(name = "bn_lumenes")
    private String bnLumenes;
    @Size(max = 100)
    @Column(name = "bn_tipo_lampara")
    private String bnTipoLampara;
    @Size(max = 100)
    @Column(name = "bn_resolucion")
    private String bnResolucion;
    @Column(name = "bd_cant_disco")
    private Integer bdCantDisco;
    @Size(max = 200)
    @Column(name = "bn_tipo_conexion")
    private String bnTipoConexion;
    @Size(max = 800)
    @Column(name = "bn_observacion")
    private String bnObservacion;
    @Size(max = 100)
    @Column(name = "bn_tip_pantalla")
    private String bnTipPantalla;
    @Size(max = 50)
    @Column(name = "bn_memo_inter")
    private String bnMemoInter;
    @Size(max = 50)
    @Column(name = "bn_memo_exter")
    private String bnMemoExter;
    @Size(max = 50)
    @Column(name = "sw_version")
    private String swVersion;
    @Size(max = 50)
    @Column(name = "sw_vigencia")
    private String swVigencia;
    @Column(name = "sw_cant_licencia")
    private Integer swCantLicencia;
    @Column(name = "sw_fecha_contrat")
    //@Temporal(TemporalType.DATE)
    private String swFechaContrat;
    @Size(max = 50)
    @Column(name = "sw_tip_soporte")
    private String swTipSoporte;
    @Column(name = "bn_cod_mot_baja")
    private Integer bnCodMotBaja;
    @Column(name = "bn_fecha_baja")
    //@Temporal(TemporalType.DATE)
    private String bnFechaBaja;
    @Size(max = 50)
    @Column(name = "bn_tip_bateria")
    private String bnTipBateria;
    @Column(name = "bn_num_conect")
    private Integer bnNumConect;
    @Column(name = "bn_num_puert_router")
    private Integer bnNumPuertRouter;
    @Size(max = 50)
    @Column(name = "bn_tip_lector")
    private String bnTipLector;
    @Size(max = 50)
    @Column(name = "bn_disco_tecn")
    private String bnDiscoTecn;
    @Size(max = 50)
    @Column(name = "bn_tam_pantalla")
    private String bnTamPantalla;
    @Size(max = 25)
    @Column(name = "bn_estado_uso")
    private String bnEstadoUso;
    @Column(name = "bn_imp_color")
    private Boolean bnImpColor;
    @JoinColumn(name = "ba_id", referencedColumnName = "ba_id")
    @ManyToOne
    private Baja baId;
    @JoinColumn(name = "cat_id", referencedColumnName = "ct_id")
    @ManyToOne
    private Catalogo catId;
    @JoinColumn(name = "dp_id", referencedColumnName = "dp_id")
    @ManyToOne
    private Dependencia dpId;
    @JoinColumn(name = "tecno_id", referencedColumnName = "tec_id")
    @ManyToOne
    private Tecnodisco tecnoId;
    @JoinColumn(name = "ti_id", referencedColumnName = "ti_id")
    @ManyToOne
    private Tipoingreso tiId;
    @JoinColumn(name = "ub_id", referencedColumnName = "ub_id")
    @ManyToOne
    private Ubicacion ubId;

    public Bien() {
    }

    public Bien(String bnCodBien) {
        this.bnCodBien = bnCodBien;
    }

    public String getBnCodBien() {
        return bnCodBien;
    }

    public void setBnCodBien(String bnCodBien) {
        this.bnCodBien = bnCodBien;
    }

    public String getBnNombre() {
        return bnNombre;
    }

    public void setBnNombre(String bnNombre) {
        this.bnNombre = bnNombre;
    }

    public String getBnSerie() {
        return bnSerie;
    }

    public void setBnSerie(String bnSerie) {
        this.bnSerie = bnSerie;
    }

    public String getBnModelo() {
        return bnModelo;
    }

    public void setBnModelo(String bnModelo) {
        this.bnModelo = bnModelo;
    }

    public String getBnMarca() {
        return bnMarca;
    }

    public void setBnMarca(String bnMarca) {
        this.bnMarca = bnMarca;
    }

    public String getBnColor() {
        return bnColor;
    }

    public void setBnColor(String bnColor) {
        this.bnColor = bnColor;
    }

    public Float getBnPrecio() {
        return bnPrecio;
    }

    public void setBnPrecio(Float bnPrecio) {
        this.bnPrecio = bnPrecio;
    }

    public String getBnEstadoBien() {
        return bnEstadoBien;
    }

    public void setBnEstadoBien(String bnEstadoBien) {
        this.bnEstadoBien = bnEstadoBien;
    }

    public String getBnFechaCompra() {
        return bnFechaCompra;
    }

    public void setBnFechaCompra(String bnFechaCompra) {
        this.bnFechaCompra = bnFechaCompra;
    }

    public Integer getBnTiempoGarantia() {
        return bnTiempoGarantia;
    }

    public void setBnTiempoGarantia(Integer bnTiempoGarantia) {
        this.bnTiempoGarantia = bnTiempoGarantia;
    }

    public String getBnFechaGarantia() {
        return bnFechaGarantia;
    }

    public void setBnFechaGarantia(String bnFechaGarantia) {
        this.bnFechaGarantia = bnFechaGarantia;
    }

    public String getBnProveedor() {
        return bnProveedor;
    }

    public void setBnProveedor(String bnProveedor) {
        this.bnProveedor = bnProveedor;
    }

    public String getBnDescripcion() {
        return bnDescripcion;
    }

    public void setBnDescripcion(String bnDescripcion) {
        this.bnDescripcion = bnDescripcion;
    }

    public String getBnRamTamano() {
        return bnRamTamano;
    }

    public void setBnRamTamano(String bnRamTamano) {
        this.bnRamTamano = bnRamTamano;
    }

    public String getBnRamTecno() {
        return bnRamTecno;
    }

    public void setBnRamTecno(String bnRamTecno) {
        this.bnRamTecno = bnRamTecno;
    }

    public String getBnDisco() {
        return bnDisco;
    }

    public void setBnDisco(String bnDisco) {
        this.bnDisco = bnDisco;
    }

    public Boolean getBnRed() {
        return bnRed;
    }

    public void setBnRed(Boolean bnRed) {
        this.bnRed = bnRed;
    }

    public String getBnProcesador() {
        return bnProcesador;
    }

    public void setBnProcesador(String bnProcesador) {
        this.bnProcesador = bnProcesador;
    }

    public Boolean getBnLectorDvd() {
        return bnLectorDvd;
    }

    public void setBnLectorDvd(Boolean bnLectorDvd) {
        this.bnLectorDvd = bnLectorDvd;
    }

    public String getBnSo() {
        return bnSo;
    }

    public void setBnSo(String bnSo) {
        this.bnSo = bnSo;
    }

    public String getBnMonitorTecn() {
        return bnMonitorTecn;
    }

    public void setBnMonitorTecn(String bnMonitorTecn) {
        this.bnMonitorTecn = bnMonitorTecn;
    }

    public String getBnMonitorTama() {
        return bnMonitorTama;
    }

    public void setBnMonitorTama(String bnMonitorTama) {
        this.bnMonitorTama = bnMonitorTama;
    }

    public String getBnModeToner() {
        return bnModeToner;
    }

    public void setBnModeToner(String bnModeToner) {
        this.bnModeToner = bnModeToner;
    }

    public String getBnNumFusor() {
        return bnNumFusor;
    }

    public void setBnNumFusor(String bnNumFusor) {
        this.bnNumFusor = bnNumFusor;
    }

    public Integer getBnCantToner() {
        return bnCantToner;
    }

    public void setBnCantToner(Integer bnCantToner) {
        this.bnCantToner = bnCantToner;
    }

    public String getBnTecnProyector() {
        return bnTecnProyector;
    }

    public void setBnTecnProyector(String bnTecnProyector) {
        this.bnTecnProyector = bnTecnProyector;
    }

    public String getBnLumenes() {
        return bnLumenes;
    }

    public void setBnLumenes(String bnLumenes) {
        this.bnLumenes = bnLumenes;
    }

    public String getBnTipoLampara() {
        return bnTipoLampara;
    }

    public void setBnTipoLampara(String bnTipoLampara) {
        this.bnTipoLampara = bnTipoLampara;
    }

    public String getBnResolucion() {
        return bnResolucion;
    }

    public void setBnResolucion(String bnResolucion) {
        this.bnResolucion = bnResolucion;
    }

    public Integer getBdCantDisco() {
        return bdCantDisco;
    }

    public void setBdCantDisco(Integer bdCantDisco) {
        this.bdCantDisco = bdCantDisco;
    }

    public String getBnTipoConexion() {
        return bnTipoConexion;
    }

    public void setBnTipoConexion(String bnTipoConexion) {
        this.bnTipoConexion = bnTipoConexion;
    }

    public String getBnObservacion() {
        return bnObservacion;
    }

    public void setBnObservacion(String bnObservacion) {
        this.bnObservacion = bnObservacion;
    }

    public String getBnTipPantalla() {
        return bnTipPantalla;
    }

    public void setBnTipPantalla(String bnTipPantalla) {
        this.bnTipPantalla = bnTipPantalla;
    }

    public String getBnMemoInter() {
        return bnMemoInter;
    }

    public void setBnMemoInter(String bnMemoInter) {
        this.bnMemoInter = bnMemoInter;
    }

    public String getBnMemoExter() {
        return bnMemoExter;
    }

    public void setBnMemoExter(String bnMemoExter) {
        this.bnMemoExter = bnMemoExter;
    }

    public String getSwVersion() {
        return swVersion;
    }

    public void setSwVersion(String swVersion) {
        this.swVersion = swVersion;
    }

    public String getSwVigencia() {
        return swVigencia;
    }

    public void setSwVigencia(String swVigencia) {
        this.swVigencia = swVigencia;
    }

    public Integer getSwCantLicencia() {
        return swCantLicencia;
    }

    public void setSwCantLicencia(Integer swCantLicencia) {
        this.swCantLicencia = swCantLicencia;
    }

    public String getSwFechaContrat() {
        return swFechaContrat;
    }

    public void setSwFechaContrat(String swFechaContrat) {
        this.swFechaContrat = swFechaContrat;
    }

    public String getSwTipSoporte() {
        return swTipSoporte;
    }

    public void setSwTipSoporte(String swTipSoporte) {
        this.swTipSoporte = swTipSoporte;
    }

    public Integer getBnCodMotBaja() {
        return bnCodMotBaja;
    }

    public void setBnCodMotBaja(Integer bnCodMotBaja) {
        this.bnCodMotBaja = bnCodMotBaja;
    }

    public String getBnFechaBaja() {
        return bnFechaBaja;
    }

    public void setBnFechaBaja(String bnFechaBaja) {
        this.bnFechaBaja = bnFechaBaja;
    }

    public String getBnTipBateria() {
        return bnTipBateria;
    }

    public void setBnTipBateria(String bnTipBateria) {
        this.bnTipBateria = bnTipBateria;
    }

    public Integer getBnNumConect() {
        return bnNumConect;
    }

    public void setBnNumConect(Integer bnNumConect) {
        this.bnNumConect = bnNumConect;
    }

    public Integer getBnNumPuertRouter() {
        return bnNumPuertRouter;
    }

    public void setBnNumPuertRouter(Integer bnNumPuertRouter) {
        this.bnNumPuertRouter = bnNumPuertRouter;
    }

    public String getBnTipLector() {
        return bnTipLector;
    }

    public void setBnTipLector(String bnTipLector) {
        this.bnTipLector = bnTipLector;
    }

    public String getBnDiscoTecn() {
        return bnDiscoTecn;
    }

    public void setBnDiscoTecn(String bnDiscoTecn) {
        this.bnDiscoTecn = bnDiscoTecn;
    }

    public String getBnTamPantalla() {
        return bnTamPantalla;
    }

    public void setBnTamPantalla(String bnTamPantalla) {
        this.bnTamPantalla = bnTamPantalla;
    }

    public String getBnEstadoUso() {
        return bnEstadoUso;
    }

    public void setBnEstadoUso(String bnEstadoUso) {
        this.bnEstadoUso = bnEstadoUso;
    }

    public Baja getBaId() {
        return baId;
    }

    public void setBaId(Baja baId) {
        this.baId = baId;
    }

    public Catalogo getCatId() {
        return catId;
    }

    public void setCatId(Catalogo catId) {
        this.catId = catId;
    }

    public Dependencia getDpId() {
        return dpId;
    }

    public void setDpId(Dependencia dpId) {
        this.dpId = dpId;
    }

    public Tecnodisco getTecnoId() {
        return tecnoId;
    }

    public void setTecnoId(Tecnodisco tecnoId) {
        this.tecnoId = tecnoId;
    }

    public Tipoingreso getTiId() {
        return tiId;
    }

    public void setTiId(Tipoingreso tiId) {
        this.tiId = tiId;
    }

    public Ubicacion getUbId() {
        return ubId;
    }

    public void setUbId(Ubicacion ubId) {
        this.ubId = ubId;
    }

    public Boolean getBnImpColor() {
        return bnImpColor;
    }

    public void setBnImpColor(Boolean bnImpColor) {
        this.bnImpColor = bnImpColor;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bnCodBien != null ? bnCodBien.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bien)) {
            return false;
        }
        Bien other = (Bien) object;
        if ((this.bnCodBien == null && other.bnCodBien != null) || (this.bnCodBien != null && !this.bnCodBien.equals(other.bnCodBien))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Bien[ bnCodBien=" + bnCodBien + " ]";
    }
    
}
