package entidades;

import entidades.Mantenimientos;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-21T23:25:54")
@StaticMetamodel(Nivelmantenimiento.class)
public class Nivelmantenimiento_ { 

    public static volatile SingularAttribute<Nivelmantenimiento, Integer> nivelId;
    public static volatile CollectionAttribute<Nivelmantenimiento, Mantenimientos> mantenimientosCollection;
    public static volatile SingularAttribute<Nivelmantenimiento, Integer> nivelEstado;
    public static volatile SingularAttribute<Nivelmantenimiento, String> nivelDescripcion;

}