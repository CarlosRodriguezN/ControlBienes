package entidades;

import entidades.Mantenimiento;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-15T10:47:34")
@StaticMetamodel(Tecnico.class)
public class Tecnico_ { 

    public static volatile SingularAttribute<Tecnico, String> tecNombre;
    public static volatile SingularAttribute<Tecnico, String> tecTelefono;
    public static volatile SingularAttribute<Tecnico, Integer> tecEstado;
    public static volatile SingularAttribute<Tecnico, String> tecDepartamento;
    public static volatile CollectionAttribute<Tecnico, Mantenimiento> mantenimientoCollection;
    public static volatile SingularAttribute<Tecnico, Integer> tecId;
    public static volatile SingularAttribute<Tecnico, String> tecCedula;

}