/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import javax.net.ssl.HttpsURLConnection;
import java.net.URL;
import org.json.JSONException;
import utils.Constantes;

/**
 *
 * @author DESARROLLO
 */
public class sSeguridad {

    public static String listarRol(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/rol/"+ codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }
    public static String listarSistema(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/sistema/"+ codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }
    public static String listarAccion(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/accion/"+ codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }
      public static String ServicioModficarRol(String json, Integer codigo) throws IOException {  //CLIENTE PARA CONSUMIR EL SERVICIO
        String idNuevoUsuario = null;
        String status = "";
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/funcion/" + codigo);  //SERVICIO
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("PUT");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "ISO-8859-1")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (NumberFormatException | IOException e) {
        }
        return strJsonResponse;
    }
    public static String listarFuncion(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/funcion/"+ codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }
    public static String listargrupo(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/grupo/"+ codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }
    public static String listarAcciones(Integer codigo,Integer id, String nombre) throws JSONException {
        String strJson = "";
        try {
            //SERVICIO
            String nombreq= java.net.URLEncoder.encode(nombre,"UTF-8");
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/listaaccionessdadousuariosistema/"+ codigo+"/"+ id +"/"+ nombreq);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }

    
    
     public static String listarRoles(Integer codigo, String nombre) throws JSONException {
        String strJson = "";
        try {
            String nombreq= java.net.URLEncoder.encode(nombre,"UTF-8");
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/listarolessdadousuariosistema/"+ codigo+"/"+ nombreq);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }
     public static String listarRolesPersonas() throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/listarolessdadosistematodosusuarios/DESEMPENIO%20DOCENTE");
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;

            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;

    }

     
   public static String ServicioEliminarRol(Integer codigo) throws JSONException {
        String strJsonResponse = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/wsrol/funcion/" + codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("DELETE");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            connection.setRequestProperty("Accept", "application/json; charset=UTF-8");
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            String line;
            String strJson = "";
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            strJsonResponse = new String(strJson.getBytes("ISO-8859-1"), "UTF-8");
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
        }
        return strJsonResponse;
    }

    public static String ServicioInsertarRol(String json) throws IOException {  //CLIENTE PARA CONSUMIR EL SERVICIO
        String idNuevoUsuario = null;
        String status = "";
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/funcion");  //SERVICIO

            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "ISO-8859-1")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (NumberFormatException | IOException e) {
            System.out.println("ddd"+e);
        }
        return strJsonResponse;
    }
    public static String ServicioInsertarusuario(String json) throws IOException {  //CLIENTE PARA CONSUMIR EL SERVICIO
        String idNuevoUsuario = null;
        String status = "";
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO_seguridad + Constantes.IP_seguridad + "/" + Constantes.SERVICIO_seguridad + "/wsrol/usuario");  //SERVICIO

            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "ISO-8859-1")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (NumberFormatException | IOException e) {
        }
        return strJsonResponse;
    }
    
}
