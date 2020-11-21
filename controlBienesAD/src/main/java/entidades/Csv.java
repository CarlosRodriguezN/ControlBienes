/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Alex
 */
@Entity
@Table(name = "csv", catalog = "bienesdtic", schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Csv.findAll", query = "SELECT c FROM Csv c"),
    @NamedQuery(name = "Csv.findByCsvCodBien", query = "SELECT c FROM Csv c WHERE c.csvCodBien = :csvCodBien"),
    @NamedQuery(name = "Csv.findByCsvNombre", query = "SELECT c FROM Csv c WHERE c.csvNombre = :csvNombre"),
    @NamedQuery(name = "Csv.findByCsvSerie", query = "SELECT c FROM Csv c WHERE c.csvSerie = :csvSerie"),
    @NamedQuery(name = "Csv.findByCsvModelo", query = "SELECT c FROM Csv c WHERE c.csvModelo = :csvModelo"),
    @NamedQuery(name = "Csv.findByCsvMarca", query = "SELECT c FROM Csv c WHERE c.csvMarca = :csvMarca"),
    @NamedQuery(name = "Csv.findByCsvColor", query = "SELECT c FROM Csv c WHERE c.csvColor = :csvColor"),
    @NamedQuery(name = "Csv.findByCsvDependencia", query = "SELECT c FROM Csv c WHERE c.csvDependencia = :csvDependencia"),
    @NamedQuery(name = "Csv.findByCsvUbicacion", query = "SELECT c FROM Csv c WHERE c.csvUbicacion = :csvUbicacion"),
    @NamedQuery(name = "Csv.findByCsvCedulaRuc", query = "SELECT c FROM Csv c WHERE c.csvCedulaRuc = :csvCedulaRuc"),
    @NamedQuery(name = "Csv.findByCsvTipoIngreso", query = "SELECT c FROM Csv c WHERE c.csvTipoIngreso = :csvTipoIngreso"),
    @NamedQuery(name = "Csv.findByCsvPrecio", query = "SELECT c FROM Csv c WHERE c.csvPrecio = :csvPrecio"),
    @NamedQuery(name = "Csv.findByCsvEstadoBien", query = "SELECT c FROM Csv c WHERE c.csvEstadoBien = :csvEstadoBien"),
    @NamedQuery(name = "Csv.findByCsvFechaCompra", query = "SELECT c FROM Csv c WHERE c.csvFechaCompra = :csvFechaCompra"),
    @NamedQuery(name = "Csv.findByCsvTiempoGarantia", query = "SELECT c FROM Csv c WHERE c.csvTiempoGarantia = :csvTiempoGarantia"),
    @NamedQuery(name = "Csv.findByCsvProveedor", query = "SELECT c FROM Csv c WHERE c.csvProveedor = :csvProveedor"),
    @NamedQuery(name = "Csv.findByCsvDescripcion", query = "SELECT c FROM Csv c WHERE c.csvDescripcion = :csvDescripcion"),
    @NamedQuery(name = "Csv.findByCsvRamTamano", query = "SELECT c FROM Csv c WHERE c.csvRamTamano = :csvRamTamano"),
    @NamedQuery(name = "Csv.findByCsvRamTecno", query = "SELECT c FROM Csv c WHERE c.csvRamTecno = :csvRamTecno"),
    @NamedQuery(name = "Csv.findByCsvTamDisco", query = "SELECT c FROM Csv c WHERE c.csvTamDisco = :csvTamDisco"),
    @NamedQuery(name = "Csv.findByCsvRed", query = "SELECT c FROM Csv c WHERE c.csvRed = :csvRed"),
    @NamedQuery(name = "Csv.findByCsvProcesador", query = "SELECT c FROM Csv c WHERE c.csvProcesador = :csvProcesador"),
    @NamedQuery(name = "Csv.findByCsvLectorDvd", query = "SELECT c FROM Csv c WHERE c.csvLectorDvd = :csvLectorDvd"),
    @NamedQuery(name = "Csv.findByCsvSistemaOperativo", query = "SELECT c FROM Csv c WHERE c.csvSistemaOperativo = :csvSistemaOperativo"),
    @NamedQuery(name = "Csv.findByCsvMonitorTecn", query = "SELECT c FROM Csv c WHERE c.csvMonitorTecn = :csvMonitorTecn"),
    @NamedQuery(name = "Csv.findByCsvMonitorTama", query = "SELECT c FROM Csv c WHERE c.csvMonitorTama = :csvMonitorTama"),
    @NamedQuery(name = "Csv.findByCsvModeToner", query = "SELECT c FROM Csv c WHERE c.csvModeToner = :csvModeToner"),
    @NamedQuery(name = "Csv.findByCsvNumFusor", query = "SELECT c FROM Csv c WHERE c.csvNumFusor = :csvNumFusor"),
    @NamedQuery(name = "Csv.findByCsvCantToner", query = "SELECT c FROM Csv c WHERE c.csvCantToner = :csvCantToner"),
    @NamedQuery(name = "Csv.findByCsvTecnProyector", query = "SELECT c FROM Csv c WHERE c.csvTecnProyector = :csvTecnProyector"),
    @NamedQuery(name = "Csv.findByCsvLumenes", query = "SELECT c FROM Csv c WHERE c.csvLumenes = :csvLumenes"),
    @NamedQuery(name = "Csv.findByCsvTipoLampara", query = "SELECT c FROM Csv c WHERE c.csvTipoLampara = :csvTipoLampara"),
    @NamedQuery(name = "Csv.findByCsvResolucion", query = "SELECT c FROM Csv c WHERE c.csvResolucion = :csvResolucion"),
    @NamedQuery(name = "Csv.findByCsvFechaSubida", query = "SELECT c FROM Csv c WHERE c.csvFechaSubida = :csvFechaSubida"),
    @NamedQuery(name = "Csv.findByCsvUsuario", query = "SELECT c FROM Csv c WHERE c.csvUsuario = :csvUsuario"),
    @NamedQuery(name = "Csv.findByCsvCargoUsuario", query = "SELECT c FROM Csv c WHERE c.csvCargoUsuario = :csvCargoUsuario"),
    @NamedQuery(name = "Csv.findByCvsCatalogo", query = "SELECT c FROM Csv c WHERE c.cvsCatalogo = :cvsCatalogo"),
    @NamedQuery(name = "Csv.findByCsvCantDisco", query = "SELECT c FROM Csv c WHERE c.csvCantDisco = :csvCantDisco"),
    @NamedQuery(name = "Csv.findByCsvMonitorTipoConex", query = "SELECT c FROM Csv c WHERE c.csvMonitorTipoConex = :csvMonitorTipoConex"),
    @NamedQuery(name = "Csv.findByCsvTipPantalla", query = "SELECT c FROM Csv c WHERE c.csvTipPantalla = :csvTipPantalla"),
    @NamedQuery(name = "Csv.findByCsvMemoInter", query = "SELECT c FROM Csv c WHERE c.csvMemoInter = :csvMemoInter"),
    @NamedQuery(name = "Csv.findByCsvMemoExter", query = "SELECT c FROM Csv c WHERE c.csvMemoExter = :csvMemoExter"),
    @NamedQuery(name = "Csv.findByCsvSwVersion", query = "SELECT c FROM Csv c WHERE c.csvSwVersion = :csvSwVersion"),
    @NamedQuery(name = "Csv.findByCsvSwVigencia", query = "SELECT c FROM Csv c WHERE c.csvSwVigencia = :csvSwVigencia"),
    @NamedQuery(name = "Csv.findByCsvSwCantLicencia", query = "SELECT c FROM Csv c WHERE c.csvSwCantLicencia = :csvSwCantLicencia"),
    @NamedQuery(name = "Csv.findByCsvSwFechaContrat", query = "SELECT c FROM Csv c WHERE c.csvSwFechaContrat = :csvSwFechaContrat"),
    @NamedQuery(name = "Csv.findByCsvSwTipSoporte", query = "SELECT c FROM Csv c WHERE c.csvSwTipSoporte = :csvSwTipSoporte"),
    @NamedQuery(name = "Csv.findByCsvTipBateria", query = "SELECT c FROM Csv c WHERE c.csvTipBateria = :csvTipBateria"),
    @NamedQuery(name = "Csv.findByCsvNumConect", query = "SELECT c FROM Csv c WHERE c.csvNumConect = :csvNumConect"),
    @NamedQuery(name = "Csv.findByCsvNumPuertRouter", query = "SELECT c FROM Csv c WHERE c.csvNumPuertRouter = :csvNumPuertRouter"),
    @NamedQuery(name = "Csv.findByCsvTipLector", query = "SELECT c FROM Csv c WHERE c.csvTipLector = :csvTipLector"),
    @NamedQuery(name = "Csv.findByCsvDiscoTecn", query = "SELECT c FROM Csv c WHERE c.csvDiscoTecn = :csvDiscoTecn"),
    @NamedQuery(name = "Csv.findByCsvTamPantalla", query = "SELECT c FROM Csv c WHERE c.csvTamPantalla = :csvTamPantalla"),
    @NamedQuery(name = "Csv.findByCsvEstadoUso", query = "SELECT c FROM Csv c WHERE c.csvEstadoUso = :csvEstadoUso")})
