package net.baojuxinxi.controller;

import java.math.BigDecimal;
import java.text.ParseException;
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
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.pojo.Task;
import net.baojuxinxi.service.impl.TaskServiceImpl;
import net.baojuxinxi.utils.FileUpload_bao;
import net.baojuxinxi.utils.UUIDUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 处理项目计划基类
 * 
 * @author xiaofeng
 * 
 */
@Controller
public class TaskController {

	@Autowired
	private TaskServiceImpl taskService;

//	@Autowired
//	private ProjectServiceImpl projectService;

	/**
	 * 删除计划
	 */
	@RequestMapping(value = "/delete_project_task", method = RequestMethod.POST)
	@ResponseBody
	public Result delete_project_task(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String[] taskId) {
		Result result = new Result(false, "删除项目计划失败！", null);
		if (StringUtils.isNoneBlank(taskId)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isdeleted", 0);

			map.put("idItems", taskId);
			result = taskService.deleteIn_Id(map);
		}
		request.setAttribute("logContent", "删除项目计划"
				+ (result.isSuccess() ? "成功" : "失败"));// 日志内容
		request.setAttribute("operType", 2);// 操作类型（1-增，2-删，3-改）
		return result;
	}

	/**
	 * 项目计划分页
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param datas
	 * @return
	 */
	@RequestMapping(value = "/get_project_task", method = RequestMethod.POST)
	@ResponseBody
	public Result get_project_task(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String id) {

		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String reqData = request.getParameter("reqData");

		if (StringUtils.isBlank(pageNumber) || Integer.valueOf(pageNumber) < 1) {
			pageNumber = "1";
		}
		if (StringUtils.isBlank(pageSize)) {
			pageSize = "8";
		}

		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if (user != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isdeleted", 1);
			map.put("projectId", id);
			// 查询计划列表
			PagedResult<Task> pagedResult = taskService.selectPageList(map,
					Integer.valueOf(pageNumber), Integer.valueOf(pageSize));

			return new Result(pagedResult);
		} else {
			return new Result(false, "会话中不存在该用户", null);
		}
	}

