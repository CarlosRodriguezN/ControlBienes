/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Permiso;
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
public class PermisoFacade extends AbstractFacade<Permiso> implements PermisoFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PermisoFacade() {
        super(Permiso.class);
    }
    
    @Override
    public List<Permiso> listaPermisosOperario() {
        List<Permiso> listaPermiso = null;
        String consulta;
        try {
            consulta = "SELECT p FROM Permiso p  WHERE p.pmCodigo LIKE \"POP%\" ";
            Query query = em.createQuery(consulta);
            listaPermiso = query.getResultList();
        } catch (Exception e) {
            e.getLocalizedMessage();
            System.out.println("error buscando permisos personas");
            throw e;
        }
        return listaPermiso;
    }
}
