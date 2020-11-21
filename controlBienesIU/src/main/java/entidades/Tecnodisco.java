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
 * @author Alex
 */
@Entity
@Table(name = "tecnodisco")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tecnodisco.findAll", query = "SELECT t FROM Tecnodisco t"),
    @NamedQuery(name = "Tecnodisco.findByTecId", query = "SELECT t FROM Tecnodisco t WHERE t.tecId = :tecId"),
    @NamedQuery(name = "Tecnodisco.findByTecDescripcion", query = "SELECT t FROM Tecnodisco t WHERE t.tecDescripcion = :tecDescripcion"),
    @NamedQuery(name = "Tecnodisco.findByTecEstado", query = "SELECT t FROM Tecnodisco t WHERE t.tecEstado = :tecEstado")})
public class Tecnodisco implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "tec_id")
    private Integer tecId;
    @Size(max = 100)
    @Column(name = "tec_descripcion")
    private String tecDescripcion;
    @Column(name = "tec_estado")
    private Integer tecEstado;
    @OneToMany(mappedBy = "tecnoId")
    private Collection<Bien> bienCollection;

    public Tecnodisco() {
    }

    public Tecnodisco(Integer tecId) {
        this.tecId = tecId;
    }

    public Integer getTecId() {
        return tecId;
    }

    public void setTecId(Integer tecId) {
        this.tecId = tecId;
    }

    public String getTecDescripcion() {
        return tecDescripcion;
    }

    public void setTecDescripcion(String tecDescripcion) {
        this.tecDescripcion = tecDescripcion;
    }

    public Integer getTecEstado() {
        return tecEstado;
    }

    public void setTecEstado(Integer tecEstado) {
        this.tecEstado = tecEstado;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<Bien> getBienCollection() {
        return bienCollection;
    }

    public void setBienCollection(Collection<Bien> bienCollection) {
        this.bienCollection = bienCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tecId != null ? tecId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tecnodisco)) {
            return false;
        }
        Tecnodisco other = (Tecnodisco) object;
        if ((this.tecId == null && other.tecId != null) || (this.tecId != null && !this.tecId.equals(other.tecId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Tecnodisco[ tecId=" + tecId + " ]";
    }
    
}
