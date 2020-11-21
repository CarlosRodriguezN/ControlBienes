/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package esntidadesSeg;

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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author DESARROLLO
 */
@Entity
@Table(schema = "seguridad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Funcion.findAll", query = "SELECT f FROM Funcion f"),
    @NamedQuery(name = "Funcion.findByIntid", query = "SELECT f FROM Funcion f WHERE f.intid = :intid"),
    @NamedQuery(name = "Funcion.findByIntorden", query = "SELECT f FROM Funcion f WHERE f.intorden = :intorden"),
    @NamedQuery(name = "Funcion.findByBlnactivo", query = "SELECT f FROM Funcion f WHERE f.blnactivo = :blnactivo"),
    @NamedQuery(name = "Funcion.findByBlnpermisoagregar", query = "SELECT f FROM Funcion f WHERE f.blnpermisoagregar = :blnpermisoagregar"),
    @NamedQuery(name = "Funcion.findByBlnpermisoeditar", query = "SELECT f FROM Funcion f WHERE f.blnpermisoeditar = :blnpermisoeditar"),
    @NamedQuery(name = "Funcion.findByBlnpermisoeliminar", query = "SELECT f FROM Funcion f WHERE f.blnpermisoeliminar = :blnpermisoeliminar")})
public class Funcion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "intid")
    private Integer intid;
    @Column(name = "intorden")
    private Integer intorden;
    @Basic(optional = false)
    @NotNull
    @Column(name = "blnactivo")
    private boolean blnactivo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "blnpermisoagregar")
    private boolean blnpermisoagregar;
    @Basic(optional = false)
    @NotNull
    @Column(name = "blnpermisoeditar")
    private boolean blnpermisoeditar;
    @Basic(optional = false)
    @NotNull
    @Column(name = "blnpermisoeliminar")
    private boolean blnpermisoeliminar;
    @JoinColumn(name = "intacc_id", referencedColumnName = "intid")
    @ManyToOne
    private Accion intaccId;
    @JoinColumn(name = "intgru_id", referencedColumnName = "intid")
    @ManyToOne
    private Grupo intgruId;
    @JoinColumn(name = "introl_id", referencedColumnName = "intid")
    @ManyToOne
    private Rol introlId;
    @JoinColumn(name = "sis_id", referencedColumnName = "sis_id")
    @ManyToOne
    private Sistema sisId;
    @JoinColumn(name = "usu_id", referencedColumnName = "usu_id")
    @ManyToOne
    private Usuario usuId;

    public Funcion() {
    }

    public Funcion(Integer intid) {
        this.intid = intid;
    }

    public Funcion(Integer intid, boolean blnactivo, boolean blnpermisoagregar, boolean blnpermisoeditar, boolean blnpermisoeliminar) {
        this.intid = intid;
        this.blnactivo = blnactivo;
        this.blnpermisoagregar = blnpermisoagregar;
        this.blnpermisoeditar = blnpermisoeditar;
        this.blnpermisoeliminar = blnpermisoeliminar;
    }

    public Integer getIntid() {
        return intid;
    }

    public void setIntid(Integer intid) {
        this.intid = intid;
    }

    public Integer getIntorden() {
        return intorden;
    }

    public void setIntorden(Integer intorden) {
        this.intorden = intorden;
    }

    public boolean getBlnactivo() {
        return blnactivo;
    }

    public void setBlnactivo(boolean blnactivo) {
        this.blnactivo = blnactivo;
    }

    public boolean getBlnpermisoagregar() {
        return blnpermisoagregar;
    }

    public void setBlnpermisoagregar(boolean blnpermisoagregar) {
        this.blnpermisoagregar = blnpermisoagregar;
    }

    public boolean getBlnpermisoeditar() {
        return blnpermisoeditar;
    }

    public void setBlnpermisoeditar(boolean blnpermisoeditar) {
        this.blnpermisoeditar = blnpermisoeditar;
    }

    public boolean getBlnpermisoeliminar() {
        return blnpermisoeliminar;
    }

    public void setBlnpermisoeliminar(boolean blnpermisoeliminar) {
        this.blnpermisoeliminar = blnpermisoeliminar;
    }

    public Accion getIntaccId() {
        return intaccId;
    }

    public void setIntaccId(Accion intaccId) {
        this.intaccId = intaccId;
    }

    public Grupo getIntgruId() {
        return intgruId;
    }

    public void setIntgruId(Grupo intgruId) {
        this.intgruId = intgruId;
    }

    public Rol getIntrolId() {
        return introlId;
    }

    public void setIntrolId(Rol introlId) {
        this.introlId = introlId;
    }

    public Sistema getSisId() {
        return sisId;
    }

    public void setSisId(Sistema sisId) {
        this.sisId = sisId;
    }

    public Usuario getUsuId() {
        return usuId;
    }

    public void setUsuId(Usuario usuId) {
        this.usuId = usuId;
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
        if (!(object instanceof Funcion)) {
            return false;
        }
        Funcion other = (Funcion) object;
        if ((this.intid == null && other.intid != null) || (this.intid != null && !this.intid.equals(other.intid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Funcion[ intid=" + intid + " ]";
    }
    
}
