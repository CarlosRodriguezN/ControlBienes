/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Dependencia;
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
public class DependenciaFacade extends AbstractFacade<Dependencia> implements DependenciaFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DependenciaFacade() {
        super(Dependencia.class);
    }
    
    @Override
    public Dependencia iddependencia(String id) {
        Dependencia objDependencia = null;
        String consulta;
        try {
            consulta = "SELECT d FROM Dependencia d WHERE d.dpDescripcion = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Dependencia> listaDependencia = query.getResultList();
            if (!listaDependencia.isEmpty()) {
                objDependencia = listaDependencia.get(0);
            }
        } catch (Exception e) {
        }
        return objDependencia;
    }
    
}
