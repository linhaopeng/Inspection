package net.baojuxinxi.phoneInterface;

import java.text.SimpleDateFormat;
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
import net.baojuxinxi.utils.Bas64Utile;
import net.baojuxinxi.utils.ErrorCodeUtill;
import net.baojuxinxi.utils.RelativeDateFormat;
import net.baojuxinxi.utils.ScaleImageUtils;
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
/**
 * 处理项目问题手机接口
 * @author xiaofeng
 *
 */
@Controller
public class PhoneProblem {

	@Autowired
	private ProblemServiceImpl problemService;
	
	/**
	 * 项目问题列表未解决
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProblemNo", method = RequestMethod.POST)
	public Map<String, Object> getProblemNo(HttpServletRequest request,
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
					
					
					Integer pageNumber = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageNumber"));
					Integer pageSize = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageSize"));
					
					if(pageNumber==null||pageSize==null){
						map.put("code", "10002");
						map.put("message", ErrorCodeUtill.map.get("10002"));
						return map;
					}
					if ( Integer.valueOf(pageNumber) < 1) {
						pageNumber = 1;
					}
				
					
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("isdeleted", 1);
						map2.put("state", 1);
						// 查询任务列表
						PagedResult<Problem> pagedResult = problemService.selectPageList_ann(map2,
								Integer.valueOf(pageNumber), Integer.valueOf(pageSize));
						
						//问题图片
						if(pagedResult!=null){
							List<Problem> dataList = pagedResult.getDataList();
							if(dataList!=null&&dataList.size()>0){
								JSONArray jsonArray2 = new JSONArray();
								SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
								for (Problem problem : dataList) {
									JSONObject jsonObject = new JSONObject();
									jsonObject.put("problemId", problem.getProblemId());
									jsonObject.put("taskId", problem.getTaskId());
									jsonObject.put("title", problem.getTitle());
									jsonObject.put("describes", problem.getDescribes());
									jsonObject.put("involvedDept", problem.getInvolvedDept());
									jsonObject.put("solution", problem.getSolution());
									jsonObject.put("state", problem.getState());
									jsonObject.put("creator", problem.getUser().getUsercname());
									if(problem.getCreateTime()!=null)
									jsonObject.put("createTime", simpleDateFormat.format(problem.getCreateTime()));
									jsonObject.put("projectId", problem.getProjectId());
									//头像图片处理
									//项目路径
									String realPath = request.getSession()
											.getServletContext().getRealPath("");
									String headImg = problem.getUser().getHeadImg();
									jsonObject.put("headImg", headImg);
									//图片处理
									List<ProblemAnnex> annexList = problem.getProblemAnnexList();
									
									if(annexList!=null&&annexList.size()>0){
										JSONArray arr = new JSONArray();
										for (ProblemAnnex problemAnnex : annexList) {
											JSONObject json = new JSONObject();
											json.put("problemAnnexId", problemAnnex.getProblemAnnexId());
											json.put("problemAnnexName", problemAnnex.getProblemAnnexName());
											//图片bas64处理
											String problemAnnexPath = problemAnnex.getProblemAnnexPath();
											json.put("problemAnnexPath", problemAnnexPath);
											arr.add(json);
										}
									jsonObject.put("problemAnnexList", arr);
										
									}
									jsonArray2.add(jsonObject);
								}
								map.put("data", jsonArray2);
								map.put("code", "10000");
								map.put("message", ErrorCodeUtill.map.get("10000"));
								return map;
							}
						}
						map.put("code", "10001");
						map.put("message", ErrorCodeUtill.map.get("10001"));
					
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
	 * 项目问题列表已解决
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProblemYes", method = RequestMethod.POST)
	public Map<String, Object> getProblemYes(HttpServletRequest request,
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
					
					
					Integer pageNumber = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageNumber"));
					Integer pageSize = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageSize"));
					
					if(pageNumber==null||pageSize==null){
						map.put("code", "10002");
						map.put("message", ErrorCodeUtill.map.get("10002"));
						return map;
					}
					if ( Integer.valueOf(pageNumber) < 1) {
						pageNumber = 1;
					}
				
					
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("isdeleted", 1);
						map2.put("state", 2);
						// 查询任务列表
						PagedResult<Problem> pagedResult = problemService.selectPageList_ann(map2,
								Integer.valueOf(pageNumber), Integer.valueOf(pageSize));
						
						//问题图片
						if(pagedResult!=null){
							List<Problem> dataList = pagedResult.getDataList();
							if(dataList!=null&&dataList.size()>0){
								JSONArray jsonArray2 = new JSONArray();
								SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
								for (Problem problem : dataList) {
									JSONObject jsonObject = new JSONObject();
									jsonObject.put("problemId", problem.getProblemId());
									jsonObject.put("taskId", problem.getTaskId());
									jsonObject.put("title", problem.getTitle());
									jsonObject.put("describes", problem.getDescribes());
									jsonObject.put("involvedDept", problem.getInvolvedDept());
									jsonObject.put("solution", problem.getSolution());
									jsonObject.put("state", problem.getState());
									jsonObject.put("creator", problem.getUser().getUsercname());
									if(problem.getCreateTime()!=null)
									jsonObject.put("createTime", simpleDateFormat.format(problem.getCreateTime()));
									jsonObject.put("projectId", problem.getProjectId());
									//头像图片处理
									//项目路径
									String realPath = request.getSession()
											.getServletContext().getRealPath("");
									String headImg = problem.getUser().getHeadImg();
									jsonObject.put("headImg", headImg);
									//图片处理
									List<ProblemAnnex> annexList = problem.getProblemAnnexList();
									if(annexList!=null&&annexList.size()>0){
										JSONArray arr = new JSONArray();
										for (ProblemAnnex problemAnnex : annexList) {
											JSONObject json = new JSONObject();
											json.put("problemAnnexId", problemAnnex.getProblemAnnexId());
											json.put("problemAnnexName", problemAnnex.getProblemAnnexName());
											//图片bas64处理
											String problemAnnexPath = problemAnnex.getProblemAnnexPath();
											json.put("problemAnnexPath", problemAnnexPath);
											arr.add(json);
										}
									jsonObject.put("problemAnnexList", arr);
										
									}
									jsonArray2.add(jsonObject);
								}
								map.put("data", jsonArray2);
								map.put("code", "10000");
								map.put("message", ErrorCodeUtill.map.get("10000"));
								return map;
							}
						}
						map.put("code", "10001");
						map.put("message", ErrorCodeUtill.map.get("10001"));
					
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
	 * 用户项目id查询项目问题列表
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProblemList", method = RequestMethod.POST)
	public Map<String, Object> getProblemList(HttpServletRequest request,
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
					Integer pageNumber = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageNumber"));
					Integer pageSize = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageSize"));
					
					if(pageNumber==null||pageSize==null){
						map.put("code", "10002");
						map.put("message", ErrorCodeUtill.map.get("10002"));
						return map;
					}
					if ( Integer.valueOf(pageNumber) < 1) {
						pageNumber = 1;
					}
				
					
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("isdeleted", 1);
						map2.put("projectId", projectId);
						map2.put("state", 1);
						// 查询任务列表
						PagedResult<Problem> pagedResult = problemService.selectPageList_ann(map2,
								Integer.valueOf(pageNumber), Integer.valueOf(pageSize));
						
						//问题图片
						if(pagedResult!=null){
							List<Problem> dataList = pagedResult.getDataList();
							if(dataList!=null&&dataList.size()>0){
								JSONArray jsonArray2 = new JSONArray();
								SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
								for (Problem problem : dataList) {
									JSONObject jsonObject = new JSONObject();
									jsonObject.put("problemId", problem.getProblemId());
									jsonObject.put("taskId", problem.getTaskId());
									jsonObject.put("title", problem.getTitle());
									jsonObject.put("describes", problem.getDescribes());
									jsonObject.put("involvedDept", problem.getInvolvedDept());
									jsonObject.put("solution", problem.getSolution());
									jsonObject.put("state", problem.getState());
									jsonObject.put("creator", problem.getUser().getUsercname());
									if(problem.getCreateTime()!=null)
									jsonObject.put("createTime", simpleDateFormat.format(problem.getCreateTime()));
									jsonObject.put("projectId", problem.getProjectId());
									jsonArray2.add(jsonObject);
								}
								map.put("data", jsonArray2);
								map.put("code", "10000");
								map.put("message", ErrorCodeUtill.map.get("10000"));
								return map;
							}
						}
						map.put("code", "10001");
						map.put("message", ErrorCodeUtill.map.get("10001"));
					
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
	 * 通过问题id查询项目问题
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProblem", method = RequestMethod.POST)
	public Map<String, Object> getProblem(HttpServletRequest request,
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
					
					String problemId = jsonArray.getJSONObject(0).getString("problemId");
					String type = jsonArray.getJSONObject(0).getString("type");
					
					if(StringUtils.isBlank(problemId)||StringUtils.isBlank(type)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("isdeleted", 1);
						map2.put("problemId", problemId);
						map2.put("state", type);
						// 查询项目问题
						Problem problem = problemService.selectPrlblem(map2);
						
						//问题图片
							if(problem!=null){
								SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
									JSONObject jsonObject = new JSONObject();
									jsonObject.put("problemId", problem.getProblemId());
									jsonObject.put("taskId", problem.getTaskId());
									jsonObject.put("title", problem.getTitle());
									jsonObject.put("describes", problem.getDescribes());
									jsonObject.put("involvedDept", problem.getInvolvedDept());
									jsonObject.put("solution", problem.getSolution());
									jsonObject.put("state", problem.getState());
									jsonObject.put("creator", problem.getUser().getUsercname());
									if(problem.getCreateTime()!=null)
									jsonObject.put("createTime", simpleDateFormat.format(problem.getCreateTime()));
									jsonObject.put("projectId", problem.getProjectId());
									//头像图片处理
									//项目路径
									String realPath = request.getSession()
											.getServletContext().getRealPath("");
									String headImg = problem.getUser().getHeadImg();
									jsonObject.put("headImg", headImg);
									//图片处理
									List<ProblemAnnex> annexList = problem.getProblemAnnexList();
									if(annexList.get(0).getProblemAnnexPath()!=null){
										if(annexList!=null&&annexList.size()>0){
											JSONArray arr = new JSONArray();
											for (ProblemAnnex problemAnnex : annexList) {
												JSONObject json = new JSONObject();
												json.put("problemAnnexId", problemAnnex.getProblemAnnexId());
												json.put("problemAnnexName", problemAnnex.getProblemAnnexName());
												//图片bas64处理
												String problemAnnexPath = problemAnnex.getProblemAnnexPath();
												json.put("problemAnnexPath", problemAnnexPath);
												arr.add(json);
											}
											jsonObject.put("problemAnnexList", arr);
										}
									}
									map.put("data", jsonObject);
									map.put("code", "10000");
									map.put("message", ErrorCodeUtill.map.get("10000"));
									return map;
						}
						map.put("code", "10001");
						map.put("message", ErrorCodeUtill.map.get("10001"));
					
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
	 * 问题评论列表
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getProblemComment", method = RequestMethod.POST)
	public Map<String, Object> getProblemComment(HttpServletRequest request,
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
					
					String problemId = String.valueOf(jsonArray.getJSONObject(0).get(
							"problemId"));
					Integer pageNumber = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageNumber"));
					Integer pageSize = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageSize"));
					
					if(pageNumber==null||pageSize==null){
						map.put("code", "10002");
						map.put("message", ErrorCodeUtill.map.get("10002"));
						return map;
					}
					if ( Integer.valueOf(pageNumber) < 1) {
						pageNumber = 1;
					}
					if(StringUtils.isBlank(problemId)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}
						
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("problemId", problemId);
						
						// 问题列表
						PagedResult<Comment> list=problemService.get_problem_comment(map2,pageNumber,pageSize);
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
						if(list!=null){
							List<Comment> dataList = list.getDataList();
							if(dataList!=null&&dataList.size()>0){
								JSONArray jsonArray2 = new JSONArray();
								for (Comment comment : dataList) {
									JSONObject jsonObject = new JSONObject();
									jsonObject.put("commentId", comment.getCommentId());
									jsonObject.put("problemId", comment.getProblemId());
									jsonObject.put("content", comment.getContent());
									jsonObject.put("creator", comment.getUser().getUsercname());
									jsonObject.put("createTime","");
									if(comment.getCreateTime()!=null){
//									jsonObject.put("createTime", simpleDateFormat.format(comment.getCreateTime()));
										jsonObject.put("createTime", RelativeDateFormat.format(comment.getCreateTime()));
									}
									//头像
									String headImg = comment.getUser().getHeadImg();
									jsonObject.put("headImg", headImg);
									jsonArray2.add(jsonObject);
								}
								map.put("data", jsonArray2);
								map.put("code", "10000");
								map.put("message", ErrorCodeUtill.map.get("10000"));
								return map;
							}
						}
						
					
						map.put("code", "10001");
						map.put("message", ErrorCodeUtill.map.get("10001"));
					
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
	 * 保存评论
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/saveProblemComment", method = RequestMethod.POST)
	public Map<String, Object> saveProblemComment(HttpServletRequest request,
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
					
					String problemId = String.valueOf(jsonArray.getJSONObject(0).get(
							"problemId"));
					String content = jsonArray.getJSONObject(0).getString("content");
					
					
					if (StringUtils.isBlank(content)) {
						map.put("code", "6001");
						map.put("message", ErrorCodeUtill.map.get("6001"));
						return map;
					}
					if(StringUtils.isBlank(problemId)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}
					Comment comment = new Comment();
					comment.setCreateTime(new Date());
					comment.setCommentId(UUIDUtil.generateUUID());
					comment.setCreator(user.getId());
					comment.setProblemId(problemId);
					comment.setContent(content);
					comment.setHeadImg(user.getHeadImg());
				
					 int com = problemService.saveproblemcomment(comment);
						if(com!=-1){
							map.put("code", "10000");
							map.put("message", ErrorCodeUtill.map.get("10000"));
							return map;
						}
					
						map.put("code", "11111");
						map.put("message", ErrorCodeUtill.map.get("11111"));
					
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
	 * 项目问题汇报
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/saveProblemInfo", method = RequestMethod.POST)
	public Map<String, Object> saveProblemInfo(HttpServletRequest request,
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
					String title = jsonArray.getJSONObject(0).getString(
							"title");
					String describes =jsonArray.getJSONObject(0).getString(
							"describes");//
					String involvedDept =jsonArray.getJSONObject(0).getString(
							"involvedDept");
					String solution =jsonArray.getJSONObject(0).getString(
							"solution");
					if(StringUtils.isBlank(projectId)||"null".equals(projectId)||StringUtils.isBlank(title)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}
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
					//项目问题
					Problem problem = new Problem();
					problem.setIsdeleted((byte) 1);
					problem.setCreator(user.getUsercname());
					problem.setUserId(user.getId());
					problem.setCreateTime(new Date());
					String problemUID = UUIDUtil.generateUUID();
					problem.setProblemId(problemUID);
					if(problem.getState()==null)
						problem.setState((byte) 1);//1为问题未解决
					problem.setHeadImg(user.getHeadImg());
					problem.setTitle(title);
					problem.setDescribes(describes);
					problem.setInvolvedDept(involvedDept);
					problem.setSolution(solution);
					problem.setProjectId(projectId);
					Result save_problem = problemService.save_problem(problem);
					//保存附件
					if(save_problem.isSuccess()){

						ArrayList<ProblemAnnex> arrayList = new ArrayList<ProblemAnnex>();
						//保存进度附件	
						String fileName=null;
						if(StringUtils.isNotBlank(img1)&&StringUtils.isNoneBlank(imgName1)){
							//处理图片路径
							fileName = add_img(request, img1, imgName1,problemUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img2)&&StringUtils.isNoneBlank(imgName2)){
							fileName = add_img(request, img2, imgName2,problemUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img3)&&StringUtils.isNoneBlank(imgName3)){
							fileName = add_img(request, img3, imgName3,problemUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img4)&&StringUtils.isNoneBlank(imgName4)){
							fileName = add_img(request, img4, imgName4,problemUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img5)&&StringUtils.isNoneBlank(imgName5)){
							fileName = add_img(request, img5, imgName5,problemUID, arrayList,projectId);
						}
						if(StringUtils.isNotBlank(img6)&&StringUtils.isNoneBlank(imgName6)){
							fileName = add_img(request, img6, imgName6,problemUID, arrayList,projectId);
						}
						if(fileName!=null){
							int saveattachmentList = problemService.saveattachmentList(arrayList);
							if(saveattachmentList==-1){
								map.put("code", "22222");
								map.put("message", ErrorCodeUtill.map.get("22222"));
								return map;
							}
						}
							map.put("code", "10000");
							map.put("message", ErrorCodeUtill.map.get("10000"));
						}else{
							map.put("code", "11111");
							map.put("message", ErrorCodeUtill.map.get("11111"));
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
			String imgName1, String UID,
			ArrayList<ProblemAnnex> arrayList,String projectId) {
		String uuid = UUIDUtil.generateUUID();
		String realPath = request.getSession().getServletContext().getRealPath("");
		String fileName= "/upload/"+projectId+"/problem/" +uuid+ imgName1.substring(imgName1.lastIndexOf("."));;
		boolean generateImage = Bas64Utile.generateImage(img1, realPath+fileName);
		//保存图片路径到附件表
		if(generateImage){
			ProblemAnnex problemAnnex = new ProblemAnnex();
			problemAnnex.setProblemId(UID);
			problemAnnex.setProblemAnnexId(uuid);
			problemAnnex.setProblemAnnexName(imgName1);
			problemAnnex.setProblemAnnexType((byte) 1);
			problemAnnex.setProblemAnnexPath(fileName);
			arrayList.add(problemAnnex);
		}
		return fileName;
	}
	/**
	 * 通过登陆用户获取用户的问题列表
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/getUserProblem", method = RequestMethod.POST)
	public Map<String, Object> getUserProblem(HttpServletRequest request,
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
					
					Integer pageNumber = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageNumber"));
					Integer pageSize = Integer.valueOf(jsonArray.getJSONObject(0).getInt("pageSize"));
					
					if(pageNumber==null||pageSize==null){
						map.put("code", "10002");
						map.put("message", ErrorCodeUtill.map.get("10002"));
						return map;
					}
					if ( Integer.valueOf(pageNumber) < 1) {
						pageNumber = 1;
					}
						Map<String, Object> map2 = new HashMap<String, Object>();
						map2.put("isdeleted", 1);
						map2.put("userId", user.getId());
						// 查询项目问题
						PagedResult<Problem> pagedResult = problemService.selectPageList_ann(map2,
								Integer.valueOf(pageNumber), Integer.valueOf(pageSize));
						
						//问题图片
						if(pagedResult!=null){
							List<Problem> dataList = pagedResult.getDataList();
						if(dataList!=null&&dataList.size()>0){
							JSONArray jsonArray2 = new JSONArray();
							SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
							for (Problem problem : dataList) {
								JSONObject jsonObject = new JSONObject();
								jsonObject.put("problemId", problem.getProblemId());
								jsonObject.put("taskId", problem.getTaskId());
								jsonObject.put("title", problem.getTitle());
								jsonObject.put("describes", problem.getDescribes());
								jsonObject.put("involvedDept", problem.getInvolvedDept());
								jsonObject.put("solution", problem.getSolution());
								jsonObject.put("state", problem.getState());
								jsonObject.put("creator", problem.getUser().getUsercname());
								if(problem.getCreateTime()!=null)
								jsonObject.put("createTime", simpleDateFormat.format(problem.getCreateTime()));
								jsonObject.put("projectId", problem.getProjectId());
								//头像图片处理
								//项目路径
								String realPath = request.getSession()
										.getServletContext().getRealPath("");
								String headImg = problem.getUser().getHeadImg();
								jsonObject.put("headImg", headImg);
								//图片处理
								List<ProblemAnnex> annexList = problem.getProblemAnnexList();
								if(annexList!=null&&annexList.size()>0){
									JSONArray arr = new JSONArray();
									for (ProblemAnnex problemAnnex : annexList) {
										JSONObject json = new JSONObject();
										json.put("problemAnnexId", problemAnnex.getProblemAnnexId());
										json.put("problemAnnexName", problemAnnex.getProblemAnnexName());
										//图片bas64处理
										String problemAnnexPath = problemAnnex.getProblemAnnexPath();
										json.put("problemAnnexPath", problemAnnexPath);
										
										arr.add(json);
									}
								jsonObject.put("problemAnnexList", arr);
									
								}
								jsonArray2.add(jsonObject);
							}
								
									map.put("data", jsonArray2);
									map.put("code", "10000");
									map.put("message", ErrorCodeUtill.map.get("10000"));
									return map;
							}
						}
						map.put("code", "10001");
						map.put("message", ErrorCodeUtill.map.get("10001"));
					
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
