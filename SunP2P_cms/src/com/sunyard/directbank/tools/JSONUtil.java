package com.sunyard.directbank.tools;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONStringer;

public class JSONUtil {
	 /**  
     * 从一个JSON 对象字符格式中得到一个java对象 说明：Bean的无参构造函数一定要写, 否则会报:  
     * net.sf.json.JSONException: java.lang.NoSuchMethodException  
     *   
     * @param jsonString  
     * @param pojoCalss  
     * @return  
     */  
    @SuppressWarnings("rawtypes")
	public static Object getObjectFromJsonString(String jsonString,   
            Class pojoCalss) {   
        Object pojo;   
        JSONObject jsonObject = JSONObject.fromObject(jsonString);   
        pojo = JSONObject.toBean(jsonObject, pojoCalss);   
        return pojo;   
    }   
  
    /**  
     * 将java对象转换成json字符串  
     *   
     * @param javaObj  
     * @return  
     */  
    public static String getJsonStringFromObject(Object javaObj) {   
        JSONObject json;   
        json = JSONObject.fromObject(javaObj);   
        return json.toString();   
    }   
    @SuppressWarnings("rawtypes")
	public static JSONArray getJSONArrayFromList(List list) {   
        JSONArray jsonArray = JSONArray.fromObject(list);   
        return jsonArray;   
    }   
    /**  
     * 从json HASH表达式中获取一个map  
     *   
     * @param jsonString  
     * @return  
     */  
    @SuppressWarnings("rawtypes")
	public static Map getMapFromJsonString(String jsonString) {  
    	JSONObject jsonObject = JSONObject.fromObject(jsonString);   
    	Map<String,Object> valueMap = new HashMap<String,Object>();   
    	for(Object key:jsonObject.keySet()){
    		valueMap.put((String)key, jsonObject.get(key));
    	}
        return valueMap;   
    }   
  
    /**  
     * 从Map对象得到Json字串  
     *   
     * @param map  
     * @return  
     */  
    @SuppressWarnings("rawtypes")
	public static String getJsonStringFromMap(Map map) {   
        JSONObject json = JSONObject.fromObject(map);   
        return json.toString();   
    }   
  
    /**  
     * 从json字串中得到相应java数组  
     *   
     * @param jsonString  
     *            like "[\"李斯\",100]"  
     * @return  
     */  
    public static Object[] getObjectArrayFromJsonString(String jsonString) {   
        JSONArray jsonArray = JSONArray.fromObject(jsonString);   
        return jsonArray.toArray();   
    }   
  
    /**  
     * 将list转换成Array  
     *   
     * @param list  
     * @return  
     */  
    @SuppressWarnings("rawtypes")
	public static Object[] getObjectArrayFromList(List list) {   
        JSONArray jsonArray = JSONArray.fromObject(list);   
        return jsonArray.toArray();   
    }   
  
    /**  
     * 用JSONStringer构造一个JsonString  
     *   
     * @param m  
     * @return  
     */  
    @SuppressWarnings("rawtypes")
	public static String buildJsonString(Map m) {   
        JSONStringer stringer = new JSONStringer();   
        stringer.object();   
        for (Object key : m.keySet()) {   
            stringer.key((String) key)   
                .value((String)m.get(key));   
        }   
        stringer.endObject();   
        return stringer.toString();   
    }   
  
    @SuppressWarnings("rawtypes")
	public static void printMap(Map map) {   
        for (Object key : map.keySet()) {   
            System.out.println(key + ":" + map.get(key));   
        }   
    }   
  
}
