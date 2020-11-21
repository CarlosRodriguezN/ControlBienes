/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Alex
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Catalogo.findAll", query = "SELECT c FROM Catalogo c"),
    @NamedQuery(name = "Catalogo.findByCtDescripcion", query = "SELECT c FROM Catalogo c WHERE c.ctDescripcion = :ctDescripcion"),
    @NamedQuery(name = "Catalogo.findByCtEstado", query = "SELECT c FROM Catalogo c WHERE c.ctEstado = :ctEstado"),
    @NamedQuery(name = "Catalogo.findByCtId", query = "SELECT c FROM Catalogo c WHERE c.ctId = :ctId")})
public class Catalogo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Size(max = 500)
    @Column(name = "ct_descripcion")
    private String ctDescripcion;
    @Column(name = "ct_estado")
    private Integer ctEstado;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "ct_id")
    private String ctId;

    public Catalogo() {
    }

    public Catalogo(String ctId) {
        this.ctId = ctId;
    }

    public String getCtDescripcion() {
        return ctDescripcion;
    }

    public void setCtDescripcion(String ctDescripcion) {
        this.ctDescripcion = ctDescripcion;
    }

    public Integer getCtEstado() {
        return ctEstado;
    }

    public void setCtEstado(Integer ctEstado) {
        this.ctEstado = ctEstado;
    }

    public String getCtId() {
        return ctId;
    }

    public void setCtId(String ctId) {
        this.ctId = ctId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ctId != null ? ctId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Catalogo)) {
            return false;
        }
        Catalogo other = (Catalogo) object;
        if ((this.ctId == null && other.ctId != null) || (this.ctId != null && !this.ctId.equals(other.ctId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Catalogo[ ctId=" + ctId + " ]";
    }
    
}
