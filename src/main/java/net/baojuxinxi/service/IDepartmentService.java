package net.baojuxinxi.service;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Department;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;

public interface IDepartmentService {

	/**
	 * 查询部门
	 * @param map
	 * @return
	 */
	Result findDepartment(Map<String, Object> map);
	
	/*
	 * 分页查询部门
	 */
	PagedResult<Department> findDepartmentByPage(
			Map<String, Object> map, Integer pageNo, Integer pageSize);
	

	/**
	 * 新增部门
	 * @param map
	 * @return
	 */
	Result addDepartment(Map<String, Object> map);

	/**
	 * 修改部门
	 * @param map
	 * @return
	 */
	Result modifyDepartment(Map<String, Object> map);

	/**
	 * 删除部门
	 * @param map
	 * @return
	 */
	Result deleteDepartmentBatch(Map<String, Object> map);
	
	/**
	 * 获取部门树
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> findDepartmentList(Map<String, Object> map);
	
	public List<Integer> selectDepartmentId(Map<String, Integer> map) ;
}
