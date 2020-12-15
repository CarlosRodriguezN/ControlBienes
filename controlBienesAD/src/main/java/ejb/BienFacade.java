/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import com.google.gson.Gson;
import entidades.Bien;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class BienFacade extends AbstractFacade<Bien> implements BienFacadeLocal {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BienFacade() {
        super(Bien.class);
    }

    @Override
    public List<Bien> findBienes(String codigo) {
        List<Bien> objBien = null;
        String consulta;
        try {
            consulta = "SELECT b FROM Bien b WHERE b.bnCodBien like CONCAT(?1, '%')";

            Query query = em.createQuery(consulta);
            query.setParameter(1, codigo);
            objBien = query.getResultList();
        } catch (NumberFormatException e) {
            throw e;
        }
        return objBien;
    }

    @Override
    public List<Bien> findBienesNombre(String nombre) {
        List<Bien> objBien = null;
        String consulta;
        try {
            consulta = "SELECT b FROM Bien b WHERE UPPER(b.bnNombre) like CONCAT(?1, '%')";
            Query query = em.createQuery(consulta);
            query.setParameter(1, nombre.toUpperCase());
            objBien = query.getResultList();
        } catch (NumberFormatException e) {
            System.out.println("ejb.BienFacade.findBienesNombre()");
            throw e;
        }
        return objBien;
    }

    @Override
    public List<Bien> findBienesSerie(String serie) {
        List<Bien> objBien = null;
        String consulta;
        try {
            consulta = "SELECT b FROM Bien b WHERE b.bnSerie like CONCAT(?1, '%')";

            Query query = em.createQuery(consulta);
            query.setParameter(1, serie);
            objBien = query.getResultList();
            System.out.println(objBien);
        } catch (NumberFormatException e) {
            throw e;
        }
        return objBien;
    }

    @Override
    public String getVersionSO() {
        List<String> objBien = null;
        List<String> objVer = new ArrayList<String>();
        String jsonCartList;
        String consulta;
        try {
            consulta = "SELECT DISTINCT b.bnSo FROM Bien b";
            Query query = em.createQuery(consulta);
            objBien = query.getResultList();
            for (String e : objBien) {
                if (e != null && !"".equals(e) && !" ".equals(e)) {
                    objVer.add(e);
                }
            }
            Gson gson = new Gson();
            // convert your list to json
            jsonCartList = gson.toJson(objVer);
            // print your generated json
        } catch (NumberFormatException e) {
            throw e;
        }
        return jsonCartList;
    }
    
    @Override
    public List<Bien> findInvGarantiaFecha(String fechact) {
        List<Bien> listBien = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechact);

            consulta = "SELECT b FROM Bien b WHERE  b.bnFechaGarantia >= :fi";
            Query query = em.createQuery(consulta);
            query.setParameter("fi", di);
            System.out.println(consulta);
            listBien = query.getResultList();
        } catch (Exception e) {
            System.out.println("Error listar----------------");
        }
        return listBien;
    }
    
    @Override
    public List<Bien> findInvBienDesactivadosMotFecha(String fechainicial, String fechafinal) {
        List<Bien> listBien = null;
        String consulta;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date di = formatter.parse(fechainicial);
            Date df = formatter.parse(fechafinal);
            //consulta = "SELECT t FROM Traspaso t WHERE  t.bnCodBien.baId.baId = 2 AND t.traFechaInicio BETWEEN :fi AND :ff";
            consulta = "SELECT b FROM Bien b WHERE b.baId.baId = 2 AND b.bnFechaBaja BETWEEN :fi AND :ff";
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
    
    public List<Bien> BienBajaId(Integer bajaId){
        List<Bien> listasalida = new ArrayList<Bien>();
        String consulta;
        try {
            consulta = "SELECT b FROM Bien b WHERE b.baId.baId = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, bajaId);
            List<Bien> listainstitucion = query.getResultList();
            listasalida = listainstitucion;
        } catch (Exception e) {
        }
        return listasalida;
    }
    
        public List<Bien> BienUbicacionId(Integer ubicacionId){
        List<Bien> listasalida = new ArrayList<Bien>();
        String consulta;
        try {
            consulta = "SELECT b FROM Bien b WHERE b.ubId.ubId = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, ubicacionId);
            List<Bien> listainstitucion = query.getResultList();
            listasalida = listainstitucion;
        } catch (Exception e) {
        }
        return listasalida;
    }
    
    public List<Bien> BienDependenciaId(Integer ubicacionId){
        List<Bien> listasalida = new ArrayList<Bien>();
        String consulta;
        try {
            consulta = "SELECT b FROM Bien b WHERE b.dpId.dpId = ?1";
            Query query = em.createQuery(consulta);
            query.setParameter(1, ubicacionId);
            List<Bien> listainstitucion = query.getResultList();
            listasalida = listainstitucion;
        } catch (Exception e) {
        }
        return listasalida;
    }
}
