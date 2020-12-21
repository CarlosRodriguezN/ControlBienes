package esntidadesSeg;

import esntidadesSeg.Funcion;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-21T09:42:12")
@StaticMetamodel(Grupo.class)
public class Grupo_ { 

    public static volatile SingularAttribute<Grupo, Integer> intid;
    public static volatile CollectionAttribute<Grupo, Funcion> funcionCollection;
    public static volatile SingularAttribute<Grupo, String> strdescripcion;
    public static volatile SingularAttribute<Grupo, Integer> intpadre;
    public static volatile SingularAttribute<Grupo, Integer> intorden;
    public static volatile SingularAttribute<Grupo, String> strnombre;
    public static volatile SingularAttribute<Grupo, Boolean> blnactivo;

}