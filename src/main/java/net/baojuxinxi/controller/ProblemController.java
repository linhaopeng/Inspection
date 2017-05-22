package net.baojuxinxi.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.Comment;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Problem;
import net.baojuxinxi.pojo.ProblemAnnex;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.impl.ProblemServiceImpl;
import net.baojuxinxi.utils.FileUpload_bao;
import net.baojuxinxi.utils.RelativeDateFormat;
import net.baojuxinxi.utils.UUIDUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
/**
 * 处理项目问题基类
 * @author xiaofeng
 *
 */
@Controller
public class ProblemController {

	@Autowired
	private ProblemServiceImpl problemService;
	
	/**
	 * 保存项目问题
	 * @param request
	 * @param response
	 * @param session
	 * @param problem
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/save_problem_info", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> save_problem_info(HttpServletRequest request,
			@RequestParam CommonsMultipartFile attach1,
			@RequestParam CommonsMultipartFile attach2,
			@RequestParam CommonsMultipartFile attach3,
			@RequestParam CommonsMultipartFile attach4,
			@RequestParam CommonsMultipartFile attach5,
			@RequestParam CommonsMultipartFile attach6,
			HttpServletResponse response, HttpSession session, String get_progress,
			Problem problem,String type) {
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		
		if(StringUtils.isBlank(type)){
			hashMap.put("massage", "参数不能空");
			return  hashMap;
		}
		//保存项目问题
		if(StringUtils.isBlank(problem.getProjectId())){
			hashMap.put("massage", "参数不能空");
			return  hashMap;
		}
		
		if(!(attach1.getContentType().contains("image")||attach1.getContentType().contains("application/octet-stream"))||
				!(attach2.getContentType().contains("image")||attach2.getContentType().contains("application/octet-stream"))||
				!(attach3.getContentType().contains("image")||attach3.getContentType().contains("application/octet-stream"))||
				!(attach4.getContentType().contains("image")||attach4.getContentType().contains("application/octet-stream"))||
				!(attach5.getContentType().contains("image")||attach5.getContentType().contains("application/octet-stream"))||
				!(attach6.getContentType().contains("image")||attach6.getContentType().contains("application/octet-stream"))
			){
			hashMap.put("massage", "请上传图片");
			return  hashMap;
		}
		int size=10*1024*1024;
		if(attach1.getSize()>size||attach2.getSize()>size||attach3.getSize()>size||attach4.getSize()>size||attach5.getSize()>size||attach6.getSize()>size){
			hashMap.put("massage", "图片不能超过10M");
			return  hashMap;
		}
		SystemUsers user = (SystemUsers) session.getAttribute("user");
//		problem.setTaskId("no");
		if("1".equals(type)){
			problem.setIsdeleted((byte) 1);
			problem.setCreator(user.getUsercname());
			problem.setCreateTime(new Date());
			problem.setUserId(user.getId());
			String problemUID = UUIDUtil.generateUUID();
			problem.setProblemId(problemUID);
			if(problem.getState()==null)
				problem.setState((byte) 1);//1为问题未解决
			problem.setHeadImg(user.getHeadImg());
			
			Result save_problem = problemService.save_problem(problem);
			
			if(save_problem.isSuccess()){
				List<ProblemAnnex> problemAnnexlist = new ArrayList<ProblemAnnex>();
				//保存问题附件		
				FileUpload_bao fileUpload_bao = new FileUpload_bao();
				String fileName=null;
				if(!attach1.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,attach1, "/"+problem.getProjectId()+"/problem",attach1.getName()+ problemUID);
					//保存图片路径到附件表
					if(fileName!=null)
					addProblem_annex(attach1, problemUID, problemAnnexlist,fileName);
				}
				if(!attach2.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,attach2, "/"+problem.getProjectId()+"/problem",attach2.getName()+ problemUID);
					//保存图片路径到附件表
					if(fileName!=null)
					addProblem_annex(attach2, problemUID, problemAnnexlist,fileName);
				}
				if(!attach3.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,attach3, "/"+problem.getProjectId()+"/problem",attach3.getName()+ problemUID);
					if(fileName!=null)
					addProblem_annex(attach3, problemUID, problemAnnexlist,fileName);
				}
				if(!attach4.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,attach4, "/"+problem.getProjectId()+"/problem",attach4.getName() +problemUID);
					if(fileName!=null)
					addProblem_annex(attach4, problemUID, problemAnnexlist,fileName);
				}
				if(!attach5.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,attach5, "/"+problem.getProjectId()+"/problem",attach5.getName()+ problemUID);
					if(fileName!=null)
					addProblem_annex(attach5, problemUID, problemAnnexlist,fileName);
				}
				if(!attach6.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,attach6, "/"+problem.getProjectId()+"/problem",attach6.getName()+ problemUID);
					if(fileName!=null)
					addProblem_annex(attach6, problemUID, problemAnnexlist,fileName);
				}
				if(fileName!=null){
					int saveattachmentList = problemService.saveattachmentList(problemAnnexlist);
					if(saveattachmentList==-1){
						hashMap.put("massage", "图片上传失败");
						return hashMap;
					}
				}
				//保存成功
				hashMap.put("save", "success");
			}
			hashMap.put("massage", save_problem.getMessage());
		}else if("2".equals(type)){
			int update_problem = problemService.update_problem(problem);
			if(update_problem!=-1){
				hashMap.put("update", "success");
			}
		}
		
		return hashMap;
	}

	private void addProblem_annex(CommonsMultipartFile file,
			String problemUID, List<ProblemAnnex> ProblemAnnexlist,
			String fileName) {
		ProblemAnnex problemAnnex = new ProblemAnnex();
		problemAnnex.setProblemId(problemUID);
		problemAnnex.setProblemAnnexId(UUIDUtil.generateUUID());
		problemAnnex.setProblemAnnexName(file.getOriginalFilename());
		problemAnnex.setProblemAnnexType((byte) 1);
		problemAnnex.setProblemAnnexPath(fileName);
		ProblemAnnexlist.add(problemAnnex);
	}
	
	/**
	 * 问题未解决分页
	 * @param request
	 * @param response
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/get_problem_no", method = RequestMethod.POST)
	@ResponseBody
	public Result get_problem_no(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String id) {

		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String reqData = request.getParameter("reqData");
		JSONObject jo ;
		String type=null;
		if(StringUtils.isNoneBlank(reqData)){
			jo = JSON.parseObject(reqData);
			type = jo.getString("type");
		}
		if(StringUtils.isBlank(type))
			return new Result(false, "参数不能空", null);
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
			map.put("state", type);
			// 查询任务列表
			PagedResult<Problem> pagedResult = problemService.selectPageList(map,
					Integer.valueOf(pageNumber), Integer.valueOf(pageSize));

			return new Result(pagedResult);
		} else {
			return new Result(false, "会话中不存在该用户", null);
		}
	}
	
	
	/**
	 * 删除项目问题
	 * @param request
	 * @param response
	 * @param session
	 * @param problemId
	 * @return
	 */
	@RequestMapping(value = "/delete_project_problem", method = RequestMethod.POST)
	@ResponseBody
	public Result delete_project_problem(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String problemId) {
		if(StringUtils.isBlank(problemId))
			return new Result(false, "参数不能为空", null);
		
		return problemService.delete_problem(problemId,request);
	}
	/**
	 * 回显图片, 项目问题附件
	 * @param request
	 * @param response
	 * @param session
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/get_problem_img", method = RequestMethod.POST)
	@ResponseBody
	public List<ProblemAnnex> get_problem_img(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String problemId) {
			if(StringUtils.isBlank(problemId))
				return null;
			// 查询任务列表
			return problemService.get_problem_img(problemId);
	}
	/**
	 * 保存问题评论
	 * @param request
	 * @param response
	 * @param session
	 * @param problemId
	 * @return
	 */
	@RequestMapping(value = "/save_problem_comment", method = RequestMethod.POST)
	@ResponseBody
	public Result save_problem_comment(HttpServletRequest request,Comment comment,
			HttpServletResponse response, HttpSession session, String problemId) {
			if(StringUtils.isBlank(comment.getProblemId()))
				return new Result(false, "参数不能为空", null);
			SystemUsers user = (SystemUsers) session.getAttribute("user");
			comment.setCreateTime(new Date());
			comment.setCommentId(UUIDUtil.generateUUID());
			comment.setCreator(user.getId());
			comment.setHeadImg(user.getHeadImg());
			// 保存问题评论
			return problemService.save_problem_comment(comment);
	}
	/**
	 * 评论列表
	 * @param request
	 * @param response
	 * @param session
	 * @param problemId
	 * @return
	 */
	@RequestMapping(value = "/get_problem_comment", method = RequestMethod.POST)
	@ResponseBody
	public Result get_problem_comment(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String problemId) {
			if(StringUtils.isBlank(problemId))
				return new Result(false, "参数不能为空", null);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("problemId", problemId);
			// 查询任务列表
			PagedResult<Comment> list=problemService.get_problem_comment(map,1,5);
//			List<Comment> dataList = list.getDataList();
//			if(dataList!=null&&dataList.size()>0){
//				for (Comment comment : dataList) {
//					Date createTime = comment.getCreateTime();
//					if(createTime!=null){
//						comment.setCreateDate(RelativeDateFormat.format(createTime));
//						break;
//					}
//				}
//			}
			return new  Result(list);
	}
	//
	/**
	 * 保存图片
	 * @param request
	 * @param response
	 * @param session
	 * @param problemId
	 * @return
	 */
	@RequestMapping(value = "/modify_problem_img", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> modify_problem_img(HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@RequestParam CommonsMultipartFile edtimg,
			@RequestParam CommonsMultipartFile insertimg,
			ProblemAnnex problemAnn,String type						) {
		HashMap<String, Object> hashMap = new HashMap<>();
			
			FileUpload_bao fileUpload_bao = new FileUpload_bao();
			if("1".equals(type)){
				//更新问题图片
				String fileName=null;
				if(!edtimg.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,edtimg, "/problem", problemAnn.getProblemId());
					//保存图片路径到附件表
					if(fileName!=null){
						problemAnn.setProblemAnnexPath(fileName);
						problemAnn.setProblemAnnexType((byte) 1);
						problemAnn.setProblemAnnexName(edtimg.getOriginalFilename());
						int update_problem_img = problemService.update_problem_img(problemAnn);
						if(update_problem_img==-1)
							hashMap.put("success", "NG");
					}
					hashMap.put("success", "edtimg");
				}
			}if("2".equals(type)){
				//删除
				boolean delete = fileUpload_bao.delete(problemAnn.getProblemAnnexPath(), request);
				if(delete){
					int delete_problem_img = problemService.delete_problem_img(problemAnn.getProblemAnnexId());
					if(delete_problem_img==-1){
						hashMap.put("success", "NG");
					}
					hashMap.put("success", "delete"); 
				}
			}if("3".equals(type)){
				//新增
				String fileName=null;
				if(!insertimg.getOriginalFilename().isEmpty()){
					fileName = fileUpload_bao.upload(request,insertimg, "/problem", problemAnn.getProblemId());
					//保存图片路径到附件表
					if(fileName!=null){
						problemAnn.setProblemAnnexPath(fileName);
						problemAnn.setProblemAnnexType((byte) 1);
						problemAnn.setProblemAnnexId(UUIDUtil.generateUUID());
						problemAnn.setProblemAnnexName(insertimg.getOriginalFilename());
						int update_problem_img = problemService.saveattachment(problemAnn);
						if(update_problem_img==-1)
							hashMap.put("success", "NG");
					}
					hashMap.put("success", "insertimg");
				}
			}
			return hashMap;
	}
	
}
