package net.baojuxinxi.pojo;

import java.math.BigDecimal;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
/**
 * 项目信息表
 * @author Administrator
 *
 */
public class Project {
    private String projectId;//项目ID

    private String typeId;//项目类型

    private String name;//项目名称

    private String no;//项目编号

    private String parentProjectId;//父项目ID

    private Integer state;//项目状态

    private Integer priority;//优先级

    private BigDecimal progress;//项目进度
    @JSONField(format="yyyy-MM-dd")
    private Date planBeginDate;//计划开始时间
    @JSONField(format="yyyy-MM-dd")
    private Date planEndDate;//计划结束时间
    @JSONField(format="yyyy-MM-dd")
    private Date actualBeginDate;//实际开始时间
    @JSONField(format="yyyy-MM-dd")
    private Date actualEndDate;//实际结束时间

    private String site;//项目选址

    private String respDept;//负责单位
    private String respDeptName;//负责单位名

    private String ownerDept;//业务单位
    private String ownerDeptName;//业务单位名

    private String deputyDept;//代建单位
    private String deputyDeptName;//代建单位名

    private String builderDept;//施工单位

    private String supDept;//监理单位

    private String designDept;//设计单位

    private String investor;//投资主体

    private BigDecimal investment;//计划投资
    
    private BigDecimal gross;//投资总额(万元

    private BigDecimal assets;//注册资本(万元)

    private String address;//注册地址

    private BigDecimal floorArea;//占地面积(亩)

    private BigDecimal coveredArea;//建筑面积(平方米)

    private BigDecimal planArea;//规划面积(亩

    private String capacity;//产能

    private String productType;//产品类型

    private BigDecimal annualProductValue;//年产值(万元)

    private String annualProductAmounr;//年产量

    private BigDecimal annualSaleValue;//年销售额(万元)

    private String annualSaleAmount;//年销售量

    private BigDecimal annualRevenue;//年税收(万元)

    private Integer employees;//员工人数

    private BigDecimal acreProductValue;//每亩年产值(万元)

    private BigDecimal acreRevenue;//每亩年税收(万元)

    private BigDecimal acreAssets;//每亩注册资本(万元)

    private BigDecimal acreGross;//每亩投资额(万元)

    private BigDecimal electricity;//用电负荷(KVA)

    private BigDecimal water;//用水负荷(吨/天)

    private String note;//项目备注

    private String intro;//项目简介

    private String creator;//创建人

    private Date createTime;//创建时间

    private Integer isdeleted;//是否删除

    public String getRespDeptName() {
		return respDeptName;
	}

	public void setRespDeptName(String respDeptName) {
		this.respDeptName = respDeptName;
	}

	public String getOwnerDeptName() {
		return ownerDeptName;
	}

	public void setOwnerDeptName(String ownerDeptName) {
		this.ownerDeptName = ownerDeptName;
	}

	public String getDeputyDeptName() {
		return deputyDeptName;
	}

	public void setDeputyDeptName(String deputyDeptName) {
		this.deputyDeptName = deputyDeptName;
	}

	public String getProjectId() {
        return projectId;
    }

    public BigDecimal getInvestment() {
		return investment;
	}

	public void setInvestment(BigDecimal investment) {
		this.investment = investment;
	}

	public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getParentProjectId() {
        return parentProjectId;
    }

    public void setParentProjectId(String parentProjectId) {
        this.parentProjectId = parentProjectId == null ? null : parentProjectId.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
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

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site == null ? null : site.trim();
    }

    public String getRespDept() {
        return respDept;
    }

    public void setRespDept(String respDept) {
        this.respDept = respDept == null ? null : respDept.trim();
    }

    public String getOwnerDept() {
        return ownerDept;
    }

    public void setOwnerDept(String ownerDept) {
        this.ownerDept = ownerDept == null ? null : ownerDept.trim();
    }

    public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDeputyDept() {
        return deputyDept;
    }

