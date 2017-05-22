package net.baojuxinxi.dao;

import net.baojuxinxi.pojo.RolePermissions;

public interface RolePermissionsMapper {
    int deleteByPrimaryKey(String id);

    int insert(RolePermissions record);

    int insertSelective(RolePermissions record);

    RolePermissions selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(RolePermissions record);

    int updateByPrimaryKey(RolePermissions record);
}