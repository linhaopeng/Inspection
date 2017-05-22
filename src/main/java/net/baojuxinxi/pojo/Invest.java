package net.baojuxinxi.pojo;

import java.math.BigDecimal;
import java.util.Date;
/**
 * 项目投资信息表
 * @author Administrator
 *
 */
public class Invest {
    private String investId;//ID

    private String projectId;//项目ID

    private Date years;//年月

    private BigDecimal monthGross;//月投资额

    private BigDecimal monthProductValue;//月产值

    private BigDecimal monthRevenue;//月税收

    private String monthProductAmounr;//月产量

    private String monthSaleAmount;//月销量

    private String creator;//上报人

    private Date createTime;//上报时间

    private Byte isdeleted;//是否删除

    public String getInvestId() {
        return investId;
    }

    public void setInvestId(String investId) {
        this.investId = investId == null ? null : investId.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public Date getYears() {
        return years;
    }

    public void setYears(Date years) {
        this.years = years;
    }

    public BigDecimal getMonthGross() {
        return monthGross;
    }

    public void setMonthGross(BigDecimal monthGross) {
        this.monthGross = monthGross;
    }

    public BigDecimal getMonthProductValue() {
        return monthProductValue;
    }

    public void setMonthProductValue(BigDecimal monthProductValue) {
        this.monthProductValue = monthProductValue;
    }

    public BigDecimal getMonthRevenue() {
        return monthRevenue;
    }

    public void setMonthRevenue(BigDecimal monthRevenue) {
        this.monthRevenue = monthRevenue;
    }

    public String getMonthProductAmounr() {
        return monthProductAmounr;
    }

    public void setMonthProductAmounr(String monthProductAmounr) {
        this.monthProductAmounr = monthProductAmounr == null ? null : monthProductAmounr.trim();
    }

    public String getMonthSaleAmount() {
        return monthSaleAmount;
    }

    public void setMonthSaleAmount(String monthSaleAmount) {
        this.monthSaleAmount = monthSaleAmount == null ? null : monthSaleAmount.trim();
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