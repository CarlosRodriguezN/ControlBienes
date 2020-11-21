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
    @NamedQuery(name = "Dependencia.findAll", query = "SELECT d FROM Dependencia d")
    , @NamedQuery(name = "Dependencia.findByDpId", query = "SELECT d FROM Dependencia d WHERE d.dpId = :dpId")
    , @NamedQuery(name = "Dependencia.findByDpDescripcion", query = "SELECT d FROM Dependencia d WHERE d.dpDescripcion = :dpDescripcion")
    , @NamedQuery(name = "Dependencia.findByDpEstado", query = "SELECT d FROM Dependencia d WHERE d.dpEstado = :dpEstado")})
public class Dependencia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "dp_id")
    private Integer dpId;
    @Size(max = 250)
    @Column(name = "dp_descripcion")
    private String dpDescripcion;
    @Column(name = "dp_estado")
    private Integer dpEstado;
    @OneToMany(mappedBy = "dpId")
    private Collection<Bien> bienCollection;

    public Dependencia() {
    }

    public Dependencia(Integer dpId) {
        this.dpId = dpId;
    }

    public Integer getDpId() {
        return dpId;
    }

    public void setDpId(Integer dpId) {
        this.dpId = dpId;
    }

    public String getDpDescripcion() {
        return dpDescripcion;
    }

    public void setDpDescripcion(String dpDescripcion) {
        this.dpDescripcion = dpDescripcion;
    }

    public Integer getDpEstado() {
        return dpEstado;
    }

    public void setDpEstado(Integer dpEstado) {
        this.dpEstado = dpEstado;
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
        hash += (dpId != null ? dpId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Dependencia)) {
            return false;
        }
        Dependencia other = (Dependencia) object;
        if ((this.dpId == null && other.dpId != null) || (this.dpId != null && !this.dpId.equals(other.dpId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Dependencia[ dpId=" + dpId + " ]";
    }
    
}
