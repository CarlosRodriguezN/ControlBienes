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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
 * @author kuri
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mantenimientos.findAll", query = "SELECT m FROM Mantenimientos m")
    , @NamedQuery(name = "Mantenimientos.findByMantId", query = "SELECT m FROM Mantenimientos m WHERE m.mantId = :mantId")
    , @NamedQuery(name = "Mantenimientos.findByMantNumOrden", query = "SELECT m FROM Mantenimientos m WHERE m.mantNumOrden = :mantNumOrden")
    , @NamedQuery(name = "Mantenimientos.findByMantEstado", query = "SELECT m FROM Mantenimientos m WHERE m.mantEstado = :mantEstado")
    , @NamedQuery(name = "Mantenimientos.findByMantFechaIngreso", query = "SELECT m FROM Mantenimientos m WHERE m.mantFechaIngreso = :mantFechaIngreso")
    , @NamedQuery(name = "Mantenimientos.findByMantFechaRevision", query = "SELECT m FROM Mantenimientos m WHERE m.mantFechaRevision = :mantFechaRevision")
    , @NamedQuery(name = "Mantenimientos.findByMantFechaEntrega", query = "SELECT m FROM Mantenimientos m WHERE m.mantFechaEntrega = :mantFechaEntrega")
    , @NamedQuery(name = "Mantenimientos.findByMantDescProblema", query = "SELECT m FROM Mantenimientos m WHERE m.mantDescProblema = :mantDescProblema")
    , @NamedQuery(name = "Mantenimientos.findByMantDescSolucion", query = "SELECT m FROM Mantenimientos m WHERE m.mantDescSolucion = :mantDescSolucion")
    , @NamedQuery(name = "Mantenimientos.findByMantTecnIngreso", query = "SELECT m FROM Mantenimientos m WHERE m.mantTecnIngreso = :mantTecnIngreso")
    , @NamedQuery(name = "Mantenimientos.findByMantTecnRevision", query = "SELECT m FROM Mantenimientos m WHERE m.mantTecnRevision = :mantTecnRevision")
    , @NamedQuery(name = "Mantenimientos.findByMantTecnEntrega", query = "SELECT m FROM Mantenimientos m WHERE m.mantTecnEntrega = :mantTecnEntrega")
    , @NamedQuery(name = "Mantenimientos.findByMantResponsableRecibo", query = "SELECT m FROM Mantenimientos m WHERE m.mantResponsableRecibo = :mantResponsableRecibo")})
