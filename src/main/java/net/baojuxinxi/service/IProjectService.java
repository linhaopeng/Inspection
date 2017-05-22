package net.baojuxinxi.service;

import java.util.Map;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.Type;

public interface IProjectService {
	/**
	 * 项目类型分页
	 * 
	 * @param map
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */

	PagedResult<Type> selectTypeList(Map<String, Object> map, Integer pageNo,
			Integer pageSize);

	/**
	 * 修改项目类型
	 * 
	 * @param map
	 * @return
	 */
	Result modifyprojectType(Map<String, Object> map);

	/**
	 * 保存项目类型
	 * 
	 * @param map
	 * @return
	 */
	Result addprojectType(Map<String, Object> map);

	/**
	 * 项目信息分页
	 * @param map
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<Project> selectInfoList(Map<String, Object> map, Integer pageNo,
			Integer pageSize);

	/**
	 * 删除项目类型
	 * @param map
	 * @return
	 */
	Result deleteDepartmentBatch(Map<String, Object> map);

	//保存项目信息
	Result addprojectInfo(Project project);

	//获取项目信息
	Project selectP_infoByKey(String projectId);
}
