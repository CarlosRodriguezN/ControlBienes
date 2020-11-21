/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Bien;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author BLADD-ESPOCH
 */
@Local
public interface BienFacadeLocal {

    void create(Bien bien);

    void edit(Bien bien);

    void remove(Bien bien);

    Bien find(Object id);

    List<Bien> findAll();

    List<Bien> findRange(int[] range);

    int count();

    List<Bien> findBienes(String codigo);

    List<Bien> findBienesNombre(String nombre);

    List<Bien> findBienesSerie(String serie);
    
    String getVersionSO();
}
