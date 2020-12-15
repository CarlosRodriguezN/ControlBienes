package entidades;

import entidades.Cargo;
import entidades.Personapermiso;
import entidades.Traspaso;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-15T16:20:13")
@StaticMetamodel(Persona.class)
public class Persona_ { 

    public static volatile SingularAttribute<Persona, Integer> perId;
    public static volatile SingularAttribute<Persona, String> perRol;
    public static volatile SingularAttribute<Persona, String> perCedula;
    public static volatile SingularAttribute<Persona, String> perTelefono;
    public static volatile SingularAttribute<Persona, Integer> perEstado;
    public static volatile SingularAttribute<Persona, String> perNombres;
    public static volatile SingularAttribute<Persona, String> perApellido1;
    public static volatile SingularAttribute<Persona, String> perApellido2;
    public static volatile CollectionAttribute<Persona, Traspaso> traspasoCollection;
    public static volatile CollectionAttribute<Persona, Personapermiso> personapermisoCollection;
    public static volatile SingularAttribute<Persona, Cargo> carId;
    public static volatile SingularAttribute<Persona, String> perEmail;

}