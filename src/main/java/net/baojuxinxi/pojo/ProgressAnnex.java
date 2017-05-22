package net.baojuxinxi.pojo;
/**
 * 进度附件表
 * @author Administrator
 *
 */
public class ProgressAnnex {
    private String progressAnnexId;//附件ID

    private String progressId;//进度ID

    private String progressAnnexName;//附件名称

    private Byte progressAnnexType;//附件类型

    private String progressAnnexPath;//存放路径

    public String getProgressAnnexId() {
        return progressAnnexId;
    }

    public void setProgressAnnexId(String progressAnnexId) {
        this.progressAnnexId = progressAnnexId == null ? null : progressAnnexId.trim();
    }

    public String getProgressId() {
        return progressId;
    }

    public void setProgressId(String progressId) {
        this.progressId = progressId == null ? null : progressId.trim();
    }

    public String getProgressAnnexName() {
        return progressAnnexName;
    }

    public void setProgressAnnexName(String progressAnnexName) {
        this.progressAnnexName = progressAnnexName == null ? null : progressAnnexName.trim();
    }

    public Byte getProgressAnnexType() {
        return progressAnnexType;
    }

    public void setProgressAnnexType(Byte progressAnnexType) {
        this.progressAnnexType = progressAnnexType;
    }

    public String getProgressAnnexPath() {
        return progressAnnexPath;
    }

    public void setProgressAnnexPath(String progressAnnexPath) {
        this.progressAnnexPath = progressAnnexPath == null ? null : progressAnnexPath.trim();
    }
}