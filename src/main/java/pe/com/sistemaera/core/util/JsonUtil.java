package pe.com.sistemaera.core.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pe.com.gmd.util.exception.GmdException;

public class JsonUtil {

	public static String convertirObjetoACadenaJson(Object objeto){
        Gson objetoGson = new GsonBuilder().registerTypeAdapter(Date.class, new DateSerializer("dd/MM/yyyy HH:mm:ss")).create();
        return objetoGson.toJson(objeto);
    }
    
    public static <T> T convertirCadenaJsonAObjeto(String cadena, Class<T> clase) {       
    	Gson objetoGson=null;
//    	cadena=URLDecoder.decode(cadena, "UTF-8");
		cadena = ParametrosUtil.formatearAUTF8(cadena);
 		GsonBuilder objetoGsonBuilder = new GsonBuilder();     
        objetoGsonBuilder.registerTypeAdapter(Date.class, new DateSerializer("dd/MM/yyyy HH:mm:ss"));   
        objetoGsonBuilder.registerTypeAdapter(Long.class, new LongTypeAdapter());
        objetoGsonBuilder.registerTypeAdapter(Integer.class, new IntegerTypeAdapter());

        objetoGson = objetoGsonBuilder.create();
        objetoGson.fromJson(cadena, clase);
        return objetoGson.fromJson(cadena, clase);
    }
    
    
    public static <T> T convertirCadenaJsonAObjeto2(String cadena, Class<T> clase) throws UnsupportedEncodingException {       
    	Gson objetoGson=null;
    	cadena=URLDecoder.decode(cadena, "UTF-8");
//		cadena = ParametrosUtil.formatearAUTF8(cadena);
 		GsonBuilder objetoGsonBuilder = new GsonBuilder();     
        objetoGsonBuilder.registerTypeAdapter(Date.class, new DateSerializer("dd/MM/yyyy HH:mm:ss"));   
        objetoGsonBuilder.registerTypeAdapter(Long.class, new LongTypeAdapter());
        objetoGsonBuilder.registerTypeAdapter(Integer.class, new IntegerTypeAdapter());

        objetoGson = objetoGsonBuilder.create();
        objetoGson.fromJson(cadena, clase);
        return objetoGson.fromJson(cadena, clase);
    }
    
    
    /*
     * Permite convertir un json array a un type especifico
     */
    public static <T> T convertirCadenaJsonALista(String cadena, Type type){
		Gson objetoGson = null;
//    	cadena=URLDecoder.decode(cadena, "UTF-8");
	    cadena = ParametrosUtil.formatearAUTF8(cadena);
	    GsonBuilder objetoGsonBuilder = new GsonBuilder();
	    objetoGsonBuilder.registerTypeAdapter(Date.class, new DateSerializer("dd/MM/yyyy HH:mm:ss"));      
	    objetoGson = objetoGsonBuilder.create();
        return objetoGson.fromJson(cadena, type);
        
        
    }
    
    public static <T> T convertirCadenaJsonALista2(String cadena, Type type) throws UnsupportedEncodingException{
		Gson objetoGson = null;
    	cadena=URLDecoder.decode(cadena, "UTF-8");
	    //cadena = ParametrosUtil.formatearAUTF8(cadena);
	    GsonBuilder objetoGsonBuilder = new GsonBuilder();
	    objetoGsonBuilder.registerTypeAdapter(Date.class, new DateSerializer("dd/MM/yyyy HH:mm:ss"));      
	    objetoGson = objetoGsonBuilder.create();
        return objetoGson.fromJson(cadena, type);
        
        
    }
    
    
    //Se utiliza jackson debido a que con gson se tuvo problemas con los numericos
    public static <T> T convertirCadenaJsonPostAObjeto(String cadena, Class<T> clase) throws GmdException{        

			try {
				return new ObjectMapper().readValue(ParametrosUtil.formatearAUTF8(cadena), clase);
			} catch (com.fasterxml.jackson.core.JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (com.fasterxml.jackson.databind.JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
    }
    
    public static <T> T convertirCadenaJsonAObjetoRequest(String cadena, Class<T> clase){        
    	Gson objetoGson=null;
        GsonBuilder objetoGsonBuilder = new GsonBuilder();
        objetoGsonBuilder.registerTypeAdapter(Date.class, new DateSerializer("dd/MM/yyyy HH:mm:ss"));      
        objetoGson = objetoGsonBuilder.create();
        objetoGson.fromJson(cadena, clase);
        return objetoGson.fromJson(cadena, clase);
    }
    
    public static String convertirObjetoACadenaJson(Object objeto, String formatoFecha){
        Gson objetoGson = new GsonBuilder().registerTypeAdapter(Date.class, new DateSerializer(formatoFecha)).create();
        return objetoGson.toJson(objeto);
    }    
        
    public static JsonArray convertirCadenaJsonAArrayJson(String cadena){
    	JsonArray jsonArray = new JsonParser().parse(cadena).getAsJsonArray();
    	return jsonArray;
    }
    
    public static String obtenerJsonField(String cadena, String fieldName){
    	GsonBuilder objetoGsonBuilder = new GsonBuilder();
    	Gson objetoGson = objetoGsonBuilder.create();
    	JsonObject jsonObject = objetoGson.fromJson(cadena, JsonObject.class);
    	return jsonObject.get(fieldName).getAsString();
    }
    
}
