package net.baojuxinxi.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.baojuxinxi.dao.ProjectMapper;
import net.baojuxinxi.dao.SysomCmonDeptMapper;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Project;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.pojo.SysomCmonDept;
import net.baojuxinxi.pojo.SystemUsers;
import net.baojuxinxi.service.ICommonDeptService;
import net.baojuxinxi.utils.BeanUtil;
import net.baojuxinxi.utils.UUIDUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
@Service("commonDeptService")
public class CommonDeptService implements ICommonDeptService {

	@Autowired
	private SysomCmonDeptMapper cmonDeptMapper;
	@Autowired
	private ProjectMapper projectMapper;

	/**
	 * 项目单位列表
	 * @param map
	 * @param parseInt
	 * @param parseInt2
	 * @return
	 */
	public PagedResult<SysomCmonDept> findPageList(Map<String, Object> map,
			Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null ? 1 : pageNo, pageSize == null ? 10
				: pageSize);
		return BeanUtil.toPagedResult(cmonDeptMapper.selectPageList(map));
	}

	/**
	 * 新增项目单位
	 * @param comm
	 * @return
	 */
	public Result addprojectUnit(SysomCmonDept comm) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("name",comm.getName());
		map.put("isdeleted", 1);
		SysomCmonDept selectByPrimaryName = cmonDeptMapper.selectByPrimaryName(map);
		if(selectByPrimaryName!=null){
			return new Result(false, "单位名已被占用", null);
		}
		comm.setCommonDeptId(UUIDUtil.generateUUID());
		comm.setCreateTime(new Date());
		comm.setIsdeleted((byte) 1);
		int insertSelective = cmonDeptMapper.insertSelective(comm);
		if(insertSelective==-1){
			return new Result(false, "保存失败", null);
		}
		return new Result(true, "保存成功", null);
	}

	/**
	 * 修改项目单位
	 * @param comm
	 * @return
	 */
	public Result modifyprojectUnit(SysomCmonDept comm) {
		SysomCmonDept selectByPrimaryKey = cmonDeptMapper.selectByPrimaryKey(comm.getCommonDeptId());
		if(selectByPrimaryKey==null){
			return new Result(false, "没有这个项目单位", null);
		}
		int insertSelective = cmonDeptMapper.updateByPrimaryKeySelective(comm);
		if(insertSelective==-1){
			return new Result(false, "保存失败", null);
		}
		return new Result(true, "保存成功", null);
	}

	/**
	 * 删除项目单位
	 * @param map
	 * @return
	 */
	public Result deleteAll(Map<String, Object> map) {
		//查询项目单位有没有被使用
		List<SysomCmonDept> projectList=projectMapper.select_unit_in_Key(map);
		if(projectList!=null&&projectList.size()>0){
			return new Result(false, "项目单位已在项目中使用！", null);
		}
		int deleteResult = cmonDeptMapper.update_deleteAll(map);
		if(deleteResult != -1){
			return new Result(true, "成功删除！", null);
		}
		return new Result(false, "删除项目单位失败！", null);
	}
}
