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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Toshiba
 */
@Entity
@Table(schema = "controlbien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Auditoria.findAll", query = "SELECT a FROM Auditoria a")
    , @NamedQuery(name = "Auditoria.findByAudId", query = "SELECT a FROM Auditoria a WHERE a.audId = :audId")
    , @NamedQuery(name = "Auditoria.findByUsuId", query = "SELECT a FROM Auditoria a WHERE a.usuId = :usuId")
    , @NamedQuery(name = "Auditoria.findByAudMetodo", query = "SELECT a FROM Auditoria a WHERE a.audMetodo = :audMetodo")
    , @NamedQuery(name = "Auditoria.findByAudDetalle", query = "SELECT a FROM Auditoria a WHERE a.audDetalle = :audDetalle")
    , @NamedQuery(name = "Auditoria.findByAudFecha", query = "SELECT a FROM Auditoria a WHERE a.audFecha = :audFecha")
    , @NamedQuery(name = "Auditoria.findByAudIp", query = "SELECT a FROM Auditoria a WHERE a.audIp = :audIp")
    , @NamedQuery(name = "Auditoria.findByAudMac", query = "SELECT a FROM Auditoria a WHERE a.audMac = :audMac")
    , @NamedQuery(name = "Auditoria.findByAudDatosmod", query = "SELECT a FROM Auditoria a WHERE a.audDatosmod = :audDatosmod")})
public class Auditoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "aud_id")
    private Integer audId;
    @Size(max = 20)
    @Column(name = "usu_id")
    private String usuId;
    @Size(max = 100)
    @Column(name = "aud_metodo")
    private String audMetodo;
    @Size(max = 300)
    @Column(name = "aud_detalle")
    private String audDetalle;
    @Size(max = 100)
    @Column(name = "aud_fecha")
    private String audFecha;
    @Size(max = 100)
    @Column(name = "aud_ip")
    private String audIp;
    @Size(max = 100)
    @Column(name = "aud_mac")
    private String audMac;
    @Size(max = 300)
    @Column(name = "aud_datosmod")
    private String audDatosmod;

    public Auditoria() {
    }

    public Auditoria(Integer audId) {
        this.audId = audId;
    }

    public Integer getAudId() {
        return audId;
    }

    public void setAudId(Integer audId) {
        this.audId = audId;
    }

    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getAudMetodo() {
        return audMetodo;
    }

    public void setAudMetodo(String audMetodo) {
        this.audMetodo = audMetodo;
    }

    public String getAudDetalle() {
        return audDetalle;
    }

    public void setAudDetalle(String audDetalle) {
        this.audDetalle = audDetalle;
    }

    public String getAudFecha() {
        return audFecha;
    }

    public void setAudFecha(String audFecha) {
        this.audFecha = audFecha;
    }

    public String getAudIp() {
        return audIp;
    }

    public void setAudIp(String audIp) {
        this.audIp = audIp;
    }

    public String getAudMac() {
        return audMac;
    }

    public void setAudMac(String audMac) {
        this.audMac = audMac;
    }

    public String getAudDatosmod() {
        return audDatosmod;
    }

    public void setAudDatosmod(String audDatosmod) {
        this.audDatosmod = audDatosmod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (audId != null ? audId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Auditoria)) {
            return false;
        }
        Auditoria other = (Auditoria) object;
        if ((this.audId == null && other.audId != null) || (this.audId != null && !this.audId.equals(other.audId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Auditoria[ audId=" + audId + " ]";
    }
    
}
