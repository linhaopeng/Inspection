package net.baojuxinxi.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.baojuxinxi.comparator.PermissionComparator;
import net.baojuxinxi.dao.PermissionMapper;
import net.baojuxinxi.pojo.Permission;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.IPermissionService;
import net.baojuxinxi.utils.ListUtil;

@Service("permissionService")
public class PermissionServiceImpl implements IPermissionService {
	
	@Resource
	private PermissionMapper permissionMapper;

	/**
	 * 获取菜单列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> findMenuPermission(SystemUsers user) {
		List<Permission> permissions = permissionMapper.selectRolePermission(user.getId());
    	List<Integer> parentIds = new ArrayList<Integer>();
    	Map<String, List<Object>> temp = new HashMap<String, List<Object>>();
    	for (Permission permission:permissions) {
			System.out.println(permission.getPermissionName());
			parentIds.add(permission.getParentId());
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("id",permission);
			int parentId = permission.getParentId();
			List<Object> list = null;
			if(temp.containsKey("list"+parentId)){
				list=temp.get("list"+parentId);
				list.add(map);
			}else{
				list = new ArrayList<Object>();
				list.add(map);
				temp.put("list"+parentId, list);
			}
			Collections.sort(list, new PermissionComparator());
		}
    	parentIds = ListUtil.removeDuplicateWithOrder(parentIds);//去除重复
    	Permission permission = null;
    	List<Object> permissionLists = temp.get("list0");
    	if(permissionLists == null){
    		permissionLists = new ArrayList<Object>();
    	}
    	for(Integer id:parentIds){
    		permission = permissionMapper.selectByPrimaryKey(id);
    		if(permission != null){
    			Map<String, Object> map = new LinkedHashMap<String, Object>();
    			map.put("id",permission);
    			map.put("children", temp.get("list"+id));
    			permissionLists.add(map);
    		}
    	}
    	Collections.sort(permissionLists, new PermissionComparator());
    	//JSONArray json= (JSONArray) JSONArray.toJSON(permissionLists);
		return permissionLists;
	}

	
}
