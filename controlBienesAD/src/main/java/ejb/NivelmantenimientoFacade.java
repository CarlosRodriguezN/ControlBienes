/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Nivelmantenimiento;
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
public class NivelmantenimientoFacade extends AbstractFacade<Nivelmantenimiento> implements NivelmantenimientoFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NivelmantenimientoFacade() {
        super(Nivelmantenimiento.class);
    }

    @Override
    public Nivelmantenimiento getNombreNivelMantenimiento(String id) {
        Nivelmantenimiento objNivelmantenimiento = null;
        String consulta;
        try {
            consulta = "SELECT n FROM Nivelmantenimiento n WHERE n.nivelDescripcion = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Nivelmantenimiento> listaNivelmantenimiento = query.getResultList();
            if (!listaNivelmantenimiento.isEmpty()) {
                objNivelmantenimiento = listaNivelmantenimiento.get(0);
            }
        } catch (Exception e) {
        }
        return objNivelmantenimiento;
    }
    
}
