package entidades;

import entidades.Mantenimiento;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-02-03T10:25:09")
@StaticMetamodel(Tipomantenimiento.class)
public class Tipomantenimiento_ { 

    public static volatile SingularAttribute<Tipomantenimiento, Integer> tipEstado;
    public static volatile SingularAttribute<Tipomantenimiento, Integer> tipId;
    public static volatile SingularAttribute<Tipomantenimiento, String> tipDetalle;
    public static volatile CollectionAttribute<Tipomantenimiento, Mantenimiento> mantenimientoCollection;

}