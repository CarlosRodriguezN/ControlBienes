/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Tipoingreso;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author BLADD-ESPOCH
 */
@Local
public interface TipoingresoFacadeLocal {

    void create(Tipoingreso tipoingreso);

    void edit(Tipoingreso tipoingreso);

    void remove(Tipoingreso tipoingreso);

    Tipoingreso find(Object id);

    List<Tipoingreso> findAll();

    List<Tipoingreso> findRange(int[] range);

    int count();
    
    Tipoingreso idtipoingreso(String id);
    
}
