package net.baojuxinxi.pojo;

import java.util.Date;

public class SystemUsers {
    private String id; //id

    private String username;//用户登录名

    private String usercname;//用户中文名

    private String password;//密码

    private String phone;//电话

    private Integer sex;//性别

    private String address;// 地址

    private String email;//邮箱

    private String headImg;//头像

    private Integer ranks;//等级

    private String description;//描述

    private Integer comId;//公司

    private String departmentId;//所属部门

    private String position;// 职位

    private String remarks;//评论

    private Integer isUse;//是否为用户

    private Date latestLoginTime;//最后登录时间

    private Date createdTime;//创建时间

    private String createdBy;//创建人

    private Date latestUpdateTime;//最后修改时间

    private String latestUpdateBy;//最后修改人
    
    private String priority;   //优先级

    private Roles role=new Roles();//角色
    
	public Roles getRole() {
		return role;
	}

	public void setRole(Roles role) {
		this.role = role;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsercname() {
		return usercname;
	}

	public void setUsercname(String usercname) {
		this.usercname = usercname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public Integer getRanks() {
		return ranks;
	}

	public void setRanks(Integer ranks) {
		this.ranks = ranks;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getIsUse() {
		return isUse;
	}

	public void setIsUse(Integer isUse) {
		this.isUse = isUse;
	}

	public Date getLatestLoginTime() {
		return latestLoginTime;
	}

	public void setLatestLoginTime(Date latestLoginTime) {
		this.latestLoginTime = latestLoginTime;
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

	public Integer getComId() {
		return comId;
	}

	public void setComId(Integer comId) {
		this.comId = comId;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}
    
    
}