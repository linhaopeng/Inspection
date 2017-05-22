package net.baojuxinxi.utils;
import java.util.HashMap;
import java.util.Map;

public class ErrorCodeUtill {
	public static Map<String, String> map = new HashMap<String, String>();
	static {

		map.put("5000", "令牌校验失败");
		
		map.put("5003", "未知异常");
	
		map.put("10000", "成功");
		map.put("11111", "失败");
		map.put("22222", "图片上传失败");
		map.put("10001", "没有数据");
		map.put("10002", "当前页或每页行数为空");
		map.put("10003", "参数不能为空");
		
		//登录
		map.put("5011", "账号退出失败");
		map.put("5012", "账号为空");
		map.put("5013", "登录密码为空");
		map.put("5014", "新登录密码为空");
		map.put("5015", "账号或密码错误");
		map.put("5016", "修改密码失败");
		map.put("5017", "登录密码错误");
		map.put("5018", "用户不存在");
		
		//用户信息
		
		//项目信息
		map.put("6000", "项目id为空");
		map.put("6001", "问题评论内容为空");
		map.put("6002", "修改项目失败");
		map.put("6003", "修改项目进度失败");
		map.put("6004", "项目不存在");
	}

	public static String getCode(String code) {
		String temp = map.get(code);
		if (temp == null) {
			return "5003";
		} else {
			return code;
		}
	}
}
