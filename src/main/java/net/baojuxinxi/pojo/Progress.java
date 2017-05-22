package net.baojuxinxi.pojo;

import java.math.BigDecimal;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 任务进度表
 * 
 * @author Administrator
 * 
 */
public class Progress {
	private String progressId;// 进度ID

	private String taskId;// 任务ID

	private Byte state;// 任务状态

	private BigDecimal progress;// 当前进度
	
	private Date actualBeginDate;// 实际开始时间
	
	private Date actualEndDate;// 实际结束时间

	private String describes;// 进度描述

	private String projectId;// 项目ID

	private Date modifyTime;// 创建时间

	private String modifyPerson;// 创建人

	private Date planBeginDate;//计划开始时间

	private Date planEndDate;//计划结束时间
	
	private SystemUsers user=new SystemUsers();//用户

	public Date getPlanBeginDate() {
		return planBeginDate;
	}

	public void setPlanBeginDate(Date planBeginDate) {
		this.planBeginDate = planBeginDate;
	}

	public Date getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(Date planEndDate) {
		this.planEndDate = planEndDate;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public SystemUsers getUser() {
		return user;
	}

	public void setUser(SystemUsers user) {
		this.user = user;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getModifyPerson() {
		return modifyPerson;
	}

	public void setModifyPerson(String modifyPerson) {
		this.modifyPerson = modifyPerson;
	}

	public String getProgressId() {
		return progressId;
	}

	public void setProgressId(String progressId) {
		this.progressId = progressId == null ? null : progressId.trim();
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId == null ? null : taskId.trim();
	}

	public Byte getState() {
		return state;
	}

	public void setState(Byte state) {
		this.state = state;
	}

	public BigDecimal getProgress() {
		return progress;
	}

	public void setProgress(BigDecimal progress) {
		this.progress = progress;
	}

	public Date getActualBeginDate() {
		return actualBeginDate;
	}

	public void setActualBeginDate(Date actualBeginDate) {
		this.actualBeginDate = actualBeginDate;
	}

	public Date getActualEndDate() {
		return actualEndDate;
	}

	public void setActualEndDate(Date actualEndDate) {
		this.actualEndDate = actualEndDate;
	}

	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes == null ? null : describes.trim();
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId == null ? null : projectId.trim();
	}
}