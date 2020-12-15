/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Personapermiso;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Toshiba
 */
@Stateless
public class PersonapermisoFacade extends AbstractFacade<Personapermiso> implements PersonapermisoFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PersonapermisoFacade() {
        super(Personapermiso.class);
    }
    
    @Override
    public List<Personapermiso> listPersonaPermosoCedula(Integer cedula) {
        List<Personapermiso> listaPersonaPermiso = null;
        String consulta;
        try {
            consulta = "SELECT p FROM Personapermiso p  WHERE p.perId.perId = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, cedula);
            listaPersonaPermiso = query.getResultList();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println("error buscando permisos personas");
            throw e;
        }
        return listaPersonaPermiso;
    }
    
}
