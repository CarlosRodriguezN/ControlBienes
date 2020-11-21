/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Tecnico;
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
public class TecnicoFacade extends AbstractFacade<Tecnico> implements TecnicoFacadeLocal {
    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TecnicoFacade() {
        super(Tecnico.class);
    }
    
    @Override
    public Tecnico idtecnico(String id) {
        Tecnico objTecnico = null;
        String consulta;
        try {
            consulta = "SELECT t FROM Tecnico t WHERE t.tecCedula = ?1";

            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            List<Tecnico> listaTecnico = query.getResultList();
            if (!listaTecnico.isEmpty()) {
                objTecnico = listaTecnico.get(0);
            }                                              
        } catch (Exception e) {
        }
        return objTecnico;
    }
 
    @Override
    public void eliminartecn(Integer id) 
    {
        String consulta;
        try {
            consulta = "DELETE FROM Tecnico t WHERE t.tecId= ?1";

            Query query = em.createQuery(consulta);
            query.setParameter(1, id);
            //query.getResultList();                                       
        } catch (Exception e) {
            System.out.println ("El error es: " + e.getMessage());
            e.printStackTrace();
        }
   
    }
}

