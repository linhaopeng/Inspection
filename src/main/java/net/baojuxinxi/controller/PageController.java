package net.baojuxinxi.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.pojo.Type;
import net.baojuxinxi.service.impl.ProjectServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 各个页面对应的controller
 * @author cxj
 *
 */
@Controller
public class PageController {
	

	@Autowired
	private ProjectServiceImpl projectService;
	
	@RequestMapping(value = "/")
	public String toInit(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null)
			return "redirect:/index";
		return "login";
	}
	
	@RequestMapping(value = "/index")
	public String toIndex(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null)
			return "redirect:/index";
		return "login";
	}
	
	@RequestMapping(value = "/login")
	public String toLogin(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		SystemUsers user = (SystemUsers) session.getAttribute("user");
		if(user != null)
			return "redirect:/index";
		return "login";
	}
	
	@RequestMapping(value = "/department_management")
	public String toDepartmentManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "department_management";
	}
	@RequestMapping(value = "/modify_password")
	public String toModifyPassword(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "modify_password";
	}
	
	@RequestMapping(value = "/account_info_management")
	public String toAccountInfoManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "account_info_management";
	}
	
	@RequestMapping(value = "/engineering_unit_management")
	public String toEngineeringUnitManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "engineering_unit_management";
	}
	
	@RequestMapping(value = "/property_unit_management")
	public String toPropertyUnitManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "property_unit_management";
	}
	
	@RequestMapping(value = "/requirement_management")
	public String toRequirementManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "requirement_management";
	}
	
	@RequestMapping(value = "/device_management")
	public String toDeviceManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "device_management";
	}
	
	@RequestMapping(value = "/property_personnel_management")
	public String toPropertyPersonnelManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "property_personnel_management";
	}
	
	@RequestMapping(value = "/rfid_card_management")
	public String toRfidCardManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "rfid_card_management";
	}
	
	@RequestMapping(value = "/access_management")
	public String toAccessManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "access_management";
	}
	
	@RequestMapping(value = "/rq_house_family_management")
	public String toRqHouseFamilyManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "rq_house_family_management";
	}
	
	@RequestMapping(value = "/rq_info_management")
	public String toRqInfoManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "rq_info_management";
	}
	
	@RequestMapping(value = "/rq_management")
	public String toRqManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "rq_management";
	}
	
	@RequestMapping(value = "/open_record_management")
	public String toOpenRecordManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "open_record_management";
	}
	
	@RequestMapping(value = "/av_record_management")
	public String toAVRecordManagement(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "av_record_management";
	}
	
	@RequestMapping(value = "/empty_page")
	public String toEmptyPage(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "empty_page";
	}
	
	//项目信息
	@RequestMapping(value = "/project_info_management")
	public String toProject_info_management(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		List<Type> typeList=projectService.get_typeId();
		session.setAttribute("typeList", typeList);
		return "project_info_management";
	}
	
	//项目类型
	@RequestMapping(value = "/project_type_management")
	public String toProject_type_management(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "project_type_management";
	}
	
	
	@RequestMapping(value = "/project_info")
	public String project_info(HttpServletRequest request, HttpServletResponse response,HttpSession session,String projectId){
		//获取项目信息
		Project project = projectService.selectP_infoByKey(projectId);
		List<Type> typeList = (List<Type>) session.getAttribute("typeList");
			for (Type type : typeList) {
				if(project.getTypeId().equals(type.getTypeId())){
					project.setTypeId(type.getName());
					break;
				}
		}
		request.setAttribute("project", project);
		return "project_info";
	}
	//personalData个人资料
	@RequestMapping(value = "/personalData")
	public String toPersonalData(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "personalData";
	}
	//项目单位管理
	@RequestMapping(value = "/project_unit_management")
	public String toProject_unit_management(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "project_unit_management";
	}
	//项目信息查询
	@RequestMapping(value = "/project_info_show")
	public String toProject_info_show(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "project_info_show";
	}
	//项目信息查询
	@RequestMapping(value = "/export_factory_detail")
	public String export_factory_detail(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "export-factory-detail";
	}
	//项目信息查询
	@RequestMapping(value = "/export_factory_list")
	public String export_factory_list(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "export-factory-list";
	}
	//项目信息查询
	@RequestMapping(value = "/export_factory_map")
	public String export_factory_map(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		return "export-factory-map";
	}
}
