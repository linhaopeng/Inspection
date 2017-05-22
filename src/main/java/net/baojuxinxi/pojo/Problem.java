package net.baojuxinxi.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;
/**
 * 任务问题表
 * @author Administrator
 *
 */
public class Problem {
    private String problemId;//问题ID

    private String taskId;//任务ID

    private String title;//问题标题

    private String describes;//问题描述

    private String involvedDept;//涉及单位

    private String solution;//解决建议

    private Byte state;//问题状态

    private String creator;//创建人

    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;//创建时间

    private Byte isdeleted;//是否删除

    private String projectId;//项目ID
    
    private String headImg;//头像

    private String userId;//用户id
    
	private List<Comment> CommentList = new ArrayList<Comment>();//问题评论
    
    private List<ProblemAnnex> problemAnnexList=new ArrayList<ProblemAnnex>();//问题附件
    
    private SystemUsers user=new SystemUsers();
 
    public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getHeadImg() {
    	return headImg;
    }
    
    public void setHeadImg(String headImg) {
    	this.headImg = headImg;
    }
	public List<ProblemAnnex> getProblemAnnexList() {
		return problemAnnexList;
	}

	public void setProblemAnnexList(List<ProblemAnnex> problemAnnexList) {
		this.problemAnnexList = problemAnnexList;
	}

	public SystemUsers getUser() {
		return user;
	}

	public void setUser(SystemUsers user) {
		this.user = user;
	}

	public String getProblemId() {
        return problemId;
    }

    public void setProblemId(String problemId) {
        this.problemId = problemId == null ? null : problemId.trim();
    }

    public List<Comment> getCommentList() {
		return CommentList;
	}

	public void setCommentList(List<Comment> commentList) {
		CommentList = commentList;
	}

	public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId == null ? null : taskId.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes == null ? null : describes.trim();
    }

    public String getInvolvedDept() {
        return involvedDept;
    }

    public void setInvolvedDept(String involvedDept) {
        this.involvedDept = involvedDept == null ? null : involvedDept.trim();
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution == null ? null : solution.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
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

    public Byte getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Byte isdeleted) {
        this.isdeleted = isdeleted;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }
}