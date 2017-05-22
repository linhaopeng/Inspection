package net.baojuxinxi.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import net.baojuxinxi.dao.CompanyMapper;
import net.baojuxinxi.pojo.Company;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;
import net.baojuxinxi.service.ICompanyService;
import net.baojuxinxi.utils.BeanUtil;
import net.baojuxinxi.utils.StringUtils;
import net.baojuxinxi.utils.UUIDUtil;

@Service("companyService")
public class CompanyServiceImpl implements ICompanyService {
	
	@Resource
	private CompanyMapper companyMapper;

	/**
	 * 分页查询企业列表
	 */
	@Override
	public PagedResult<Company> findCompaniesByPage(Map<String, Object> map,
			Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo == null?1:pageNo,pageSize == null?10:pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
		return BeanUtil.toPagedResult(companyMapper.selectCompanies(map));
	}
	
	/**
	 * 生成企业账号
	 */
	@Override
	public String getCompanyNum() {
		String numStr = companyMapper.selectMaxCompanyNum();
		int num = StringUtils.parseInt(numStr, -1);
		String companyNum = String.format("%04d", num+1);
		return companyNum;
	}

	/**
	 * 新增企业信息
	 */
	@Override
	public Result addCompany(Map<String, Object> map) {
		int insertResult = -1;
		String companyNum = (String) map.get("companyNum");
		//判断企业账号是否重复
		Map<String, Object> cacheMap = new HashMap<String, Object>();
		cacheMap.put("isUse", 1);
		cacheMap.put("companyNum", companyNum);
		List<Company> companies = companyMapper.selectCompanies(cacheMap);
		if(companies.size() != 0){
			companyNum = getCompanyNum();
		}
		
		Company company = new Company();
//		company.setId(UUIDUtil.generateUUID());
		company.setCompanyNum(companyNum);
		company.setCompanyType((Integer) map.get("companyType"));
		company.setCompanyName((String) map.get("companyName"));
		company.setContactPerson((String) map.get("contactPerson"));
		company.setDescription((String) map.get("description"));
		company.setFax((String) map.get("fax"));
		company.setLegalPerson((String) map.get("legalPerson"));
		company.setAddress((String) map.get("address"));
		company.setWebsite((String) map.get("website"));
		company.setIsUse(1);
		company.setCreatedTime(new Date());
		company.setLatestUpdateTime(new Date());
		
		insertResult = companyMapper.insertSelective(company);
		return insertResult != -1?new Result(true,"新增企业信息成功",insertResult):new Result(false,"新增企业信息失败",null);
	}

	/**
	 * 修改企业信息
	 */
	@Override
	public Result modifyCompany(Map<String, Object> map) {
		int modifyResult = -1;
		Integer companyId = Integer.valueOf((String) map.get("companyId")) ;
		Company company = companyMapper.selectByPrimaryKey(companyId);
		if(company != null){
			company.setCompanyType((Integer) map.get("companyType"));
			company.setCompanyName((String) map.get("companyName"));
			company.setContactPerson((String) map.get("contactPerson"));
			company.setDescription((String) map.get("description"));
			company.setFax((String) map.get("fax"));
			company.setLegalPerson((String) map.get("legalPerson"));
			company.setAddress((String) map.get("address"));
			company.setWebsite((String) map.get("website"));
			company.setLatestUpdateTime(new Date());
			modifyResult = companyMapper.updateByPrimaryKeySelective(company);
		}
		return modifyResult != -1?new Result(true,"修改企业信息成功",modifyResult):new Result(false,"修改企业信息失败",null);
	}

	/**
	 * 批量删除企业（逻辑删除）
	 */
	@Override
	public Result deleteCompanyBatch(Map<String, Object> map) {
		int deleteResult = companyMapper.updateCompanyBatch(map);
		if(deleteResult != -1){
			return new Result(true, "成功删除企业！", null);
		}
		return new Result(false, "删除用户企业！", null);
	}

}