public class Csv implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "csv_cod_bien")
    private String csvCodBien;
    @Size(max = 500)
    @Column(name = "csv_nombre")
    private String csvNombre;
    @Size(max = 100)
    @Column(name = "csv_serie")
    private String csvSerie;
    @Size(max = 100)
    @Column(name = "csv_modelo")
    private String csvModelo;
    @Size(max = 100)
    @Column(name = "csv_marca")
    private String csvMarca;
    @Size(max = 100)
    @Column(name = "csv_color")
    private String csvColor;
    @Size(max = 250)
    @Column(name = "csv_dependencia")
    private String csvDependencia;
    @Size(max = 500)
    @Column(name = "csv_ubicacion")
    private String csvUbicacion;
    @Size(max = 25)
    @Column(name = "csv_cedula_ruc")
    private String csvCedulaRuc;
    @Size(max = 100)
    @Column(name = "csv_tipo_ingreso")
    private String csvTipoIngreso;
    @Size(max = 100)
    @Column(name = "csv_precio")
    private String csvPrecio;
    @Size(max = 100)
    @Column(name = "csv_estado_bien")
    private String csvEstadoBien;
    @Size(max = 100)
    @Column(name = "csv_fecha_compra")
    private String csvFechaCompra;
    @Size(max = 100)
    @Column(name = "csv_tiempo_garantia")
    private String csvTiempoGarantia;
    @Size(max = 100)
    @Column(name = "csv_proveedor")
    private String csvProveedor;
    @Size(max = 1000)
    @Column(name = "csv_descripcion")
    private String csvDescripcion;
    @Size(max = 25)
    @Column(name = "csv_ram_tamano")
    private String csvRamTamano;
    @Size(max = 25)
    @Column(name = "csv_ram_tecno")
    private String csvRamTecno;
    @Size(max = 25)
    @Column(name = "csv_tam_disco")
    private String csvTamDisco;
    @Size(max = 25)
    @Column(name = "csv_red")
    private String csvRed;
    @Size(max = 100)
    @Column(name = "csv_procesador")
    private String csvProcesador;
    @Size(max = 25)
    @Column(name = "csv_lector_dvd")
    private String csvLectorDvd;
    @Size(max = 100)
    @Column(name = "csv_sistema_operativo")
    private String csvSistemaOperativo;
    @Size(max = 100)
    @Column(name = "csv_monitor_tecn")
    private String csvMonitorTecn;
    @Size(max = 100)
    @Column(name = "csv_monitor_tama")
    private String csvMonitorTama;
    @Size(max = 100)
    @Column(name = "csv_mode_toner")
    private String csvModeToner;
    @Size(max = 100)
    @Column(name = "csv_num_fusor")
    private String csvNumFusor;
    @Size(max = 10)
    @Column(name = "csv_cant_toner")
    private String csvCantToner;
    @Size(max = 100)
    @Column(name = "csv_tecn_proyector")
    private String csvTecnProyector;
    @Size(max = 100)
    @Column(name = "csv_lumenes")
    private String csvLumenes;
    @Size(max = 100)
    @Column(name = "csv_tipo_lampara")
    private String csvTipoLampara;
    @Size(max = 100)
    @Column(name = "csv_resolucion")
    private String csvResolucion;
    @Size(max = 100)
    @Column(name = "csv_fecha_subida")
    private String csvFechaSubida;
    @Size(max = 50)
    @Column(name = "csv_usuario")
    private String csvUsuario;
    @Size(max = 150)
    @Column(name = "csv_cargo_usuario")
    private String csvCargoUsuario;
    @Size(max = 20)
    @Column(name = "cvs_catalogo")
    private String cvsCatalogo;
    @Size(max = 10)
    @Column(name = "csv_cant_disco")
    private String csvCantDisco;
    @Size(max = 25)
    @Column(name = "csv_monitor_tipo_conex")
    private String csvMonitorTipoConex;
    @Size(max = 100)
    @Column(name = "csv_tip_pantalla")
    private String csvTipPantalla;
    @Size(max = 50)
    @Column(name = "csv_memo_inter")
    private String csvMemoInter;
    @Size(max = 50)
    @Column(name = "csv_memo_exter")
    private String csvMemoExter;
    @Size(max = 50)
    @Column(name = "csv_sw_version")
    private String csvSwVersion;
    @Size(max = 50)
    @Column(name = "csv_sw_vigencia")
    private String csvSwVigencia;
    @Size(max = 10)
    @Column(name = "csv_sw_cant_licencia")
    private String csvSwCantLicencia;
    @Size(max = 25)
    @Column(name = "csv_sw_fecha_contrat")
    private String csvSwFechaContrat;
    @Size(max = 50)
    @Column(name = "csv_sw_tip_soporte")
    private String csvSwTipSoporte;
    @Size(max = 50)
    @Column(name = "csv_tip_bateria")
    private String csvTipBateria;
    @Size(max = 10)
    @Column(name = "csv_num_conect")
    private String csvNumConect;
    @Size(max = 10)
    @Column(name = "csv_num_puert_router")
    private String csvNumPuertRouter;
    @Size(max = 50)
    @Column(name = "csv_tip_lector")
    private String csvTipLector;
    @Size(max = 50)
    @Column(name = "csv_disco_tecn")
    private String csvDiscoTecn;
    @Size(max = 50)
    @Column(name = "csv_tam_pantalla")
    private String csvTamPantalla;
    @Size(max = 25)
    @Column(name = "csv_estado_uso")
    private String csvEstadoUso;

    public Csv() {
    }

    public Csv(String csvCodBien) {
        this.csvCodBien = csvCodBien;
    }

    public String getCsvCodBien() {
        return csvCodBien;
    }

    public void setCsvCodBien(String csvCodBien) {
        this.csvCodBien = csvCodBien;
    }

    public String getCsvNombre() {
        return csvNombre;
    }

    public void setCsvNombre(String csvNombre) {
        this.csvNombre = csvNombre;
    }

    public String getCsvSerie() {
        return csvSerie;
    }

    public void setCsvSerie(String csvSerie) {
        this.csvSerie = csvSerie;
    }

    public String getCsvModelo() {
        return csvModelo;
    }

    public void setCsvModelo(String csvModelo) {
        this.csvModelo = csvModelo;
    }

    public String getCsvMarca() {
        return csvMarca;
    }

    public void setCsvMarca(String csvMarca) {
        this.csvMarca = csvMarca;
    }

    public String getCsvColor() {
        return csvColor;
    }

    public void setCsvColor(String csvColor) {
        this.csvColor = csvColor;
    }

    public String getCsvDependencia() {
        return csvDependencia;
    }

    public void setCsvDependencia(String csvDependencia) {
        this.csvDependencia = csvDependencia;
    }

    public String getCsvUbicacion() {
        return csvUbicacion;
    }

    public void setCsvUbicacion(String csvUbicacion) {
        this.csvUbicacion = csvUbicacion;
    }

    public String getCsvCedulaRuc() {
        return csvCedulaRuc;
    }

    public void setCsvCedulaRuc(String csvCedulaRuc) {
        this.csvCedulaRuc = csvCedulaRuc;
    }

    public String getCsvTipoIngreso() {
        return csvTipoIngreso;
    }

    public void setCsvTipoIngreso(String csvTipoIngreso) {
        this.csvTipoIngreso = csvTipoIngreso;
    }

    public String getCsvPrecio() {
        return csvPrecio;
    }

    public void setCsvPrecio(String csvPrecio) {
        this.csvPrecio = csvPrecio;
    }

    public String getCsvEstadoBien() {
        return csvEstadoBien;
    }

    public void setCsvEstadoBien(String csvEstadoBien) {
        this.csvEstadoBien = csvEstadoBien;
    }

    public String getCsvFechaCompra() {
        return csvFechaCompra;
    }

    public void setCsvFechaCompra(String csvFechaCompra) {
        this.csvFechaCompra = csvFechaCompra;
    }

    public String getCsvTiempoGarantia() {
        return csvTiempoGarantia;
    }

    public void setCsvTiempoGarantia(String csvTiempoGarantia) {
        this.csvTiempoGarantia = csvTiempoGarantia;
    }

    public String getCsvProveedor() {
        return csvProveedor;
    }

    public void setCsvProveedor(String csvProveedor) {
        this.csvProveedor = csvProveedor;
    }

    public String getCsvDescripcion() {
        return csvDescripcion;
    }

    public void setCsvDescripcion(String csvDescripcion) {
        this.csvDescripcion = csvDescripcion;
    }

    public String getCsvRamTamano() {
        return csvRamTamano;
    }

    public void setCsvRamTamano(String csvRamTamano) {
        this.csvRamTamano = csvRamTamano;
    }

    public String getCsvRamTecno() {
        return csvRamTecno;
    }

    public void setCsvRamTecno(String csvRamTecno) {
        this.csvRamTecno = csvRamTecno;
    }

    public String getCsvTamDisco() {
        return csvTamDisco;
    }

    public void setCsvTamDisco(String csvTamDisco) {
        this.csvTamDisco = csvTamDisco;
    }

    public String getCsvRed() {
        return csvRed;
    }

    public void setCsvRed(String csvRed) {
        this.csvRed = csvRed;
    }

    public String getCsvProcesador() {
        return csvProcesador;
    }

    public void setCsvProcesador(String csvProcesador) {
        this.csvProcesador = csvProcesador;
    }

    public String getCsvLectorDvd() {
        return csvLectorDvd;
    }

    public void setCsvLectorDvd(String csvLectorDvd) {
        this.csvLectorDvd = csvLectorDvd;
    }

    public String getCsvSistemaOperativo() {
        return csvSistemaOperativo;
    }

    public void setCsvSistemaOperativo(String csvSistemaOperativo) {
        this.csvSistemaOperativo = csvSistemaOperativo;
    }

    public String getCsvMonitorTecn() {
        return csvMonitorTecn;
    }

    public void setCsvMonitorTecn(String csvMonitorTecn) {
        this.csvMonitorTecn = csvMonitorTecn;
    }

    public String getCsvMonitorTama() {
        return csvMonitorTama;
    }

    public void setCsvMonitorTama(String csvMonitorTama) {
        this.csvMonitorTama = csvMonitorTama;
    }

    public String getCsvModeToner() {
        return csvModeToner;
    }

    public void setCsvModeToner(String csvModeToner) {
        this.csvModeToner = csvModeToner;
    }

    public String getCsvNumFusor() {
        return csvNumFusor;
    }

    public void setCsvNumFusor(String csvNumFusor) {
        this.csvNumFusor = csvNumFusor;
    }

    public String getCsvCantToner() {
        return csvCantToner;
    }

    public void setCsvCantToner(String csvCantToner) {
        this.csvCantToner = csvCantToner;
    }

    public String getCsvTecnProyector() {
        return csvTecnProyector;
    }

    public void setCsvTecnProyector(String csvTecnProyector) {
        this.csvTecnProyector = csvTecnProyector;
    }

    public String getCsvLumenes() {
        return csvLumenes;
    }

    public void setCsvLumenes(String csvLumenes) {
        this.csvLumenes = csvLumenes;
    }

    public String getCsvTipoLampara() {
        return csvTipoLampara;
    }

    public void setCsvTipoLampara(String csvTipoLampara) {
        this.csvTipoLampara = csvTipoLampara;
    }

    public String getCsvResolucion() {
        return csvResolucion;
    }

    public void setCsvResolucion(String csvResolucion) {
        this.csvResolucion = csvResolucion;
    }

    public String getCsvFechaSubida() {
        return csvFechaSubida;
    }

    public void setCsvFechaSubida(String csvFechaSubida) {
        this.csvFechaSubida = csvFechaSubida;
    }

    public String getCsvUsuario() {
        return csvUsuario;
    }

    public void setCsvUsuario(String csvUsuario) {
        this.csvUsuario = csvUsuario;
    }

    public String getCsvCargoUsuario() {
        return csvCargoUsuario;
    }

    public void setCsvCargoUsuario(String csvCargoUsuario) {
        this.csvCargoUsuario = csvCargoUsuario;
    }

    public String getCvsCatalogo() {
        return cvsCatalogo;
    }

    public void setCvsCatalogo(String cvsCatalogo) {
        this.cvsCatalogo = cvsCatalogo;
    }

    public String getCsvCantDisco() {
        return csvCantDisco;
    }

    public void setCsvCantDisco(String csvCantDisco) {
        this.csvCantDisco = csvCantDisco;
    }

    public String getCsvMonitorTipoConex() {
        return csvMonitorTipoConex;
    }

    public void setCsvMonitorTipoConex(String csvMonitorTipoConex) {
        this.csvMonitorTipoConex = csvMonitorTipoConex;
    }

    public String getCsvTipPantalla() {
        return csvTipPantalla;
    }

    public void setCsvTipPantalla(String csvTipPantalla) {
        this.csvTipPantalla = csvTipPantalla;
    }

    public String getCsvMemoInter() {
        return csvMemoInter;
    }

    public void setCsvMemoInter(String csvMemoInter) {
        this.csvMemoInter = csvMemoInter;
    }

    public String getCsvMemoExter() {
        return csvMemoExter;
    }

    public void setCsvMemoExter(String csvMemoExter) {
        this.csvMemoExter = csvMemoExter;
    }

    public String getCsvSwVersion() {
        return csvSwVersion;
    }

    public void setCsvSwVersion(String csvSwVersion) {
        this.csvSwVersion = csvSwVersion;
    }

    public String getCsvSwVigencia() {
        return csvSwVigencia;
    }

    public void setCsvSwVigencia(String csvSwVigencia) {
        this.csvSwVigencia = csvSwVigencia;
    }

    public String getCsvSwCantLicencia() {
        return csvSwCantLicencia;
    }

    public void setCsvSwCantLicencia(String csvSwCantLicencia) {
        this.csvSwCantLicencia = csvSwCantLicencia;
    }

    public String getCsvSwFechaContrat() {
        return csvSwFechaContrat;
    }

    public void setCsvSwFechaContrat(String csvSwFechaContrat) {
        this.csvSwFechaContrat = csvSwFechaContrat;
    }

    public String getCsvSwTipSoporte() {
        return csvSwTipSoporte;
    }

    public void setCsvSwTipSoporte(String csvSwTipSoporte) {
        this.csvSwTipSoporte = csvSwTipSoporte;
    }

    public String getCsvTipBateria() {
        return csvTipBateria;
    }

    public void setCsvTipBateria(String csvTipBateria) {
        this.csvTipBateria = csvTipBateria;
    }

    public String getCsvNumConect() {
        return csvNumConect;
    }

    public void setCsvNumConect(String csvNumConect) {
        this.csvNumConect = csvNumConect;
    }

    public String getCsvNumPuertRouter() {
        return csvNumPuertRouter;
    }

    public void setCsvNumPuertRouter(String csvNumPuertRouter) {
        this.csvNumPuertRouter = csvNumPuertRouter;
    }

    public String getCsvTipLector() {
        return csvTipLector;
    }

    public void setCsvTipLector(String csvTipLector) {
        this.csvTipLector = csvTipLector;
    }

    public String getCsvDiscoTecn() {
        return csvDiscoTecn;
    }

    public void setCsvDiscoTecn(String csvDiscoTecn) {
        this.csvDiscoTecn = csvDiscoTecn;
    }

    public String getCsvTamPantalla() {
        return csvTamPantalla;
    }

    public void setCsvTamPantalla(String csvTamPantalla) {
        this.csvTamPantalla = csvTamPantalla;
    }

    public String getCsvEstadoUso() {
        return csvEstadoUso;
    }

    public void setCsvEstadoUso(String csvEstadoUso) {
        this.csvEstadoUso = csvEstadoUso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (csvCodBien != null ? csvCodBien.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Csv)) {
            return false;
        }
        Csv other = (Csv) object;
        if ((this.csvCodBien == null && other.csvCodBien != null) || (this.csvCodBien != null && !this.csvCodBien.equals(other.csvCodBien))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Csv[ csvCodBien=" + csvCodBien + " ]";
    }
    
}
