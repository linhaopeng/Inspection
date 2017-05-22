package net.baojuxinxi.phoneInterface;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.impl.ProjectServiceImpl;
import net.baojuxinxi.utils.ErrorCodeUtill;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PhoneProject {

	
	@Autowired
	private ProjectServiceImpl projectService;
	
	/**
	 * 手机获取项目信息列表
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/projectInfo", method = RequestMethod.POST)
	public Map<String, Object> projectInfo(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,@RequestBody JSONObject params){
		/*Map<String, Object> params = Current.getMapParams(request
				.getParameterMap());*/
		Map<String, Object> map = Current.getMap();
		if (Current.key(params.get("method"), params.get("version"),
				params.get("timestemp"), params.get("sign"))) {
			try {
				//通过当前登录 的用户查询用户
				SystemUsers user = (SystemUsers) session.getAttribute("user");
				if(user == null){
					map.put("code", "5020");
					map.put("message", ErrorCodeUtill.map.get("5020"));
				}else{
						
					JSONObject fromObject = JSONObject.fromObject(params.get("request"));
					JSONArray jsonArray = JSONArray.fromObject(fromObject);
					
					String projectName = String.valueOf(jsonArray.getJSONObject(0).get(
							"projectName"));
					Integer pageNumber = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageNumber"));
					Integer pageSize = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageSize"));
					
					if(pageNumber==null||pageSize==null){
						map.put("code", "10002");
						map.put("message", ErrorCodeUtill.map.get("10002"));
						return map;
					}
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("name", projectName);
						map2.put("isdeleted", 1);
						//查询项目信息列表
						PagedResult<Project> pagedResult = projectService.selectInfoList(map2, pageNumber,pageSize );
						//把项目类型ID换成项目类型名
						List<Project> dataList = pagedResult.getDataList();
						if(dataList!=null&&dataList.size()>0){
							JSONArray jsonArray2 = new JSONArray();
							SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
							for (Project project : pagedResult.getDataList()) {
								JSONObject jsonObject = new JSONObject();
								jsonObject.put("projectId", project.getProjectId());
								jsonObject.put("name", project.getName());
								jsonObject.put("state", project.getState());
								jsonObject.put("progress", project.getProgress().setScale(0,BigDecimal.ROUND_HALF_UP));
								jsonObject.put("intro", project.getIntro());
								if(project.getPlanBeginDate()!=null){
									jsonObject.put("planBeginDate", simpleDateFormat.format(project.getPlanBeginDate()));
								}else{
									jsonObject.put("planBeginDate","");
								}
								if(project.getPlanEndDate()!=null){
									jsonObject.put("planEndDate", simpleDateFormat.format(project.getPlanEndDate()));
								}else{
									jsonObject.put("planEndDate", "");
								}
								jsonArray2.add(jsonObject);
							}
							map.put("data", jsonArray2);
							map.put("pages", pagedResult.getPages());
							map.put("code", "10000");
							map.put("message", ErrorCodeUtill.map.get("10000"));
						}else{
							//没有数据
							map.put("code", "10001");
							map.put("message", ErrorCodeUtill.map.get("10001"));
						}
					
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
	
	/**
	 * 获取单个项目信息
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProject", method = RequestMethod.POST)
	public Map<String, Object> getProject(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,@RequestBody JSONObject params){
		/*Map<String, Object> params = Current.getMapParams(request
				.getParameterMap());*/
		Map<String, Object> map = Current.getMap();
		if (Current.key(params.get("method"), params.get("version"),
				params.get("timestemp"), params.get("sign"))) {
			try {
				//通过当前登录 的用户查询用户
				SystemUsers user = (SystemUsers) session.getAttribute("user");
				if(user == null){
					map.put("code", "5020");
					map.put("message", ErrorCodeUtill.map.get("5020"));
				}else{
						
					JSONObject fromObject = JSONObject.fromObject(params.get("request"));
					JSONArray jsonArray = JSONArray.fromObject(fromObject);
					
					String projectId = String.valueOf(jsonArray.getJSONObject(0).get(
							"projectId"));
					if(StringUtils.isBlank(projectId)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}
						
					 Project project = projectService.selectP_infoByKey(projectId);
					 
					if(project!=null){
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
						JSONObject jsonObject = new JSONObject();
						jsonObject.put("projectId", project.getProjectId());
						jsonObject.put("name", project.getName());
						jsonObject.put("state", project.getState());
						jsonObject.put("progress", project.getProgress().setScale(0,BigDecimal.ROUND_HALF_UP));
						jsonObject.put("intro", project.getIntro());
						if(project.getPlanBeginDate()!=null){
							jsonObject.put("planBeginDate", simpleDateFormat.format(project.getPlanBeginDate()));
						}else{
							jsonObject.put("planBeginDate","");
						}
						if(project.getPlanEndDate()!=null){
							jsonObject.put("planEndDate", simpleDateFormat.format(project.getPlanEndDate()));
						}else{
							jsonObject.put("planEndDate", "");
						}
						if(project.getActualBeginDate()!=null){
							jsonObject.put("actualBeginDate", simpleDateFormat.format(project.getActualBeginDate()));
						}else{
							jsonObject.put("actualBeginDate","");
						}
						if(project.getActualEndDate()!=null){
							jsonObject.put("actualEndDate", simpleDateFormat.format(project.getActualEndDate()));
						}else{
							jsonObject.put("actualEndDate", "");
						}
						map.put("data", jsonObject);
						map.put("code", "10000");
						map.put("message", ErrorCodeUtill.map.get("10000"));
						return map;
					}else{
						
						//没有数据
						map.put("code", "10001");
						map.put("message", ErrorCodeUtill.map.get("10001"));
					}
						
					
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
	
}
