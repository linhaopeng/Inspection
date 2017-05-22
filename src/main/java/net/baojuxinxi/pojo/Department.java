package net.baojuxinxi.pojo;

import java.util.Date;

public class Department {
    private Integer departmentId;		//部门ID

    private Integer pId;	//父类Id

    private String departmentName;	//部门名称

    private Date createdTime;	//创建时间

    private String createdBy;	//创建人

    private Date latestUpdateTime;	//最后修改时间

    private String latestUpdateBy; 	//最后修改人

    private String remarks;	//评论

    private String describe;		//描述

    private Integer isUse;  //是否使用
    
    private Integer levels;  //等级

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getLatestUpdateTime() {
		return latestUpdateTime;
	}

	public void setLatestUpdateTime(Date latestUpdateTime) {
		this.latestUpdateTime = latestUpdateTime;
	}

	public String getLatestUpdateBy() {
		return latestUpdateBy;
	}

	public void setLatestUpdateBy(String latestUpdateBy) {
		this.latestUpdateBy = latestUpdateBy;
	}



	public String getDescribe() {
		return describe;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setLevels(Integer levels) {
		this.levels = levels;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public Integer getIsUse() {
		return isUse;
	}

	public void setIsUse(Integer isUse) {
		this.isUse = isUse;
	}

	public Integer getLevels() {
		return levels;
	}

	
    

}