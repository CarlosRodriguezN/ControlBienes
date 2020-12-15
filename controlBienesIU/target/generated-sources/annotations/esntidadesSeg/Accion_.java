package esntidadesSeg;

import esntidadesSeg.Funcion;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-15T16:20:13")
@StaticMetamodel(Accion.class)
public class Accion_ { 

    public static volatile SingularAttribute<Accion, Integer> intid;
    public static volatile CollectionAttribute<Accion, Funcion> funcionCollection;
    public static volatile SingularAttribute<Accion, String> strdescripcion;
    public static volatile SingularAttribute<Accion, String> strtitulo;
    public static volatile SingularAttribute<Accion, Boolean> blnactivo;
    public static volatile SingularAttribute<Accion, String> strurl;

}