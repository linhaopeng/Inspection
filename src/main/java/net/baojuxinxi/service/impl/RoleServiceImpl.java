package net.baojuxinxi.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.baojuxinxi.dao.RolesMapper;
import net.baojuxinxi.pojo.Roles;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.IRoleService;

@Service("roleService")
public class RoleServiceImpl implements IRoleService {
	
	@Resource
	private RolesMapper rolesMapper;

	@Override
	public Roles findUserRole(SystemUsers user) {
		Roles role = rolesMapper.selectUserRoleByUserId(user.getId());
		return role;
	}

	@Override
	public List<Roles> selectUserRole(Map<String, Object> map) {
		List<Roles> role = rolesMapper.selectUserRole(map);
		return role;
	}

	
}
