package net.baojuxinxi.dao;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Department;

public interface DepartmentMapper {

    Department selectByPrimaryKey(String departmentId);

    List<Department> selectDepartment(Map<String, Object> map);
    
    List<Map<String, Object>> selectDepartments(Map<String, Object> map);
    
    int deleteByPrimaryKey(String departmentId);
    
    int insert(Department record);
    
    int insertSelective(Department record);
    
    int updateByPrimaryKeySelective(Department record);
    
    int updateSystemUsersBatch(Map<String, Object> map);
    
    int updateByPrimaryKey(Department record);
    
    List<Department> selectDepartmentMo(Map<String, Object> map);
    
    List<Department> selectDepartmentId(Map<String, Integer> map);
}