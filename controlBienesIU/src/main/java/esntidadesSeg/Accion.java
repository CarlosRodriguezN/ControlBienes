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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author DESARROLLO
 */
@Entity
@Table( schema = "seguridad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accion.findAll", query = "SELECT a FROM Accion a"),
    @NamedQuery(name = "Accion.findByIntid", query = "SELECT a FROM Accion a WHERE a.intid = :intid"),
    @NamedQuery(name = "Accion.findByStrtitulo", query = "SELECT a FROM Accion a WHERE a.strtitulo = :strtitulo"),
    @NamedQuery(name = "Accion.findByStrdescripcion", query = "SELECT a FROM Accion a WHERE a.strdescripcion = :strdescripcion"),
    @NamedQuery(name = "Accion.findByStrurl", query = "SELECT a FROM Accion a WHERE a.strurl = :strurl"),
    @NamedQuery(name = "Accion.findByBlnactivo", query = "SELECT a FROM Accion a WHERE a.blnactivo = :blnactivo")})
public class Accion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "intid")
    private Integer intid;
    @Size(max = 2147483647)
    @Column(name = "strtitulo")
    private String strtitulo;
    @Size(max = 2147483647)
    @Column(name = "strdescripcion")
    private String strdescripcion;
    @Size(max = 2147483647)
    @Column(name = "strurl")
    private String strurl;
    @Column(name = "blnactivo")
    private Boolean blnactivo;
    @OneToMany(mappedBy = "intaccId")
    private Collection<Funcion> funcionCollection;

    public Accion() {
    }

    public Accion(Integer intid) {
        this.intid = intid;
    }

    public Integer getIntid() {
        return intid;
    }

    public void setIntid(Integer intid) {
        this.intid = intid;
    }

    public String getStrtitulo() {
        return strtitulo;
    }

    public void setStrtitulo(String strtitulo) {
        this.strtitulo = strtitulo;
    }

    public String getStrdescripcion() {
        return strdescripcion;
    }

    public void setStrdescripcion(String strdescripcion) {
        this.strdescripcion = strdescripcion;
    }

    public String getStrurl() {
        return strurl;
    }

    public void setStrurl(String strurl) {
        this.strurl = strurl;
    }

    public Boolean getBlnactivo() {
        return blnactivo;
    }

    public void setBlnactivo(Boolean blnactivo) {
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
        if (!(object instanceof Accion)) {
            return false;
        }
        Accion other = (Accion) object;
        if ((this.intid == null && other.intid != null) || (this.intid != null && !this.intid.equals(other.intid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Accion[ intid=" + intid + " ]";
    }
    
}
