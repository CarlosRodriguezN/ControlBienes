package entidades;

import entidades.Bien;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-02-03T10:25:09")
@StaticMetamodel(Tipoingreso.class)
public class Tipoingreso_ { 

    public static volatile SingularAttribute<Tipoingreso, Integer> tiEstado;
    public static volatile SingularAttribute<Tipoingreso, Integer> tiId;
    public static volatile CollectionAttribute<Tipoingreso, Bien> bienCollection;
    public static volatile SingularAttribute<Tipoingreso, String> tiDetalle;

}