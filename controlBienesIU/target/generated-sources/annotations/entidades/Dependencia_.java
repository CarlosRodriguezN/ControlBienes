package entidades;

import entidades.Bien;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-12T01:56:31")
@StaticMetamodel(Dependencia.class)
public class Dependencia_ { 

    public static volatile SingularAttribute<Dependencia, Integer> dpId;
    public static volatile CollectionAttribute<Dependencia, Bien> bienCollection;
    public static volatile SingularAttribute<Dependencia, Integer> dpEstado;
    public static volatile SingularAttribute<Dependencia, String> dpDescripcion;

}