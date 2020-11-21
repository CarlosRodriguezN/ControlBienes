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
@Table(name = "temp", catalog = "bienesdtic", schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Temp.findAll", query = "SELECT t FROM Temp t"),
    @NamedQuery(name = "Temp.findByTempCodBien", query = "SELECT t FROM Temp t WHERE t.tempCodBien = :tempCodBien"),
    @NamedQuery(name = "Temp.findByTempNombre", query = "SELECT t FROM Temp t WHERE t.tempNombre = :tempNombre"),
    @NamedQuery(name = "Temp.findByTempSerie", query = "SELECT t FROM Temp t WHERE t.tempSerie = :tempSerie"),
    @NamedQuery(name = "Temp.findByTempModelo", query = "SELECT t FROM Temp t WHERE t.tempModelo = :tempModelo"),
    @NamedQuery(name = "Temp.findByTempMarca", query = "SELECT t FROM Temp t WHERE t.tempMarca = :tempMarca"),
    @NamedQuery(name = "Temp.findByTempColor", query = "SELECT t FROM Temp t WHERE t.tempColor = :tempColor"),
    @NamedQuery(name = "Temp.findByTempDependencia", query = "SELECT t FROM Temp t WHERE t.tempDependencia = :tempDependencia"),
    @NamedQuery(name = "Temp.findByTempUbicacion", query = "SELECT t FROM Temp t WHERE t.tempUbicacion = :tempUbicacion"),
    @NamedQuery(name = "Temp.findByTempCedulaRuc", query = "SELECT t FROM Temp t WHERE t.tempCedulaRuc = :tempCedulaRuc"),
    @NamedQuery(name = "Temp.findByTempTipoIngreso", query = "SELECT t FROM Temp t WHERE t.tempTipoIngreso = :tempTipoIngreso"),
    @NamedQuery(name = "Temp.findByTempPrecio", query = "SELECT t FROM Temp t WHERE t.tempPrecio = :tempPrecio"),
    @NamedQuery(name = "Temp.findByTempEstadoBien", query = "SELECT t FROM Temp t WHERE t.tempEstadoBien = :tempEstadoBien"),
    @NamedQuery(name = "Temp.findByTempFechaCompra", query = "SELECT t FROM Temp t WHERE t.tempFechaCompra = :tempFechaCompra"),
    @NamedQuery(name = "Temp.findByTempTiempoGarantia", query = "SELECT t FROM Temp t WHERE t.tempTiempoGarantia = :tempTiempoGarantia"),
    @NamedQuery(name = "Temp.findByTempProveedor", query = "SELECT t FROM Temp t WHERE t.tempProveedor = :tempProveedor"),
    @NamedQuery(name = "Temp.findByTempDescripcion", query = "SELECT t FROM Temp t WHERE t.tempDescripcion = :tempDescripcion"),
    @NamedQuery(name = "Temp.findByTempRamTamano", query = "SELECT t FROM Temp t WHERE t.tempRamTamano = :tempRamTamano"),
    @NamedQuery(name = "Temp.findByTempRamTecno", query = "SELECT t FROM Temp t WHERE t.tempRamTecno = :tempRamTecno"),
    @NamedQuery(name = "Temp.findByTempTamDisco", query = "SELECT t FROM Temp t WHERE t.tempTamDisco = :tempTamDisco"),
    @NamedQuery(name = "Temp.findByTempRed", query = "SELECT t FROM Temp t WHERE t.tempRed = :tempRed"),
    @NamedQuery(name = "Temp.findByTempProcesador", query = "SELECT t FROM Temp t WHERE t.tempProcesador = :tempProcesador"),
    @NamedQuery(name = "Temp.findByTempLectorDvd", query = "SELECT t FROM Temp t WHERE t.tempLectorDvd = :tempLectorDvd"),
    @NamedQuery(name = "Temp.findByTempSistemaOperativo", query = "SELECT t FROM Temp t WHERE t.tempSistemaOperativo = :tempSistemaOperativo"),
    @NamedQuery(name = "Temp.findByTempMonitorTecn", query = "SELECT t FROM Temp t WHERE t.tempMonitorTecn = :tempMonitorTecn"),
    @NamedQuery(name = "Temp.findByTempMonitorTama", query = "SELECT t FROM Temp t WHERE t.tempMonitorTama = :tempMonitorTama"),
    @NamedQuery(name = "Temp.findByTempModeToner", query = "SELECT t FROM Temp t WHERE t.tempModeToner = :tempModeToner"),
    @NamedQuery(name = "Temp.findByTempNumFusor", query = "SELECT t FROM Temp t WHERE t.tempNumFusor = :tempNumFusor"),
    @NamedQuery(name = "Temp.findByTempCantToner", query = "SELECT t FROM Temp t WHERE t.tempCantToner = :tempCantToner"),
    @NamedQuery(name = "Temp.findByTempTecnProyector", query = "SELECT t FROM Temp t WHERE t.tempTecnProyector = :tempTecnProyector"),
    @NamedQuery(name = "Temp.findByTempLumenes", query = "SELECT t FROM Temp t WHERE t.tempLumenes = :tempLumenes"),
    @NamedQuery(name = "Temp.findByTempTipoLampara", query = "SELECT t FROM Temp t WHERE t.tempTipoLampara = :tempTipoLampara"),
    @NamedQuery(name = "Temp.findByTempResolucion", query = "SELECT t FROM Temp t WHERE t.tempResolucion = :tempResolucion"),
    @NamedQuery(name = "Temp.findByTempFechaSubida", query = "SELECT t FROM Temp t WHERE t.tempFechaSubida = :tempFechaSubida"),
    @NamedQuery(name = "Temp.findByTempUsuario", query = "SELECT t FROM Temp t WHERE t.tempUsuario = :tempUsuario"),
    @NamedQuery(name = "Temp.findByTempCargoUsuario", query = "SELECT t FROM Temp t WHERE t.tempCargoUsuario = :tempCargoUsuario"),
    @NamedQuery(name = "Temp.findByTempCatalogo", query = "SELECT t FROM Temp t WHERE t.tempCatalogo = :tempCatalogo"),
    @NamedQuery(name = "Temp.findByTempCantDisco", query = "SELECT t FROM Temp t WHERE t.tempCantDisco = :tempCantDisco"),
    @NamedQuery(name = "Temp.findByTempMonitorTipoConex", query = "SELECT t FROM Temp t WHERE t.tempMonitorTipoConex = :tempMonitorTipoConex"),
    @NamedQuery(name = "Temp.findByTempTipPantalla", query = "SELECT t FROM Temp t WHERE t.tempTipPantalla = :tempTipPantalla"),
    @NamedQuery(name = "Temp.findByTempMemoInter", query = "SELECT t FROM Temp t WHERE t.tempMemoInter = :tempMemoInter"),
    @NamedQuery(name = "Temp.findByTempMemoExter", query = "SELECT t FROM Temp t WHERE t.tempMemoExter = :tempMemoExter"),
    @NamedQuery(name = "Temp.findByTempSwVersion", query = "SELECT t FROM Temp t WHERE t.tempSwVersion = :tempSwVersion"),
    @NamedQuery(name = "Temp.findByTempSwVigencia", query = "SELECT t FROM Temp t WHERE t.tempSwVigencia = :tempSwVigencia"),
    @NamedQuery(name = "Temp.findByTempSwCantLicencia", query = "SELECT t FROM Temp t WHERE t.tempSwCantLicencia = :tempSwCantLicencia"),
    @NamedQuery(name = "Temp.findByTempSwFechaContrat", query = "SELECT t FROM Temp t WHERE t.tempSwFechaContrat = :tempSwFechaContrat"),
    @NamedQuery(name = "Temp.findByTempSwTipSoporte", query = "SELECT t FROM Temp t WHERE t.tempSwTipSoporte = :tempSwTipSoporte"),
    @NamedQuery(name = "Temp.findByTempTipBateria", query = "SELECT t FROM Temp t WHERE t.tempTipBateria = :tempTipBateria"),
    @NamedQuery(name = "Temp.findByTempNumConect", query = "SELECT t FROM Temp t WHERE t.tempNumConect = :tempNumConect"),
    @NamedQuery(name = "Temp.findByTempNumPuertRouter", query = "SELECT t FROM Temp t WHERE t.tempNumPuertRouter = :tempNumPuertRouter"),
    @NamedQuery(name = "Temp.findByTempTipLector", query = "SELECT t FROM Temp t WHERE t.tempTipLector = :tempTipLector"),
    @NamedQuery(name = "Temp.findByTempDiscoTecn", query = "SELECT t FROM Temp t WHERE t.tempDiscoTecn = :tempDiscoTecn"),
    @NamedQuery(name = "Temp.findByTempTamPantalla", query = "SELECT t FROM Temp t WHERE t.tempTamPantalla = :tempTamPantalla"),
    @NamedQuery(name = "Temp.findByTempEstadoUso", query = "SELECT t FROM Temp t WHERE t.tempEstadoUso = :tempEstadoUso")})
