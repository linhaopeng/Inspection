package net.baojuxinxi.dao;

import net.baojuxinxi.pojo.Invest;

public interface InvestMapper {
    int deleteByPrimaryKey(String investId);

    int insert(Invest record);

    int insertSelective(Invest record);

    Invest selectByPrimaryKey(String investId);

    int updateByPrimaryKeySelective(Invest record);

    int updateByPrimaryKey(Invest record);
}