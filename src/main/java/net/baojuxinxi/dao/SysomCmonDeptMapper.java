package net.baojuxinxi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.SysomCmonDept;


public interface SysomCmonDeptMapper {
    int deleteByPrimaryKey(String commonDeptId);

    int insert(SysomCmonDept record);

    int insertSelective(SysomCmonDept record);

    SysomCmonDept selectByPrimaryKey(String commonDeptId);

    int updateByPrimaryKeySelective(SysomCmonDept record);

    int updateByPrimaryKey(SysomCmonDept record);

    //项目单位列表
	List<SysomCmonDept> selectPageList(Map<String, Object> map);

	//根据名查询
	SysomCmonDept selectByPrimaryName(HashMap<String, Object> map);

	//批量删除
	int update_deleteAll(Map<String, Object> map);

	

}