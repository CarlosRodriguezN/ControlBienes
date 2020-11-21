/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Tipoingreso;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 *
 * @author BLADD-ESPOCH
 */
@Stateless
public class TipoingresoFacade extends AbstractFacade<Tipoingreso> implements TipoingresoFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipoingresoFacade() {
        super(Tipoingreso.class);
    }
    
    @Override
    public Tipoingreso idtipoingreso(String id) {
        Tipoingreso objTipoingreso = null;
        String consulta;
        try {
            consulta = "SELECT t FROM Tipoingreso t WHERE t.tiDetalle = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Tipoingreso> listaTipoingreso = query.getResultList();
            if (!listaTipoingreso.isEmpty()) {
                objTipoingreso = listaTipoingreso.get(0);
            }
        } catch (Exception e) {
        }
        return objTipoingreso;
    }
    
}
