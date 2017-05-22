package net.baojuxinxi.pojo;

import java.math.BigDecimal;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
/**
 * 任务信息表
 * @author Administrator
 *
 */
public class Task {
    private String taskId;//任务ID

    private String projectId;//项目ID

    private String parentTaskId;//父任务ID

    private String name;//任务名称

    private Byte state;//任务状态

    private Integer weight;//权重

    private BigDecimal progress;//任务进度
    @JSONField(format="yyyy-MM-dd")
    private Date planBeginDate;//计划开始时间
    @JSONField(format="yyyy-MM-dd")
    private Date planEndDate;//计划结束时间
    @JSONField(format="yyyy-MM-dd")
    private Date actualBeginDate;//实际开始时间
    @JSONField(format="yyyy-MM-dd")
    private Date actualEndDate;//实际结束时间

    private String involvedDept;//涉及单位

    private Integer listNo;//显示序号

    private String creator;//创建人

    private Date createTime;//创建时间

    private Byte isdeleted;//是否删除
    
    private String taskDescribe;//任务描述

    public String getTaskDescribe() {
		return taskDescribe;
	}

	public void setTaskDescribe(String taskDescribe) {
		this.taskDescribe = taskDescribe;
	}

	public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId == null ? null : taskId.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getParentTaskId() {
        return parentTaskId;
    }

    public void setParentTaskId(String parentTaskId) {
        this.parentTaskId = parentTaskId == null ? null : parentTaskId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public BigDecimal getProgress() {
        return progress;
    }

    public void setProgress(BigDecimal progress) {
        this.progress = progress;
    }

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

    public String getInvolvedDept() {
        return involvedDept;
    }

    public void setInvolvedDept(String involvedDept) {
        this.involvedDept = involvedDept == null ? null : involvedDept.trim();
    }

    public Integer getListNo() {
        return listNo;
    }

    public void setListNo(Integer listNo) {
        this.listNo = listNo;
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
}