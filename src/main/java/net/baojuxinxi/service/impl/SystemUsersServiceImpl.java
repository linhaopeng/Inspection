package net.baojuxinxi.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.dao.RolesMapper;
import net.baojuxinxi.dao.SystemUsersMapper;
import net.baojuxinxi.dao.UserRolesMapper;
//import net.baojuxinxi.dao.ManagedResidentialQuartersMapper;
//import net.baojuxinxi.dao.UserRolesMapper;
//import net.baojuxinxi.pojo.ManagedResidentialQuarters;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.Roles;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.pojo.UserRoles;
//import net.baojuxinxi.pojo.UserRoles;
//import net.baojuxinxi.pojo.custom.UserInfo;
import net.baojuxinxi.service.ISystemUsersService;
import net.baojuxinxi.utils.BeanUtil;
import net.baojuxinxi.utils.ErrorCodeUtill;
import net.baojuxinxi.utils.UUIDUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service("systemUsersService")
public class SystemUsersServiceImpl implements ISystemUsersService {
	
	@Resource
	private SystemUsersMapper systemUsersMapper;
	
	@Resource
	private UserRolesMapper userRolesMapper;
	
	@Autowired
	private RolesMapper rolesMapper;
//	
//	@Resource
//	private ManagedResidentialQuartersMapper managedResidentialQuartersMapper;
	
