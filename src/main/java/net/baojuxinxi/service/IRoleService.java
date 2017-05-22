package net.baojuxinxi.service;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Roles;
import net.baojuxinxi.pojo.SystemUsers;

public interface IRoleService {

	Roles findUserRole(SystemUsers user);
	
	List<Roles> selectUserRole(Map<String, Object> map);

}
