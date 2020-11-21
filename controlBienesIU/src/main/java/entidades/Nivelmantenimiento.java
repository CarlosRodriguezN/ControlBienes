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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author kuri
 */
@Entity
@Table(name = "nivelmantenimiento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Nivelmantenimiento.findAll", query = "SELECT n FROM Nivelmantenimiento n")
    , @NamedQuery(name = "Nivelmantenimiento.findByNivelId", query = "SELECT n FROM Nivelmantenimiento n WHERE n.nivelId = :nivelId")
    , @NamedQuery(name = "Nivelmantenimiento.findByNivelDescripcion", query = "SELECT n FROM Nivelmantenimiento n WHERE n.nivelDescripcion = :nivelDescripcion")
    , @NamedQuery(name = "Nivelmantenimiento.findByNivelEstado", query = "SELECT n FROM Nivelmantenimiento n WHERE n.nivelEstado = :nivelEstado")
})
public class Nivelmantenimiento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "nivel_id")
    private Integer nivelId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nivel_descripcion")
    private String nivelDescripcion;
    @Column(name = "nivel_estado")
    private Integer nivelEstado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nivelmId")
    private Collection<Mantenimientos> mantenimientosCollection;

    public Nivelmantenimiento() {
    }

    public Nivelmantenimiento(Integer nivelId) {
        this.nivelId = nivelId;
    }

    public Nivelmantenimiento(Integer nivelId, String nivelDescripcion) {
        this.nivelId = nivelId;
        this.nivelDescripcion = nivelDescripcion;
    }

    public Integer getNivelId() {
        return nivelId;
    }

    public void setNivelId(Integer nivelId) {
        this.nivelId = nivelId;
    }

    public String getNivelDescripcion() {
        return nivelDescripcion;
    }

    public void setNivelDescripcion(String nivelDescripcion) {
        this.nivelDescripcion = nivelDescripcion;
    }

    public Integer getNivelEstado() {
        return nivelEstado;
    }

    public void setNivelEstado(Integer nivelEstado) {
        this.nivelEstado = nivelEstado;
    }

    @XmlTransient
    public Collection<Mantenimientos> getMantenimientosCollection() {
        return mantenimientosCollection;
    }

    public void setMantenimientosCollection(Collection<Mantenimientos> mantenimientosCollection) {
        this.mantenimientosCollection = mantenimientosCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nivelId != null ? nivelId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Nivelmantenimiento)) {
            return false;
        }
        Nivelmantenimiento other = (Nivelmantenimiento) object;
        if ((this.nivelId == null && other.nivelId != null) || (this.nivelId != null && !this.nivelId.equals(other.nivelId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Nivelmantenimiento[ nivelId=" + nivelId + " ]";
    }

}
