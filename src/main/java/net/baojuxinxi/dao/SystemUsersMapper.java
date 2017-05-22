package net.baojuxinxi.dao;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.SystemUsers;

public interface SystemUsersMapper{
    int deleteByPrimaryKey(String id);

    int insert(SystemUsers record);

    int insertSelective(SystemUsers record);

    SystemUsers selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SystemUsers record);

    int updateByPrimaryKey(SystemUsers record);

	SystemUsers selectSystemUser(Map<String, Object> map);

	int updateSystemUsersBatch(Map<String, Object> map);
	
	List<SystemUsers> selectUser(Map<String, Object> map);

	List<SystemUsers> selectUser_role(Map<String, Object> map);
}