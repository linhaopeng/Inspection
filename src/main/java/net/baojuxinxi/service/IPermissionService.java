package net.baojuxinxi.service;

import java.util.List;

import net.baojuxinxi.pojo.SystemUsers;

public interface IPermissionService {

	List<Object> findMenuPermission(SystemUsers user);

}
