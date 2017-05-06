package com.lsm.trip.dto;

/**
 * Created by LSM on 2017/2/10.
 * 评论表
 */
public class UserEvaluate {
    private Integer eid;//评论id
    private Integer uid;
    private String author;//评论者
    private String content;//内容
    private String eTime;//评论时间

    private UserShowInfo userShowInfo;

    public UserShowInfo getUserShowInfo() {
        return userShowInfo;
    }

    public void setUserShowInfo(UserShowInfo userShowInfo) {
        this.userShowInfo = userShowInfo;
    }

    public UserEvaluate() {
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String geteTime() {
        return eTime;
    }

    public void seteTime(String eTime) {
        this.eTime = eTime;
    }
}
