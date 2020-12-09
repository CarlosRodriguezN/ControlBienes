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

public class sBien {

    public static String listaTodosBien() throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/bien");
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

    public static String listaBienId(String codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/bien/" + codigo);
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

    public static String InsertarBien(String json) throws JSONException {
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/bien");

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

    public static String EliminarBien(String codigo) throws JSONException {
        String strJsonResponse = "";
        try {
            //SERVICIO
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/bien/" + codigo);
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

    public static String ModficBien(String json, String codigo) throws IOException {
        String strJsonResponse = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/bien/" + codigo);
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

    /*personalizados*/
    public static String listaBienNombre(String nombre) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        nombre = java.net.URLEncoder.encode(nombre, "UTF-8");
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/idBien/" + nombre);
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

    public static String BienDependenciaId(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/BienDependenciaId/" + codigo);
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

    public static String BienUbicacionId(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/BienUbicacionId/" + codigo);
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

    public static String BienBajaId(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/BienBajaId/" + codigo);
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

    //    fase 2 
//    buscar bienes por código
    public static String buscarbiencodigo(String codigo) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        codigo = java.net.URLEncoder.encode(codigo, "UTF-8");
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/buscarbienes/" + codigo);
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

    //BUSCAR por nombre
    public static String buscarbiennombre(String nombre) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        nombre = java.net.URLEncoder.encode(nombre, "UTF-8");
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/buscarbienesnombre/" + nombre);
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

    //buscar por serie
    public static String buscarbienserie(String serie) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        serie = java.net.URLEncoder.encode(serie, "UTF-8");
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/buscarbienesserie/" + serie);
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

    public static String listaGarantiaPorFecha(String fechactual) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/invGarantiafecha/" + fechactual);
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
    
    public static String listaBienDesactivadosPorFecha(String fechai, String fechaf) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        try {
            URL url = new URL(Constantes.PREFIJO + Constantes.IP + "/" + Constantes.SERVICIO + "/" + Constantes.ACCESO_DATOS + "/invBienDesactivadosfecha/" + fechai + "/" + fechaf);
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
}