    public void setDeputyDept(String deputyDept) {
        this.deputyDept = deputyDept == null ? null : deputyDept.trim();
    }

    public String getBuilderDept() {
        return builderDept;
    }

    public void setBuilderDept(String builderDept) {
        this.builderDept = builderDept == null ? null : builderDept.trim();
    }

    public String getSupDept() {
        return supDept;
    }

    public void setSupDept(String supDept) {
        this.supDept = supDept == null ? null : supDept.trim();
    }

    public String getDesignDept() {
        return designDept;
    }

    public void setDesignDept(String designDept) {
        this.designDept = designDept == null ? null : designDept.trim();
    }

    public String getInvestor() {
        return investor;
    }

    public void setInvestor(String investor) {
        this.investor = investor == null ? null : investor.trim();
    }

    public BigDecimal getGross() {
        return gross;
    }

    public void setGross(BigDecimal gross) {
        this.gross = gross;
    }

    public BigDecimal getAssets() {
        return assets;
    }

    public void setAssets(BigDecimal assets) {
        this.assets = assets;
    }

   

    public BigDecimal getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(BigDecimal floorArea) {
        this.floorArea = floorArea;
    }

    public BigDecimal getCoveredArea() {
        return coveredArea;
    }

    public void setCoveredArea(BigDecimal coveredArea) {
        this.coveredArea = coveredArea;
    }

    public BigDecimal getPlanArea() {
        return planArea;
    }

    public void setPlanArea(BigDecimal planArea) {
        this.planArea = planArea;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity == null ? null : capacity.trim();
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }

    public BigDecimal getAnnualProductValue() {
        return annualProductValue;
    }

    public void setAnnualProductValue(BigDecimal annualProductValue) {
        this.annualProductValue = annualProductValue;
    }

    public String getAnnualProductAmounr() {
        return annualProductAmounr;
    }

    public void setAnnualProductAmounr(String annualProductAmounr) {
        this.annualProductAmounr = annualProductAmounr == null ? null : annualProductAmounr.trim();
    }

    public BigDecimal getAnnualSaleValue() {
        return annualSaleValue;
    }

    public void setAnnualSaleValue(BigDecimal annualSaleValue) {
        this.annualSaleValue = annualSaleValue;
    }

    public String getAnnualSaleAmount() {
        return annualSaleAmount;
    }

    public void setAnnualSaleAmount(String annualSaleAmount) {
        this.annualSaleAmount = annualSaleAmount == null ? null : annualSaleAmount.trim();
    }

    public BigDecimal getAnnualRevenue() {
        return annualRevenue;
    }

    public void setAnnualRevenue(BigDecimal annualRevenue) {
        this.annualRevenue = annualRevenue;
    }

    public Integer getEmployees() {
        return employees;
    }

    public void setEmployees(Integer employees) {
        this.employees = employees;
    }

    public BigDecimal getAcreProductValue() {
        return acreProductValue;
    }

    public void setAcreProductValue(BigDecimal acreProductValue) {
        this.acreProductValue = acreProductValue;
    }

    public BigDecimal getAcreRevenue() {
        return acreRevenue;
    }

    public void setAcreRevenue(BigDecimal acreRevenue) {
        this.acreRevenue = acreRevenue;
    }

    public BigDecimal getAcreAssets() {
        return acreAssets;
    }

    public void setAcreAssets(BigDecimal acreAssets) {
        this.acreAssets = acreAssets;
    }

    public BigDecimal getAcreGross() {
        return acreGross;
    }

    public void setAcreGross(BigDecimal acreGross) {
        this.acreGross = acreGross;
    }

    public BigDecimal getElectricity() {
        return electricity;
    }

    public void setElectricity(BigDecimal electricity) {
        this.electricity = electricity;
    }

    public BigDecimal getWater() {
        return water;
    }

    public void setWater(BigDecimal water) {
        this.water = water;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
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

    public Integer getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Integer isdeleted) {
        this.isdeleted = isdeleted;
    }
}