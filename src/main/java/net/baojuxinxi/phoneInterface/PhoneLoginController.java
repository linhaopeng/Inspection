package net.baojuxinxi.phoneInterface;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.ISystemUsersService;
import net.baojuxinxi.utils.ErrorCodeUtill;
import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;


@Controller
public class PhoneLoginController {
	
	

	@Resource
	private ISystemUsersService systemUsersService;
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/phone/loginss", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loginss(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,@RequestBody JSONObject params) {
		
		
		/*Map<String, Object> params = Current.getMapParams(request
				.getParameterMap());*/
		Map<String, Object> map = Current.getMap();
		if (Current.key(params.get("method"), params.get("version"),
				params.get("timestemp"), params.get("sign"))) {
			try {
				net.sf.json.JSONObject fromObject = net.sf.json.JSONObject.fromObject(params.get("request"));
				JSONArray jsonArray = JSONArray.fromObject(fromObject);
				String userName = String.valueOf(jsonArray.getJSONObject(0).get(
						"userName"));
				String password = String.valueOf(jsonArray.getJSONObject(0).get(
						"password"));
				String code="page";
				session.setAttribute("codeId", "page");
				if(StringUtils.isBlank(userName)||"null".equals(userName)){
					map.put("code", "5012");
					map.put("message", ErrorCodeUtill.map.get("5012"));
					return map;
				}
				if(StringUtils.isBlank(password)||"null".equals(password)){
					map.put("code", "5013");
					map.put("message", ErrorCodeUtill.map.get("5013"));
					return map;
				}
				// 登录
				Result login = gotoLogin(request, session, userName, password,code);
				if("login_success".equals(login.getMessage())){
					//说明登录成功
					map.put("code", "10000");
					map.put("message", ErrorCodeUtill.map.get("10000"));
				}else{
					map.put("code", "5015");
					map.put("message", ErrorCodeUtill.map.get("5015"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				map.put("code", "5003");
				map.put("message", ErrorCodeUtill.map.get("5003"));
			}
			

		} else {
			map.put("code", "5000");
			map.put("message", ErrorCodeUtill.map.get("5000"));
		}
		return map;
	}
	
	public Result gotoLogin(HttpServletRequest request, HttpSession session,
			String username, String password,String code) {
		
		if(username == null || password == null || code == null)
			return new Result(false,"code_error",null);
//		String sessionCode = (String) session.getAttribute(session.getId());
		String sessionCode = (String) session.getAttribute("codeId");
		if(sessionCode.equalsIgnoreCase(code)){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("username", username.trim());
			map.put("password", password.trim());
			map.put("isUse", 1);//使用中

			
			Result validateResult = systemUsersService.findSystemUsers(map);
			if(validateResult.isSuccess()){
				session.setAttribute("user", validateResult.getData());//登陆成功，将用户存入session
				session.setMaxInactiveInterval(0);
				validateResult.setMessage("login_success");
			}
			return validateResult;
		}else{
			return new Result(false,"code_error",null);
		}
	}
	
	/**
	 * 登出系统
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/logout", method = RequestMethod.POST)
	public Map<String, Object> toLogout(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,@RequestBody JSONObject params){
		/*Map<String, Object> params = Current.getMapParams(request
				.getParameterMap());*/
		Map<String, Object> map = Current.getMap();
		if (Current.key(params.get("method"), params.get("version"),
				params.get("timestemp"), params.get("sign"))) {
			try {
				SystemUsers user = (SystemUsers) session.getAttribute("user");
				if(user != null){
					session.removeAttribute("user");
					session.removeAttribute("role");
					session.removeAttribute("company");
					session.removeAttribute("typeList");
					map.put("code", "10000");
					map.put("message", ErrorCodeUtill.map.get("10000"));
				}else{
					map.put("code", "5020");
					map.put("message", ErrorCodeUtill.map.get("5020"));
				}
				
			} catch (Exception e) {
				map.put("code", "5003");
				map.put("message", ErrorCodeUtill.map.get("5003"));
			}
			
		} else {
			map.put("code", "5000");
			map.put("message", ErrorCodeUtill.map.get("5000"));
		}
		return map;
	}
	
	
	
//	/**
//	 * 测试用。
//	 * @param request
//	 * @param response
//	 * @param session
//	 * @param params
//	 * @return
//	 */
//	@RequestMapping(value = "/phone/logins", method = RequestMethod.GET)
//	@ResponseBody
//	public Map<String, Object> phonelogins(HttpServletRequest request,HttpServletResponse response,
//			HttpSession session/*,@RequestBody JSONObject params*/) {
//		
//		
//		Map<String, Object> params = Current.getMapParams(request
//				.getParameterMap());
//		Map<String, Object> map = Current.getMap();
//		if (Current.key(params.get("method"), params.get("version"),
//				params.get("timestemp"), params.get("sign"))) {
//			try {
//				net.sf.json.JSONObject fromObject = net.sf.json.JSONObject.fromObject(params.get("request"));
//				JSONArray jsonArray = JSONArray.fromObject(fromObject);
//				String userName = String.valueOf(jsonArray.getJSONObject(0).get(
//						"userName"));
//				String password = String.valueOf(jsonArray.getJSONObject(0).get(
//						"password"));
//				String code="page";
//				session.setAttribute("codeId", "page");
//				if(StringUtils.isBlank(userName)||"null".equals(userName)){
//					map.put("code", "5012");
//					map.put("message", ErrorCodeUtill.map.get("5012"));
//					return map;
//				}
//				if(StringUtils.isBlank(password)||"null".equals(password)){
//					map.put("code", "5013");
//					map.put("message", ErrorCodeUtill.map.get("5013"));
//					return map;
//				}
//				// 登录
//				Result login = gotoLogin(request, session, userName, password,code);
//				if("login_success".equals(login.getMessage())){
//					//说明登录成功
//					map.put("code", "10000");
//					map.put("message", ErrorCodeUtill.map.get("10000"));
//				}else{
//					map.put("code", "5015");
//					map.put("message", ErrorCodeUtill.map.get("5015"));
//				}
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//				map.put("code", "5003");
//				map.put("message", ErrorCodeUtill.map.get("5003"));
//			}
//			
//
//		} else {
//			map.put("code", "5000");
//			map.put("message", ErrorCodeUtill.map.get("5000"));
//		}
//		return map;
//	}
//	
	
}