	/**
	 * 保存项目计划信息
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param datas
	 * @return
	 */
	@RequestMapping(value = "/save_project_task", method = RequestMethod.POST)
	@ResponseBody
	public Result save_project_task(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model,
			Task task, String type, String beginDate, String endDate,
			String s_beginDate, String s_endDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (StringUtils.isNoneBlank(beginDate))
				task.setPlanBeginDate(sdf.parse(beginDate));
			if (StringUtils.isNoneBlank(endDate))
				task.setPlanEndDate(sdf.parse(endDate));
			if (StringUtils.isNoneBlank(s_beginDate))
				task.setActualBeginDate(sdf.parse(s_beginDate));
			if (StringUtils.isNoneBlank(s_endDate))
				task.setActualEndDate(sdf.parse(s_endDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("日期转换错误");
		}
		if(task.getListNo()==null){
			task.setListNo(0);
		}
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		task.setCreator(user.getId());
		Result result = new Result(false, "保存失败！", null);
		if (StringUtils.isEmpty(type) || StringUtils.isEmpty(task.getName()))
			throw new RuntimeException("参数不能为空");

		String logContent = null;
		Integer operType = null;
		switch (type) {
		case "1":// 新增
			result = taskService.addprojectInfo(task);
			logContent = "新增计划";
			operType = 1;
			break;
		case "2":// 修改
			if (StringUtils.isEmpty(task.getProjectId()))
				throw new RuntimeException("参数不能为空");

			result = taskService.modifyprojectInfo(task);
			logContent = "修改计划";
			operType = 3;
			break;
		}
		request.setAttribute("logContent", logContent
				+ (result.isSuccess() ? "成功" : "失败"));// 日志内容
		request.setAttribute("operType", operType);// 操作（1-增，2-删，3-改）
		return result;
	}

	

	/**
	 * 保存进度汇报
	 * @param request
	 * @param response
	 * @param session
	 * @param progress
	 * @param beginDate
	 * @param endDate
	 * @param s_beginDate
	 * @param s_endDate
	 * @return
	 */
	@RequestMapping(value = "/save_Schedule_info", method = RequestMethod.POST)
	@ResponseBody
	public Result save_Schedule_info(HttpServletRequest request,
			@RequestParam CommonsMultipartFile attr1,
			@RequestParam CommonsMultipartFile attr2,
			@RequestParam CommonsMultipartFile attr3,
			@RequestParam CommonsMultipartFile attr4,
			@RequestParam CommonsMultipartFile attr5,
			@RequestParam CommonsMultipartFile attr6,
			HttpServletResponse response, HttpSession session, 
			Progress progress,  String beginDate, String endDate,
			String s_beginDate, String s_endDate,Project project) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (StringUtils.isNoneBlank(beginDate)){
				project.setPlanBeginDate(sdf.parse(beginDate));
				progress.setPlanBeginDate(sdf.parse(beginDate));
			}
			if (StringUtils.isNoneBlank(endDate)){
				project.setPlanEndDate(sdf.parse(endDate));
				progress.setPlanEndDate(sdf.parse(endDate));
			}
			if (StringUtils.isNoneBlank(s_beginDate)){
				project.setActualBeginDate(sdf.parse(s_beginDate));
				progress.setActualBeginDate(sdf.parse(s_beginDate));
			}
			if (StringUtils.isNoneBlank(s_endDate)){
				project.setActualEndDate(sdf.parse(s_endDate));
				progress.setActualEndDate(sdf.parse(s_endDate));
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("日期转换错误");
		}
		if(!(attr1.getContentType().contains("image")||attr1.getContentType().contains("application/octet-stream"))||
				!(attr2.getContentType().contains("image")||attr2.getContentType().contains("application/octet-stream"))||
				!(attr3.getContentType().contains("image")||attr3.getContentType().contains("application/octet-stream"))||
				!(attr4.getContentType().contains("image")||attr4.getContentType().contains("application/octet-stream"))||
				!(attr5.getContentType().contains("image")||attr5.getContentType().contains("application/octet-stream"))||
				!(attr6.getContentType().contains("image")||attr6.getContentType().contains("application/octet-stream"))
			){
			return new Result(false, "请上传图片", null);
		}
		int size=10*1024*1024;
		if(attr1.getSize()>size||attr2.getSize()>size||attr3.getSize()>size||attr4.getSize()>size||attr5.getSize()>size||attr6.getSize()>size){
			return new Result(false, "图片不能超过10M", null);
		}
		//项目进度
		String progressUUID = UUIDUtil.generateUUID();
		progress.setProgressId(progressUUID);
		progress.setModifyTime(new Date());
		Integer pro = progress.getProgress()==null?0:progress.getProgress().intValue();
		pro=pro>100?100:pro;
		project.setProgress(new BigDecimal(pro));
		progress.setProgress(new BigDecimal(pro));
		//修改人
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		progress.setModifyPerson(user.getId());
		Result result = taskService.addProgressInfo(progress,project);
		//保存附件
		if(result.isSuccess()){

			ArrayList<ProgressAnnex> arrayList = new ArrayList<ProgressAnnex>();
			//保存进度附件		
			FileUpload_bao fileUpload_bao = new FileUpload_bao();
			String fileName=null;
			if(!attr1.getOriginalFilename().isEmpty()){
				fileName = fileUpload_bao.upload(request,attr1, "/"+progress.getProjectId()+"/progressAnnex", attr1.getName()+progressUUID);
				//保存图片路径到附件表
				if(fileName!=null)
				addProblem_annex(attr1, progressUUID, arrayList,fileName);
			}
			if(!attr2.getOriginalFilename().isEmpty()){
				fileName = fileUpload_bao.upload(request,attr2, "/"+progress.getProjectId()+"/progressAnnex", attr2.getName()+progressUUID);
				//保存图片路径到附件表
				if(fileName!=null)
				addProblem_annex(attr2, progressUUID, arrayList,fileName);
			}
			if(!attr3.getOriginalFilename().isEmpty()){
				fileName = fileUpload_bao.upload(request,attr3, "/"+progress.getProjectId()+"/progressAnnex", attr3.getName()+progressUUID);
				if(fileName!=null)
				addProblem_annex(attr3, progressUUID, arrayList,fileName);
			}
			if(!attr4.getOriginalFilename().isEmpty()){
				fileName = fileUpload_bao.upload(request,attr4, "/"+progress.getProjectId()+"/progressAnnex", attr4.getName()+progressUUID);
				if(fileName!=null)
				addProblem_annex(attr4, progressUUID, arrayList,fileName);
			}
			if(!attr5.getOriginalFilename().isEmpty()){
				fileName = fileUpload_bao.upload(request,attr5, "/"+progress.getProjectId()+"/progressAnnex", attr5.getName()+progressUUID);
				if(fileName!=null)
				addProblem_annex(attr5, progressUUID, arrayList,fileName);
			}
			if(!attr6.getOriginalFilename().isEmpty()){
				fileName = fileUpload_bao.upload(request,attr6, "/"+progress.getProjectId()+"/progressAnnex", attr6.getName()+progressUUID);
				if(fileName!=null)
				addProblem_annex(attr6, progressUUID, arrayList,fileName);
			}
			if(fileName!=null){
				int saveattachmentList = taskService.saveattachmentList(arrayList);
				if(saveattachmentList==-1)
					return new Result(false, "附件保存失败", null);
			}
		}else{
			return new Result(false, "保存失败", null);
		}
		return result;
	}
	
