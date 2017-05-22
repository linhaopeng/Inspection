package net.baojuxinxi.pojo;

public class ProblemAnnex {
    private String problemAnnexId;

    private String problemId;

    private String problemAnnexName;

    private Byte problemAnnexType;

    private String problemAnnexPath;

    public String getProblemAnnexId() {
        return problemAnnexId;
    }

    public void setProblemAnnexId(String problemAnnexId) {
        this.problemAnnexId = problemAnnexId == null ? null : problemAnnexId.trim();
    }

    public String getProblemId() {
        return problemId;
    }

    public void setProblemId(String problemId) {
        this.problemId = problemId == null ? null : problemId.trim();
    }

    public String getProblemAnnexName() {
        return problemAnnexName;
    }

    public void setProblemAnnexName(String problemAnnexName) {
        this.problemAnnexName = problemAnnexName == null ? null : problemAnnexName.trim();
    }

    public Byte getProblemAnnexType() {
        return problemAnnexType;
    }

    public void setProblemAnnexType(Byte problemAnnexType) {
        this.problemAnnexType = problemAnnexType;
    }

    public String getProblemAnnexPath() {
        return problemAnnexPath;
    }

    public void setProblemAnnexPath(String problemAnnexPath) {
        this.problemAnnexPath = problemAnnexPath == null ? null : problemAnnexPath.trim();
    }
}