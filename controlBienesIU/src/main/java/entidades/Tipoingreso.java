/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
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
 * @author BLADD-ESPOCH
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipoingreso.findAll", query = "SELECT t FROM Tipoingreso t")
    , @NamedQuery(name = "Tipoingreso.findByTiId", query = "SELECT t FROM Tipoingreso t WHERE t.tiId = :tiId")
    , @NamedQuery(name = "Tipoingreso.findByTiDetalle", query = "SELECT t FROM Tipoingreso t WHERE t.tiDetalle = :tiDetalle")
    , @NamedQuery(name = "Tipoingreso.findByTiEstado", query = "SELECT t FROM Tipoingreso t WHERE t.tiEstado = :tiEstado")})
public class Tipoingreso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ti_id")
    private Integer tiId;
    @Size(max = 100)
    @Column(name = "ti_detalle")
    private String tiDetalle;
    @Column(name = "ti_estado")
    private Integer tiEstado;
    @OneToMany(mappedBy = "tiId")
    private Collection<Bien> bienCollection;

    public Tipoingreso() {
    }

    public Tipoingreso(Integer tiId) {
        this.tiId = tiId;
    }

    public Integer getTiId() {
        return tiId;
    }

    public void setTiId(Integer tiId) {
        this.tiId = tiId;
    }

    public String getTiDetalle() {
        return tiDetalle;
    }

    public void setTiDetalle(String tiDetalle) {
        this.tiDetalle = tiDetalle;
    }

    public Integer getTiEstado() {
        return tiEstado;
    }

    public void setTiEstado(Integer tiEstado) {
        this.tiEstado = tiEstado;
    }

    @XmlTransient
    public Collection<Bien> getBienCollection() {
        return bienCollection;
    }

    public void setBienCollection(Collection<Bien> bienCollection) {
        this.bienCollection = bienCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tiId != null ? tiId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoingreso)) {
            return false;
        }
        Tipoingreso other = (Tipoingreso) object;
        if ((this.tiId == null && other.tiId != null) || (this.tiId != null && !this.tiId.equals(other.tiId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Tipoingreso[ tiId=" + tiId + " ]";
    }
    
}
