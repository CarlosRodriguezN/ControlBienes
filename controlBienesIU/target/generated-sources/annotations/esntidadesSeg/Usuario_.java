package esntidadesSeg;

import esntidadesSeg.Funcion;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-02-03T10:25:09")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> usuCorreo;
    public static volatile SingularAttribute<Usuario, String> usuNombre;
    public static volatile SingularAttribute<Usuario, Boolean> usuBlnactivo;
    public static volatile SingularAttribute<Usuario, Integer> usuId;
    public static volatile CollectionAttribute<Usuario, Funcion> funcionCollection;
    public static volatile SingularAttribute<Usuario, String> usuCedula;

}