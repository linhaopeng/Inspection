package net.baojuxinxi.pojo;

import java.io.Serializable;

/**
 *	用来封装Controller向页面传出的数据
 */
public class Result implements Serializable{
	
	private static final long serialVersionUID = 6520550543487766561L;

	/**
	 * 程序是否执行成功，默认为true。
	 * 目前都是返回true，后续我们会采用统一的方式
	 * 处理异常，届时会改变这个属性的值为false，
	 * 同时给message设置相关的错误提示。
	 */
	private boolean success=true;
	
	/**
	 * 当程序执行报错时，用来封装错误信息
	 */
	private String message;
	
	/**
	 * 用来封装业务数据
	 */
	private Object data;

	public Result(){
		
	}
	
	public Result(Object data){
		this.data=data;
	}
	
	public Result(boolean success,String message,Object data){
		this.success=success;
		this.message=message;
		this.data=data;
	}
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
