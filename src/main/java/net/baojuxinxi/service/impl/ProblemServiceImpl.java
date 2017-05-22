package net.baojuxinxi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.baojuxinxi.dao.CommentMapper;
import net.baojuxinxi.dao.ProblemAnnexMapper;
import net.baojuxinxi.dao.ProblemMapper;
import net.baojuxinxi.pojo.Comment;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Problem;
import net.baojuxinxi.pojo.ProblemAnnex;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.service.IProblemService;
import net.baojuxinxi.utils.BeanUtil;
import net.baojuxinxi.utils.FileUpload_bao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
@Service("problemService")
public class ProblemServiceImpl implements IProblemService {

	@Autowired
	private ProblemMapper problemMapper;
	
	@Autowired
	private ProblemAnnexMapper problemAnnexMapper;
	
	@Autowired
	private CommentMapper commentMapper;
	/**
	 *  保存项目问题
	 * @param problem
	 * @return 
	 */
	@Override
	public Result save_problem(Problem problem) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("title", problem.getTitle());
		map.put("isdeleted", 1);
		List<Problem> selectPageList = problemMapper.selectPageList(map);

		if (selectPageList != null&&selectPageList.size()>0)
			return new Result(false, "该问题标题已被占用", null);
	
		int insertSelective = problemMapper.insertSelective(problem);
		return insertSelective != -1 ? new Result(true, "成功新增项目问题", insertSelective)
		: new Result(false, "新增项目问题失败", null);
	}
	/**
	 * 保存图片路径到附件表
	 * @param problemAnnex
	 * @return 
	 */
	@Override
	public int saveattachment(ProblemAnnex problemAnnex) {
		// TODO Auto-generated method stub
		return problemAnnexMapper.insertSelective(problemAnnex);
	}
	/**
	 * 问题分页
	 * @param map
	 * @param valueOf
	 * @param valueOf2
	 * @return
	 */
	@Override
	public PagedResult<Problem> selectPageList(Map<String, Object> map,
			Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 10
				: pageSize);
		return BeanUtil.toPagedResult(problemMapper.selectPageList(map));
	}
	/**
	 * 批量保存图片路径到附件表
	 * @param problemAnnexlist
	 * @return 
	 */
	@Override
	public int saveattachmentList(List<ProblemAnnex> problemAnnexlist) {
		// TODO Auto-generated method stub
		return problemAnnexMapper.insertSelectivelist(problemAnnexlist);
	}
	/**
	 * 删除项目问题
	 * @param problemId
	 * @param request 
	 * @return
	 */
	
	public Result delete_problem(String problemId, HttpServletRequest request) {
		//删除项目问题
		Problem problem = new Problem();
		problem.setIsdeleted((byte) 0);
		problem.setProblemId(problemId);
		int updateByPrimaryKeySelective = problemMapper.updateByPrimaryKeySelective(problem);
		if(updateByPrimaryKeySelective!=-1){
			//删除图片
//			List<ProblemAnnex> annList = problemAnnexMapper.selectBy_problemKey(problemId);
//			if(annList!=null&&annList.size()>0){
//				FileUpload_bao upload_bao = new FileUpload_bao();
//				// 定义上传路径
//				for (ProblemAnnex problemAnnex : annList) {
//					String path = problemAnnex.getProblemAnnexPath();
//					upload_bao.delete(path, request);
//				}
//			}
//			//删除项目问题下的附件
//			int deleteBy_problemKey = problemAnnexMapper.deleteBy_problemKey(problem.getProblemId());
//			if(deleteBy_problemKey==-1){
//				return new Result(false, "删除附件失败", null);
//			}
		}else{
			return new Result(false, "删除项目问题失败", null);
		}
		return  new Result(true, "删除成功", null);
	}
	/**
	 * 回显图片, 项目问题附件
	 * @param problemId
	 * @return
	 */
	@Override
	public List<ProblemAnnex> get_problem_img(String problemId) {
		return problemAnnexMapper.selectBy_problemKey(problemId);
	}
	/**
	 * 保存问题评论
	 * @param comment
	 * @return
	 */
	public Result save_problem_comment(Comment comment) {
		int insertSelective = commentMapper.insertSelective(comment);
		if(insertSelective==-1)
			new Result(false, "保存问题评论失败", null);
		return new Result(true, "保存问题评论成功", null);
	}
	public int saveproblemcomment(Comment comment) {
		 return commentMapper.insertSelective(comment);
		
	}
	/**
	 * 评论列表
	 * @param problemId
	 * @param i
	 * @param j
	 * @return
	 */
	public PagedResult<Comment> get_problem_comment(Map<String, Object> map, Integer pageNo,
			Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 5
				: pageSize);
		return BeanUtil.toPagedResult(commentMapper.selectPageList(map));
	}
	
	/**
	 * 更新问题图片
	 * @param problemAnn
	 * @return 
	 */
	public int update_problem_img(ProblemAnnex problemAnn) {
		return problemAnnexMapper.updateByPrimaryKeySelective(problemAnn);
		
	}
	/**
	 * 删除问题附件
	 * @param problemAnnexId
	 * @return 
	 */
	public int delete_problem_img(String problemAnnexId) {
		// TODO Auto-generated method stub
		return problemAnnexMapper.deleteByPrimaryKey(problemAnnexId);
	}
	/**
	 * 问题分页_关联附件
	 * @param map2
	 * @param valueOf
	 * @param valueOf2
	 * @return
	 */
	public PagedResult<Problem> selectPageList_ann(Map<String, Object> map,
			Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 10
				: pageSize);
//		List<Problem> selectPageList_ann = problemMapper.selectPageList_ann(map);
		//get_par_annList
		List<Problem> selectPageList_ann = problemMapper.get_par_annList(map);
		return BeanUtil.toPagedResult(selectPageList_ann);
	}
	/**
	 * 通过问题ID查询项目问题
	 * @param map2
	 */
	public Problem selectPrlblem(Map<String, Object> map) {
		return problemMapper.selectPrlblem(map);
	}
	/**
	 * 更新项目问题
	 * @param problem
	 * @return 
	 */
	public int update_problem(Problem problem) {
		//查询数据库有没有这条数据
		Problem selectByPrimaryKey = problemMapper.selectByPrimaryKey(problem.getProblemId());
		if(selectByPrimaryKey!=null){
			selectByPrimaryKey.setDescribes(problem.getDescribes());
			selectByPrimaryKey.setInvolvedDept(problem.getInvolvedDept());
			selectByPrimaryKey.setSolution(problem.getSolution());
			selectByPrimaryKey.setState(problem.getState());
			return problemMapper.updateByPrimaryKey(selectByPrimaryKey);
		}
		return -1;
	}
	

	

}
