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

public class sTraspaso {

    public static String listaTodosTraspaso() throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/traspaso");
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

    public static String listaTraspasoId(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/traspaso/" + codigo);
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
    
        public static String listaTraspasoPorFecha(String fechai, String fechaf) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/invtraspasofecha/" + fechai + "/" + fechaf);
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

    public static String listaTaspasoUbicDepPorFecha(String ubicacion, String dependencia, String fechai, String fechaf) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/invtraspasoUbicDepfecha/" + ubicacion.replaceAll(" ", "_") + "/" + dependencia.replaceAll(" ", "_") + "/" + fechai + "/" + fechaf);
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

        public static String listaTaspasoMarcaPorFecha(String marca, String fechai, String fechaf) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/invtraspasoMarcafecha/" + marca + "/" + fechai + "/" + fechaf);
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
        
    public static String listaTaspasoDesactivadosPorFecha(String fechai, String fechaf) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/invtraspasoDesactivadosfecha/" + fechai + "/" + fechaf);
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
//    public static String listaTraspasoCedBien(String codBien, String codPer) throws JSONException {
//        String strJson = "";
//        try {
//            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/wstraspaso/" + codBien + codPer);
//            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
//            connection.setRequestMethod("GET");
//            connection.setDoOutput(true);
//            connection.setDoInput(true);
//            InputStream content = (InputStream) connection.getInputStream();
//            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
//            String line;
//            while ((line = in.readLine()) != null) {
//                strJson = line;
//            }
//            connection.disconnect();
//        } catch (NumberFormatException | IOException ex) {
//            System.out.println("Fallort");
//        }
//        return strJson;
//    }
    
    public static String InsertarTraspaso(String json) throws JSONException {
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/traspaso");

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

    public static String EliminarTraspaso(Integer codigo) throws JSONException {
        String strJsonResponse = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/traspaso/" + codigo);
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
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJsonResponse;
    }

    public static String ModficTraspaso(String json, Integer codigo) throws IOException {
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS +"/traspaso/" + codigo);
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
