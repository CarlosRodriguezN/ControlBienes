package entidades;

import entidades.Bien;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-20T21:27:37")
@StaticMetamodel(Tecnodisco.class)
public class Tecnodisco_ { 

    public static volatile SingularAttribute<Tecnodisco, String> tecDescripcion;
    public static volatile SingularAttribute<Tecnodisco, Integer> tecEstado;
    public static volatile CollectionAttribute<Tecnodisco, Bien> bienCollection;
    public static volatile SingularAttribute<Tecnodisco, Integer> tecId;

}