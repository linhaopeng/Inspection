package net.baojuxinxi.utils;

public class StringUtils {

	/**
	 * 判断对象是否不为空 
	 * @param obj
	 * @return  true-不为空  false-为空  
	 */
	public static boolean isNotEmpty(Object obj){
		if(null==obj || "".equals(obj) || "null".equals(obj)){
			return false;
		}
		return true;
	}
	
	public static boolean isEmpty(Object obj){
		if(null==obj || "".equals(obj.toString()) || "null".equals(obj)){
			return true;
		}
		return false;
	}
	
	//生产随机字符串
    public static String getRandomString(int length) { //length表示生成字符串的长度
	    String base = "abcdefghijklmnopqrstuvwxyz0123456789";   
	    java.util.Random random = new java.util.Random();   
	    StringBuffer sb = new StringBuffer();   
	    for (int i = 0; i < length; i++) {   
	        int number = random.nextInt(base.length());   
	        sb.append(base.charAt(number));   
	    }   
	    return sb.toString();   
	 }
    
   
    public static int parseInt(String numStr,int defNum){
    	try {
    		return Integer.parseInt(numStr);
    	} catch(Exception e){
    		return defNum;
    	}
    }
    
}