public class Mantenimientos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mant_id")
    private Integer mantId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "mant_num_orden")
    private String mantNumOrden;
    @Basic(optional = false)
    @NotNull
    @Column(name = "mant_estado")
    private int mantEstado;
    @Column(name = "mant_fecha_ingreso")
    @Temporal(TemporalType.DATE)
    private Date mantFechaIngreso;
    @Column(name = "mant_fecha_revision")
    @Temporal(TemporalType.DATE)
    private Date mantFechaRevision;
    @Column(name = "mant_fecha_entrega")
    @Temporal(TemporalType.DATE)
    private Date mantFechaEntrega;
    @Size(max = 200)
    @Column(name = "mant_desc_problema")
    private String mantDescProblema;
    @Size(max = 200)
    @Column(name = "mant_desc_solucion")
    private String mantDescSolucion;
    @Size(max = 45)
    @Column(name = "mant_tecn_ingreso")
    private String mantTecnIngreso;
    @Size(max = 45)
    @Column(name = "mant_tecn_revision")
    private String mantTecnRevision;
    @Size(max = 45)
    @Column(name = "mant_tecn_entrega")
    private String mantTecnEntrega;
    @JoinColumn(name = "nivelm_id", referencedColumnName = "nivel_id")
    @ManyToOne(optional = false)
    private Nivelmantenimiento nivelmId;
    @JoinColumn(name = "tipom_id", referencedColumnName = "tip_id")
    @ManyToOne(optional = false)
    private Tipomantenimiento tipId;
    @JoinColumn(name = "bien_id", referencedColumnName = "bn_cod_bien")
    @ManyToOne
    private Bien bienId;
    @Size(max = 40)
    @Column(name = "mant_responsable_recibo")
    private String mantResponsableRecibo;

    public Mantenimientos() {
    }

    public Mantenimientos(Integer mantId) {
        this.mantId = mantId;
    }

    public Mantenimientos(Integer mantId, String mantNumOrden, int mantEstado) {
        this.mantId = mantId;
        this.mantNumOrden = mantNumOrden;
        this.mantEstado = mantEstado;
    }

    public Integer getMantId() {
        return mantId;
    }

    public void setMantId(Integer mantId) {
        this.mantId = mantId;
    }

    public String getMantNumOrden() {
        return mantNumOrden;
    }

    public void setMantNumOrden(String mantNumOrden) {
        this.mantNumOrden = mantNumOrden;
    }

    public int getMantEstado() {
        return mantEstado;
    }

    public void setMantEstado(int mantEstado) {
        this.mantEstado = mantEstado;
    }

    public Date getMantFechaIngreso() {
        return mantFechaIngreso;
    }

    public void setMantFechaIngreso(Date mantFechaIngreso) {
        this.mantFechaIngreso = mantFechaIngreso;
    }

    public Date getMantFechaRevision() {
        return mantFechaRevision;
    }

    public void setMantFechaRevision(Date mantFechaRevision) {
        this.mantFechaRevision = mantFechaRevision;
    }

    public Date getMantFechaEntrega() {
        return mantFechaEntrega;
    }

    public void setMantFechaEntrega(Date mantFechaEntrega) {
        this.mantFechaEntrega = mantFechaEntrega;
    }

    public String getMantDescProblema() {
        return mantDescProblema;
    }

    public void setMantDescProblema(String mantDescProblema) {
        this.mantDescProblema = mantDescProblema;
    }

    public String getMantDescSolucion() {
        return mantDescSolucion;
    }

    public void setMantDescSolucion(String mantDescSolucion) {
        this.mantDescSolucion = mantDescSolucion;
    }

    public String getMantTecnIngreso() {
        return mantTecnIngreso;
    }

    public void setMantTecnIngreso(String mantTecnIngreso) {
        this.mantTecnIngreso = mantTecnIngreso;
    }

    public String getMantTecnRevision() {
        return mantTecnRevision;
    }

    public void setMantTecnRevision(String mantTecnRevision) {
        this.mantTecnRevision = mantTecnRevision;
    }

    public String getMantTecnEntrega() {
        return mantTecnEntrega;
    }

    public void setMantTecnEntrega(String mantTecnEntrega) {
        this.mantTecnEntrega = mantTecnEntrega;
    }

    public Nivelmantenimiento getNivelmId() {
        return nivelmId;
    }

    public void setNivelmId(Nivelmantenimiento nivelmId) {
        this.nivelmId = nivelmId;
    }

    public Tipomantenimiento getTipId() {
        return tipId;
    }

    public void setTipId(Tipomantenimiento tipId) {
        this.tipId = tipId;
    }

    public Bien getBienId() {
        return bienId;
    }

    public void setBienId(Bien bienId) {
        this.bienId = bienId;
    }

    public String getMantResponsableRecibo() {
        return mantResponsableRecibo;
    }

    public void setMantResponsableRecibo(String mantResponsableRecibo) {
        this.mantResponsableRecibo = mantResponsableRecibo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mantId != null ? mantId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mantenimientos)) {
            return false;
        }
        Mantenimientos other = (Mantenimientos) object;
        if ((this.mantId == null && other.mantId != null) || (this.mantId != null && !this.mantId.equals(other.mantId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Mantenimientos[ mantId=" + mantId + " ]";
    }

}
