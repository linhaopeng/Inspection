package net.baojuxinxi.dao;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.SysomCmonDept;
import net.baojuxinxi.pojo.Type;

public interface ProjectMapper {
    int deleteByPrimaryKey(String projectId);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(String projectId);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);
    
    //分页查询项目信息
	List<Project> selectPageList(Map<String, Object> map);
	//删除
	int updateByKeyDelete(Map<String, Object> map);

	//如果有项目用到就不给删除
	List<Project> select_type_in_Key(Map<String, Object> map);
	//查询项目单位有没有被使用
	List<SysomCmonDept> select_unit_in_Key(Map<String, Object> map);



}