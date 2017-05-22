package net.baojuxinxi.dao;

import java.util.List;

import net.baojuxinxi.pojo.Permission;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer permissionId);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer permissionId);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

	List<Permission> selectRolePermission(String userId);
}