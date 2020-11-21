/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author Usuario
 */
@javax.ws.rs.ApplicationPath("wsBienes")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    /**
     * Do not modify addRestResourceClasses() method.
     * It is automatically populated with
     * all resources defined in the project.
     * If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(service.AuditoriaFacadeREST.class);
        resources.add(service.BajaFacadeREST.class);
        resources.add(service.BienFacadeREST.class);
        resources.add(service.CargoFacadeREST.class);
        resources.add(service.CatalogoFacadeREST.class);
        resources.add(service.CsvFacadeREST.class);
        resources.add(service.DependenciaFacadeREST.class);
        resources.add(service.InformeFacadeREST.class);
        resources.add(service.MantenimientoFacadeREST.class);
        resources.add(service.MantenimientosFacadeREST.class);
        resources.add(service.MotivoinformeFacadeREST.class);
        resources.add(service.NivelmantenimientoFacadeREST.class);
        resources.add(service.PersonaFacadeREST.class);
        resources.add(service.TecnicoFacadeREST.class);
        resources.add(service.TempFacadeREST.class);
        resources.add(service.TipoingresoFacadeREST.class);
        resources.add(service.TipomantenimientoFacadeREST.class);
        resources.add(service.TraspasoFacadeREST.class);
        resources.add(service.UbicacionFacadeREST.class);
        resources.add(servicePer.ws.class);
              
        
    }
    
}
