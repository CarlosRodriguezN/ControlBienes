/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author BLADD-ESPOCH
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Traspaso.findAll", query = "SELECT t FROM Traspaso t")
    , @NamedQuery(name = "Traspaso.findByTraId", query = "SELECT t FROM Traspaso t WHERE t.traId = :traId")
    , @NamedQuery(name = "Traspaso.findByTraFechaInicio", query = "SELECT t FROM Traspaso t WHERE t.traFechaInicio = :traFechaInicio")
    , @NamedQuery(name = "Traspaso.findByTraFechaFin", query = "SELECT t FROM Traspaso t WHERE t.traFechaFin = :traFechaFin")
    , @NamedQuery(name = "Traspaso.findByTraEstado", query = "SELECT t FROM Traspaso t WHERE t.traEstado = :traEstado")})
public class Traspaso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "tra_id")
    private Integer traId;
    @Column(name = "tra_fecha_inicio")
    private String traFechaInicio;
    @Column(name = "tra_fecha_fin")
    private String traFechaFin;
    @Column(name = "tra_estado")
    private Integer traEstado;
    @Size(max = 500)
    @Column(name = "tra_observacion")
    private String traObservacion;
    @JoinColumn(name = "bn_cod_bien", referencedColumnName = "bn_cod_bien")
    @ManyToOne
    private Bien bnCodBien;
    @JoinColumn(name = "per_id", referencedColumnName = "per_id")
    @ManyToOne
    private Persona perId;

    public Traspaso() {
    }

    public Traspaso(Integer traId) {
        this.traId = traId;
    }

    public Integer getTraId() {
        return traId;
    }

    public void setTraId(Integer traId) {
        this.traId = traId;
    }

    public String getTraFechaInicio() {
        return traFechaInicio;
    }

    public void setTraFechaInicio(String traFechaInicio) {
        this.traFechaInicio = traFechaInicio;
    }

    public String getTraFechaFin() {
        return traFechaFin;
    }

    public void setTraFechaFin(String traFechaFin) {
        this.traFechaFin = traFechaFin;
    }

    public Integer getTraEstado() {
        return traEstado;
    }

    public void setTraEstado(Integer traEstado) {
        this.traEstado = traEstado;
    }

    public Bien getBnCodBien() {
        return bnCodBien;
    }

    public void setBnCodBien(Bien bnCodBien) {
        this.bnCodBien = bnCodBien;
    }
    
    public String getTraObservacion() {
        return traObservacion;
    }

    public void setTraObservacion(String traObservacion) {
        this.traObservacion = traObservacion;
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
        hash += (traId != null ? traId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Traspaso)) {
            return false;
        }
        Traspaso other = (Traspaso) object;
        if ((this.traId == null && other.traId != null) || (this.traId != null && !this.traId.equals(other.traId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Traspaso[ traId=" + traId + " ]";
    }
    
}
