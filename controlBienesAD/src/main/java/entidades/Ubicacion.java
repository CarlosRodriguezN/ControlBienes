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
    @NamedQuery(name = "Ubicacion.findAll", query = "SELECT u FROM Ubicacion u")
    , @NamedQuery(name = "Ubicacion.findByUbId", query = "SELECT u FROM Ubicacion u WHERE u.ubId = :ubId")
    , @NamedQuery(name = "Ubicacion.findByUbDescripcion", query = "SELECT u FROM Ubicacion u WHERE u.ubDescripcion = :ubDescripcion")
    , @NamedQuery(name = "Ubicacion.findByUbEstado", query = "SELECT u FROM Ubicacion u WHERE u.ubEstado = :ubEstado")})
public class Ubicacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ub_id")
    private Integer ubId;
    @Size(max = 250)
    @Column(name = "ub_descripcion")
    private String ubDescripcion;
    @Column(name = "ub_estado")
    private Integer ubEstado;
    @OneToMany(mappedBy = "ubId")
    private Collection<Bien> bienCollection;

    public Ubicacion() {
    }

    public Ubicacion(Integer ubId) {
        this.ubId = ubId;
    }

    public Integer getUbId() {
        return ubId;
    }

    public void setUbId(Integer ubId) {
        this.ubId = ubId;
    }

    public String getUbDescripcion() {
        return ubDescripcion;
    }

    public void setUbDescripcion(String ubDescripcion) {
        this.ubDescripcion = ubDescripcion;
    }

    public Integer getUbEstado() {
        return ubEstado;
    }

    public void setUbEstado(Integer ubEstado) {
        this.ubEstado = ubEstado;
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
        hash += (ubId != null ? ubId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ubicacion)) {
            return false;
        }
        Ubicacion other = (Ubicacion) object;
        if ((this.ubId == null && other.ubId != null) || (this.ubId != null && !this.ubId.equals(other.ubId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Ubicacion[ ubId=" + ubId + " ]";
    }
    
}
