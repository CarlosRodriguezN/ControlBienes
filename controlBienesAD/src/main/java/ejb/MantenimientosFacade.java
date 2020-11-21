/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Bien;
import entidades.Mantenimientos;
import entidades.Tipomantenimiento;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author kuri
 */
@Stateless
public class MantenimientosFacade extends AbstractFacade<Mantenimientos> implements MantenimientosFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MantenimientosFacade() {
        super(Mantenimientos.class);
    }

    @Override
    public Mantenimientos idordenmantenimiento(String orden) {
        Mantenimientos objMantenimiento = null;
        String consulta;
        try {
            consulta = "SELECT m FROM Mantenimientos m WHERE m.mantNumOrden = ?1";

            Query query = em.createQuery(consulta);
            query.setParameter(1, orden);
            List<Mantenimientos> listaMantenimiento = query.getResultList();
            if (!listaMantenimiento.isEmpty()) {
                objMantenimiento = listaMantenimiento.get(0);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            throw e;
        }
        return objMantenimiento;
    }

    @Override
    public List<Mantenimientos> listMantenimientosEstado(Integer estado) {
        List<Mantenimientos> listaMantenimiento = null;
        String consulta;
        try {
            consulta = "SELECT m FROM Mantenimientos m WHERE m.mantEstado = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, estado);
            listaMantenimiento = query.getResultList();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println("error -----------------");
            throw e;
        }
        return listaMantenimiento;
    }

    @Override
    public List<Mantenimientos> findMantenimientosBienCodigo(String codigo) {
        List<Mantenimientos> objMantenimientos = null;
        String consulta;
        try {
//            consulta = "SELECT m FROM Mantenimientos m INNER JOIN Bien b ON m.bienId = b.bnCodBien WHERE m.bienId LIKE (:bnId)";
            consulta = "SELECT m FROM Mantenimientos m WHERE m.bienId = :bnId";
            Bien obien = new Bien();
            obien.setBnCodBien(codigo);
            Query query = em.createQuery(consulta);
            query.setParameter("bnId", obien);
            System.out.println(query);
            objMantenimientos = query.getResultList();
        } catch (Exception e) {
            System.out.println(e.getMessage() + "e aqui error");
        }
        return objMantenimientos;
    }

    @Override
    public List<Mantenimientos> findMantenimientosTecnicoFecha(String nombre, String fechainicial, String fechafinal) {
        List<Mantenimientos> listMantenimiento = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT m FROM Mantenimientos m WHERE m.mantFechaRevision BETWEEN :fi AND :ff AND m.mantTecnRevision = :tc";
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            query.setParameter("tc", nombre);
            System.out.println(consulta);
            listMantenimiento = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listMantenimiento;
    }

    @Override
    public List<Mantenimientos> listMantenimientosTipo(Integer tipo) {
        List<Mantenimientos> listaMantenimiento = null;
        String consulta;
        try {
            consulta = "SELECT m FROM Mantenimientos m WHERE m.tipId = :tipId";
            Tipomantenimiento oTipomantenimiento = new Tipomantenimiento();
            oTipomantenimiento.setTipId(tipo);
            Query query = em.createQuery(consulta);
            query.setParameter("tipId", oTipomantenimiento);
            listaMantenimiento = query.getResultList();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println("error buscando tipo");
            throw e;
        }
        return listaMantenimiento;
    }

    @Override
    public Mantenimientos lastNrodeOrden() {
        Mantenimientos objMantenimiento = null;
        String consulta;
        try {
            consulta = "SELECT m from Mantenimientos m order by m.mantId desc";

            Query query = em.createQuery(consulta);
            List<Mantenimientos> listaMantenimiento = query.getResultList();
            if (!listaMantenimiento.isEmpty()) {
                objMantenimiento = listaMantenimiento.get(0);
            }
        } catch (Exception e) {
            e.getLocalizedMessage();
            throw e;
        }
        return objMantenimiento;
    }

    @Override
    public List<Mantenimientos> findMantenimientosBienesFecha(String nombre, String fechainicial, String fechafinal) {
        List<Mantenimientos> listMantenimiento = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT m FROM Mantenimientos m WHERE m.mantFechaRevision BETWEEN :fi AND :ff AND m.bienId = :tc";
            Bien obien = new Bien();
            obien.setBnCodBien(nombre);
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            query.setParameter("tc", obien);
            System.out.println(consulta);
            listMantenimiento = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listMantenimiento;
    }

    @Override
    public List<Mantenimientos> findMantenimientosGeneralFecha(String fechainicial, String fechafinal) {
        List<Mantenimientos> listMantenimiento = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT m FROM Mantenimientos m WHERE m.mantFechaRevision BETWEEN :fi AND :ff";
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            System.out.println(consulta);
            listMantenimiento = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listMantenimiento;
    }

    @Override
    public List<Mantenimientos> findMantenimientosTipoFecha(Integer nombre, String fechainicial, String fechafinal) {
        List<Mantenimientos> listMantenimiento = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT m FROM Mantenimientos m WHERE m.mantFechaRevision BETWEEN :fi AND :ff AND m.tipId = :tc";
            Tipomantenimiento obien = new Tipomantenimiento();
            obien.setTipId(nombre);
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            query.setParameter("tc", obien);
            System.out.println(consulta);
            listMantenimiento = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listMantenimiento;
    }

    @Override
    public List<Bien> findMantenimientosVersionSOFecha(String nombre, String fechainicial, String fechafinal) {
        List<Bien> objBien = null;
        String consulta;
        System.out.println(nombre);
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT b FROM Bien b WHERE b.bnFechaCompra BETWEEN :fi AND :ff AND UPPER(b.bnSo) = :tc";
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            query.setParameter("tc", nombre);
            objBien = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar bienes vsooo");
        }
        return objBien;
    }

}
