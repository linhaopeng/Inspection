package net.baojuxinxi.dao;

import java.util.ArrayList;
import java.util.List;

import net.baojuxinxi.pojo.ProgressAnnex;

public interface ProgressAnnexMapper {
    int deleteByPrimaryKey(String progressAnnexId);

    int insert(ProgressAnnex record);

    int insertSelective(ProgressAnnex record);

    ProgressAnnex selectByPrimaryKey(String progressAnnexId);

    int updateByPrimaryKeySelective(ProgressAnnex record);

    int updateByPrimaryKey(ProgressAnnex record);

    //批量保存进度汇报附件
	int insertSelectivelist(ArrayList<ProgressAnnex> list);

	//通过进度id查询附件
	List<ProgressAnnex> selectBy_progressKey(String progressId);
}