package net.baojuxinxi.dao;

import net.baojuxinxi.pojo.UserRoles;

public interface UserRolesMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserRoles record);

    int insertSelective(UserRoles record);

    UserRoles selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserRoles record);

    int updateByPrimaryKey(UserRoles record);

	UserRoles selectUserRole(String userId);

	UserRoles get_roles(String id);

	int updateByPrimaryUserId(UserRoles userRoles);

}