/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Temp;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author BLADD-ESPOCH
 */
@Local
public interface TempFacadeLocal {

    void create(Temp temp);

    void edit(Temp temp);

    void remove(Temp temp);

    Temp find(Object id);

    List<Temp> findAll();

    List<Temp> findRange(int[] range);

    int count();
    
}
