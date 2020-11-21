/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entidades.Ubicacion;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author BLADD-ESPOCH
 */
@Stateless
@Path("ubicacion")
public class UbicacionFacadeREST extends AbstractFacade<Ubicacion> {

    @PersistenceContext(unitName = "dtic_controlBienesAD_war_1.0PU")
    private EntityManager em;

    public UbicacionFacadeREST() {
        super(Ubicacion.class);
    }

    @POST
    //@Override
    @Consumes({"application/json; charset=utf-8"})
    @Produces({"application/json; charset=utf-8"})
    public Ubicacion insertar(Ubicacion entity) {
        //super.create(entity);
        try {
            super.create(entity);
            em.flush();
            return entity;
        } catch (Exception e) {
            System.out.println("" + e);
            entity =null;
            return entity;
        }
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/json; charset=utf-8"})
    public void edit(@PathParam("id") Integer id, Ubicacion entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/json; charset=utf-8"})
    public Ubicacion find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/json; charset=utf-8"})
    public List<Ubicacion> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/json; charset=utf-8"})
    public List<Ubicacion> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
