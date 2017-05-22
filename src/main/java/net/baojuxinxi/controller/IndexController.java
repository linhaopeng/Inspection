package net.baojuxinxi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.Roles;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.IPermissionService;
import net.baojuxinxi.service.IRoleService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 进入系统主页
 * @author cxj
 *
 */
@Controller
public class IndexController {

	@Resource
	IRoleService roleService;
	
	@Resource
	IPermissionService permissionService;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String toIndex(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,ModelMap model){
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null){
			//获取菜单列表
			List<Object> menus = permissionService.findMenuPermission(user);
			Roles role = roleService.findUserRole(user);
			model.put("user", user);
			model.put("menus", menus);
			model.put("role", role);
			session.setAttribute("role", role);//保存到session，以便后面比较用户角色是否改变
			Map<String, Object> queryMap = new HashMap<String, Object>();
			queryMap.put("userId", user.getId());
		}
		return "index";
	}
	
}