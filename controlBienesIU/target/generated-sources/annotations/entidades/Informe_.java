package entidades;

import entidades.Bien;
import entidades.Motivoinforme;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-09T11:48:56")
@StaticMetamodel(Informe.class)
public class Informe_ { 

    public static volatile SingularAttribute<Informe, Bien> bnCodBien;
    public static volatile SingularAttribute<Informe, Integer> infId;
    public static volatile SingularAttribute<Informe, Integer> infTecnicoId;
    public static volatile SingularAttribute<Informe, Motivoinforme> motId;
    public static volatile SingularAttribute<Informe, String> infFechaElabora;
    public static volatile SingularAttribute<Informe, Integer> infSolicitanteId;

}