package entidades;

import entidades.Bien;
import entidades.Nivelmantenimiento;
import entidades.Tipomantenimiento;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-09T11:48:56")
@StaticMetamodel(Mantenimientos.class)
public class Mantenimientos_ { 

    public static volatile SingularAttribute<Mantenimientos, String> mantNumOrden;
    public static volatile SingularAttribute<Mantenimientos, String> mantTecnIngreso;
    public static volatile SingularAttribute<Mantenimientos, String> mantDescProblema;
    public static volatile SingularAttribute<Mantenimientos, Tipomantenimiento> tipId;
    public static volatile SingularAttribute<Mantenimientos, Nivelmantenimiento> nivelmId;
    public static volatile SingularAttribute<Mantenimientos, String> mantFechaEntrega;
    public static volatile SingularAttribute<Mantenimientos, Integer> mantEstado;
    public static volatile SingularAttribute<Mantenimientos, String> mantResponsableRecibo;
    public static volatile SingularAttribute<Mantenimientos, String> mantFechaRevision;
    public static volatile SingularAttribute<Mantenimientos, String> mantFechaIngreso;
    public static volatile SingularAttribute<Mantenimientos, Bien> bienId;
    public static volatile SingularAttribute<Mantenimientos, String> mantTecnEntrega;
    public static volatile SingularAttribute<Mantenimientos, String> mantDescSolucion;
    public static volatile SingularAttribute<Mantenimientos, String> mantTecnRevision;
    public static volatile SingularAttribute<Mantenimientos, Integer> mantId;

}