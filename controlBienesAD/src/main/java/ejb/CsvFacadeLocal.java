/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Csv;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author BLADD-ESPOCH
 */
@Local
public interface CsvFacadeLocal {

    void create(Csv csv);

    void edit(Csv csv);

    void remove(Csv csv);

    Csv find(Object id);

    List<Csv> findAll();

    List<Csv> findRange(int[] range);

    int count();
    
}
