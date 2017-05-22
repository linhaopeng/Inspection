package net.baojuxinxi.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SysomCmonDept;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.impl.CommonDeptService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
/**
 * 处理项目单位的基类
 * @author xiaofeng
 *
 */
@Controller
public class CommonDeptController {

	@Autowired
	private CommonDeptService commonDeptService;
	
	/**
	 * 项目单位列表
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/get_project_unit" ,method = RequestMethod.POST)
	@ResponseBody
	public Result get_project_unit(HttpServletRequest request,HttpServletResponse response,
			HttpSession session){
		String pageNumber = request.getParameter("pageNumber"); 
		String pageSize = request.getParameter("pageSize");
		String reqData = request.getParameter("reqData");
		JSONObject jo = null;
		String commName = null;
		if(StringUtils.isNotEmpty(reqData)){
			jo = JSON.parseObject(reqData);
			commName = jo.getString("commName");
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
			
			map.put("name", commName);
			map.put("isdeleted", 1);
			PagedResult<SysomCmonDept> users = commonDeptService.findPageList(map,Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
			return new Result(users);
		}else{
			return new Result(false,"会话中不存在该用户",null);
		}
		
	}
	/**
	 * 保存项目单位
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/save_project_unit" ,method = RequestMethod.POST)
	@ResponseBody
	public Result save_project_unit(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,SysomCmonDept comm){
		String type = request.getParameter("type"); 
		if(StringUtils.isEmpty(type)
				|| StringUtils.isEmpty(type)  )
			throw new RuntimeException("参数不能为空");
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		Result result=null;
		if(user != null){
			Map<String, Object> map = new HashMap<String, Object>();
			switch (type) {
			case "1"://新增
					comm.setCreator(user.getId());
				 result = commonDeptService.addprojectUnit(comm);
				
				break;
			case "2"://修改
				if(StringUtils.isEmpty(comm.getCommonDeptId()))
					throw new RuntimeException("参数不能为空");
				 result = commonDeptService.modifyprojectUnit(comm);
				
				break;
			}
			return result;
		}else{
			return new Result(false,"会话中不存在该用户",null);
		}
		
	}
	/**
	 * 删除项目单位
	 * @param request
	 * @param response
	 * @param session
	 * @param comm
	 * @return
	 */
	@RequestMapping(value="/delete_project_unit" ,method = RequestMethod.POST)
	@ResponseBody
	public Result delete_project_unit(HttpServletRequest request,HttpServletResponse response,
			HttpSession session,@RequestParam(value = "selectedArr") String[] datas ){
		Result result = new Result(false, "删除项目单位失败！", null);
		if(datas.length != 0){
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("isdeleted", 0);
			map.put("idItems", datas);
			result = commonDeptService.deleteAll(map);
		}
		request.setAttribute("logContent", "删除项目单位"+(result.isSuccess()? "成功":"失败"));//日志内容
		request.setAttribute("operType", 2);//操作单位（1-增，2-删，3-改）
		return result;
	}
}
