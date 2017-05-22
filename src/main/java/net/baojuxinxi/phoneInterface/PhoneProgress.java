package net.baojuxinxi.phoneInterface;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Progress;
import net.baojuxinxi.pojo.ProgressAnnex;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.impl.TaskServiceImpl;
import net.baojuxinxi.utils.Bas64Utile;
import net.baojuxinxi.utils.ErrorCodeUtill;
import net.baojuxinxi.utils.RelativeDateFormat;
import net.baojuxinxi.utils.UUIDUtil;
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
public class PhoneProgress {

	@Autowired
	private TaskServiceImpl taskService;
	
	/**
	 * 通过项目id查询项目进度列表
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProjectScheduleList", method = RequestMethod.POST)
	public Map<String, Object> getProjectScheduleList(HttpServletRequest request,
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
					Integer pageNumber = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageNumber"));
					Integer pageSize = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageSize"));
					
					if(pageNumber==null||pageSize==null){
						map.put("code", "10002");
						map.put("message", ErrorCodeUtill.map.get("10002"));
						return map;
					}
					if(StringUtils.isBlank(projectId)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}	
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("projectId", projectId);
					// 查询进度列表
					  PagedResult<Progress> pagedResult = taskService.selectScheduleList(map2,
							Integer.valueOf(pageNumber), Integer.valueOf(pageSize));
					  List<Progress> dataList = pagedResult.getDataList();
					 if(dataList!=null&&dataList.size()>0){
						 JSONArray jsonArray2 = new JSONArray();
						 for (Progress progress : dataList) {
							 JSONObject jsonObject = new JSONObject();
							 Date modifyTime = progress.getModifyTime();
//							 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日　HH:mm:ss");
//							 String format = simpleDateFormat.format(modifyTime);
//							 jsonObject.put("modifyTime", format);
							 if(modifyTime!=null){
								 jsonObject.put("modifyTime",  RelativeDateFormat.format(modifyTime));
							 }
							 jsonObject.put("progressId", progress.getProgressId());
							 jsonObject.put("modifyPerson", progress.getUser().getUsercname());
							 if(progress.getProgress()!=null)
							 jsonObject.put("progress",Math.round(progress.getProgress().doubleValue()) );
							 jsonObject.put("state", progress.getState());
							 jsonObject.put("describes", progress.getDescribes());
							 jsonObject.put("projectId", progress.getProjectId());
							 jsonArray2.add(jsonObject);
						}
					
							map.put("data", jsonArray2);
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
	 * 进度汇报
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/saveScheduleInfo", method = RequestMethod.POST)
	public Map<String, Object> saveScheduleInfo(HttpServletRequest request,
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
					Integer progress = jsonArray.getJSONObject(0).getInt(
							"progress");
					String describes =jsonArray.getJSONObject(0).getString(
							"describes");
					Integer state = jsonArray.getJSONObject(0).getInt(
							"state");
					if(StringUtils.isBlank(projectId)||progress==null||state==null){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}
					progress=progress>100?100:progress;
					//图片bas64 编码
					String img1 =jsonArray.getJSONObject(0).getString("img1");
					String img2 =jsonArray.getJSONObject(0).getString("img2");
					String img3 =jsonArray.getJSONObject(0).getString("img3");
					String img4 =jsonArray.getJSONObject(0).getString("img4");
					String img5 =jsonArray.getJSONObject(0).getString("img5");
					String img6 =jsonArray.getJSONObject(0).getString("img6");
					//图片名
					String imgName1 =jsonArray.getJSONObject(0).getString("imgName1");
					String imgName2 =jsonArray.getJSONObject(0).getString("imgName2");
					String imgName3 =jsonArray.getJSONObject(0).getString("imgName3");
					String imgName4 =jsonArray.getJSONObject(0).getString("imgName4");
					String imgName5 =jsonArray.getJSONObject(0).getString("imgName5");
					String imgName6 =jsonArray.getJSONObject(0).getString("imgName6");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
					//日期
					String beginDate =jsonArray.getJSONObject(0).getString("beginDate");
					String endDate =jsonArray.getJSONObject(0).getString("endDate");
					String s_beginDate =jsonArray.getJSONObject(0).getString("s_beginDate");
					String s_endDate =jsonArray.getJSONObject(0).getString("s_endDate");
					Project project = new Project();
					Progress pro = new Progress();
				
					if (StringUtils.isNoneBlank(beginDate)){
						project.setPlanBeginDate(sdf.parse(beginDate));
						pro.setPlanBeginDate(sdf.parse(beginDate));
					}
					if (StringUtils.isNoneBlank(endDate)){
						project.setPlanEndDate(sdf.parse(endDate));
						pro.setPlanEndDate(sdf.parse(endDate));
					}
					if (StringUtils.isNoneBlank(s_beginDate)){
						project.setActualBeginDate(sdf.parse(s_beginDate));
						pro.setActualBeginDate(sdf.parse(s_beginDate));
					}
					if (StringUtils.isNoneBlank(s_endDate)){
						project.setActualEndDate(sdf.parse(s_endDate));
						pro.setActualEndDate(sdf.parse(s_endDate));
					}
				
					//项目进度
					String progressUUID = UUIDUtil.generateUUID();
					pro.setProgressId(progressUUID);
					pro.setModifyTime(new Date());
					pro.setProjectId(projectId);
					//修改人
					pro.setModifyPerson(user.getId());
					pro.setProgress(BigDecimal.valueOf(progress));
					pro.setDescribes(describes);
					pro.setState((byte)state.intValue());
					//项目
					project.setProgress(BigDecimal.valueOf(progress));//进度
					project.setState(state);
					Map<String, Object> addProgressInfo2 = taskService.addProgressInfo2(pro,project,map);
					//保存附件
					if(addProgressInfo2==null){

						ArrayList<ProgressAnnex> arrayList = new ArrayList<ProgressAnnex>();
						//保存进度附件	
						String fileName=null;
						if(StringUtils.isNotBlank(img1)&&StringUtils.isNoneBlank(imgName1)){
							//处理图片路径
							fileName = add_img(request, img1, imgName1,progressUUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img2)&&StringUtils.isNoneBlank(imgName2)){
							fileName = add_img(request, img2, imgName2,progressUUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img3)&&StringUtils.isNoneBlank(imgName3)){
							fileName = add_img(request, img3, imgName3,progressUUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img4)&&StringUtils.isNoneBlank(imgName4)){
							fileName = add_img(request, img4, imgName4,progressUUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img5)&&StringUtils.isNoneBlank(imgName5)){
							fileName = add_img(request, img5, imgName5,progressUUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img6)&&StringUtils.isNoneBlank(imgName6)){
							fileName = add_img(request, img6, imgName6,progressUUID, arrayList,projectId);
						}
						if(fileName!=null){
							int saveattachmentList = taskService.saveattachmentList(arrayList);
							if(saveattachmentList==-1){
								map.put("code", "22222");
								map.put("message", ErrorCodeUtill.map.get("22222"));
								return map;
							}
						}
					
							
							map.put("code", "10000");
							map.put("message", ErrorCodeUtill.map.get("10000"));
						}else{
							return addProgressInfo2;
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
	private String add_img(HttpServletRequest request, String img1,
			String imgName1, String progressUUID,
			ArrayList<ProgressAnnex> arrayList,String projectId) {
		String uuid = UUIDUtil.generateUUID();
		String fileName;
		String realPath = request.getSession().getServletContext().getRealPath("");
		fileName= "/upload/"+projectId+"/progressAnnex/" +uuid+ imgName1.substring(imgName1.lastIndexOf("."));;
		boolean generateImage = Bas64Utile.generateImage(img1, realPath+fileName);
		//保存图片路径到附件表
		if(generateImage){
			ProgressAnnex progressAnnex = new ProgressAnnex();
			progressAnnex.setProgressAnnexId(uuid);
			progressAnnex.setProgressAnnexName(imgName1);
			progressAnnex.setProgressAnnexPath(fileName);
			progressAnnex.setProgressAnnexType((byte) 1);
			progressAnnex.setProgressId(progressUUID);
			arrayList.add(progressAnnex);
		}
		return fileName;
	}
	
	/**
	 * 通过进度id查询进度　
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProjectSchedule", method = RequestMethod.POST)
	public Map<String, Object> getProjectSchedule(HttpServletRequest request,
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
					
					String progressId = String.valueOf(jsonArray.getJSONObject(0).get(
							"progressId"));
					
					
					if(StringUtils.isBlank(progressId)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}	
					
					// 查询进度列表
					Progress pro=taskService.selectSchedule(progressId);
					 
					 if(pro!=null){
							 JSONObject jsonObject = new JSONObject();
							 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日　HH:mm:ss");
							 jsonObject.put("progressId", pro.getProgressId());
							 jsonObject.put("modifyPerson", pro.getUser().getUsercname());
							 if(pro.getProgress()!=null)
							 jsonObject.put("progress",Math.round(pro.getProgress().doubleValue()) );
							 jsonObject.put("state", pro.getState());
							 jsonObject.put("describes", pro.getDescribes());
							 jsonObject.put("projectId", pro.getProjectId());
							 Date planBeginDate = pro.getPlanBeginDate();
							 Date planEndDate = pro.getPlanEndDate();
							 Date actualBeginDate = pro.getActualBeginDate();
							 Date actualEndDate = pro.getActualEndDate();
							 if(planBeginDate!=null)
								 jsonObject.put("planBeginDate", simpleDateFormat.format(planBeginDate));
							 if(planEndDate!=null)
								 jsonObject.put("planEndDate", simpleDateFormat.format(planEndDate));
							 if(actualBeginDate!=null)
								 jsonObject.put("actualBeginDate", simpleDateFormat.format(actualBeginDate));
							 if(actualEndDate!=null)
								 jsonObject.put("actualEndDate", simpleDateFormat.format(actualEndDate));
					
							map.put("data", jsonObject);
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
	
}
