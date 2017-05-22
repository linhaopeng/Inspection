package net.baojuxinxi.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;

public class ListUtil {

	/**
	 * 去除list中重复值
	 * @param list
	 * @return
	 */
	public static List removeDuplicateWithOrder(List list) {
		Set set = new HashSet();
		List newList = new ArrayList();
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			Object element = iter.next();
			if (set.add(element))
				newList.add(element);
		}
		list.clear();
		list.addAll(newList);
		System.out.println(" remove duplicate " + list);
		return list;
	}
	
	/**
	 * 删除null对象
	 * @return
	 */
	public static List removeNullObject(List list){
		Collection nullCon = new Vector(); 
		nullCon.add(null); 
		list.removeAll(nullCon);
		return list;
	}
}
