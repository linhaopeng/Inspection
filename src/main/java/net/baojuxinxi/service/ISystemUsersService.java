package net.baojuxinxi.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;

public interface ISystemUsersService {

	Result findSystemUsers(Map<String, Object> map);

	PagedResult<SystemUsers> findUserByPage(
			Map<String, Object> map, Integer pageNo, Integer pageSize);

	Result addSystemUser(Map<String, Object> map);

	Result modifySystemUser(Map<String, Object> map);

	Result deleteSystemUserBatch(Map<String, Object> map);

	Result modifyUserPassword(Map<String, String> map);
	
	Map<String, Object> modifyUserPassword2(Map<String, String> map,Map<String, Object> map2);

	Result modifySystemUserImg(Map<String, Object> map);

	SystemUsers find_user(String id);

	HashMap<String, Object> get_roles(String id);

}
