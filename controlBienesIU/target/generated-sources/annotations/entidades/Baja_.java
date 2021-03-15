package entidades;

import entidades.Bien;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-02-03T10:25:09")
@StaticMetamodel(Baja.class)
public class Baja_ { 

    public static volatile SingularAttribute<Baja, Integer> baId;
    public static volatile CollectionAttribute<Baja, Bien> bienCollection;
    public static volatile SingularAttribute<Baja, Integer> baEstado;
    public static volatile SingularAttribute<Baja, String> baDetalle;

}