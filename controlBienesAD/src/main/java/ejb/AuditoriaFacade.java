/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Auditoria;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class AuditoriaFacade extends AbstractFacade<Auditoria> implements AuditoriaFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AuditoriaFacade() {
        super(Auditoria.class);
    }
   
    @Override
    public List<Auditoria> findInvAuditoriaFecha(String fechainicial, String fechafinal) {
        List<Auditoria> listBien = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            //consulta = "SELECT t FROM Traspaso t WHERE  t.bnCodBien.baId.baId = 2 AND t.traFechaInicio BETWEEN :fi AND :ff";
            consulta = "SELECT a FROM Auditoria a WHERE a.audDate BETWEEN :fi AND :ff";
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            query.setParameter("ff", df);
            System.out.println(consulta);
            listBien = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listBien;
    }
    
}
