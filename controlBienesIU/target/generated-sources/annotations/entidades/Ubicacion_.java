package entidades;

import entidades.Bien;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-09T11:48:56")
@StaticMetamodel(Ubicacion.class)
public class Ubicacion_ { 

    public static volatile SingularAttribute<Ubicacion, Integer> ubEstado;
    public static volatile CollectionAttribute<Ubicacion, Bien> bienCollection;
    public static volatile SingularAttribute<Ubicacion, String> ubDescripcion;
    public static volatile SingularAttribute<Ubicacion, Integer> ubId;

}