	private void addProblem_annex(CommonsMultipartFile attr,
			String progressUUID, ArrayList<ProgressAnnex> arrayList,
			String fileName) {
		ProgressAnnex progressAnnex = new ProgressAnnex();
		progressAnnex.setProgressAnnexId(UUIDUtil.generateUUID());
		progressAnnex.setProgressAnnexName(attr.getOriginalFilename());
		progressAnnex.setProgressAnnexPath(fileName);
		progressAnnex.setProgressAnnexType((byte) 1);
		progressAnnex.setProgressId(progressUUID);
		arrayList.add(progressAnnex);
	}

	/**
	 * 进度汇报分页
	 * @param request
	 * @param response
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/get_project_schedule", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> get_project_schedule(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,String id) {

		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String reqData = request.getParameter("reqData");

		if (StringUtils.isBlank(pageNumber) || Integer.valueOf(pageNumber) < 1) {
			pageNumber = "1";
		}
		if (StringUtils.isBlank(pageSize)) {
			pageSize = "5";
		}

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projectId", id);
			// 查询进度列表
			 PagedResult<Progress> selectScheduleList = taskService.selectScheduleList(map,
					Integer.valueOf(pageNumber), Integer.valueOf(pageSize));
			 map.clear();
			 List<Progress> dataList = selectScheduleList.getDataList();
			 if(dataList!=null&&dataList.size()>0){
				 List<HashMap> arrayList = new ArrayList<HashMap>();
				 for (Progress progress : dataList) {
					 HashMap<String,Object> hashMap = new HashMap<String,Object>();
					 Date modifyTime = progress.getModifyTime();
					 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日　HH:mm:ss");
					 String format = simpleDateFormat.format(modifyTime);
					 hashMap.put("modifyTime", format);
					 hashMap.put("progressId", progress.getProgressId());
					 hashMap.put("modifyPerson", progress.getUser().getUsercname());
					 if(progress.getProgress()!=null)
					 hashMap.put("progress",Math.round(progress.getProgress().doubleValue()) );
					 hashMap.put("state", progress.getState());
					 hashMap.put("describes", progress.getDescribes());
					 
					 hashMap.put("planBeginDate", progress.getPlanBeginDate());
					 hashMap.put("planEndDate", progress.getPlanEndDate());
					 hashMap.put("actualBeginDate", progress.getActualBeginDate());
					 hashMap.put("actualEndDate", progress.getActualEndDate());
					 arrayList.add(hashMap);
				}
				
				 map.put("dataList", arrayList);
				 selectScheduleList.setDataList(null);
				 map.put("data", selectScheduleList);
			 }
			 return map;
	}
	
	/**
	 * 查询所有计划列表
	 * @param request
	 * @param response
	 * @param session
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/get_progress", method = RequestMethod.POST)
	@ResponseBody
	public List<Task> get_progress(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String projectId) {

		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isdeleted", 1);
			map.put("projectId", projectId);
			// 查询计划列表
			return taskService.selectList(map);
		
	}
	
	/**
	 * 回显图片,进度汇报附件
	 * @param request
	 * @param response
	 * @param session
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/get_progress_img", method = RequestMethod.POST)
	@ResponseBody
	public List<ProgressAnnex> get_progress_img(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String progressId) {
			if(StringUtils.isBlank(progressId))
				return null;
			// 查询计划列表
			return taskService.get_progress_img(progressId);
		
	}


}