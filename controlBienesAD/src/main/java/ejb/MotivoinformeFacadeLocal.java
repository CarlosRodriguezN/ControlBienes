/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Motivoinforme;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author BLADD-ESPOCH
 */
@Local
public interface MotivoinformeFacadeLocal {

    void create(Motivoinforme motivoinforme);

    void edit(Motivoinforme motivoinforme);

    void remove(Motivoinforme motivoinforme);

    Motivoinforme find(Object id);

    List<Motivoinforme> findAll();

    List<Motivoinforme> findRange(int[] range);

    int count();
    
    Motivoinforme idmotivoinforme(String id);
}
