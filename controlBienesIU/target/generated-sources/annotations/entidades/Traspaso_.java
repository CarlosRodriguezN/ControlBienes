package entidades;

import entidades.Bien;
import entidades.Persona;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-15T10:47:34")
@StaticMetamodel(Traspaso.class)
public class Traspaso_ { 

    public static volatile SingularAttribute<Traspaso, String> traFechaFin;
    public static volatile SingularAttribute<Traspaso, Persona> perId;
    public static volatile SingularAttribute<Traspaso, Bien> bnCodBien;
    public static volatile SingularAttribute<Traspaso, Integer> traEstado;
    public static volatile SingularAttribute<Traspaso, String> traFechaInicio;
    public static volatile SingularAttribute<Traspaso, Integer> traId;
    public static volatile SingularAttribute<Traspaso, String> traObservacion;

}