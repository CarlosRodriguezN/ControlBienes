package esntidadesSeg;

import esntidadesSeg.Accion;
import esntidadesSeg.Grupo;
import esntidadesSeg.Rol;
import esntidadesSeg.Sistema;
import esntidadesSeg.Usuario;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-26T19:17:04")
@StaticMetamodel(Funcion.class)
public class Funcion_ { 

    public static volatile SingularAttribute<Funcion, Integer> intid;
    public static volatile SingularAttribute<Funcion, Usuario> usuId;
    public static volatile SingularAttribute<Funcion, Integer> intorden;
    public static volatile SingularAttribute<Funcion, Boolean> blnactivo;
    public static volatile SingularAttribute<Funcion, Boolean> blnpermisoeliminar;
    public static volatile SingularAttribute<Funcion, Grupo> intgruId;
    public static volatile SingularAttribute<Funcion, Boolean> blnpermisoagregar;
    public static volatile SingularAttribute<Funcion, Accion> intaccId;
    public static volatile SingularAttribute<Funcion, Boolean> blnpermisoeditar;
    public static volatile SingularAttribute<Funcion, Rol> introlId;
    public static volatile SingularAttribute<Funcion, Sistema> sisId;

}