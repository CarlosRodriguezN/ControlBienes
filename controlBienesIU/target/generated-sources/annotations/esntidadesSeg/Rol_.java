package esntidadesSeg;

import esntidadesSeg.Funcion;
import esntidadesSeg.Perfil;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-21T23:25:54")
@StaticMetamodel(Rol.class)
public class Rol_ { 

    public static volatile CollectionAttribute<Rol, Perfil> perfilCollection;
    public static volatile SingularAttribute<Rol, Integer> intid;
    public static volatile CollectionAttribute<Rol, Funcion> funcionCollection;
    public static volatile SingularAttribute<Rol, String> strdescripcion;
    public static volatile SingularAttribute<Rol, String> strnombre;
    public static volatile SingularAttribute<Rol, Boolean> blnactivo;
    public static volatile SingularAttribute<Rol, String> strcodigo;

}