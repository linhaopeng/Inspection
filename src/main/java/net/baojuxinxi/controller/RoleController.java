package net.baojuxinxi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.baojuxinxi.dao.RolesMapper;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.Roles;
import net.baojuxinxi.utils.StringUtils;

/**
 * @author xl
 *
 */
@Controller
public class RoleController {
	
	@Resource
	private RolesMapper rolesMapper;
	
	
	
	
}
