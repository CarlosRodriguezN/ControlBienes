/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Cargo;
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
public class CargoFacade extends AbstractFacade<Cargo> implements CargoFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CargoFacade() {
        super(Cargo.class);
    }

    @Override
    public Cargo idcargo(String id) {
        Cargo objcargo = null;
        String consulta;
        try {
            consulta = "SELECT c FROM Cargo c WHERE c.carDescripcion = ?1";

            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Cargo> listacargo = query.getResultList();
            if (!listacargo.isEmpty()) {
                objcargo = listacargo.get(0);
            }
        } catch (Exception e) {
        }
        return objcargo;
    }

}
