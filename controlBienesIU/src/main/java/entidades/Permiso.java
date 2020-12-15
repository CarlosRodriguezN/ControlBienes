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
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author Toshiba
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Permiso.findAll", query = "SELECT p FROM Permiso p")
    , @NamedQuery(name = "Permiso.findByPmId", query = "SELECT p FROM Permiso p WHERE p.pmId = :pmId")
    , @NamedQuery(name = "Permiso.findByPmCodigo", query = "SELECT p FROM Permiso p WHERE p.pmCodigo = :pmCodigo")
    , @NamedQuery(name = "Permiso.findByPmNombre", query = "SELECT p FROM Permiso p WHERE p.pmNombre = :pmNombre")})
public class Permiso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pm_id")
    private Integer pmId;
    @Size(max = 50)
    @Column(name = "pm_codigo")
    private String pmCodigo;
    @Size(max = 500)
    @Column(name = "pm_nombre")
    private String pmNombre;
    @OneToMany(mappedBy = "pmId")
    private Collection<Personapermiso> personapermisoCollection;

    public Permiso() {
    }

    public Permiso(Integer pmId) {
        this.pmId = pmId;
    }

    public Integer getPmId() {
        return pmId;
    }

    public void setPmId(Integer pmId) {
        this.pmId = pmId;
    }

    public String getPmCodigo() {
        return pmCodigo;
    }

    public void setPmCodigo(String pmCodigo) {
        this.pmCodigo = pmCodigo;
    }

    public String getPmNombre() {
        return pmNombre;
    }

    public void setPmNombre(String pmNombre) {
        this.pmNombre = pmNombre;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<Personapermiso> getPersonapermisoCollection() {
        return personapermisoCollection;
    }

    public void setPersonapermisoCollection(Collection<Personapermiso> personapermisoCollection) {
        this.personapermisoCollection = personapermisoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pmId != null ? pmId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Permiso)) {
            return false;
        }
        Permiso other = (Permiso) object;
        if ((this.pmId == null && other.pmId != null) || (this.pmId != null && !this.pmId.equals(other.pmId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Permiso[ pmId=" + pmId + " ]";
    }
    
}
