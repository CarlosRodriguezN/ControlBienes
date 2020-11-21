package entidades;

import entidades.Informe;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-20T21:27:37")
@StaticMetamodel(Motivoinforme.class)
public class Motivoinforme_ { 

    public static volatile CollectionAttribute<Motivoinforme, Informe> informeCollection;
    public static volatile SingularAttribute<Motivoinforme, Integer> motId;
    public static volatile SingularAttribute<Motivoinforme, Integer> motEstado;
    public static volatile SingularAttribute<Motivoinforme, String> motDetalle;

}