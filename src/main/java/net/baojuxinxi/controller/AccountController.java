package net.baojuxinxi.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import net.baojuxinxi.phoneInterface.Current;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.IDepartmentService;
import net.baojuxinxi.service.ISystemUsersService;
import net.baojuxinxi.utils.FileUpload_bao;
import net.baojuxinxi.utils.ShiftLeft;

/**
 *
 * @author xl
 *
 */
@Controller
public class AccountController {

	@Resource
	private ISystemUsersService systemUsersService;

	@Resource
	private IDepartmentService departmentService;

	/**
	 * 获取用户信息列表
	 */
	@RequestMapping(value = "/get_user", method = RequestMethod.POST)
	@ResponseBody
	public Result getUserInfos(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) {
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String departmentId = request.getParameter("departmentId");
		String reqData = request.getParameter("reqData");
		JSONObject jo = null;
		String userName = null;
		// String companyName = null;
		if (StringUtils.isNotEmpty(reqData)) {
			jo = JSON.parseObject(reqData);
			userName = jo.getString("userName");
			// companyName = jo.getString("companyName");
		}
		if (StringUtils.isBlank(pageNumber) || Integer.valueOf(pageNumber) < 1) {
			pageNumber = "1";
		}
		if (StringUtils.isBlank(pageSize)) {
			pageSize = "8";
		}
		SystemUsers user = (SystemUsers) session.getAttribute("user");

		if (user != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			// if(departmentId!=null && !"".equals(departmentId)){
			// Integer departmentIdInt = Integer.valueOf(departmentId);
			// Map<String, Integer> mapD = new HashMap<String, Integer>();
			// mapD.put("departmentId", departmentIdInt);
			// mapD.put("isUse", 1);
			// List<Integer> departmentIdList =
			// departmentService.selectDepartmentId(mapD);
			// map.put("departmentIdList", departmentIdList);
			// }
			map.put("username", userName);
			// map.put("companyName", companyName);
			map.put("isUse", 1);
			PagedResult<SystemUsers> users = systemUsersService.findUserByPage(map, Integer.parseInt(pageNumber),
					Integer.parseInt(pageSize));
			return new Result(users);
		} else {
			return new Result(false, "会话中不存在该用户", null);
		}
	}

