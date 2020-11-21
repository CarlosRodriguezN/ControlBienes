/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Persona;
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
public class PersonaFacade extends AbstractFacade<Persona> implements PersonaFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PersonaFacade() {
        super(Persona.class);
    }

    @Override
    public Persona obtenerpersona(String cedula) {
        Persona objpersona = null;
        String consulta;
        try {
            consulta = "SELECT p FROM Persona p WHERE p.perCedula= ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, cedula);
            List<Persona> listainstitucion = query.getResultList();
            if (!listainstitucion.isEmpty()) {
                objpersona = listainstitucion.get(0);
            }

        } catch (Exception e) {
        }
        return objpersona;
    }

}