	/**
	 * 根据用户名和用户密码判断是否登录成功
	 */
	@Override
	public Result findSystemUsers(Map<String, Object> map) {
		//根据is_user和用户登录名查询用户信息
		SystemUsers systemUsers = systemUsersMapper.selectSystemUser(map);
		if(systemUsers != null){
					return new Result(systemUsers);//TODO 登录成功记录
		}
		return new Result(false,"login_error",null);
	}
	public SystemUsers find_user(String id) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("isUse", 1);
		map.put("id", id);
		 return systemUsersMapper.selectSystemUser(map);
		
	}
	
	/**
	 * 新增用户
	 */
	@Override
	public Result addSystemUser(Map<String, Object> map) {
		int insertResult = -1; 
		Map<String, Object> queryMap = new HashMap<String, Object>();
		//创建用户
		SystemUsers systemUser = new SystemUsers();
		String userId = UUIDUtil.generateUUID();
		String username = (String) map.get("username");
		String usercname = (String) map.get("usercname");
		queryMap.put("isUse", 1);
		queryMap.put("username", username);
		SystemUsers queryUser = systemUsersMapper.selectSystemUser(queryMap);
		if(queryUser != null)
			return new Result(false,"该用户名已被占用",null);
		systemUser.setId(userId);
		systemUser.setUsername(username);
		systemUser.setUsercname(usercname);
		systemUser.setPassword((String) map.get("password"));
		systemUser.setIsUse(1);
		systemUser.setPhone((String) map.get("phone"));
		systemUser.setEmail((String) map.get("email"));
		systemUser.setSex((Integer) map.get("sex"));
		systemUser.setCreatedTime(new Date());
		systemUser.setPriority((String) map.get("priority"));
		systemUser.setLatestUpdateTime(new Date());
		insertResult = systemUsersMapper.insertSelective(systemUser);
		//暂时默认给一个管理员的权限
		if(insertResult!=-1){
			//关联用户角色
			UserRoles userRole = new UserRoles();
			userRole.setId(UUIDUtil.generateUUID());
			String power = (String) map.get("power");
			userRole.setRoleId(2);
			if(StringUtils.isNoneBlank(power)){
				userRole.setRoleId(Integer.valueOf(power));
			}
			userRole.setUserId(userId);
			insertResult = userRolesMapper.insertSelective(userRole);
		}
//		if(insertResult != -1){
//			//关联用户角色
//			UserRoles userRole = new UserRoles();
//			userRole.setId(UUIDUtil.generateUUID());
//			userRole.setRoleId((Integer) map.get("roleId"));
//			userRole.setUserId(userId);
//			insertResult = userRolesMapper.insertSelective(userRole);
//			//关联用户管理的小区
//			List<ManagedResidentialQuarters> managedRQs = new ArrayList<ManagedResidentialQuarters>();
//			String[] rqArr = (String[]) map.get("rqArr");
//			if(insertResult != -1 && rqArr != null){
//				for(String rq: rqArr){
//					ManagedResidentialQuarters managedRQ = new ManagedResidentialQuarters();
//					managedRQ.setId(UUIDUtil.generateUUID());
//					managedRQ.setUserId(userId);
//					managedRQ.setRqId(rq);
//					managedRQ.setCreatedTime(new Date());
//					managedRQ.setLatestUpdateTime(new Date());
//					managedRQs.add(managedRQ);
//				}
//				insertResult =managedResidentialQuartersMapper.insertManagedRQsBatch(managedRQs);
//			}
//			
//		}
		return insertResult != -1?new Result(true,"成功新增账号",insertResult):new Result(false,"新增账号失败",null);
	}

	/**
	 * 修改用户
	 */
	@Override
	public Result modifySystemUser(Map<String, Object> map) {
		int modifyResult = -1;
		Map<String, Object> queryMap = new HashMap<String, Object>();
		String userId = (String) map.get("accountId");
		SystemUsers systemUser = systemUsersMapper.selectByPrimaryKey(userId);
		if(systemUser != null){
			String username = (String) map.get("username");
			String usercname = (String) map.get("usercname");
			String email = (String) map.get("email");
			String phone = (String) map.get("phone");
			Integer sex = (Integer) map.get("sex");//性别
			String priority = (String) map.get("priority");
			queryMap.put("isUse", 1);
			queryMap.put("username", username);
			//修改用户信息
			systemUser.setUsername(username);
			systemUser.setUsercname(usercname);
			systemUser.setEmail(email);
			systemUser.setPhone(phone);
			systemUser.setSex(sex);
			systemUser.setPriority(priority);
			systemUser.setComId((Integer) map.get("companyId"));
			systemUser.setLatestUpdateTime(new Date());
			modifyResult = systemUsersMapper.updateByPrimaryKeySelective(systemUser);
			//修改用户角色
			String power = (String) map.get("power");
			if(StringUtils.isNoneBlank(power)){
				UserRoles userRoles = new UserRoles();
				userRoles.setRoleId(Integer.valueOf(power));
				userRoles.setUserId(userId);
				int updateByPrimaryKey = userRolesMapper.updateByPrimaryUserId(userRoles);
			}
			
		}else{
			return new Result(false,"不存在该用户",null);
		}
		return modifyResult != -1?new Result(true,"成功修改账号",modifyResult):new Result(false,"修改账号失败",null);
	}

	/**
	 * 批量删除账号（逻辑删除）
	 * */
	@Override
	public Result deleteSystemUserBatch(Map<String, Object> map) {
		int deleteResult = systemUsersMapper.updateSystemUsersBatch(map);
		if(deleteResult != -1){
			return new Result(true, "成功删除用户！", null);
		}
		return new Result(false, "删除用户失败！", null);
	}

	/**
	 * 修改用户密码
	 */
	@Override
	public Result modifyUserPassword(Map<String, String> map) {
		String userId = map.get("accountId");
		String newPassword = map.get("newPassword");
		String updateBy = map.get("updateBy");
		SystemUsers systemUser = systemUsersMapper.selectByPrimaryKey(userId);
		if(systemUser != null){
			
			systemUser.setPassword(newPassword);
			systemUser.setLatestUpdateTime(new Date());
			systemUser.setLatestUpdateBy(updateBy);
			if(systemUsersMapper.updateByPrimaryKeySelective(systemUser) != -1)
				return new Result(true,"成功修改账号密码",null);
			return new Result(false,"修改账号密码失败",null);
		}else{
			return new Result(false,"不存在该用户",null);
		}
	}
	
	/**
	 * 手机修改用户密码
	 */
	@Override
	public Map<String, Object> modifyUserPassword2(Map<String, String> map,Map<String, Object> code) {
		
		String userId = map.get("accountId");
		String newPassword = map.get("newPassword");
		String loginPassword = map.get("loginPassword");
		String updateBy = map.get("updateBy");
		SystemUsers systemUser = systemUsersMapper.selectByPrimaryKey(userId);
		if(systemUser != null){
			if(!systemUser.getPassword().equals(loginPassword)){
				code.put("code", "5017");
				code.put("message", ErrorCodeUtill.map.get("5017"));
				return code;
			}
				
			
			systemUser.setPassword(newPassword);
			systemUser.setLatestUpdateTime(new Date());
			systemUser.setLatestUpdateBy(updateBy);
			if(systemUsersMapper.updateByPrimaryKeySelective(systemUser) != -1){
				code.put("code", "10000");
				code.put("message", ErrorCodeUtill.map.get("10000"));
			
			}else{
				code.put("code", "5016");
				code.put("message", ErrorCodeUtill.map.get("5016"));
			}
			
		}else{
			code.put("code", "5018");
			code.put("message", ErrorCodeUtill.map.get("5018"));
		}
		return code;
	}

	@Override
	public PagedResult<SystemUsers> findUserByPage(Map<String, Object> map, Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null?1:pageNo,pageSize == null?10:pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		return BeanUtil.toPagedResult(systemUsersMapper.selectUser_role(map));
	}

	/**
	 * 修改头像
	 */
	@Override
	public Result modifySystemUserImg(Map<String, Object> map) {
		String userId = (String) map.get("accountId");
		SystemUsers systemUser = systemUsersMapper.selectByPrimaryKey(userId);
		if(systemUser != null){
			SystemUsers user = new SystemUsers();
			user.setId(userId);
			user.setHeadImg((String) map.get("headImg"));
			int upate = systemUsersMapper.updateByPrimaryKeySelective(user);
			if(upate==-1){
				return new Result(false,"修改失败",null);
			}
			return new Result(true,"修改成功",user);
		}else{
			return new Result(false,"不存在该用户",null);
		}
	}
	/**
	 * 获取用户的角色
	 * @return 
	 */
	@Override
	public HashMap<String, Object> get_roles(String id) {
		UserRoles userRole = userRolesMapper.get_roles(id);
		Roles roles = userRole.getRoles();
		HashMap<String, Object> map = new HashMap<>();
		map.put("roles", roles.getRoleKey());
		if("superAdmin".equals(roles.getRoleKey())){
			//超级管理员,获取角色信息列表
			List<Roles> list = rolesMapper.selectUserRole(map);
			map.put("rolesList", list);
		}
		return map;
	}


}
