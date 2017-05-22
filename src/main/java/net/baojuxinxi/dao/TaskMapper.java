package net.baojuxinxi.dao;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Task;

public interface TaskMapper {
    int deleteByPrimaryKey(String taskId);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(String taskId);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);

    //获取任务列表
	List<Task> selectPageList(Map<String, Object> map);
	//删除
	int updateDeleteIn(Map<String, Object> map);
}