	/**
	 * 保存用户信息
	 */
	@RequestMapping(value = "/save_account_info", method = RequestMethod.POST)
	@ResponseBody
	public Result saveAccountInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model, String[] rqArr, String power) {
		String type = request.getParameter("type"); // 判断是新增还是修改
		String accountId = request.getParameter("accountId");// 账户ID
		// String companyId = request.getParameter("companyId");//公司ID
		String username = request.getParameter("username");// 用户登录名
		String usercname = request.getParameter("usercname");// 用户昵称
		String password = request.getParameter("password");// 密码
		String email = request.getParameter("email");// 电话
		String phone = request.getParameter("phone");// 邮箱
		String priority = request.getParameter("priority");// 优先级
		String sex = request.getParameter("sex");
		if (StringUtils.isEmpty(type) || StringUtils.isEmpty(username))
			throw new RuntimeException("参数不能为空");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("power", power);
		map.put("username", username);
		if (StringUtils.isBlank(priority)) {
			priority = "0";
		}
		map.put("priority", priority);
		map.put("usercname", usercname);
		map.put("email", email);
		map.put("phone", phone);
		map.put("sex", Integer.parseInt(sex));
		Result result = new Result(false, "保存失败！", null);
		String logContent = null;
		Integer operType = null;
		switch (type) {
		case "1":// 新增
			if (StringUtils.isEmpty(password))
				throw new RuntimeException("参数不能为空");
			password = Current.md5(password);// 密码加密
			map.put("password", password);
			result = systemUsersService.addSystemUser(map);
			logContent = "新增后台系统用户";
			operType = 1;
			break;
		case "2":// 修改
			if (StringUtils.isEmpty(accountId))
				throw new RuntimeException("参数不能为空");
			map.put("accountId", accountId);
			result = systemUsersService.modifySystemUser(map);
			logContent = "修改后台系统用户";
			operType = 3;
			break;
		}

		request.setAttribute("logContent", logContent + (result.isSuccess() ? "成功" : "失败"));// 日志内容
		request.setAttribute("operType", operType);// 操作类型（1-增，2-删，3-改）
		return result;
	}

	/**
	 * 删除用户信息
	 */
	@RequestMapping(value = "/delete_account_info", method = RequestMethod.POST)
	@ResponseBody
	public Result accountInfoDelete(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model, @RequestParam(value = "selectedArr") String[] datas) {
		Result result = new Result(false, "删除系统后台用户失败！", null);
		// 如何是当前用户就不能被删除
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		for (String string : datas) {
			if (string.equals(user.getId()) || "1".equals(string)) {
				return new Result(false, "不能删除当前登录用户或admin用户！", null);
			}
		}

		if (datas.length != 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isUse", 0);
			map.put("latestUpdateTime", new Date());
			map.put("idItems", datas);
			result = systemUsersService.deleteSystemUserBatch(map);
		}
		request.setAttribute("logContent", "删除系统后台用户" + (result.isSuccess() ? "成功" : "失败"));// 日志内容
		request.setAttribute("operType", 2);// 操作类型（1-增，2-删，3-改）
		return result;
	}

	/**
	 * 保存修改密码
	 */
	@RequestMapping(value = "/modify_password", method = RequestMethod.POST)
	@ResponseBody
	public Result modifyPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) {
		String accountId = request.getParameter("accountId");
		String loginPassword = request.getParameter("loginPassword");
		String newPassword = request.getParameter("newPassword");
		if (StringUtils.isEmpty(accountId) || StringUtils.isEmpty(loginPassword) || StringUtils.isEmpty(newPassword))
			throw new RuntimeException("参数不能为空");
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if (user != null) {
			if (!user.getPassword().equals(Current.md5(loginPassword)))
				return new Result(false, "您输的登录密码有误，无法重置密码", null);
			Map<String, String> map = new HashMap<String, String>();
			map.put("accountId", accountId);
			map.put("loginPassword", Current.md5(loginPassword));
			map.put("newPassword", Current.md5(newPassword));
			map.put("updateBy", user.getUsername());
			Result result = systemUsersService.modifyUserPassword(map);
			request.setAttribute("logContent", "修改系统后台用户密码" + (result.isSuccess() ? "成功" : "失败"));// 日志内容
			request.setAttribute("operType", 3);// 操作类型（1-增，2-删，3-改）
			return result;
		} else {
			return new Result(false, "会话过期，请重新登录", null);
		}
	}

	/**
	 * 验证用户
	 */
	@RequestMapping(value = "/validate_user", method = RequestMethod.POST)
	@ResponseBody
	public Result validateUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String password = request.getParameter("password");
		if (StringUtils.isEmpty(password))
			throw new RuntimeException("参数不能为空");
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		password = DigestUtils.md5Hex(ShiftLeft.shift(password, -5));// 密码加密
		if (user.getPassword().equals(password)) {
			return new Result(true, "密码正确", null);
		} else {
			return new Result(false, "密码错误", null);
		}
	}

	/**
	 * 修改自己的密码
	 */
	@RequestMapping(value = "/modify_owned_password", method = RequestMethod.POST)
	@ResponseBody
	public Result modifyOwnedPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) {
		String password = request.getParameter("password");
		if (StringUtils.isEmpty(password))
			throw new RuntimeException("参数不能为空");
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if (user != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("accountId", user.getId());
			map.put("newPassword", password);
			Result result = systemUsersService.modifyUserPassword(map);
			request.setAttribute("logContent", "修改系统后台用户密码" + (result.isSuccess() ? "成功" : "失败"));// 日志内容
			request.setAttribute("operType", 3);// 操作类型（1-增，2-删，3-改）
			return result;
		} else {
			return new Result(false, "会话过期，请重新登录", null);
		}
	}

	/**
	 * 保存用户头像 save_user_headImg
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save_user_headImg", method = RequestMethod.POST)
	@ResponseBody
	public Result save_user_headImg(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam CommonsMultipartFile head_img) {
		SystemUsers user = (SystemUsers) session.getAttribute("user");

		if (user != null) {
			String id = user.getId();
			if (StringUtils.isNoneBlank(head_img.getOriginalFilename())) {
				FileUpload_bao upload_bao = new FileUpload_bao();
				String fileName = upload_bao.upload(request, head_img, "/sysUser", id);
				if (fileName != null) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("headImg", fileName);
					user.setHeadImg(fileName);
					map.put("accountId", id);
					Result result = systemUsersService.modifySystemUserImg(map);
					if (result.isSuccess()) {
						session.setAttribute("user", user);
					}
					return result;
				}
			}
			return new Result(false, "上传图片失败", null);
		} else {
			return new Result(false, "会话过期，请重新登录", null);
		}

	}

	/**
	 * 获取用户权限
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param head_img
	 * @return
	 */
	@RequestMapping(value = "/get_power", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> get_power(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if (user != null) {
			String id = user.getId();
			HashMap<String, Object> get_roles = systemUsersService.get_roles(id);
			return get_roles;
		}
		return null;
	}
}