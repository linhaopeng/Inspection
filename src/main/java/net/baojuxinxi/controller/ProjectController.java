package net.baojuxinxi.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.pojo.Type;
import net.baojuxinxi.service.impl.ProjectServiceImpl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;


/**
 * 处理项目基类
 * @author xiaofeng
 *
 */
@Controller
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl projectService;
	
	/**
	 * 项目类型分页
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/get_project_type")
	@ResponseBody
	public Result getProjectType(HttpServletRequest request,HttpServletResponse response,
			HttpSession session){
		String pageNumber = request.getParameter("pageNumber"); 
		String pageSize = request.getParameter("pageSize");
		String reqData = request.getParameter("reqData");
		JSONObject jo = null;
		String typeName = null;
		if(StringUtils.isNotEmpty(reqData)){
			jo = JSON.parseObject(reqData);
			typeName = jo.getString("name");
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
			//map.put("projectTypeId", projectTypeId);
			map.put("name", typeName);
			map.put("isdeleted", 1);
			//查询项目类型
			PagedResult<Type> pagedResult = projectService.selectTypeList(map, Integer.valueOf(pageNumber),Integer.valueOf(pageSize) );
			return new Result(pagedResult);
		}else{
			return new Result(false,"会话中不存在该用户",null);
		}
		
	}
	
	/**
	 * 保存项目类型
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/save_project_type" )
	@ResponseBody
	public Result save_project_type(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,Type projectType){
		String type = request.getParameter("type"); //判断是新增还是修改
		String id = request.getParameter("id");//项目类型Id
		String code = request.getParameter("code");//项目编码
		String name = request.getParameter("name");//项目类型名
		String parentTypeId = request.getParameter("parentTypeId");//父类型ID
		String description = request.getParameter("description");//类型描述
		String listNo = request.getParameter("listNo");//显示序号
		String creator = request.getParameter("creator");//创建人
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(StringUtils.isEmpty(type)
				|| StringUtils.isEmpty(name)  )
			throw new RuntimeException("参数不能为空");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("code", code);
		map.put("creator", user.getId());
		map.put("parentTypeId", parentTypeId);
		map.put("description", description);
		if(StringUtils.isBlank(listNo)){
			listNo="0";
		}
		map.put("listNo", listNo);
		
		Result result = new Result(false,"保存失败！",null);
		String logContent = null;
		Integer operType = null;
		switch (type) {
		case "1"://新增
			result = projectService.addprojectType(map);
			logContent = "新增项目类型";
			operType = 1;
			break;
		case "2"://修改
			if(StringUtils.isEmpty(id))
				throw new RuntimeException("参数不能为空");
			map.put("typeId", id);
			result = projectService.modifyprojectType(map);
			logContent = "修改项目类型";
			operType = 3;
			break;
		}
		request.setAttribute("logContent", logContent+(result.isSuccess()? "成功":"失败"));//日志内容
		request.setAttribute("operType", operType);//操作类型（1-增，2-删，3-改）
		return result;
	}
	
	/**
	 * 删除信息
	 */
	@RequestMapping(value = "/delete_project_type", method=RequestMethod.POST)
	@ResponseBody
	public Result delete_project_type(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,ModelMap model,@RequestParam(value = "selectedArr") String[] datas){
		Result result = new Result(false, "删除项目类型失败！", null);
		if(datas.length != 0){
			
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("isdeleted", 0);
			map.put("idItems", datas);
			result = projectService.deleteDepartmentBatch(map);
		}
		request.setAttribute("logContent", "删除项目类型"+(result.isSuccess()? "成功":"失败"));//日志内容
		request.setAttribute("operType", 2);//操作类型（1-增，2-删，3-改）
		return result;
	}
	
	/**
	 * 项目信息分页
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param datas
	 * @return
	 */
	@RequestMapping(value = "/get_project_info", method=RequestMethod.POST)
	@ResponseBody
	public Result get_project_info(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,ModelMap model){
		
		//项目类型
		String typeId = null;
		//项目名
		String name = null;
		//项目编号
		String no = null;
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String reqData = request.getParameter("reqData");
		JSONObject jo = null;
		if(StringUtils.isNotEmpty(reqData)){
			jo = JSON.parseObject(reqData);
			typeId = jo.getString("typeId");
			name = jo.getString("name");
			no = jo.getString("no");
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
			map.put("typeId", typeId);
			map.put("no", no);
			map.put("name", name);
			map.put("isdeleted", 1);
			//查询项目类型
			PagedResult<Project> pagedResult = projectService.selectInfoList(map, Integer.valueOf(pageNumber),Integer.valueOf(pageSize) );
			//把项目类型ID换成项目类型名
			List<Project> dataList = pagedResult.getDataList();
			if(dataList!=null&&dataList.size()>0){
				List<Type> typeList = (List<Type>) session.getAttribute("typeList");
				for (Project project : pagedResult.getDataList()) {
					for (Type type : typeList) {
						if(project.getTypeId().equals(type.getTypeId())){
							project.setTypeId(type.getName());
							break;
						}
					}
				}
			}
			
			return new Result(pagedResult);
		}else{
			return new Result(false,"会话中不存在该用户",null);
		}
	}
	//
	/**
	 * 项目信息查询分页，多条件
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param datas
	 * @return
	 */
	@RequestMapping(value = "/get_project_info_show", method=RequestMethod.POST)
	@ResponseBody
	public Result get_project_info_show(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,Project project,String select_a,Integer select_b,Integer s_value){
		
	
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		
		if(StringUtils.isBlank(pageNumber)||Integer.valueOf(pageNumber)<1){
			pageNumber="1";
		}
		if(StringUtils.isBlank(pageSize)){
			pageSize="8";
		}
		
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("typeId", project.getTypeId());
			map.put("no", project.getNo());
			map.put("name", project.getName());
			map.put("investor", project.getInvestor());
			map.put("isdeleted", 1);
			
			map.put(select_a, select_a);
			map.put("select_b", select_b);
			map.put("s_value", s_value);
			//查询项目类型
			PagedResult<Project> pagedResult = projectService.selectInfoList(map, Integer.valueOf(pageNumber),Integer.valueOf(pageSize) );
			//把项目类型ID换成项目类型名
			
			
			return new Result(pagedResult);
		}else{
			return new Result(false,"会话中不存在该用户",null);
		}
	}
	
	/**
	 * 保存项目信息
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param datas
	 * @return
	 */
	@RequestMapping(value = "/save_project_info", method=RequestMethod.POST)
	@ResponseBody
	public Result save_project_info(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,ModelMap model,Project project,String type,String p_beginDate,String p_endDate
			,String ps_beginDate,String ps_endDate,String id,String respDept_id,String deputyDept_id,String ownerDept_id){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(StringUtils.isNoneBlank(p_beginDate))
			project.setPlanBeginDate(sdf.parse(p_beginDate));
			if(StringUtils.isNoneBlank(p_endDate))
			project.setPlanEndDate(sdf.parse(p_endDate));
			if(StringUtils.isNoneBlank(ps_beginDate))
			project.setActualBeginDate(sdf.parse(ps_beginDate));
			if(StringUtils.isNoneBlank(ps_endDate))
			project.setActualEndDate(sdf.parse(ps_endDate));
		} catch (ParseException e) {
			throw new RuntimeException("日期转换格式错误");
		} 
		
		Result result = new Result(false,"保存失败！",null);
		if(StringUtils.isEmpty(type)
				|| StringUtils.isEmpty(project.getName())  )
			throw new RuntimeException("参数不能为空");
		
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user==null){
			throw new RuntimeException("用户不存在");
		}
		project.setCreator(user.getId());
		//项目单位存id
		project.setRespDept(respDept_id);
		project.setOwnerDept(ownerDept_id);
		project.setDeputyDept(deputyDept_id);
		String logContent = null;
		Integer operType = null;
		switch (type) {
		case "1"://新增
			result = projectService.addprojectInfo(project);
			logContent = "新增项目";
			operType = 1;
			break;
		case "2"://修改
			if(StringUtils.isEmpty(id))
				throw new RuntimeException("参数不能为空");
			project.setProjectId(id);
			
			result = projectService.modifyprojectInfo(project);
			logContent = "修改项目";
			operType = 3;
			break;
		}
		request.setAttribute("logContent", logContent+(result.isSuccess()? "成功":"失败"));//日志内容
		request.setAttribute("operType", operType);//操作（1-增，2-删，3-改）
		return result;
	}
	
	/**
	 * 获取单个项目信息
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/getProjectInfo", method = RequestMethod.POST)
	@ResponseBody
	public Project getProjectInfo(HttpServletRequest request,
			HttpServletResponse response, HttpSession session){
		String projectId = request.getParameter("projectId");
		return projectService.selectP_infoByKey(projectId);
		
	}
	/**
	 * 删除项目
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/project_delete", method = RequestMethod.POST)
	@ResponseBody
	public Result project_delete(HttpServletRequest request,
			HttpServletResponse response, HttpSession session){
		String projectId = request.getParameter("projectId");
		if(StringUtils.isBlank(projectId))
			return new Result(false, "参数不能为空", null);
		return projectService.deleteProject(projectId);
	}
	
}