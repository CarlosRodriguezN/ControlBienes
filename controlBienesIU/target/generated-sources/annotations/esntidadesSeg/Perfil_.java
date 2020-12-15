package esntidadesSeg;

import esntidadesSeg.Rol;
import java.math.BigInteger;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-15T10:47:34")
@StaticMetamodel(Perfil.class)
public class Perfil_ { 

    public static volatile SingularAttribute<Perfil, BigInteger> lngasignadopor;
    public static volatile SingularAttribute<Perfil, Integer> intid;
    public static volatile SingularAttribute<Perfil, String> strnombretema;
    public static volatile SingularAttribute<Perfil, BigInteger> lngfechamodificacion;
    public static volatile SingularAttribute<Perfil, Boolean> blnactivo;
    public static volatile SingularAttribute<Perfil, BigInteger> lngusrId;
    public static volatile SingularAttribute<Perfil, BigInteger> lngmodificadopor;
    public static volatile SingularAttribute<Perfil, Boolean> blndefault;
    public static volatile SingularAttribute<Perfil, BigInteger> lngfechaasignacion;
    public static volatile SingularAttribute<Perfil, Rol> introlId;

}