package net.baojuxinxi.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.baojuxinxi.dao.ProblemMapper;
import net.baojuxinxi.dao.ProjectMapper;
import net.baojuxinxi.dao.TypeMapper;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.Type;
import net.baojuxinxi.service.IProjectService;
import net.baojuxinxi.utils.BeanUtil;
import net.baojuxinxi.utils.UUIDUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service("projectService")
public class ProjectServiceImpl implements IProjectService {

	@Autowired
	private TypeMapper typeMapper;
	
	@Autowired
	private ProjectMapper projectMapper;
	
	@Autowired
	private ProblemMapper problemMapper;

	/**
	 * 分页查询项目类型
	 */
	@Override
	public PagedResult<Type> selectTypeList(Map<String, Object> map,
			Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 10
				: pageSize);
		return BeanUtil.toPagedResult(typeMapper.selectTypeList(map));
	}

	/**
	 * 保存项目类型
	 * 
	 * @param map
	 * @return
	 */
	@Override
	public Result addprojectType(Map<String, Object> map) {
		// 创建项目类型
		Map<String, Object> queryMap = new HashMap<String, Object>();
		Type projectType = new Type();
		String name = (String) map.get("name");
		String code = (String) map.get("code");
		String creator = (String) map.get("creator");
		String parentTypeId = (String) map.get("parentTypeId");
		String description = (String) map.get("description");
		Integer listNo = (Integer.valueOf(map.get("listNo").toString()));

		Byte isdeleted = 1;
		queryMap.put("isdeleted", isdeleted);
		queryMap.put("name", name);
		List<Type> selectTypeList = typeMapper.selectTypeList(queryMap);

		if (selectTypeList != null && selectTypeList.size() > 0)
			return new Result(false, "该项目类型名已被占用", null);
		projectType.setCode(code);
		projectType.setCreateTime(new Date());
		projectType.setCreator(creator);
		projectType.setDescription(description);
		projectType.setIsdeleted(isdeleted);
		projectType.setListNo(listNo);
		projectType.setName(name);
		projectType.setParentTypeId(parentTypeId);
		projectType.setTypeId(UUIDUtil.generateUUID());

		int insertSelective = typeMapper.insertSelective(projectType);
		return insertSelective != -1 ? new Result(true, "成功新增项目类型",
				insertSelective) : new Result(false, "新增项目类型失败", null);

	}

	/**
	 * 修改项目类型
	 * 
	 * @param map
	 * @return
	 */

	@Override
	public Result modifyprojectType(Map<String, Object> map) {
		int modifyResult = -1;

		String typeId = map.get("typeId").toString();
		Type projectType = typeMapper.selectByPrimaryKey(typeId);

		if (projectType != null) {
			// 项目类型名
			String name = (String) map.get("name");
			// 项目类型描述
			String description = (String) map.get("description");
			String code = (String) map.get("code");
			String parentTypeId = (String) map.get("parentTypeId");
			Integer listNo = (Integer.valueOf(map.get("listNo").toString()));

			// 修改项目类型信息
			projectType.setCode(code);
			projectType.setDescription(description);
			projectType.setListNo(listNo);
			projectType.setName(name);
			projectType.setParentTypeId(parentTypeId);
			modifyResult = typeMapper.updateByPrimaryKeySelective(projectType);
		} else {
			return new Result(false, "不存在该项目类型", null);
		}
		return modifyResult != -1 ? new Result(true, "成功修改项目类型", modifyResult)
				: new Result(false, "修改项目类型失败", null);

	}

	/**
	 * 删除项目类型
	 * @param map
	 * @return
	 */
	@Override
	public Result deleteDepartmentBatch(Map<String, Object> map) {
		//如果有项目用到就不给删除
		List<Project> projectList=projectMapper.select_type_in_Key(map);
		if(projectList!=null&&projectList.size()>0){
			return new Result(false, "项目类型已在项目中使用！", null);
		}
		int deleteResult = typeMapper.updateSystemTypeBatch(map);
		if(deleteResult != -1){
			return new Result(true, "成功删除！", null);
		}
		return new Result(false, "删除项目类型失败！", null);
	}

	/**
	 * 项目信息分页
	 * @param map
	 * @param valueOf
	 * @param valueOf2
	 * @return
	 */
	@Override
	public PagedResult<Project> selectInfoList(Map<String, Object> map,
			Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 10
				: pageSize);
		List<Project> selectPageList = projectMapper.selectPageList(map);
		
		return BeanUtil.toPagedResult(selectPageList);
	}

	/**
	 * 获取项目类型ID
	 * @return 
	 */
	public List<Type> get_typeId() {
		HashMap<String, Object> map = new HashMap<>();
		map.put("isdeleted", 1);
		return typeMapper.selectTypeList(map);
	}

	/**
	 * 保存项目信息
	 * @param project
	 * @return
	 */
	@Override
	public Result addprojectInfo(Project project) {
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("name", project.getName());
		hashMap.put("isdeleted", 1);
			//看这个项目名有没有被占用
		List<Project> selectPageList = projectMapper.selectPageList(hashMap);
		
		if (selectPageList != null && selectPageList.size() > 0)
			return new Result(false, "该项目名已被占用", null);
		project.setProjectId(UUIDUtil.generateUUID());
		project.setIsdeleted(1);
		//progress;//项目进度
		project.setProgress(new BigDecimal(0));
		//createTime;//创建时间
		project.setCreateTime(new Date());

		int insertSelective = projectMapper.insertSelective(project);
		return insertSelective != -1 ? new Result(true, "成功新增项目信息",
				insertSelective) : new Result(false, "新增项目信息失败", null);
	}

	/**
	 * 修改项目信息
	 * @param project
	 * @return
	 */
	public Result modifyprojectInfo(Project project) {
		int modifyResult = -1;

		
		Project selectByPrimaryKey = projectMapper.selectByPrimaryKey(project.getProjectId());

		if (selectByPrimaryKey != null) {
			project.setIsdeleted(1);
			project.setCreateTime(selectByPrimaryKey.getCreateTime());
			project.setCreator(selectByPrimaryKey.getCreator());
			project.setProjectId(selectByPrimaryKey.getProjectId());
			project.setParentProjectId(selectByPrimaryKey.getParentProjectId());
			project.setProgress(selectByPrimaryKey.getProgress());
			
			modifyResult = projectMapper.updateByPrimaryKey(project);
		} else {
			return new Result(false, "不存在该项目信息", null);
		}
		return modifyResult != -1 ? new Result(true, "成功修改项目信息", modifyResult)
				: new Result(false, "修改项目信息失败", null);
	}
	

	//获取项目信息
	@Override
	public Project selectP_infoByKey(String projectId) {
		return projectMapper.selectByPrimaryKey(projectId);
	}
	/**
	 * 删除项目
	 * @param projectId
	 * @return
	 */
	public Result deleteProject(String projectId) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("isdeleted", 0);
		hashMap.put("idItems", new String []{projectId});
		//删除项目
		int deleteByPrimaryKey = projectMapper.updateByKeyDelete(hashMap);
		//删除项目下的问题
		int delete =problemMapper.updateByKeyDelete(hashMap);
		if(delete==-1){
			return new Result(false, "删除项目问题失败", null);
		}
		//删除问题下的附件
		//删除项目下的任务
		//删除任务附件
		if(deleteByPrimaryKey==-1){
			return new Result(false, "删除项目失败", null);
		}
		return new Result(true, "删除项目成功", null);
	}

}
