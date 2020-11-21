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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Alex
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mantenimiento.findAll", query = "SELECT m FROM Mantenimiento m"),
    @NamedQuery(name = "Mantenimiento.findByMantId", query = "SELECT m FROM Mantenimiento m WHERE m.mantId = :mantId"),
    @NamedQuery(name = "Mantenimiento.findByMantNumOrden", query = "SELECT m FROM Mantenimiento m WHERE m.mantNumOrden = :mantNumOrden"),
    @NamedQuery(name = "Mantenimiento.findByMantFechaIng", query = "SELECT m FROM Mantenimiento m WHERE m.mantFechaIng = :mantFechaIng"),
    @NamedQuery(name = "Mantenimiento.findByMantFechaEntrega", query = "SELECT m FROM Mantenimiento m WHERE m.mantFechaEntrega = :mantFechaEntrega"),
    @NamedQuery(name = "Mantenimiento.findByMantFechaRevision", query = "SELECT m FROM Mantenimiento m WHERE m.mantFechaRevision = :mantFechaRevision"),
    @NamedQuery(name = "Mantenimiento.findByMantDescripProblema", query = "SELECT m FROM Mantenimiento m WHERE m.mantDescripProblema = :mantDescripProblema"),
    @NamedQuery(name = "Mantenimiento.findByMantDescripSolucion", query = "SELECT m FROM Mantenimiento m WHERE m.mantDescripSolucion = :mantDescripSolucion"),
    @NamedQuery(name = "Mantenimiento.findByMantEstado", query = "SELECT m FROM Mantenimiento m WHERE m.mantEstado = :mantEstado"),
    @NamedQuery(name = "Mantenimiento.findByMantTipo", query = "SELECT m FROM Mantenimiento m WHERE m.mantTipo = :mantTipo")})
public class Mantenimiento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mant_id")
    private Integer mantId;
    @Column(name = "mant_num_orden")
    private Integer mantNumOrden;
    @Column(name = "mant_fecha_ing")
    //@Temporal(TemporalType.DATE)
    private String mantFechaIng;
    @Column(name = "mant_fecha_entrega")
    //@Temporal(TemporalType.DATE)
    private String mantFechaEntrega;
    @Column(name = "mant_fecha_revision")
   // @Temporal(TemporalType.DATE)
    private String mantFechaRevision;
    @Size(max = 1000)
    @Column(name = "mant_descrip_problema")
    private String mantDescripProblema;
    @Size(max = 1000)
    @Column(name = "mant_descrip_solucion")
    private String mantDescripSolucion;
    @Column(name = "mant_estado")
    private Integer mantEstado;
    @Size(max = 15)
    @Column(name = "mant_tipo")
    private String mantTipo;
    @JoinColumn(name = "tecn_id", referencedColumnName = "tec_id")
    @ManyToOne(optional = false)
    private Tecnico tecnId;
    @JoinColumn(name = "tip_id", referencedColumnName = "tip_id")
    @ManyToOne(optional = false)
    private Tipomantenimiento tipId;
    @JoinColumn(name = "bien_id", referencedColumnName = "bn_cod_bien")
    @ManyToOne
    private Bien bienId;

    public Mantenimiento() {
    }

    public Mantenimiento(Integer mantId) {
        this.mantId = mantId;
    }

    public Integer getMantId() {
        return mantId;
    }

    public void setMantId(Integer mantId) {
        this.mantId = mantId;
    }

    public Integer getMantNumOrden() {
        return mantNumOrden;
    }

    public void setMantNumOrden(Integer mantNumOrden) {
        this.mantNumOrden = mantNumOrden;
    }

    public String getMantFechaIng() {
        return mantFechaIng;
    }

    public void setMantFechaIng(String mantFechaIng) {
        this.mantFechaIng = mantFechaIng;
    }

    public String getMantFechaEntrega() {
        return mantFechaEntrega;
    }

    public void setMantFechaEntrega(String mantFechaEntrega) {
        this.mantFechaEntrega = mantFechaEntrega;
    }

    public String getMantFechaRevision() {
        return mantFechaRevision;
    }

    public void setMantFechaRevision(String mantFechaRevision) {
        this.mantFechaRevision = mantFechaRevision;
    }

    public String getMantDescripProblema() {
        return mantDescripProblema;
    }

    public void setMantDescripProblema(String mantDescripProblema) {
        this.mantDescripProblema = mantDescripProblema;
    }

    public String getMantDescripSolucion() {
        return mantDescripSolucion;
    }

    public void setMantDescripSolucion(String mantDescripSolucion) {
        this.mantDescripSolucion = mantDescripSolucion;
    }

    public Integer getMantEstado() {
        return mantEstado;
    }

    public void setMantEstado(Integer mantEstado) {
        this.mantEstado = mantEstado;
    }

    public String getMantTipo() {
        return mantTipo;
    }

    public void setMantTipo(String mantTipo) {
        this.mantTipo = mantTipo;
    }

    public Tecnico getTecnId() {
        return tecnId;
    }

    public void setTecnId(Tecnico tecnId) {
        this.tecnId = tecnId;
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
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mantId != null ? mantId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mantenimiento)) {
            return false;
        }
        Mantenimiento other = (Mantenimiento) object;
        if ((this.mantId == null && other.mantId != null) || (this.mantId != null && !this.mantId.equals(other.mantId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Mantenimiento[ mantId=" + mantId + " ]";
    }
    
}
