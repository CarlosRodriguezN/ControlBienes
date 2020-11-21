/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Tecnico;
import entidades.Traspaso;
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
public class TraspasoFacade extends AbstractFacade<Traspaso> implements TraspasoFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TraspasoFacade() {
        super(Traspaso.class);
    }
    
//    @Override
//    public Traspaso obtenertraspaso(String codBien , String codPer) {
//        Traspaso objTraspaso = null;
//        String consulta;
//        try {
//            consulta = "SELECT t FROM Traspaso t  where t.";
//            //consulta = "SELECT * FROM Bien b INNER JOIN Traspaso t ON b.bnCodBien = t.bnCodBien INNER JOIN Persona p ON t.perId = p.perId WHERE t.perId = ?1 AND t.bnCodBien = ?2";
//            //consulta = "SELECT b.bnColor b.bnMarca  "
////            consulta = "SELECT *  "
////                    + "FROM Bien b "
////                    + "INNER JOIN Traspaso t ON t.bnCodBien = b.bnCodBien "
////                    + "INNER JOIN Persona p ON t.perId = p.perId";
//            
//            Query query = em.createQuery(consulta);
//            //query.setParameter(1, codBien);
//            //query.setParameter(2,  Integer. parseInt (codPer));
//            List<Traspaso> listaTraspaso = query.getResultList();
//            if (!listaTraspaso.isEmpty()) {
//                objTraspaso = listaTraspaso.get(0);
//            }                                              
//        } catch (Exception e) {
//        }
//        return objTraspaso;
//    }
}
