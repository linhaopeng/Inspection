package net.baojuxinxi.dao;

import java.util.List;

import net.baojuxinxi.pojo.ProblemAnnex;

public interface ProblemAnnexMapper {
    int deleteByPrimaryKey(String problemAnnexId);

    int insert(ProblemAnnex record);

    int insertSelective(ProblemAnnex record);

    ProblemAnnex selectByPrimaryKey(String problemAnnexId);

    int updateByPrimaryKeySelective(ProblemAnnex record);

    int updateByPrimaryKey(ProblemAnnex record);

	int insertSelectivelist(List<ProblemAnnex> list);

	int deleteBy_problemKey(String problemId);
	//项目问题附件
	List<ProblemAnnex> selectBy_problemKey(String problemId);

}