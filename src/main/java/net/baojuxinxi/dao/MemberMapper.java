package net.baojuxinxi.dao;

import net.baojuxinxi.pojo.Member;

public interface MemberMapper {
    int deleteByPrimaryKey(String memberId);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(String memberId);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
}