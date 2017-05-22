package net.baojuxinxi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import net.baojuxinxi.pojo.Department;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.IDepartmentService;

/**
 *
 * @author xl
 *
 */
@Controller
public class DepartmentController {
	
	
	@Resource
	private IDepartmentService departmentService;
	

	/**
	 * 获取部门分页信息列表
	 */
	@RequestMapping(value = "/get_department_page", method = RequestMethod.POST)
	@ResponseBody
	public Result getDepartmentPage(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,ModelMap model){
		String pageNumber = request.getParameter("pageNumber"); 
		String pageSize = request.getParameter("pageSize");
		String reqData = request.getParameter("reqData");
		String departmentId = request.getParameter("departmentId");
		JSONObject jo = null;
		String departmentName = null;
		if(StringUtils.isNotEmpty(reqData)){
			jo = JSON.parseObject(reqData);
			departmentName = jo.getString("departmentName");
		}
		if(StringUtils.isBlank(pageNumber)||Integer.valueOf(pageNumber)<1){
			pageNumber="1";
		}
		if(StringUtils.isBlank(pageSize)){
			pageSize="8";
		}
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("departmentId", departmentId);
			map.put("departmentName", departmentName);
			map.put("isUse", 1);
			PagedResult<Department> department = departmentService.findDepartmentByPage(map,Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
			return new Result(department);
		}else{
			return new Result(false,"会话中不存在该用户",null);
		}
	}
	
	
	/**
	 * 获取部门信息列表
	 */
	@RequestMapping(value = "/get_department_list", method = RequestMethod.GET)
	@ResponseBody
	public Result getDepartmentlist(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,ModelMap model){
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isUse", 1);
			List<Map<String, Object>> department = departmentService.findDepartmentList(map);
			return new Result(department);
		}else{
			return new Result(false,"会话中不存在该用户",null);
		}
	}
	
	/**
	 * 修改、保存部门信息
	 */
	@RequestMapping(value = "/save_Deprtment", method = RequestMethod.POST)
	@ResponseBody
	public Result saveDeprtmen(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,ModelMap model){
		String type = request.getParameter("type"); //判断是新增还是修改
		String departmentId = request.getParameter("departmentId");//部门Id
		String departmentName = request.getParameter("departmentName");//部门名
		String levels = request.getParameter("levels");//部门等级
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		String describe = request.getParameter("describe");//描述
		if(StringUtils.isEmpty(type)
				|| StringUtils.isEmpty(departmentName)  )
			throw new RuntimeException("参数不能为空");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("departmentName", departmentName);
		map.put("describe", describe);
		map.put("createdBy", user.getId());
		map.put("latestUpdateBy", user.getUsername());
		map.put("levels", Integer.valueOf(levels));
		
		Result result = new Result(false,"保存失败！",null);
		String logContent = null;
		Integer operType = null;
		switch (type) {
		case "1"://新增
			result = departmentService.addDepartment(map);
			logContent = "新增部门";
			operType = 1;
			break;
		case "2"://修改
			if(StringUtils.isEmpty(departmentId))
				throw new RuntimeException("参数不能为空");
			map.put("departmentId", departmentId);
			result = departmentService.modifyDepartment(map);
			logContent = "修改部门";
			operType = 3;
			break;
		}
		request.setAttribute("logContent", logContent+(result.isSuccess()? "成功":"失败"));//日志内容
		request.setAttribute("operType", operType);//操作类型（1-增，2-删，3-改）
		return result;
	}
	
	/**
	 * 删除部门信息
	 */
	@RequestMapping(value = "/delete_department", method=RequestMethod.POST)
	@ResponseBody
	public Result departmentDelete(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,ModelMap model,@RequestParam(value = "selectedArr") String[] datas){
		Result result = new Result(false, "删除部门信息失败！", null);
		if(datas.length != 0){
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("isUse", 0);
			map.put("latestUpdateTime", new Date());
			map.put("idItems", datas);
			result = departmentService.deleteDepartmentBatch(map);
		}
		request.setAttribute("logContent", "删除部门信息用户"+(result.isSuccess()? "成功":"失败"));//日志内容
		request.setAttribute("operType", 2);//操作类型（1-增，2-删，3-改）
		return result;
	}
	
}