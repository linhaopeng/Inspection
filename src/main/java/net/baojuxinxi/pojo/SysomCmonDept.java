package net.baojuxinxi.pojo;
import java.util.Date;

public class SysomCmonDept {
    private String commonDeptId;//

    private String name;//单位名称

    private String principal;//单位负责人

    private String phone;//联系电话

    private String address;//单位地址

    private String creator;//创建人

    private Date createTime;//创建时间

    private Byte isdeleted;//是否删除

    public String getCommonDeptId() {
        return commonDeptId;
    }

    public void setCommonDeptId(String commonDeptId) {
        this.commonDeptId = commonDeptId == null ? null : commonDeptId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal == null ? null : principal.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
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