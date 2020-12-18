package entidades;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-18T10:55:46")
@StaticMetamodel(Auditoria.class)
public class Auditoria_ { 

    public static volatile SingularAttribute<Auditoria, String> audDatosmod;
    public static volatile SingularAttribute<Auditoria, String> usuId;
    public static volatile SingularAttribute<Auditoria, Date> audFecha;
    public static volatile SingularAttribute<Auditoria, Integer> audId;
    public static volatile SingularAttribute<Auditoria, String> audDetalle;
    public static volatile SingularAttribute<Auditoria, String> audIp;
    public static volatile SingularAttribute<Auditoria, String> audMac;
    public static volatile SingularAttribute<Auditoria, String> audMetodo;

}