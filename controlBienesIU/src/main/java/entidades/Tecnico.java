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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author Alex
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tecnico.findAll", query = "SELECT t FROM Tecnico t"),
    @NamedQuery(name = "Tecnico.findByTecId", query = "SELECT t FROM Tecnico t WHERE t.tecId = :tecId"),
    @NamedQuery(name = "Tecnico.findByTecCedula", query = "SELECT t FROM Tecnico t WHERE t.tecCedula = :tecCedula"),
    @NamedQuery(name = "Tecnico.findByTecNombre", query = "SELECT t FROM Tecnico t WHERE t.tecNombre = :tecNombre"),
    @NamedQuery(name = "Tecnico.findByTecDepartamento", query = "SELECT t FROM Tecnico t WHERE t.tecDepartamento = :tecDepartamento"),
    @NamedQuery(name = "Tecnico.findByTecTelefono", query = "SELECT t FROM Tecnico t WHERE t.tecTelefono = :tecTelefono"),
    @NamedQuery(name = "Tecnico.findByTecEstado", query = "SELECT t FROM Tecnico t WHERE t.tecEstado = :tecEstado")})
public class Tecnico implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "tec_id")
    private Integer tecId;
    @Size(max = 15)
    @Column(name = "tec_cedula")
    private String tecCedula;
    @Size(max = 200)
    @Column(name = "tec_nombre")
    private String tecNombre;
    @Size(max = 200)
    @Column(name = "tec_departamento")
    private String tecDepartamento;
    @Size(max = 15)
    @Column(name = "tec_telefono")
    private String tecTelefono;
    @Column(name = "tec_estado")
    private Integer tecEstado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tecnId")
    private Collection<Mantenimiento> mantenimientoCollection;

    public Tecnico() {
    }

    public Tecnico(Integer tecId) {
        this.tecId = tecId;
    }

    public Integer getTecId() {
        return tecId;
    }

    public void setTecId(Integer tecId) {
        this.tecId = tecId;
    }

    public String getTecCedula() {
        return tecCedula;
    }

    public void setTecCedula(String tecCedula) {
        this.tecCedula = tecCedula;
    }

    public String getTecNombre() {
        return tecNombre;
    }

    public void setTecNombre(String tecNombre) {
        this.tecNombre = tecNombre;
    }

    public String getTecDepartamento() {
        return tecDepartamento;
    }

    public void setTecDepartamento(String tecDepartamento) {
        this.tecDepartamento = tecDepartamento;
    }

    public String getTecTelefono() {
        return tecTelefono;
    }

    public void setTecTelefono(String tecTelefono) {
        this.tecTelefono = tecTelefono;
    }

    public Integer getTecEstado() {
        return tecEstado;
    }

    public void setTecEstado(Integer tecEstado) {
        this.tecEstado = tecEstado;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<Mantenimiento> getMantenimientoCollection() {
        return mantenimientoCollection;
    }

    public void setMantenimientoCollection(Collection<Mantenimiento> mantenimientoCollection) {
        this.mantenimientoCollection = mantenimientoCollection;
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
        if (!(object instanceof Tecnico)) {
            return false;
        }
        Tecnico other = (Tecnico) object;
        if ((this.tecId == null && other.tecId != null) || (this.tecId != null && !this.tecId.equals(other.tecId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Tecnico[ tecId=" + tecId + " ]";
    }
    
}
