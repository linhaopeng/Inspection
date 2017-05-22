package net.baojuxinxi.dao;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Roles;

public interface RolesMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Roles record);

    int insertSelective(Roles record);

    Roles selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Roles record);

    int updateByPrimaryKey(Roles record);

	Roles selectUserRoleByUserId(String userId);
	
	List<Roles> selectUserRole(Map<String, Object> map);
}