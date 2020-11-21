/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package esntidadesSeg;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author DESARROLLO
 */
@Entity
@Table(schema = "seguridad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sistema.findAll", query = "SELECT s FROM Sistema s"),
    @NamedQuery(name = "Sistema.findBySisId", query = "SELECT s FROM Sistema s WHERE s.sisId = :sisId"),
    @NamedQuery(name = "Sistema.findBySisCodigo", query = "SELECT s FROM Sistema s WHERE s.sisCodigo = :sisCodigo"),
    @NamedQuery(name = "Sistema.findBySisNombre", query = "SELECT s FROM Sistema s WHERE s.sisNombre = :sisNombre"),
    @NamedQuery(name = "Sistema.findBySisDescripcion", query = "SELECT s FROM Sistema s WHERE s.sisDescripcion = :sisDescripcion"),
    @NamedQuery(name = "Sistema.findBySisBlnactivo", query = "SELECT s FROM Sistema s WHERE s.sisBlnactivo = :sisBlnactivo")})
public class Sistema implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sis_id")
    private Integer sisId;
    @Size(max = 4)
    @Column(name = "sis_codigo")
    private String sisCodigo;
    @Size(max = 32)
    @Column(name = "sis_nombre")
    private String sisNombre;
    @Size(max = 1024)
    @Column(name = "sis_descripcion")
    private String sisDescripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "sis_blnactivo")
    private boolean sisBlnactivo;
    @OneToMany(mappedBy = "sisId")
    private Collection<Funcion> funcionCollection;

    public Sistema() {
    }

    public Sistema(Integer sisId) {
        this.sisId = sisId;
    }

    public Sistema(Integer sisId, boolean sisBlnactivo) {
        this.sisId = sisId;
        this.sisBlnactivo = sisBlnactivo;
    }

    public Integer getSisId() {
        return sisId;
    }

    public void setSisId(Integer sisId) {
        this.sisId = sisId;
    }

    public String getSisCodigo() {
        return sisCodigo;
    }

    public void setSisCodigo(String sisCodigo) {
        this.sisCodigo = sisCodigo;
    }

    public String getSisNombre() {
        return sisNombre;
    }

    public void setSisNombre(String sisNombre) {
        this.sisNombre = sisNombre;
    }

    public String getSisDescripcion() {
        return sisDescripcion;
    }

    public void setSisDescripcion(String sisDescripcion) {
        this.sisDescripcion = sisDescripcion;
    }

    public boolean getSisBlnactivo() {
        return sisBlnactivo;
    }

    public void setSisBlnactivo(boolean sisBlnactivo) {
        this.sisBlnactivo = sisBlnactivo;
    }

    @XmlTransient
    public Collection<Funcion> getFuncionCollection() {
        return funcionCollection;
    }

    public void setFuncionCollection(Collection<Funcion> funcionCollection) {
        this.funcionCollection = funcionCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sisId != null ? sisId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sistema)) {
            return false;
        }
        Sistema other = (Sistema) object;
        if ((this.sisId == null && other.sisId != null) || (this.sisId != null && !this.sisId.equals(other.sisId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Sistema[ sisId=" + sisId + " ]";
    }
    
}
