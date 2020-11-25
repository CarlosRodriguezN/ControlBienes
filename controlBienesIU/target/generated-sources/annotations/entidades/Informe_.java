package entidades;

import entidades.Bien;
import entidades.Motivoinforme;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-24T20:26:25")
@StaticMetamodel(Informe.class)
public class Informe_ { 

    public static volatile SingularAttribute<Informe, Bien> bnCodBien;
    public static volatile SingularAttribute<Informe, Integer> infId;
    public static volatile SingularAttribute<Informe, Integer> infTecnicoId;
    public static volatile SingularAttribute<Informe, Motivoinforme> motId;
    public static volatile SingularAttribute<Informe, String> infFechaElabora;
    public static volatile SingularAttribute<Informe, Integer> infSolicitanteId;

}