package net.baojuxinxi.utils;

import java.util.UUID;

public class UUIDUtil {
	
	public static String generateUUID(){
		String uuid=String.valueOf(UUID.randomUUID());
		return uuid.replaceAll("-", "").toLowerCase();
	}
	
	public static void main(String[] args) {
		for(int i=0;i<10;i++)
		System.out.println("#"+(i+1)+"# "+generateUUID());
//		System.out.println(generateUUID());
	}
}
