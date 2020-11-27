package entidades;

import entidades.Bien;
import entidades.Tecnico;
import entidades.Tipomantenimiento;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-26T19:17:04")
@StaticMetamodel(Mantenimiento.class)
public class Mantenimiento_ { 

    public static volatile SingularAttribute<Mantenimiento, Integer> mantEstado;
    public static volatile SingularAttribute<Mantenimiento, Integer> mantNumOrden;
    public static volatile SingularAttribute<Mantenimiento, Tipomantenimiento> tipId;
    public static volatile SingularAttribute<Mantenimiento, String> mantTipo;
    public static volatile SingularAttribute<Mantenimiento, String> mantFechaRevision;
    public static volatile SingularAttribute<Mantenimiento, String> mantFechaIng;
    public static volatile SingularAttribute<Mantenimiento, Tecnico> tecnId;
    public static volatile SingularAttribute<Mantenimiento, Bien> bienId;
    public static volatile SingularAttribute<Mantenimiento, String> mantFechaEntrega;
    public static volatile SingularAttribute<Mantenimiento, String> mantDescripProblema;
    public static volatile SingularAttribute<Mantenimiento, Integer> mantId;
    public static volatile SingularAttribute<Mantenimiento, String> mantDescripSolucion;

}