/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Tecnico;
import entidades.Traspaso;
import java.util.List;
import javax.ejb.Local;
import javax.persistence.Query;

/**
 *
 * @author BLADD-ESPOCH
 */
@Local
public interface TraspasoFacadeLocal {

    void create(Traspaso traspaso);

    void edit(Traspaso traspaso);

    void remove(Traspaso traspaso);

    Traspaso find(Object id);

    List<Traspaso> findAll();

    List<Traspaso> findRange(int[] range);

    int count();
    
//    Traspaso obtenertraspaso(String codBien , String codPer);
}
