/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Alex
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipomantenimiento.findAll", query = "SELECT t FROM Tipomantenimiento t"),
    @NamedQuery(name = "Tipomantenimiento.findByTipId", query = "SELECT t FROM Tipomantenimiento t WHERE t.tipId = :tipId"),
    @NamedQuery(name = "Tipomantenimiento.findByTipDetalle", query = "SELECT t FROM Tipomantenimiento t WHERE t.tipDetalle = :tipDetalle"),
    @NamedQuery(name = "Tipomantenimiento.findByTipEstado", query = "SELECT t FROM Tipomantenimiento t WHERE t.tipEstado = :tipEstado")})
public class Tipomantenimiento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "tip_id")
    private Integer tipId;
    @Size(max = 200)
    @Column(name = "tip_detalle")
    private String tipDetalle;
    @Column(name = "tip_estado")
    private Integer tipEstado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipId")
    private Collection<Mantenimiento> mantenimientoCollection;

    public Tipomantenimiento() {
    }

    public Tipomantenimiento(Integer tipId) {
        this.tipId = tipId;
    }

    public Integer getTipId() {
        return tipId;
    }

    public void setTipId(Integer tipId) {
        this.tipId = tipId;
    }

    public String getTipDetalle() {
        return tipDetalle;
    }

    public void setTipDetalle(String tipDetalle) {
        this.tipDetalle = tipDetalle;
    }

    public Integer getTipEstado() {
        return tipEstado;
    }

    public void setTipEstado(Integer tipEstado) {
        this.tipEstado = tipEstado;
    }

    @XmlTransient
    public Collection<Mantenimiento> getMantenimientoCollection() {
        return mantenimientoCollection;
    }

    public void setMantenimientoCollection(Collection<Mantenimiento> mantenimientoCollection) {
        this.mantenimientoCollection = mantenimientoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tipId != null ? tipId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipomantenimiento)) {
            return false;
        }
        Tipomantenimiento other = (Tipomantenimiento) object;
        if ((this.tipId == null && other.tipId != null) || (this.tipId != null && !this.tipId.equals(other.tipId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Tipomantenimiento[ tipId=" + tipId + " ]";
    }
    
}
