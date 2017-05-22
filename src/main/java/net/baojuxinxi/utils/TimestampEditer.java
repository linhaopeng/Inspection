package net.baojuxinxi.utils;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;



public class TimestampEditer extends PropertyEditorSupport {
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(text==null){
			setValue(null);
		}else{
			System.out.println(new Timestamp(Long.valueOf(text)));
			setValue(new Timestamp(Long.valueOf(text)));
		}
	}
}
