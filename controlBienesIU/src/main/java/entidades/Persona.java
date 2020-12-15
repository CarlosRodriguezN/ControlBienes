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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
 * @author BLADD-ESPOCH
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Persona.findAll", query = "SELECT p FROM Persona p")
    , @NamedQuery(name = "Persona.findByPerId", query = "SELECT p FROM Persona p WHERE p.perId = :perId")
    , @NamedQuery(name = "Persona.findByPerCedula", query = "SELECT p FROM Persona p WHERE p.perCedula = :perCedula")
    , @NamedQuery(name = "Persona.findByPerNombres", query = "SELECT p FROM Persona p WHERE p.perNombres = :perNombres")
    , @NamedQuery(name = "Persona.findByPerApellido1", query = "SELECT p FROM Persona p WHERE p.perApellido1 = :perApellido1")
    , @NamedQuery(name = "Persona.findByPerApellido2", query = "SELECT p FROM Persona p WHERE p.perApellido2 = :perApellido2")
    , @NamedQuery(name = "Persona.findByPerEmail", query = "SELECT p FROM Persona p WHERE p.perEmail = :perEmail")
    , @NamedQuery(name = "Persona.findByPerTelefono", query = "SELECT p FROM Persona p WHERE p.perTelefono = :perTelefono")
    , @NamedQuery(name = "Persona.findByPerEstado", query = "SELECT p FROM Persona p WHERE p.perEstado = :perEstado")
    , @NamedQuery(name = "Persona.findByPerRol", query = "SELECT p FROM Persona p WHERE p.perRol = :perRol")})
public class Persona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "per_id")
    private Integer perId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "per_cedula")
    private String perCedula;
    @Size(max = 100)
    @Column(name = "per_nombres")
    private String perNombres;
    @Size(max = 100)
    @Column(name = "per_apellido1")
    private String perApellido1;
    @Size(max = 100)
    @Column(name = "per_apellido2")
    private String perApellido2;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "per_email")
    private String perEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "per_telefono")
    private String perTelefono;
    @Column(name = "per_estado")
    private Integer perEstado;
    @Size(max = 100)
    @Column(name = "per_rol")
    private String perRol;
    @OneToMany(mappedBy = "perId")
    private Collection<Traspaso> traspasoCollection;
    @JoinColumn(name = "car_id", referencedColumnName = "car_id")
    @ManyToOne
    private Cargo carId;
    @OneToMany(mappedBy = "perId")
    private Collection<Personapermiso> personapermisoCollection;

    public Persona() {
    }

    public Persona(Integer perId) {
        this.perId = perId;
    }

    public Persona(Integer perId, String perCedula, String perEmail, String perTelefono) {
        this.perId = perId;
        this.perCedula = perCedula;
        this.perEmail = perEmail;
        this.perTelefono = perTelefono;
    }

    public Integer getPerId() {
        return perId;
    }

    public void setPerId(Integer perId) {
        this.perId = perId;
    }

    public String getPerCedula() {
        return perCedula;
    }

    public void setPerCedula(String perCedula) {
        this.perCedula = perCedula;
    }

    public String getPerNombres() {
        return perNombres;
    }

    public void setPerNombres(String perNombres) {
        this.perNombres = perNombres;
    }

    public String getPerApellido1() {
        return perApellido1;
    }

    public void setPerApellido1(String perApellido1) {
        this.perApellido1 = perApellido1;
    }

    public String getPerApellido2() {
        return perApellido2;
    }

    public void setPerApellido2(String perApellido2) {
        this.perApellido2 = perApellido2;
    }

    public String getPerEmail() {
        return perEmail;
    }

    public void setPerEmail(String perEmail) {
        this.perEmail = perEmail;
    }

    public String getPerTelefono() {
        return perTelefono;
    }

    public void setPerTelefono(String perTelefono) {
        this.perTelefono = perTelefono;
    }

    public Integer getPerEstado() {
        return perEstado;
    }

    public void setPerEstado(Integer perEstado) {
        this.perEstado = perEstado;
    }

    public String getPerRol() {
        return perRol;
    }

    public void setPerRol(String perRol) {
        this.perRol = perRol;
    }
    
    @XmlTransient
    public Collection<Traspaso> getTraspasoCollection() {
        return traspasoCollection;
    }

    public void setTraspasoCollection(Collection<Traspaso> traspasoCollection) {
        this.traspasoCollection = traspasoCollection;
    }

    public Cargo getCarId() {
        return carId;
    }

    public void setCarId(Cargo carId) {
        this.carId = carId;
    }

    @XmlTransient
    public Collection<Personapermiso> getPersonapermisoCollection() {
        return personapermisoCollection;
    }

    public void setPersonapermisoCollection(Collection<Personapermiso> personapermisoCollection) {
        this.personapermisoCollection = personapermisoCollection;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (perId != null ? perId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Persona)) {
            return false;
        }
        Persona other = (Persona) object;
        if ((this.perId == null && other.perId != null) || (this.perId != null && !this.perId.equals(other.perId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Persona[ perId=" + perId + " ]";
    }
    
}
