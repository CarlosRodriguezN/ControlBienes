/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Baja;
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
public class BajaFacade extends AbstractFacade<Baja> implements BajaFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BajaFacade() {
        super(Baja.class);
    }
    
    @Override
    public Baja idbaja(String id) {
        Baja objBaja = null;
        String consulta;
        try {
            consulta = "SELECT b FROM Baja b WHERE b.baDetalle = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Baja> listaBaja = query.getResultList();
            if (!listaBaja.isEmpty()) {
                objBaja = listaBaja.get(0);
            }
        } catch (Exception e) {
        }
        return objBaja;
    }
    
}
