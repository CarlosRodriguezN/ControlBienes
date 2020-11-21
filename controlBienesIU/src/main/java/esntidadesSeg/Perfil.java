/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package esntidadesSeg;

import java.io.Serializable;
import java.math.BigInteger;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author DESARROLLO
 */
@Entity
@Table(schema = "seguridad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Perfil.findAll", query = "SELECT p FROM Perfil p"),
    @NamedQuery(name = "Perfil.findByIntid", query = "SELECT p FROM Perfil p WHERE p.intid = :intid"),
    @NamedQuery(name = "Perfil.findByLngusrId", query = "SELECT p FROM Perfil p WHERE p.lngusrId = :lngusrId"),
    @NamedQuery(name = "Perfil.findByBlnactivo", query = "SELECT p FROM Perfil p WHERE p.blnactivo = :blnactivo"),
    @NamedQuery(name = "Perfil.findByLngasignadopor", query = "SELECT p FROM Perfil p WHERE p.lngasignadopor = :lngasignadopor"),
    @NamedQuery(name = "Perfil.findByLngfechaasignacion", query = "SELECT p FROM Perfil p WHERE p.lngfechaasignacion = :lngfechaasignacion"),
    @NamedQuery(name = "Perfil.findByLngmodificadopor", query = "SELECT p FROM Perfil p WHERE p.lngmodificadopor = :lngmodificadopor"),
    @NamedQuery(name = "Perfil.findByLngfechamodificacion", query = "SELECT p FROM Perfil p WHERE p.lngfechamodificacion = :lngfechamodificacion"),
    @NamedQuery(name = "Perfil.findByStrnombretema", query = "SELECT p FROM Perfil p WHERE p.strnombretema = :strnombretema"),
    @NamedQuery(name = "Perfil.findByBlndefault", query = "SELECT p FROM Perfil p WHERE p.blndefault = :blndefault")})
public class Perfil implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "intid")
    private Integer intid;
    @Column(name = "lngusr_id")
    private BigInteger lngusrId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "blnactivo")
    private boolean blnactivo;
    @Column(name = "lngasignadopor")
    private BigInteger lngasignadopor;
    @Column(name = "lngfechaasignacion")
    private BigInteger lngfechaasignacion;
    @Column(name = "lngmodificadopor")
    private BigInteger lngmodificadopor;
    @Column(name = "lngfechamodificacion")
    private BigInteger lngfechamodificacion;
    @Size(max = 2147483647)
    @Column(name = "strnombretema")
    private String strnombretema;
    @Column(name = "blndefault")
    private Boolean blndefault;
    @JoinColumn(name = "introl_id", referencedColumnName = "intid")
    @ManyToOne
    private Rol introlId;

    public Perfil() {
    }

    public Perfil(Integer intid) {
        this.intid = intid;
    }

    public Perfil(Integer intid, boolean blnactivo) {
        this.intid = intid;
        this.blnactivo = blnactivo;
    }

    public Integer getIntid() {
        return intid;
    }

    public void setIntid(Integer intid) {
        this.intid = intid;
    }

    public BigInteger getLngusrId() {
        return lngusrId;
    }

    public void setLngusrId(BigInteger lngusrId) {
        this.lngusrId = lngusrId;
    }

    public boolean getBlnactivo() {
        return blnactivo;
    }

    public void setBlnactivo(boolean blnactivo) {
        this.blnactivo = blnactivo;
    }

    public BigInteger getLngasignadopor() {
        return lngasignadopor;
    }

    public void setLngasignadopor(BigInteger lngasignadopor) {
        this.lngasignadopor = lngasignadopor;
    }

    public BigInteger getLngfechaasignacion() {
        return lngfechaasignacion;
    }

    public void setLngfechaasignacion(BigInteger lngfechaasignacion) {
        this.lngfechaasignacion = lngfechaasignacion;
    }

    public BigInteger getLngmodificadopor() {
        return lngmodificadopor;
    }

    public void setLngmodificadopor(BigInteger lngmodificadopor) {
        this.lngmodificadopor = lngmodificadopor;
    }

    public BigInteger getLngfechamodificacion() {
        return lngfechamodificacion;
    }

    public void setLngfechamodificacion(BigInteger lngfechamodificacion) {
        this.lngfechamodificacion = lngfechamodificacion;
    }

    public String getStrnombretema() {
        return strnombretema;
    }

    public void setStrnombretema(String strnombretema) {
        this.strnombretema = strnombretema;
    }

    public Boolean getBlndefault() {
        return blndefault;
    }

    public void setBlndefault(Boolean blndefault) {
        this.blndefault = blndefault;
    }

    public Rol getIntrolId() {
        return introlId;
    }

    public void setIntrolId(Rol introlId) {
        this.introlId = introlId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (intid != null ? intid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Perfil)) {
            return false;
        }
        Perfil other = (Perfil) object;
        if ((this.intid == null && other.intid != null) || (this.intid != null && !this.intid.equals(other.intid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Perfil[ intid=" + intid + " ]";
    }
    
}
