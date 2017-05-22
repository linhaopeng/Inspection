package net.baojuxinxi.service;

import java.util.Map;

import net.baojuxinxi.pojo.Company;
import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Result;

public interface ICompanyService {

	PagedResult<Company> findCompaniesByPage(Map<String, Object> map,
			 Integer pageNo,Integer pageSize);

	String getCompanyNum();

	Result addCompany(Map<String, Object> map);

	Result modifyCompany(Map<String, Object> map);

	Result deleteCompanyBatch(Map<String, Object> map);
	
}
