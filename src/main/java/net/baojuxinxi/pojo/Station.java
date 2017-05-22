package net.baojuxinxi.pojo;
/**
 * 项目成员身份表
 * @author Administrator
 *
 */
public class Station {
    private String stationId;//身份ID

    private String code;//身份编码

    private String name;//身份名称

    private Integer listNo;//显示序号

    private Byte isdeleted;//是否删除

    public String getStationId() {
        return stationId;
    }

    public void setStationId(String stationId) {
        this.stationId = stationId == null ? null : stationId.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getListNo() {
        return listNo;
    }

    public void setListNo(Integer listNo) {
        this.listNo = listNo;
    }

    public Byte getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Byte isdeleted) {
        this.isdeleted = isdeleted;
    }
}