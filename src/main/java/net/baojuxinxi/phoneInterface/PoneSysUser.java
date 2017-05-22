package net.baojuxinxi.phoneInterface;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.ISystemUsersService;
import net.baojuxinxi.utils.Bas64Utile;
import net.baojuxinxi.utils.ErrorCodeUtill;
import net.baojuxinxi.utils.FileUpload_bao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PoneSysUser {

	@Resource
	private ISystemUsersService systemUsersService;
	
	/**
	 * 手机获取当前的用户信息
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/sysUserInfo", method = RequestMethod.POST)
	public Map<String, Object> sysUserInfo(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,@RequestBody JSONObject params){
		/*Map<String, Object> params = Current.getMapParams(request
				.getParameterMap());*/
		Map<String, Object> map = Current.getMap();
		if (Current.key(params.get("method"), params.get("version"),
				params.get("timestemp"), params.get("sign"))) {
			try {
				//通过当前登录 的用户查询用户
				SystemUsers user = (SystemUsers) session.getAttribute("user");
				
				if(user == null){
					map.put("code", "5020");
					map.put("message", ErrorCodeUtill.map.get("5020"));
				}else{
					HashMap<String,Object> hashMap = new HashMap<String,Object>();
					SystemUsers find_user = systemUsersService.find_user(user.getId());
					String usercname = find_user.getUsercname();
					String phone = find_user.getPhone();
					Integer sex = find_user.getSex();
					String email = find_user.getEmail();
					hashMap.put("usercname", usercname);
					hashMap.put("phone", phone);
					hashMap.put("sex", sex==1?"男":"女");
					hashMap.put("email", email);
					String headImg = find_user.getHeadImg();
					if(StringUtils.isNoneBlank(headImg)){
//						String realPath = request.getSession().getServletContext().getRealPath("");
//						String imageStr = Bas64Utile.getImageStr(realPath+headImg);
						hashMap.put("headImg", headImg);
					}
					map.put("data", hashMap);
					map.put("code", "10000");
					map.put("message", ErrorCodeUtill.map.get("10000"));
				}
			} catch (Exception e) {
				map.put("code", "5003");
				map.put("message", ErrorCodeUtill.map.get("5003"));
			}
			
		} else {
			map.put("code", "5000");
			map.put("message", ErrorCodeUtill.map.get("5000"));
		}
		return map;
	}
	
	/**
	 * 修改密码，
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/setPassword", method = RequestMethod.POST)
	public Map<String, Object> setPassword(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,@RequestBody JSONObject params){
		/*Map<String, Object> params = Current.getMapParams(request
				.getParameterMap());*/
		Map<String, Object> map = Current.getMap();
		if (Current.key(params.get("method"), params.get("version"),
				params.get("timestemp"), params.get("sign"))) {
			try {
				
				SystemUsers user = (SystemUsers) session.getAttribute("user");
				if(user != null){
					JSONObject fromObject = JSONObject.fromObject(params.get("request"));
					JSONArray jsonArray = JSONArray.fromObject(fromObject);
					
					String newpassword = String.valueOf(jsonArray.getJSONObject(0).get(
							"newpassword"));
					String lonpassword = String.valueOf(jsonArray.getJSONObject(0).get(
							"lonpassword"));
					
					if(StringUtils.isBlank(newpassword)||"null".equals(newpassword)){
						map.put("code", "5014");
						map.put("message", ErrorCodeUtill.map.get("5014"));
						return map;
					}
					if(StringUtils.isBlank(lonpassword)||"null".equals(lonpassword)){
						map.put("code", "5013");
						map.put("message", ErrorCodeUtill.map.get("5013"));
						return map;
					}
					Map<String, String> map2 = new HashMap<String, String>();
					String id = user.getId();
					map2.put("accountId", id);
					map2.put("loginPassword", lonpassword);
					map2.put("newPassword", newpassword);
					map2.put("updateBy", user.getUsername());
					return systemUsersService.modifyUserPassword2(map2,map);
					
					
					
				}else{
					map.put("code", "5020");
					map.put("message", ErrorCodeUtill.map.get("5020"));
				}

			} catch (Exception e) {
				map.put("code", "5003");
				map.put("message", ErrorCodeUtill.map.get("5003"));
			}
		} else {
			map.put("code", "5000");
			map.put("message", ErrorCodeUtill.map.get("5000"));
		}
		return map;
	}
	/**
	 * 头像上传
	 * @param request
	 * @param response
	 * @param session
	 * @param params
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/phone/saveUserHeadImg", method = RequestMethod.POST)
	public Map<String, Object> saveUserHeadImg(HttpServletRequest request,
			HttpServletResponse response,HttpSession session,@RequestBody JSONObject params){
		/*Map<String, Object> params = Current.getMapParams(request
				.getParameterMap());*/
		Map<String, Object> map = Current.getMap();
		if (Current.key(params.get("method"), params.get("version"),
				params.get("timestemp"), params.get("sign"))) {
			try {
				
				SystemUsers user = (SystemUsers) session.getAttribute("user");
				if(user != null){
					JSONObject fromObject = JSONObject.fromObject(params.get("request"));
					JSONArray jsonArray = JSONArray.fromObject(fromObject);
					
					String headImg = jsonArray.getJSONObject(0).getString("headImg");
					String imgName = jsonArray.getJSONObject(0).getString("imgName");
					if(StringUtils.isBlank(imgName)||StringUtils.isBlank(headImg)){
						map.put("code", "10003");
						map.put("message", ErrorCodeUtill.map.get("10003"));
						return map;
					}
					String id = user.getId();
					imgName="/upload/sysUser/"+id+imgName.substring(imgName.lastIndexOf("."));;
					String realPath = request.getSession().getServletContext().getRealPath("");
						boolean generateImage = Bas64Utile.generateImage(headImg, realPath+imgName);
						if(generateImage){
							Map<String, Object> map2 = new HashMap<String, Object>();
							
							map2.put("headImg", imgName);
							map2.put("accountId", id);
							Result result = systemUsersService.modifySystemUserImg(map2);
							if(result.isSuccess()){
								user.setHeadImg(imgName);
								session.setAttribute("user", user);
								map.put("code", "10000");
								map.put("message", ErrorCodeUtill.map.get("10000"));
								return map;
							}
						}
						map.put("code", "22222");
						map.put("message", ErrorCodeUtill.map.get("22222"));
				}else{
					map.put("code", "5020");
					map.put("message", ErrorCodeUtill.map.get("5020"));
				}

			} catch (Exception e) {
				map.put("code", "5003");
				map.put("message", ErrorCodeUtill.map.get("5003"));
			}
		} else {
			map.put("code", "5000");
			map.put("message", ErrorCodeUtill.map.get("5000"));
		}
		return map;
	}
}
