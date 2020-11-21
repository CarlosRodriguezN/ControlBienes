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
    @NamedQuery(name = "Rol.findAll", query = "SELECT r FROM Rol r"),
    @NamedQuery(name = "Rol.findByIntid", query = "SELECT r FROM Rol r WHERE r.intid = :intid"),
    @NamedQuery(name = "Rol.findByStrcodigo", query = "SELECT r FROM Rol r WHERE r.strcodigo = :strcodigo"),
    @NamedQuery(name = "Rol.findByStrnombre", query = "SELECT r FROM Rol r WHERE r.strnombre = :strnombre"),
    @NamedQuery(name = "Rol.findByStrdescripcion", query = "SELECT r FROM Rol r WHERE r.strdescripcion = :strdescripcion"),
    @NamedQuery(name = "Rol.findByBlnactivo", query = "SELECT r FROM Rol r WHERE r.blnactivo = :blnactivo")})
public class Rol implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "intid")
    private Integer intid;
    @Size(max = 4)
    @Column(name = "strcodigo")
    private String strcodigo;
    @Size(max = 32)
    @Column(name = "strnombre")
    private String strnombre;
    @Size(max = 1024)
    @Column(name = "strdescripcion")
    private String strdescripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "blnactivo")
    private boolean blnactivo;
    @OneToMany(mappedBy = "introlId")
    private Collection<Funcion> funcionCollection;
    @OneToMany(mappedBy = "introlId")
    private Collection<Perfil> perfilCollection;

    public Rol() {
    }

    public Rol(Integer intid) {
        this.intid = intid;
    }

    public Rol(Integer intid, boolean blnactivo) {
        this.intid = intid;
        this.blnactivo = blnactivo;
    }

    public Integer getIntid() {
        return intid;
    }

    public void setIntid(Integer intid) {
        this.intid = intid;
    }

    public String getStrcodigo() {
        return strcodigo;
    }

    public void setStrcodigo(String strcodigo) {
        this.strcodigo = strcodigo;
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

    @XmlTransient
    public Collection<Perfil> getPerfilCollection() {
        return perfilCollection;
    }

    public void setPerfilCollection(Collection<Perfil> perfilCollection) {
        this.perfilCollection = perfilCollection;
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
        if (!(object instanceof Rol)) {
            return false;
        }
        Rol other = (Rol) object;
        if ((this.intid == null && other.intid != null) || (this.intid != null && !this.intid.equals(other.intid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Rol[ intid=" + intid + " ]";
    }
    
}
