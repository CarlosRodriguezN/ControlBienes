/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Mantenimientos;
import entidades.Bien;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author kuri
 */
@Local
public interface MantenimientosFacadeLocal {

    void create(Mantenimientos mantenimientos);

    void edit(Mantenimientos mantenimientos);

    void remove(Mantenimientos mantenimientos);

    Mantenimientos idordenmantenimiento(String orden);

    Mantenimientos find(Object id);

    List<Mantenimientos> findAll();

    List<Mantenimientos> findRange(int[] range);

    int count();

    List<Mantenimientos> listMantenimientosEstado(Integer estado);

    List<Mantenimientos> listMantenimientosTipo(Integer tipo);

    List<Mantenimientos> findMantenimientosBienCodigo(String codigo);

    List<Mantenimientos> findMantenimientosTecnicoFecha(String nombre, String fechainicial, String fechafinal);

    List<Mantenimientos> findMantenimientosBienesFecha(String nombre, String fechainicial, String fechafinal);

    List<Mantenimientos> findMantenimientosGeneralFecha(String fechainicial, String fechafinal);

    List<Mantenimientos> findMantenimientosTipoFecha(Integer nombre, String fechainicial, String fechafinal);

    List<Bien> findMantenimientosVersionSOFecha(String nombre, String fechainicial, String fechafinal);

    Mantenimientos lastNrodeOrden();
}
