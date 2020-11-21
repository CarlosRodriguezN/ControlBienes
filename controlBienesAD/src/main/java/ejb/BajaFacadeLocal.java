/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Baja;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author BLADD-ESPOCH
 */
@Local
public interface BajaFacadeLocal {

    void create(Baja baja);

    void edit(Baja baja);

    void remove(Baja baja);

    Baja find(Object id);

    List<Baja> findAll();

    List<Baja> findRange(int[] range);

    int count();
    
    Baja idbaja(String id);
    
}