public class Temp implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "temp_cod_bien")
    private String tempCodBien;
    @Size(max = 500)
    @Column(name = "temp_nombre")
    private String tempNombre;
    @Size(max = 100)
    @Column(name = "temp_serie")
    private String tempSerie;
    @Size(max = 100)
    @Column(name = "temp_modelo")
    private String tempModelo;
    @Size(max = 100)
    @Column(name = "temp_marca")
    private String tempMarca;
    @Size(max = 100)
    @Column(name = "temp_color")
    private String tempColor;
    @Size(max = 250)
    @Column(name = "temp_dependencia")
    private String tempDependencia;
    @Size(max = 500)
    @Column(name = "temp_ubicacion")
    private String tempUbicacion;
    @Size(max = 25)
    @Column(name = "temp_cedula_ruc")
    private String tempCedulaRuc;
    @Size(max = 100)
    @Column(name = "temp_tipo_ingreso")
    private String tempTipoIngreso;
    @Size(max = 100)
    @Column(name = "temp_precio")
    private String tempPrecio;
    @Size(max = 100)
    @Column(name = "temp_estado_bien")
    private String tempEstadoBien;
    @Size(max = 100)
    @Column(name = "temp_fecha_compra")
    private String tempFechaCompra;
    @Size(max = 100)
    @Column(name = "temp_tiempo_garantia")
    private String tempTiempoGarantia;
    @Size(max = 100)
    @Column(name = "temp_proveedor")
    private String tempProveedor;
    @Size(max = 1000)
    @Column(name = "temp_descripcion")
    private String tempDescripcion;
    @Size(max = 25)
    @Column(name = "temp_ram_tamano")
    private String tempRamTamano;
    @Size(max = 25)
    @Column(name = "temp_ram_tecno")
    private String tempRamTecno;
    @Size(max = 25)
    @Column(name = "temp_tam_disco")
    private String tempTamDisco;
    @Size(max = 25)
    @Column(name = "temp_red")
    private String tempRed;
    @Size(max = 100)
    @Column(name = "temp_procesador")
    private String tempProcesador;
    @Size(max = 25)
    @Column(name = "temp_lector_dvd")
    private String tempLectorDvd;
    @Size(max = 100)
    @Column(name = "temp_sistema_operativo")
    private String tempSistemaOperativo;
    @Size(max = 100)
    @Column(name = "temp_monitor_tecn")
    private String tempMonitorTecn;
    @Size(max = 100)
    @Column(name = "temp_monitor_tama")
    private String tempMonitorTama;
    @Size(max = 100)
    @Column(name = "temp_mode_toner")
    private String tempModeToner;
    @Size(max = 100)
    @Column(name = "temp_num_fusor")
    private String tempNumFusor;
    @Size(max = 10)
    @Column(name = "temp_cant_toner")
    private String tempCantToner;
    @Size(max = 100)
    @Column(name = "temp_tecn_proyector")
    private String tempTecnProyector;
    @Size(max = 100)
    @Column(name = "temp_lumenes")
    private String tempLumenes;
    @Size(max = 100)
    @Column(name = "temp_tipo_lampara")
    private String tempTipoLampara;
    @Size(max = 100)
    @Column(name = "temp_resolucion")
    private String tempResolucion;
    @Size(max = 100)
    @Column(name = "temp_fecha_subida")
    private String tempFechaSubida;
    @Size(max = 50)
    @Column(name = "temp_usuario")
    private String tempUsuario;
    @Size(max = 150)
    @Column(name = "temp_cargo_usuario")
    private String tempCargoUsuario;
    @Size(max = 20)
    @Column(name = "temp_catalogo")
    private String tempCatalogo;
    @Size(max = 10)
    @Column(name = "temp_cant_disco")
    private String tempCantDisco;
    @Size(max = 25)
    @Column(name = "temp_monitor_tipo_conex")
    private String tempMonitorTipoConex;
    @Size(max = 100)
    @Column(name = "temp_tip_pantalla")
    private String tempTipPantalla;
    @Size(max = 50)
    @Column(name = "temp_memo_inter")
    private String tempMemoInter;
    @Size(max = 50)
    @Column(name = "temp_memo_exter")
    private String tempMemoExter;
    @Size(max = 50)
    @Column(name = "temp_sw_version")
    private String tempSwVersion;
    @Size(max = 50)
    @Column(name = "temp_sw_vigencia")
    private String tempSwVigencia;
    @Size(max = 10)
    @Column(name = "temp_sw_cant_licencia")
    private String tempSwCantLicencia;
    @Size(max = 25)
    @Column(name = "temp_sw_fecha_contrat")
    private String tempSwFechaContrat;
    @Size(max = 50)
    @Column(name = "temp_sw_tip_soporte")
    private String tempSwTipSoporte;
    @Size(max = 50)
    @Column(name = "temp_tip_bateria")
    private String tempTipBateria;
    @Size(max = 10)
    @Column(name = "temp_num_conect")
    private String tempNumConect;
    @Size(max = 10)
    @Column(name = "temp_num_puert_router")
    private String tempNumPuertRouter;
    @Size(max = 50)
    @Column(name = "temp_tip_lector")
    private String tempTipLector;
    @Size(max = 50)
    @Column(name = "temp_disco_tecn")
    private String tempDiscoTecn;
    @Size(max = 50)
    @Column(name = "temp_tam_pantalla")
    private String tempTamPantalla;
    @Size(max = 25)
    @Column(name = "temp_estado_uso")
    private String tempEstadoUso;

    public Temp() {
    }

    public Temp(String tempCodBien) {
        this.tempCodBien = tempCodBien;
    }

    public String getTempCodBien() {
        return tempCodBien;
    }

    public void setTempCodBien(String tempCodBien) {
        this.tempCodBien = tempCodBien;
    }

    public String getTempNombre() {
        return tempNombre;
    }

    public void setTempNombre(String tempNombre) {
        this.tempNombre = tempNombre;
    }

    public String getTempSerie() {
        return tempSerie;
    }

    public void setTempSerie(String tempSerie) {
        this.tempSerie = tempSerie;
    }

    public String getTempModelo() {
        return tempModelo;
    }

    public void setTempModelo(String tempModelo) {
        this.tempModelo = tempModelo;
    }

    public String getTempMarca() {
        return tempMarca;
    }

    public void setTempMarca(String tempMarca) {
        this.tempMarca = tempMarca;
    }

    public String getTempColor() {
        return tempColor;
    }

    public void setTempColor(String tempColor) {
        this.tempColor = tempColor;
    }

    public String getTempDependencia() {
        return tempDependencia;
    }

    public void setTempDependencia(String tempDependencia) {
        this.tempDependencia = tempDependencia;
    }

    public String getTempUbicacion() {
        return tempUbicacion;
    }

    public void setTempUbicacion(String tempUbicacion) {
        this.tempUbicacion = tempUbicacion;
    }

    public String getTempCedulaRuc() {
        return tempCedulaRuc;
    }

    public void setTempCedulaRuc(String tempCedulaRuc) {
        this.tempCedulaRuc = tempCedulaRuc;
    }

    public String getTempTipoIngreso() {
        return tempTipoIngreso;
    }

    public void setTempTipoIngreso(String tempTipoIngreso) {
        this.tempTipoIngreso = tempTipoIngreso;
    }

    public String getTempPrecio() {
        return tempPrecio;
    }

    public void setTempPrecio(String tempPrecio) {
        this.tempPrecio = tempPrecio;
    }

    public String getTempEstadoBien() {
        return tempEstadoBien;
    }

    public void setTempEstadoBien(String tempEstadoBien) {
        this.tempEstadoBien = tempEstadoBien;
    }

    public String getTempFechaCompra() {
        return tempFechaCompra;
    }

    public void setTempFechaCompra(String tempFechaCompra) {
        this.tempFechaCompra = tempFechaCompra;
    }

    public String getTempTiempoGarantia() {
        return tempTiempoGarantia;
    }

    public void setTempTiempoGarantia(String tempTiempoGarantia) {
        this.tempTiempoGarantia = tempTiempoGarantia;
    }

    public String getTempProveedor() {
        return tempProveedor;
    }

    public void setTempProveedor(String tempProveedor) {
        this.tempProveedor = tempProveedor;
    }

    public String getTempDescripcion() {
        return tempDescripcion;
    }

    public void setTempDescripcion(String tempDescripcion) {
        this.tempDescripcion = tempDescripcion;
    }

    public String getTempRamTamano() {
        return tempRamTamano;
    }

    public void setTempRamTamano(String tempRamTamano) {
        this.tempRamTamano = tempRamTamano;
    }

    public String getTempRamTecno() {
        return tempRamTecno;
    }

    public void setTempRamTecno(String tempRamTecno) {
        this.tempRamTecno = tempRamTecno;
    }

    public String getTempTamDisco() {
        return tempTamDisco;
    }

    public void setTempTamDisco(String tempTamDisco) {
        this.tempTamDisco = tempTamDisco;
    }

    public String getTempRed() {
        return tempRed;
    }

    public void setTempRed(String tempRed) {
        this.tempRed = tempRed;
    }

    public String getTempProcesador() {
        return tempProcesador;
    }

    public void setTempProcesador(String tempProcesador) {
        this.tempProcesador = tempProcesador;
    }

    public String getTempLectorDvd() {
        return tempLectorDvd;
    }

    public void setTempLectorDvd(String tempLectorDvd) {
        this.tempLectorDvd = tempLectorDvd;
    }

    public String getTempSistemaOperativo() {
        return tempSistemaOperativo;
    }

    public void setTempSistemaOperativo(String tempSistemaOperativo) {
        this.tempSistemaOperativo = tempSistemaOperativo;
    }

    public String getTempMonitorTecn() {
        return tempMonitorTecn;
    }

    public void setTempMonitorTecn(String tempMonitorTecn) {
        this.tempMonitorTecn = tempMonitorTecn;
    }

    public String getTempMonitorTama() {
        return tempMonitorTama;
    }

    public void setTempMonitorTama(String tempMonitorTama) {
        this.tempMonitorTama = tempMonitorTama;
    }

    public String getTempModeToner() {
        return tempModeToner;
    }

    public void setTempModeToner(String tempModeToner) {
        this.tempModeToner = tempModeToner;
    }

    public String getTempNumFusor() {
        return tempNumFusor;
    }

    public void setTempNumFusor(String tempNumFusor) {
        this.tempNumFusor = tempNumFusor;
    }

    public String getTempCantToner() {
        return tempCantToner;
    }

    public void setTempCantToner(String tempCantToner) {
        this.tempCantToner = tempCantToner;
    }

    public String getTempTecnProyector() {
        return tempTecnProyector;
    }

    public void setTempTecnProyector(String tempTecnProyector) {
        this.tempTecnProyector = tempTecnProyector;
    }

    public String getTempLumenes() {
        return tempLumenes;
    }

    public void setTempLumenes(String tempLumenes) {
        this.tempLumenes = tempLumenes;
    }

    public String getTempTipoLampara() {
        return tempTipoLampara;
    }

    public void setTempTipoLampara(String tempTipoLampara) {
        this.tempTipoLampara = tempTipoLampara;
    }

    public String getTempResolucion() {
        return tempResolucion;
    }

    public void setTempResolucion(String tempResolucion) {
        this.tempResolucion = tempResolucion;
    }

    public String getTempFechaSubida() {
        return tempFechaSubida;
    }

    public void setTempFechaSubida(String tempFechaSubida) {
        this.tempFechaSubida = tempFechaSubida;
    }

    public String getTempUsuario() {
        return tempUsuario;
    }

    public void setTempUsuario(String tempUsuario) {
        this.tempUsuario = tempUsuario;
    }

    public String getTempCargoUsuario() {
        return tempCargoUsuario;
    }

    public void setTempCargoUsuario(String tempCargoUsuario) {
        this.tempCargoUsuario = tempCargoUsuario;
    }

    public String getTempCatalogo() {
        return tempCatalogo;
    }

    public void setTempCatalogo(String tempCatalogo) {
        this.tempCatalogo = tempCatalogo;
    }

    public String getTempCantDisco() {
        return tempCantDisco;
    }

    public void setTempCantDisco(String tempCantDisco) {
        this.tempCantDisco = tempCantDisco;
    }

    public String getTempMonitorTipoConex() {
        return tempMonitorTipoConex;
    }

    public void setTempMonitorTipoConex(String tempMonitorTipoConex) {
        this.tempMonitorTipoConex = tempMonitorTipoConex;
    }

    public String getTempTipPantalla() {
        return tempTipPantalla;
    }

    public void setTempTipPantalla(String tempTipPantalla) {
        this.tempTipPantalla = tempTipPantalla;
    }

    public String getTempMemoInter() {
        return tempMemoInter;
    }

    public void setTempMemoInter(String tempMemoInter) {
        this.tempMemoInter = tempMemoInter;
    }

    public String getTempMemoExter() {
        return tempMemoExter;
    }

    public void setTempMemoExter(String tempMemoExter) {
        this.tempMemoExter = tempMemoExter;
    }

    public String getTempSwVersion() {
        return tempSwVersion;
    }

    public void setTempSwVersion(String tempSwVersion) {
        this.tempSwVersion = tempSwVersion;
    }

    public String getTempSwVigencia() {
        return tempSwVigencia;
    }

    public void setTempSwVigencia(String tempSwVigencia) {
        this.tempSwVigencia = tempSwVigencia;
    }

    public String getTempSwCantLicencia() {
        return tempSwCantLicencia;
    }

    public void setTempSwCantLicencia(String tempSwCantLicencia) {
        this.tempSwCantLicencia = tempSwCantLicencia;
    }

    public String getTempSwFechaContrat() {
        return tempSwFechaContrat;
    }

    public void setTempSwFechaContrat(String tempSwFechaContrat) {
        this.tempSwFechaContrat = tempSwFechaContrat;
    }

    public String getTempSwTipSoporte() {
        return tempSwTipSoporte;
    }

    public void setTempSwTipSoporte(String tempSwTipSoporte) {
        this.tempSwTipSoporte = tempSwTipSoporte;
    }

    public String getTempTipBateria() {
        return tempTipBateria;
    }

    public void setTempTipBateria(String tempTipBateria) {
        this.tempTipBateria = tempTipBateria;
    }

    public String getTempNumConect() {
        return tempNumConect;
    }

    public void setTempNumConect(String tempNumConect) {
        this.tempNumConect = tempNumConect;
    }

    public String getTempNumPuertRouter() {
        return tempNumPuertRouter;
    }

    public void setTempNumPuertRouter(String tempNumPuertRouter) {
        this.tempNumPuertRouter = tempNumPuertRouter;
    }

    public String getTempTipLector() {
        return tempTipLector;
    }

    public void setTempTipLector(String tempTipLector) {
        this.tempTipLector = tempTipLector;
    }

    public String getTempDiscoTecn() {
        return tempDiscoTecn;
    }

    public void setTempDiscoTecn(String tempDiscoTecn) {
        this.tempDiscoTecn = tempDiscoTecn;
    }

    public String getTempTamPantalla() {
        return tempTamPantalla;
    }

    public void setTempTamPantalla(String tempTamPantalla) {
        this.tempTamPantalla = tempTamPantalla;
    }

    public String getTempEstadoUso() {
        return tempEstadoUso;
    }

    public void setTempEstadoUso(String tempEstadoUso) {
        this.tempEstadoUso = tempEstadoUso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tempCodBien != null ? tempCodBien.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Temp)) {
            return false;
        }
        Temp other = (Temp) object;
        if ((this.tempCodBien == null && other.tempCodBien != null) || (this.tempCodBien != null && !this.tempCodBien.equals(other.tempCodBien))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Temp[ tempCodBien=" + tempCodBien + " ]";
    }
    
}
