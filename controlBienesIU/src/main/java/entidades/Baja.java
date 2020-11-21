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
@Table(name = "baja", catalog = "bienesdtic", schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Baja.findAll", query = "SELECT b FROM Baja b"),
    @NamedQuery(name = "Baja.findByBaId", query = "SELECT b FROM Baja b WHERE b.baId = :baId"),
    @NamedQuery(name = "Baja.findByBaDetalle", query = "SELECT b FROM Baja b WHERE b.baDetalle = :baDetalle"),
    @NamedQuery(name = "Baja.findByBaEstado", query = "SELECT b FROM Baja b WHERE b.baEstado = :baEstado")})
public class Baja implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ba_id")
    private Integer baId;
    @Size(max = 150)
    @Column(name = "ba_detalle")
    private String baDetalle;
    @Column(name = "ba_estado")
    private Integer baEstado;
    @OneToMany(mappedBy = "baId")
    private Collection<Bien> bienCollection;

    public Baja() {
    }

    public Baja(Integer baId) {
        this.baId = baId;
    }

    public Integer getBaId() {
        return baId;
    }

    public void setBaId(Integer baId) {
        this.baId = baId;
    }

    public String getBaDetalle() {
        return baDetalle;
    }

    public void setBaDetalle(String baDetalle) {
        this.baDetalle = baDetalle;
    }

    public Integer getBaEstado() {
        return baEstado;
    }

    public void setBaEstado(Integer baEstado) {
        this.baEstado = baEstado;
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
        hash += (baId != null ? baId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Baja)) {
            return false;
        }
        Baja other = (Baja) object;
        if ((this.baId == null && other.baId != null) || (this.baId != null && !this.baId.equals(other.baId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Baja[ baId=" + baId + " ]";
    }
    
}
