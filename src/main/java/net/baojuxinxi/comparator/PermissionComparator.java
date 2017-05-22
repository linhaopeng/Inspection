package net.baojuxinxi.comparator;

import java.util.Comparator;
import java.util.Map;

//import net.baojuxinxi.pojo.Permission;

public class PermissionComparator implements Comparator<Object>{

	@Override
	public int compare(Object o1, Object o2) {
		int result = 0;
		if(o1 instanceof Map && o2 instanceof Map){
			//Permission p1 = (Permission) ((Map<String,Object>) o1).get("id");
			//Permission p2 = (Permission) ((Map<String,Object>) o2).get("id");
			//result = p1.getCreatedTime().compareTo(p2.getCreatedTime());
		}
		return result;
	}

	
}
