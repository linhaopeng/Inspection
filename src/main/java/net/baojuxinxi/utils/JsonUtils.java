package net.baojuxinxi.utils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;

public class JsonUtils {

	public final static ObjectMapper mapper = new ObjectMapper(); 
	
	public static <T> List<T> getList(String jsonStr, Class<T> clazz) throws JsonParseException, JsonMappingException, IOException{
		JavaType javaType = getCollectionType(ArrayList.class, clazz); 
		return (ArrayList<T>)mapper.readValue(jsonStr, javaType);
	}
	
	public static <T> T fromJson(String jsonStr, Class<T> clazz) throws JsonParseException, JsonMappingException, IOException{
		return mapper.readValue(jsonStr, clazz);
	}
	
	public static <T> String toJson(T t) throws JsonGenerationException, JsonMappingException, IOException{
		return mapper.writeValueAsString(t);
	}
	
	public static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) { 
		return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);   
	}
	
}
