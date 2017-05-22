package net.baojuxinxi.dao;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.Comment;

public interface CommentMapper {
	int deleteByPrimaryKey(String commentId);

	int insert(Comment record);

	int insertSelective(Comment record);

	Comment selectByPrimaryKey(String commentId);

	int updateByPrimaryKeySelective(Comment record);

	int updateByPrimaryKey(Comment record);


	List<Comment> selectBy_problemKey(String problemId);

	List<Comment> selectPageList(Map<String, Object> map);

}