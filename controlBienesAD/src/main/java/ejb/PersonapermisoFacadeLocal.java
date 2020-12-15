/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Personapermiso;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Toshiba
 */
@Local
public interface PersonapermisoFacadeLocal {

    void create(Personapermiso personapermiso);

    void edit(Personapermiso personapermiso);

    void remove(Personapermiso personapermiso);

    Personapermiso find(Object id);

    List<Personapermiso> findAll();

    List<Personapermiso> findRange(int[] range);

    int count();
    
    List<Personapermiso> listPersonaPermosoCedula(Integer cedula);
    
}
