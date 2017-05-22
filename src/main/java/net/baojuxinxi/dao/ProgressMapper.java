package net.baojuxinxi.dao;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Progress;

public interface ProgressMapper {
    int deleteByPrimaryKey(String progressId);

    int insert(Progress record);

    int insertSelective(Progress record);

    Progress selectByPrimaryKey(String progressId);

    int updateByPrimaryKeySelective(Progress record);

    int updateByPrimaryKey(Progress record);

    //查询进度列表分页
	List<Progress> selectPageList(Map<String, Object> map);
}