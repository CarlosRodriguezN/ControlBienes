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
    @NamedQuery(name = "Motivoinforme.findAll", query = "SELECT m FROM Motivoinforme m")
    , @NamedQuery(name = "Motivoinforme.findByMotId", query = "SELECT m FROM Motivoinforme m WHERE m.motId = :motId")
    , @NamedQuery(name = "Motivoinforme.findByMotDetalle", query = "SELECT m FROM Motivoinforme m WHERE m.motDetalle = :motDetalle")
    , @NamedQuery(name = "Motivoinforme.findByMotEstado", query = "SELECT m FROM Motivoinforme m WHERE m.motEstado = :motEstado")})
public class Motivoinforme implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mot_id")
    private Integer motId;
    @Size(max = 100)
    @Column(name = "mot_detalle")
    private String motDetalle;
    @Column(name = "mot_estado")
    private Integer motEstado;
    @OneToMany(mappedBy = "motId")
    private Collection<Informe> informeCollection;

    public Motivoinforme() {
    }

    public Motivoinforme(Integer motId) {
        this.motId = motId;
    }

    public Integer getMotId() {
        return motId;
    }

    public void setMotId(Integer motId) {
        this.motId = motId;
    }

    public String getMotDetalle() {
        return motDetalle;
    }

    public void setMotDetalle(String motDetalle) {
        this.motDetalle = motDetalle;
    }

    public Integer getMotEstado() {
        return motEstado;
    }

    public void setMotEstado(Integer motEstado) {
        this.motEstado = motEstado;
    }

    @XmlTransient
    public Collection<Informe> getInformeCollection() {
        return informeCollection;
    }

    public void setInformeCollection(Collection<Informe> informeCollection) {
        this.informeCollection = informeCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (motId != null ? motId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Motivoinforme)) {
            return false;
        }
        Motivoinforme other = (Motivoinforme) object;
        if ((this.motId == null && other.motId != null) || (this.motId != null && !this.motId.equals(other.motId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Motivoinforme[ motId=" + motId + " ]";
    }
    
}
