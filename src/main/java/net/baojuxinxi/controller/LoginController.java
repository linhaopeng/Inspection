package net.baojuxinxi.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.phoneInterface.Current;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.ISystemUsersService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 登陆登出模块
 * @author xl
 *
 */
@Controller
public class LoginController {
	
	@Resource
	private ISystemUsersService systemUsersService;
	
	/**
	 * 登陆系统
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Result toLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		if(username == null || password == null || code == null)
			throw new RuntimeException("参数不能为空");
//		String sessionCode = (String) session.getAttribute(session.getId());
		String sessionCode = (String) session.getAttribute("codeId");
		if(sessionCode.equalsIgnoreCase(code)){
			System.out.println(username+":"+password+":"+code);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("username", username.trim());
			password=Current.md5(password.trim());
			map.put("password", password);
			map.put("isUse", 1);//使用中
			Result validateResult = systemUsersService.findSystemUsers(map);
			if(validateResult.isSuccess()){
				session.setAttribute("user", validateResult.getData());//登陆成功，将用户存入session
			}
			return validateResult;
		}else{
			return new Result(false,"code_error",null);
		}
	}
	
	/**
	 * 登出系统
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String toLogout(HttpServletRequest request,
			HttpServletResponse response,HttpSession session){
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null){
			session.removeAttribute("user");
			session.removeAttribute("role");
			session.removeAttribute("company");
			session.removeAttribute("typeList");
		}
		return "redirect:/login";
	}
	
	
}
