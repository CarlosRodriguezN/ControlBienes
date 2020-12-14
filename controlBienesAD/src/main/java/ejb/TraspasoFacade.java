/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Mantenimientos;
import entidades.Tecnico;
import entidades.Traspaso;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author BLADD-ESPOCH
 */
@Stateless
public class TraspasoFacade extends AbstractFacade<Traspaso> implements TraspasoFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TraspasoFacade() {
        super(Traspaso.class);
    }
    
//    @Override
//    public Traspaso obtenertraspaso(String codBien , String codPer) {
//        Traspaso objTraspaso = null;
//        String consulta;
//        try {
//            consulta = "SELECT t FROM Traspaso t  where t.";
//            //consulta = "SELECT * FROM Bien b INNER JOIN Traspaso t ON b.bnCodBien = t.bnCodBien INNER JOIN Persona p ON t.perId = p.perId WHERE t.perId = ?1 AND t.bnCodBien = ?2";
//            //consulta = "SELECT b.bnColor b.bnMarca  "
////            consulta = "SELECT *  "
////                    + "FROM Bien b "
////                    + "INNER JOIN Traspaso t ON t.bnCodBien = b.bnCodBien "
////                    + "INNER JOIN Persona p ON t.perId = p.perId";
//            
//            Query query = em.createQuery(consulta);
//            //query.setParameter(1, codBien);
//            //query.setParameter(2,  Integer. parseInt (codPer));
//            List<Traspaso> listaTraspaso = query.getResultList();
//            if (!listaTraspaso.isEmpty()) {
//                objTraspaso = listaTraspaso.get(0);
//            }                                              
//        } catch (Exception e) {
//        }
//        return objTraspaso;
//    }
    
    
    @Override
    public List<Traspaso> findInvTraspasoFecha(String fechainicial, String fechafinal) {
        List<Traspaso> listTraspaso = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT t FROM Traspaso t WHERE t.traFechaInicio BETWEEN :fi AND :ff";
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            System.out.println(consulta);
            listTraspaso = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listTraspaso;
    }
    @Override
    public List<Traspaso> findInvTraspasoUbicDepFecha(String ubicacion, String dependencia, String fechainicial, String fechafinal) {
        List<Traspaso> listTraspaso = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT t FROM Traspaso t WHERE  t.bnCodBien.ubId.ubDescripcion = :ubic AND t.bnCodBien.dpId.dpDescripcion = :dep AND t.traFechaInicio BETWEEN :fi AND :ff";
            Query query = em.createQuery(consulta);
            query.setParameter("ubic", ubicacion);
            query.setParameter("dep", dependencia);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            System.out.println(consulta);
            listTraspaso = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listTraspaso;
    }
    
    @Override
    public List<Traspaso> findInvTraspasoMarcaFecha(String marca, String fechainicial, String fechafinal) {
        List<Traspaso> listTraspaso = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT t FROM Traspaso t WHERE  t.bnCodBien.bnMarca = :marc AND t.traFechaInicio BETWEEN :fi AND :ff";
            Query query = em.createQuery(consulta);
            query.setParameter("marc", marca);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            System.out.println(consulta);
            listTraspaso = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listTraspaso;
    }
    
    @Override
    public List<Traspaso> findInvTraspasoDesactivadosFecha(String fechainicial, String fechafinal) {
        List<Traspaso> listTraspaso = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            consulta = "SELECT t FROM Traspaso t WHERE  t.bnCodBien.baId.baId = 2 AND t.traFechaInicio BETWEEN :fi AND :ff";
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            System.out.println(consulta);
            listTraspaso = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listTraspaso;
    }
}
