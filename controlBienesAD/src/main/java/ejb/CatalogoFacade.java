/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Catalogo;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Alex
 */
@Stateless
public class CatalogoFacade extends AbstractFacade<Catalogo> implements CatalogoFacadeLocal {
    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CatalogoFacade() {
        super(Catalogo.class);
    }
    
    @Override
    public Catalogo obtenercatalogo(String codigo) {
        Catalogo objcatalogo = null;
        String consulta;
        try {
            consulta = "SELECT c FROM Catalogo c WHERE c.ctId = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, codigo);
            List<Catalogo> listainstitucion = query.getResultList();
            if (!listainstitucion.isEmpty()) {
                objcatalogo = listainstitucion.get(0);
            }

        } catch (Exception e) {
        }
        return objcatalogo;
    }
}
