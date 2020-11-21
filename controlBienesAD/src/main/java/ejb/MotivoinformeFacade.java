/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Motivoinforme;
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
public class MotivoinformeFacade extends AbstractFacade<Motivoinforme> implements MotivoinformeFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MotivoinformeFacade() {
        super(Motivoinforme.class);
    }
    
    @Override
    public Motivoinforme idmotivoinforme(String id) {
        Motivoinforme objMotivoinforme = null;
        String consulta;
        try {
            consulta = "SELECT m FROM Motivoinforme m WHERE m.motDetalle = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Motivoinforme> listaMotivoinforme = query.getResultList();
            if (!listaMotivoinforme.isEmpty()) {
                objMotivoinforme = listaMotivoinforme.get(0);
            }
        } catch (Exception e) {
        }
        return objMotivoinforme;
    }
    
}
