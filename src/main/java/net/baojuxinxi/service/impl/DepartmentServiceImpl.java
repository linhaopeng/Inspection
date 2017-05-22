package net.baojuxinxi.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import net.baojuxinxi.dao.DepartmentMapper;
import net.baojuxinxi.pojo.Department;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.service.IDepartmentService;
import net.baojuxinxi.utils.BeanUtil;

@Service("departmentService")
public class DepartmentServiceImpl implements IDepartmentService {

	@Resource
	private DepartmentMapper departmentMapper;
	
	/**
	 * 查询部门
	 */
	@Override
	public Result findDepartment(Map<String, Object> map) {
		List<Department> department = departmentMapper.selectDepartment(map);
		if(department != null){
			return new Result(department);
		}
		return new Result(false,"查询失败",null);
	}
	/**
	 * 分页查询部门
	 */
	@Override
	public PagedResult<Department> findDepartmentByPage(Map<String, Object> map, Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null?1:pageNo,pageSize == null?10:pageSize); 
		return BeanUtil.toPagedResult(departmentMapper.selectDepartmentMo(map));
	}

	/**
	 * 新建部门信息
	 */
	@Override
	public Result addDepartment(Map<String, Object> map) {
		int insertResult = -1; 
		Map<String, Object> queryMap = new HashMap<String, Object>();
		//创建部门
		Department department = new Department();
		String departmentName = (String) map.get("departmentName");
		String describe = (String) map.get("describe");
		String createdBy= (String) map.get("createdBy");
		Integer levels = (Integer) map.get("levels");
		
		//Integer pId = (Integer) map.get("createdBy");
		//部门父类Id，先这样
		Integer pId =1;
		
		queryMap.put("isUse", 1);
		queryMap.put("departmentName", departmentName);
		List<Department> querydepartment = departmentMapper.selectDepartment(queryMap);
		if(querydepartment != null && querydepartment.size() > 0)
			return new Result(false,"该部门名已被占用",null);
		department.setCreatedBy(createdBy);
		department.setCreatedTime(new Date());
		department.setDepartmentName(departmentName);
		department.setIsUse(1);
		department.setpId(pId);
		department.setDescribe(describe);
		department.setLatestUpdateBy(createdBy);
		department.setLatestUpdateTime(new Date());
		department.setLevels(levels);
		
		insertResult = departmentMapper.insertSelective(department);
		return insertResult != -1?new Result(true,"成功新增部门",insertResult):new Result(false,"新增部门失败",null);
	}

	/**
	 *  修改部门信息
	 */
	@Override
	public Result modifyDepartment(Map<String, Object> map) {
		int modifyResult = -1;
		
		String  departmentId = map.get("departmentId").toString();
		Department department = departmentMapper.selectByPrimaryKey(departmentId);
		
		if(department != null){
			//部门名
			String departmentName = (String) map.get("departmentName");
			//部门描述
			String describe = (String) map.get("describe");
			//最后修改人
			String latestUpdateBy= (String) map.get("latestUpdateBy");
			//部门等级
			
			Integer levels = Integer.valueOf(map.get("levels").toString());
			//Integer pId = (Integer) map.get("pId");
		
			
			//修改部门信息
			department.setLatestUpdateBy(latestUpdateBy);
			department.setLatestUpdateTime(new Date());
			department.setDepartmentName(departmentName);
			department.setDescribe(describe);
			department.setLevels(levels);
			modifyResult = departmentMapper.updateByPrimaryKeySelective(department);
		}else{
			return new Result(false,"不存在该",null);
		}
		return modifyResult != -1?new Result(true,"成功修改部门",modifyResult):new Result(false,"修改部门失败",null);
	}

	@Override
	public Result deleteDepartmentBatch(Map<String, Object> map) {
		int deleteResult = departmentMapper.updateSystemUsersBatch(map);
		if(deleteResult != -1){
			return new Result(true, "成功删除！", null);
		}
		return new Result(false, "删除部门失败！", null);
	}
	@Override
	public List<Map<String, Object>> findDepartmentList(Map<String, Object> map) {
		List<Map<String, Object>> department = departmentMapper.selectDepartments(map);
		return department;
	}
	
	@Override
	public List<Integer> selectDepartmentId(Map<String, Integer> map) {
		List<Integer> departmentIdList = new ArrayList<Integer>();
		Integer departmentId = (Integer) map.get("departmentId");
		departmentIdList.add(departmentId);
		selectDepartmentIdByPid(departmentIdList, map);
		return departmentIdList;
	}
	
	public List<Integer> selectDepartmentIdByPid(List<Integer> departmentIdList,Map<String, Integer> map){
		//根据ID 查询子部门
		List<Department> department = departmentMapper.selectDepartmentId(map);
		if(department.size()>0 && department!=null){
			for (int i = 0; i < department.size(); i++) {
				//将查询出来的子部门的ID 存到集合中去
				departmentIdList.add(department.get(i).getDepartmentId());
				map.put("departmentId", department.get(i).getDepartmentId());
			}
			selectDepartmentIdByPid(departmentIdList, map);
		}
		return null;
	}

}
