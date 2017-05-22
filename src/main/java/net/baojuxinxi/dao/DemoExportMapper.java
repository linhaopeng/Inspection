package net.baojuxinxi.dao;

import java.util.List;

import net.baojuxinxi.pojo.DemoExport;

public interface DemoExportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DemoExport record);

    int insertSelective(DemoExport record);

    DemoExport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DemoExport record);

    int updateByPrimaryKey(DemoExport record);
    
    List<DemoExport> findAll();

	List<DemoExport> findByType(String type);
}