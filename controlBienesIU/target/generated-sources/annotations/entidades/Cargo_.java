package entidades;

import entidades.Persona;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-02-03T10:25:09")
@StaticMetamodel(Cargo.class)
public class Cargo_ { 

    public static volatile SingularAttribute<Cargo, Integer> carEstado;
    public static volatile CollectionAttribute<Cargo, Persona> personaCollection;
    public static volatile SingularAttribute<Cargo, String> carDescripcion;
    public static volatile SingularAttribute<Cargo, Integer> carId;

}