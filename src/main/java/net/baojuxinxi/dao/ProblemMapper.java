package net.baojuxinxi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Problem;

public interface ProblemMapper {
    int deleteByPrimaryKey(String problemId);

    int insert(Problem record);

    int insertSelective(Problem record);

    Problem selectByPrimaryKey(String problemId);

    int updateByPrimaryKeySelective(Problem record);

    int updateByPrimaryKey(Problem record);

	List<Problem> selectPageList(Map<String, Object> map);

	//通过问题id查询项目问题
	Problem selectPrlblem(Map<String, Object> map);

	//问题分页_关联附件
	List<Problem> get_par_annList(Map<String, Object> map);

	//删除项目下的问题
	int updateByKeyDelete(HashMap<String, Object> hashMap);
}