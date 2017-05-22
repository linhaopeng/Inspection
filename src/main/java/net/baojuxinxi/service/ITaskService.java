package net.baojuxinxi.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Progress;
import net.baojuxinxi.pojo.ProgressAnnex;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.Task;

public interface  ITaskService {

	//获取任务列表
	PagedResult<Task> selectPageList(Map<String, Object> map, Integer pageNo,
			Integer pageSize);

	//保存任务
	Result addprojectInfo(Task task);

	//修改任务
	Result modifyprojectInfo(Task task);

	List<ProgressAnnex> get_progress_img(String progressId);

	int saveattachmentList(ArrayList<ProgressAnnex> arrayList);

	List<Task> selectList(Map<String, Object> map);

	PagedResult<Progress> selectScheduleList(Map<String, Object> map, Integer pageNo,
			Integer pageSize);

	Result addProgressInfo(Progress progress, Project project);

	Result deleteIn_Id(Map<String, Object> map);

}
