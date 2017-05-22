package net.baojuxinxi.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import net.baojuxinxi.dao.ProgressAnnexMapper;
import net.baojuxinxi.dao.ProgressMapper;
import net.baojuxinxi.dao.ProjectMapper;
import net.baojuxinxi.dao.TaskMapper;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Progress;
import net.baojuxinxi.pojo.ProgressAnnex;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.Task;
import net.baojuxinxi.service.ITaskService;
import net.baojuxinxi.utils.BeanUtil;
import net.baojuxinxi.utils.ErrorCodeUtill;
import net.baojuxinxi.utils.UUIDUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service("taskService")
public class TaskServiceImpl implements ITaskService {

	@Resource
	private TaskMapper taskMapper;
	
	@Autowired
	private ProgressMapper progressMapper;
	
	@Autowired
	private ProjectMapper projectMapper;
	
	@Autowired
	private ProgressAnnexMapper progressAnnexMapper;

	/**
	 * 获取任务列表
	 * 
	 * @param map
	 * @param valueOf
	 * @param valueOf2
	 * @return
	 */
	@Override
	public PagedResult<Task> selectPageList(Map<String, Object> map,
			Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 10
				: pageSize);
		return BeanUtil.toPagedResult(taskMapper.selectPageList(map));
	}

	/**
	 * 保存任务
	 * 
	 * @param task
	 * @return
	 */
	@Override
	public Result addprojectInfo(Task task) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("name", task.getName());
		hashMap.put("isdeleted", 1);
		List<Task> selectTypeList = taskMapper.selectPageList(hashMap);

		if (selectTypeList != null && selectTypeList.size() > 0)
			return new Result(false, "该项目任务名已被占用", null);
		task.setCreateTime(new Date());
		task.setTaskId(UUIDUtil.generateUUID());
		task.setIsdeleted((byte) 1);
		int insert = taskMapper.insert(task);
		return insert != -1 ? new Result(true, "成功新增项目任务", insert)
				: new Result(false, "新增项目任务失败", null);
	}

	/**
	 * 修改任务
	 * 
	 * @param task
	 * @return
	 */
	@Override
	public Result modifyprojectInfo(Task task) {
		Task selectByPrimaryKey = taskMapper.selectByPrimaryKey(task.getTaskId());
		//task.setIsdeleted((byte) 1);
		int updateByPrimaryKey=-1;
		if (selectByPrimaryKey != null) {
			selectByPrimaryKey.setName(task.getName());
			selectByPrimaryKey.setWeight(task.getWeight());
			selectByPrimaryKey.setState(task.getState());
			selectByPrimaryKey.setInvolvedDept(task.getInvolvedDept());
			selectByPrimaryKey.setPlanBeginDate(task.getPlanBeginDate());
			selectByPrimaryKey.setPlanEndDate(task.getPlanEndDate());
			selectByPrimaryKey.setTaskDescribe(task.getTaskDescribe());
			selectByPrimaryKey.setActualBeginDate(task.getActualBeginDate());
			selectByPrimaryKey.setActualEndDate(task.getActualEndDate());
			selectByPrimaryKey.setListNo(task.getListNo());
			 updateByPrimaryKey = taskMapper.updateByPrimaryKey(selectByPrimaryKey);
		
		} else {
			return new Result(false, "不存在该任务", null);
		}
		return updateByPrimaryKey != -1 ? new Result(true, "成功修改项目任务", updateByPrimaryKey)
				: new Result(false, "修改项目任务失败", null);
	}

	/**
	 * 删除计划
	 * @param map
	 * @return
	 */
	@Override
	public Result deleteIn_Id(Map<String, Object> map) {
		int deleteResult = taskMapper.updateDeleteIn(map);
		if(deleteResult != -1){
			return new Result(true, "成功删除！", null);
		}
		return new Result(false, "删除失败！", null);
	}

	/**
	 * 保存进度汇报
	 * @param progress
	 * @param project
	 * @return
	 */
	@Override
	public Result addProgressInfo(Progress progress, Project project) {
		//修改项目信息
		Project selectP_infoByKey = projectMapper.selectByPrimaryKey(progress.getProjectId());
		if(selectP_infoByKey==null)
			return new Result(false, "项目不存在！", null);
		selectP_infoByKey.setProgress(project.getProgress());
		selectP_infoByKey.setPlanBeginDate(project.getPlanBeginDate());
		selectP_infoByKey.setPlanEndDate(project.getPlanEndDate());
		selectP_infoByKey.setActualBeginDate(project.getActualBeginDate());
		selectP_infoByKey.setActualEndDate(project.getActualEndDate());
		selectP_infoByKey.setState(project.getState());
		int updateByPrimaryKeySelective = projectMapper.updateByPrimaryKeySelective(selectP_infoByKey);
		if(updateByPrimaryKeySelective==-1)
			return new Result(false, "项目保存失败！", null);
		//保存进度汇报
		
		int insert = progressMapper.insertSelective(progress);
		if(insert==-1)
			return new Result(false, "进度汇报保存失败！", null);
		//保存附件
		
		
		
		return new Result(true, "进度汇报保存成功！", insert);
	}
	//手机保存项目进度
	public Map<String, Object> addProgressInfo2(Progress progress, Project project, Map<String, Object> map) {
		//修改项目信息
		Project selectP_infoByKey = projectMapper.selectByPrimaryKey(progress.getProjectId());
		if(selectP_infoByKey==null){
			map.put("code", "6004");
			map.put("message", ErrorCodeUtill.map.get("6004"));
			return map;
		}
			
		selectP_infoByKey.setProgress(project.getProgress());
		selectP_infoByKey.setState(project.getState());
		if(project.getPlanBeginDate()!=null)
		selectP_infoByKey.setPlanBeginDate(project.getPlanBeginDate());
		if(project.getPlanEndDate()!=null)
		selectP_infoByKey.setPlanEndDate(project.getPlanEndDate());
		if(project.getActualBeginDate()!=null)
		selectP_infoByKey.setActualBeginDate(project.getActualBeginDate());
		if(project.getActualEndDate()!=null)
		selectP_infoByKey.setActualEndDate(project.getActualEndDate());
		int updateByPrimaryKeySelective = projectMapper.updateByPrimaryKeySelective(selectP_infoByKey);
		if(updateByPrimaryKeySelective==-1){
			map.put("code", "6002");
			map.put("message", ErrorCodeUtill.map.get("6002"));
			return map;
		}
		//保存进度汇报
		
		int insert = progressMapper.insertSelective(progress);
		if(insert==-1){
			map.put("code", "6003");
			map.put("message", ErrorCodeUtill.map.get("6003"));
			return map;
		}
		return null; 
	
	}

	/**
	 * 查询进度列表
	 * @param map
	 * @param valueOf
	 * @param valueOf2
	 * @return
	 */
	@Override
	public PagedResult<Progress> selectScheduleList(
			Map<String, Object> map, Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 10
				: pageSize);
		return BeanUtil.toPagedResult(progressMapper.selectPageList(map));
	}

	/**
	 * 查询所有任务列表
	 * @param map
	 * @return 
	 */
	@Override
	public List<Task> selectList(Map<String, Object> map) {
		
		return taskMapper.selectPageList(map);
	}

	/**
	 * 批量保存进度汇报附件
	 * @param arrayList
	 */
	@Override
	public int saveattachmentList(ArrayList<ProgressAnnex> arrayList) {
		// TODO Auto-generated method stub
		return progressAnnexMapper.insertSelectivelist(arrayList);
	}

	/**
	 *  回显图片,进度汇报附件
	 * @param progressId
	 * @return
	 */
	@Override
	public List<ProgressAnnex> get_progress_img(String progressId) {
		return progressAnnexMapper.selectBy_progressKey(progressId);
	}

	/**
	 * 通过进度id查询进度
	 * @param progressId
	 * @return
	 */
	public Progress selectSchedule(String progressId) {
		return progressMapper.selectByPrimaryKey(progressId);
 
	}

}
