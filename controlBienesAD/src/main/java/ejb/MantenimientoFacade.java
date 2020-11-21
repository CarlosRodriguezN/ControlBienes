/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Mantenimiento;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Alex
 */
@Stateless
public class MantenimientoFacade extends AbstractFacade<Mantenimiento> implements MantenimientoFacadeLocal {
    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MantenimientoFacade() {
        super(Mantenimiento.class);
    }
    
    @Override
    public Mantenimiento idordenmantenimiento(String orden) {
        Mantenimiento objMantenimiento = null;
        String consulta;
        try {
            consulta = "SELECT m FROM Mantenimiento m WHERE m.mantNumOrden = ?1";

            Query query = em.createQuery(consulta);
            query.setParameter(1, Integer.parseInt(orden));
            List<Mantenimiento> listaMantenimiento = query.getResultList();
            if (!listaMantenimiento.isEmpty()) {
                objMantenimiento = listaMantenimiento.get(0);
            }                                              
        } catch (Exception e) {
        }
        return objMantenimiento;
    }
    
    @Override
    public Mantenimiento mantenimientoRango(String fechinicial, String fechfinal) {
        Mantenimiento objMantenimiento = null;
        String consulta;
        try {
            consulta = "SELECT m FROM Mantenimiento m WHERE m.mantFechaIng BETWEEN ?1::DATE AND ?2::DATE";

            Query query = em.createQuery(consulta);
            query.setParameter(1, fechinicial);
            query.setParameter(2, fechfinal);
            List<Mantenimiento> listaMantenimiento = query.getResultList();
            if (!listaMantenimiento.isEmpty()) {
                objMantenimiento = listaMantenimiento.get(0);
            }                                              
        } catch (Exception e) {
        }
        return objMantenimiento;
    }
    
    @Override
    public void eliminarmant(Integer codigo) {
        //Mantenimiento objMantenimiento = null;
        String consulta;
//        try {
//            consulta = "DELETE FROM Mantenimsoftware m WHERE (m.mantId = ?1)";
//
//            Query query = em.createQuery(consulta);
//            query.setParameter(1, codigo);
            //query.getResultList();
        
//            consulta = "DELETE FROM Mantenimhardware m WHERE (m.mantId = ?1)";
//
//            Query query1 = em.createQuery(consulta);
//            query1.setParameter(1, codigo);
            //query1.getResultList();
            
            consulta = "DELETE FROM Mantenimiento m WHERE m.mantId = ?1";
            Query query2 = em.createQuery(consulta);
            query2.setParameter(1, codigo);
            //query2.getResultList();
            //List<Mantenimiento> listaMantenimiento = query.getResultList();
            //if (!listaMantenimiento.isEmpty()) {
            //    objMantenimiento = listaMantenimiento.get(0);
            //
//        //}                                              
//        } catch (Exception e) {
//            System.out.println ("El error eeeeeeeees: " + e.getMessage());
//            e.printStackTrace();
//        }
//        //return objMantenimiento;
    }
    
    @Override
    public void modificarmant(Integer codigo) {
        //Mantenimiento objMantenimiento = null;
        String consulta;
//        try {            
            consulta = "UPDATE Mantenimiento m SET m.mantEstado = ?1 WHERE m.mantId = ?2";
            Query query2 = em.createQuery(consulta);
            query2.setParameter(1, 0);
            query2.setParameter(2, codigo);
            //query2.getResultList();

//        //}                                              
//        } catch (Exception e) {
//            System.out.println ("El error eeeeeeeees: " + e.getMessage());
//            e.printStackTrace();
//        }
    }
    @Override
    public List<Mantenimiento>  listbienesmantenimiento(Integer opcion) {
        //List<Mantenimiento> objMantenimiento = null
        List<Mantenimiento> listaMantenimiento = null;
        String consulta;
        //Integer num = 1;
        try {
            //consulta = "SELECT array_to_string(SELECT m FROM Mantenimiento m WHERE m.mantEstado = ?1)";
            consulta = "SELECT m FROM Mantenimiento m WHERE m.mantEstado = ?1";
            Query query = em.createQuery(consulta);
            
            if(opcion == 1)
                query.setParameter(1, 1);
            if(opcion == 0)
                query.setParameter(1, 0);
            
            listaMantenimiento = query.getResultList();
            //if (!listaMantenimiento.isEmpty()) {
                //objMantenimiento = listaMantenimiento.get(0);
                //objMantenimiento.;
            //}                                              
        } catch (Exception e) {
        }
        return listaMantenimiento;
    }
}
