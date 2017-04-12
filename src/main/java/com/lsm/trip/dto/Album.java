/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.dto;

/**
 * @Title: 用户相册
 * @Description: 用户相册
 * @author lsm
 * @date 2017-03-30 14:43
 */
public class Album {
    private Integer id;
    private String name;
    private String desc;
    private Integer uid;
    private String createTime;
    private String modifyTime;
    private String type;
    private String cover;
    private Integer hotnum;
    private UserShowInfo userShowInfo;

    public UserShowInfo getUserShowInfo() {
        return userShowInfo;
    }

    public void setUserShowInfo(UserShowInfo userShowInfo) {
        this.userShowInfo = userShowInfo;
    }

    public Integer getHotnum() {
        return hotnum;
    }

    public void setHotnum(Integer hotnum) {
        this.hotnum = hotnum;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }
}
