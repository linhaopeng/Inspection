package net.baojuxinxi.pojo;

import java.util.Date;

import net.baojuxinxi.utils.RelativeDateFormat;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 问题评论表
 * 
 * @author Administrator
 * 
 */
public class Comment {
	private String commentId;// 评论ID

	private String problemId;// 问题ID

	private String content;// 评论内容

	private String creator;// 评论人

	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;// 评论时间

	private String createDate;// 评论时间几天前
	
	private SystemUsers user=new SystemUsers();//用户

	public String getCreateDate() {
		return createTime == null ? createDate : RelativeDateFormat
				.format(createTime);
	}

	public void setCreateDate(String createDate) {

		this.createDate = createDate;
	}

	private String parentCommentId;// 父评论ID

	private String headImg;

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getCommentId() {
		return commentId;
	}

	public SystemUsers getUser() {
		return user;
	}

	public void setUser(SystemUsers user) {
		this.user = user;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId == null ? null : commentId.trim();
	}

	public String getProblemId() {
		return problemId;
	}

	public void setProblemId(String problemId) {
		this.problemId = problemId == null ? null : problemId.trim();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator == null ? null : creator.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getParentCommentId() {
		return parentCommentId;
	}

	public void setParentCommentId(String parentCommentId) {
		this.parentCommentId = parentCommentId == null ? null : parentCommentId
				.trim();
	}
}