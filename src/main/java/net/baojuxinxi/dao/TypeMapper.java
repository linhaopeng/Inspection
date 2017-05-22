package net.baojuxinxi.dao;
import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Type;

public interface TypeMapper {
    int deleteByPrimaryKey(String typeId);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(String typeId);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);
    
    //分页查询项目类型
    List<Type> selectTypeList(Map<String, Object> map);

    /**
     * 删除项目类型
     */
	int updateSystemTypeBatch(Map<String, Object> map);

	//获取项目类型
	List<Type> selectList(Integer isdeleted);

	
}