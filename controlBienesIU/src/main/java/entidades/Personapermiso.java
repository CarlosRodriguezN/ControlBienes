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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Toshiba
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personapermiso.findAll", query = "SELECT p FROM Personapermiso p")
    , @NamedQuery(name = "Personapermiso.findByIdPerPm", query = "SELECT p FROM Personapermiso p WHERE p.idPerPm = :idPerPm")
    , @NamedQuery(name = "Personapermiso.findByPerpmEstado", query = "SELECT p FROM Personapermiso p WHERE p.perpmEstado = :perpmEstado")})
public class Personapermiso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_per_pm")
    private Integer idPerPm;
    @Column(name = "perpm_estado")
    private Boolean perpmEstado;
    @JoinColumn(name = "pm_id", referencedColumnName = "pm_id")
    @ManyToOne
    private Permiso pmId;
    @JoinColumn(name = "per_id", referencedColumnName = "per_id")
    @ManyToOne
    private Persona perId;

    public Personapermiso() {
    }

    public Personapermiso(Integer idPerPm) {
        this.idPerPm = idPerPm;
    }

    public Integer getIdPerPm() {
        return idPerPm;
    }

    public void setIdPerPm(Integer idPerPm) {
        this.idPerPm = idPerPm;
    }

    public Boolean getPerpmEstado() {
        return perpmEstado;
    }

    public void setPerpmEstado(Boolean perpmEstado) {
        this.perpmEstado = perpmEstado;
    }

    public Permiso getPmId() {
        return pmId;
    }

    public void setPmId(Permiso pmId) {
        this.pmId = pmId;
    }

    public Persona getPerId() {
        return perId;
    }

    public void setPerId(Persona perId) {
        this.perId = perId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPerPm != null ? idPerPm.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Personapermiso)) {
            return false;
        }
        Personapermiso other = (Personapermiso) object;
        if ((this.idPerPm == null && other.idPerPm != null) || (this.idPerPm != null && !this.idPerPm.equals(other.idPerPm))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Personapermiso[ idPerPm=" + idPerPm + " ]";
    }
    
}
