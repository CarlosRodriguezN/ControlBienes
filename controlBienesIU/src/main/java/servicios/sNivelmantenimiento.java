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
import java.io.UnsupportedEncodingException;
import javax.net.ssl.HttpsURLConnection;
import java.net.URL;
import org.json.JSONException;
import utils.Constantes;

/**
 *
 * @author kuri
 */
public class sNivelmantenimiento {

    public static String listaTodosNivelMantenimiento() throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/nivelmantenimiento");
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
            System.out.println(ex.getLocalizedMessage());
            System.out.println("Fallort");
        }
        return strJson;
    }

    public static String listaNivelMantenimientoNombre(String nombre) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        nombre = java.net.URLEncoder.encode(nombre, "UTF-8");
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/nombreNivelMantenimiento/" + nombre);
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

    public static String InsertarNivelMantenimiento(String json) throws JSONException {
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/nivelmantenimiento");

            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "UTF-8")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (Exception e) {
            String aa = e.toString();
        }
        return strJsonResponse;
    }

    public static String DetallesNivelMantenimiento(Integer idMant) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/nivelmantenimiento/" + idMant);
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

    public static String ModificarNivelMantenimiento(String json, Integer codigo) throws IOException {
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/nivelmantenimiento/" + codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("PUT");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "UTF-8")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (NumberFormatException | IOException e) {
            System.out.println("Fallort");
        }
        return strJsonResponse;
    }

}
