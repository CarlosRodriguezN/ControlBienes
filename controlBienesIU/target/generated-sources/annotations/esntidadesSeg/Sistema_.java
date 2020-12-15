package esntidadesSeg;

import esntidadesSeg.Funcion;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-15T16:20:13")
@StaticMetamodel(Sistema.class)
public class Sistema_ { 

    public static volatile SingularAttribute<Sistema, String> sisCodigo;
    public static volatile SingularAttribute<Sistema, String> sisDescripcion;
    public static volatile CollectionAttribute<Sistema, Funcion> funcionCollection;
    public static volatile SingularAttribute<Sistema, String> sisNombre;
    public static volatile SingularAttribute<Sistema, Integer> sisId;
    public static volatile SingularAttribute<Sistema, Boolean> sisBlnactivo;

}