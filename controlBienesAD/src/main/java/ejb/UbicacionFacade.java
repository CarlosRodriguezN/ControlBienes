/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ubicacion;
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
public class UbicacionFacade extends AbstractFacade<Ubicacion> implements UbicacionFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UbicacionFacade() {
        super(Ubicacion.class);
    }
    
    @Override
    public Ubicacion idubicacion(String id) {
        Ubicacion objUbicacion = null;
        String consulta;
        try {
            consulta = "SELECT u FROM Ubicacion u WHERE u.ubDescripcion = ?1";

            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Ubicacion> listaUbicacion = query.getResultList();
            if (!listaUbicacion.isEmpty()) {
                objUbicacion = listaUbicacion.get(0);
            }
        } catch (Exception e) {
        }
        return objUbicacion;
    }
    
}
