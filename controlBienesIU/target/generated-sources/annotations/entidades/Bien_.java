package entidades;

import entidades.Baja;
import entidades.Catalogo;
import entidades.Dependencia;
import entidades.Tecnodisco;
import entidades.Tipoingreso;
import entidades.Ubicacion;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-12-18T10:55:46")
@StaticMetamodel(Bien.class)
public class Bien_ { 

    public static volatile SingularAttribute<Bien, String> bnModelo;
    public static volatile SingularAttribute<Bien, String> bnTipBateria;
    public static volatile SingularAttribute<Bien, String> swVigencia;
    public static volatile SingularAttribute<Bien, Integer> bnNumConect;
    public static volatile SingularAttribute<Bien, String> bnNumFusor;
    public static volatile SingularAttribute<Bien, String> bnSerie;
    public static volatile SingularAttribute<Bien, String> bnLumenes;
    public static volatile SingularAttribute<Bien, String> bnDiscoTecn;
    public static volatile SingularAttribute<Bien, String> bnProcesador;
    public static volatile SingularAttribute<Bien, String> bnTipLector;
    public static volatile SingularAttribute<Bien, String> bnMarca;
    public static volatile SingularAttribute<Bien, Baja> baId;
    public static volatile SingularAttribute<Bien, Integer> bnCantToner;
    public static volatile SingularAttribute<Bien, Tecnodisco> tecnoId;
    public static volatile SingularAttribute<Bien, String> bnModeToner;
    public static volatile SingularAttribute<Bien, String> bnEstadoUso;
    public static volatile SingularAttribute<Bien, Integer> bnTiempoGarantia;
    public static volatile SingularAttribute<Bien, Boolean> bnImpColor;
    public static volatile SingularAttribute<Bien, String> bnMonitorTecn;
    public static volatile SingularAttribute<Bien, Float> bnPrecio;
    public static volatile SingularAttribute<Bien, Integer> bnNumPuertRouter;
    public static volatile SingularAttribute<Bien, String> swTipSoporte;
    public static volatile SingularAttribute<Bien, String> bnTipoConexion;
    public static volatile SingularAttribute<Bien, Catalogo> catId;
    public static volatile SingularAttribute<Bien, String> bnFechaGarantia;
    public static volatile SingularAttribute<Bien, String> swFechaContrat;
    public static volatile SingularAttribute<Bien, String> bnNombre;
    public static volatile SingularAttribute<Bien, Boolean> bnRed;
    public static volatile SingularAttribute<Bien, String> bnFechaCompra;
    public static volatile SingularAttribute<Bien, Ubicacion> ubId;
    public static volatile SingularAttribute<Bien, String> bnMonitorTama;
    public static volatile SingularAttribute<Bien, String> bnProveedor;
    public static volatile SingularAttribute<Bien, String> swVersion;
    public static volatile SingularAttribute<Bien, Tipoingreso> tiId;
    public static volatile SingularAttribute<Bien, String> bnDisco;
    public static volatile SingularAttribute<Bien, String> bnColor;
    public static volatile SingularAttribute<Bien, Integer> swCantLicencia;
    public static volatile SingularAttribute<Bien, Integer> bdCantDisco;
    public static volatile SingularAttribute<Bien, String> bnRamTamano;
    public static volatile SingularAttribute<Bien, String> bnDescripcion;
    public static volatile SingularAttribute<Bien, String> bnEstadoBien;
    public static volatile SingularAttribute<Bien, Boolean> bnLectorDvd;
    public static volatile SingularAttribute<Bien, String> bnObservacion;
    public static volatile SingularAttribute<Bien, String> bnTipPantalla;
    public static volatile SingularAttribute<Bien, String> bnCodBien;
    public static volatile SingularAttribute<Bien, String> bnSo;
    public static volatile SingularAttribute<Bien, String> bnMemoInter;
    public static volatile SingularAttribute<Bien, Dependencia> dpId;
    public static volatile SingularAttribute<Bien, String> bnRamTecno;
    public static volatile SingularAttribute<Bien, Integer> bnCodMotBaja;
    public static volatile SingularAttribute<Bien, String> bnTecnProyector;
    public static volatile SingularAttribute<Bien, String> bnMemoExter;
    public static volatile SingularAttribute<Bien, String> bnTamPantalla;
    public static volatile SingularAttribute<Bien, String> bnTipoLampara;
    public static volatile SingularAttribute<Bien, String> bnResolucion;
    public static volatile SingularAttribute<Bien, String> bnFechaBaja;

}