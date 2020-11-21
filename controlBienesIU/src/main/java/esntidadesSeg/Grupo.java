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
    @NamedQuery(name = "Grupo.findAll", query = "SELECT g FROM Grupo g"),
    @NamedQuery(name = "Grupo.findByIntid", query = "SELECT g FROM Grupo g WHERE g.intid = :intid"),
    @NamedQuery(name = "Grupo.findByStrnombre", query = "SELECT g FROM Grupo g WHERE g.strnombre = :strnombre"),
    @NamedQuery(name = "Grupo.findByStrdescripcion", query = "SELECT g FROM Grupo g WHERE g.strdescripcion = :strdescripcion"),
    @NamedQuery(name = "Grupo.findByIntorden", query = "SELECT g FROM Grupo g WHERE g.intorden = :intorden"),
    @NamedQuery(name = "Grupo.findByIntpadre", query = "SELECT g FROM Grupo g WHERE g.intpadre = :intpadre"),
    @NamedQuery(name = "Grupo.findByBlnactivo", query = "SELECT g FROM Grupo g WHERE g.blnactivo = :blnactivo")})
public class Grupo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "intid")
    private Integer intid;
    @Size(max = 32)
    @Column(name = "strnombre")
    private String strnombre;
    @Size(max = 1024)
    @Column(name = "strdescripcion")
    private String strdescripcion;
    @Column(name = "intorden")
    private Integer intorden;
    @Column(name = "intpadre")
    private Integer intpadre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "blnactivo")
    private boolean blnactivo;
    @OneToMany(mappedBy = "intgruId")
    private Collection<Funcion> funcionCollection;

    public Grupo() {
    }

    public Grupo(Integer intid) {
        this.intid = intid;
    }

    public Grupo(Integer intid, boolean blnactivo) {
        this.intid = intid;
        this.blnactivo = blnactivo;
    }

    public Integer getIntid() {
        return intid;
    }

    public void setIntid(Integer intid) {
        this.intid = intid;
    }

    public String getStrnombre() {
        return strnombre;
    }

    public void setStrnombre(String strnombre) {
        this.strnombre = strnombre;
    }

    public String getStrdescripcion() {
        return strdescripcion;
    }

    public void setStrdescripcion(String strdescripcion) {
        this.strdescripcion = strdescripcion;
    }

    public Integer getIntorden() {
        return intorden;
    }

    public void setIntorden(Integer intorden) {
        this.intorden = intorden;
    }

    public Integer getIntpadre() {
        return intpadre;
    }

    public void setIntpadre(Integer intpadre) {
        this.intpadre = intpadre;
    }

    public boolean getBlnactivo() {
        return blnactivo;
    }

    public void setBlnactivo(boolean blnactivo) {
        this.blnactivo = blnactivo;
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
        hash += (intid != null ? intid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Grupo)) {
            return false;
        }
        Grupo other = (Grupo) object;
        if ((this.intid == null && other.intid != null) || (this.intid != null && !this.intid.equals(other.intid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Grupo[ intid=" + intid + " ]";
    }
    
}
