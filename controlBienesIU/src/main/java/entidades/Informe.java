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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author BLADD-ESPOCH
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Informe.findAll", query = "SELECT i FROM Informe i")
    , @NamedQuery(name = "Informe.findByInfId", query = "SELECT i FROM Informe i WHERE i.infId = :infId")
    , @NamedQuery(name = "Informe.findByInfFechaElabora", query = "SELECT i FROM Informe i WHERE i.infFechaElabora = :infFechaElabora")
    , @NamedQuery(name = "Informe.findByInfTecnicoId", query = "SELECT i FROM Informe i WHERE i.infTecnicoId = :infTecnicoId")
    , @NamedQuery(name = "Informe.findByInfSolicitanteId", query = "SELECT i FROM Informe i WHERE i.infSolicitanteId = :infSolicitanteId")})
public class Informe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "inf_id")
    private Integer infId;
    @Column(name = "inf_fecha_elabora")
    private String infFechaElabora;
    @Column(name = "inf_tecnico_id")
    private Integer infTecnicoId;
    @Column(name = "inf_solicitante_id")
    private Integer infSolicitanteId;
    @JoinColumn(name = "bn_cod_bien", referencedColumnName = "bn_cod_bien")
    @ManyToOne
    private Bien bnCodBien;
    @JoinColumn(name = "mot_id", referencedColumnName = "mot_id")
    @ManyToOne
    private Motivoinforme motId;

    public Informe() {
    }

    public Informe(Integer infId) {
        this.infId = infId;
    }

    public Integer getInfId() {
        return infId;
    }

    public void setInfId(Integer infId) {
        this.infId = infId;
    }

    public String getInfFechaElabora() {
        return infFechaElabora;
    }

    public void setInfFechaElabora(String infFechaElabora) {
        this.infFechaElabora = infFechaElabora;
    }

    public Integer getInfTecnicoId() {
        return infTecnicoId;
    }

    public void setInfTecnicoId(Integer infTecnicoId) {
        this.infTecnicoId = infTecnicoId;
    }

    public Integer getInfSolicitanteId() {
        return infSolicitanteId;
    }

    public void setInfSolicitanteId(Integer infSolicitanteId) {
        this.infSolicitanteId = infSolicitanteId;
    }

    public Bien getBnCodBien() {
        return bnCodBien;
    }

    public void setBnCodBien(Bien bnCodBien) {
        this.bnCodBien = bnCodBien;
    }

    public Motivoinforme getMotId() {
        return motId;
    }

    public void setMotId(Motivoinforme motId) {
        this.motId = motId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (infId != null ? infId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Informe)) {
            return false;
        }
        Informe other = (Informe) object;
        if ((this.infId == null && other.infId != null) || (this.infId != null && !this.infId.equals(other.infId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Informe[ infId=" + infId + " ]";
    }
    
}
