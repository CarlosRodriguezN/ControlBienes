/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Nivelmantenimiento;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author kuri
 */
@Local
public interface NivelmantenimientoFacadeLocal {

    void create(Nivelmantenimiento nivelmantenimiento);

    void edit(Nivelmantenimiento nivelmantenimiento);

    void remove(Nivelmantenimiento nivelmantenimiento);

    Nivelmantenimiento find(Object id);

    List<Nivelmantenimiento> findAll();

    List<Nivelmantenimiento> findRange(int[] range);

    int count();
    
    Nivelmantenimiento getNombreNivelMantenimiento(String id);
}
