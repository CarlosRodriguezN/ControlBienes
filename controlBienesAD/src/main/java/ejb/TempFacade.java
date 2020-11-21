/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Temp;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author BLADD-ESPOCH
 */
@Stateless
public class TempFacade extends AbstractFacade<Temp> implements TempFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TempFacade() {
        super(Temp.class);
    }
    
}
