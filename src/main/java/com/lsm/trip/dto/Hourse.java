package com.lsm.trip.dto;

/**
 * Created by lv on 2017/5/11.
 * 房屋信息
 */
public class Hourse {
    private Integer hid;
    private String content;
    private String updateTime;
    private Integer uid;
    private Integer isOverFlow;

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getIsOverFlow() {
        return isOverFlow;
    }

    public void setIsOverFlow(Integer isOverFlow) {
        this.isOverFlow = isOverFlow;
    }
}
