package com.lsm.trip.dto;

/**
 * Created by LSM on 2017/2/10.
 * 攻略实体类
 */
public class Radiers {
    private Integer rid;//攻略id
    private Integer sid;//景点id
    private String title;//攻略标题
    private String content;//攻略内容
    private String posttime;//发布时间
    private String updatetime;//更新时间
    private String author;//发布的作者

    public Radiers() {
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPosttime() {
        return posttime;
    }

    public void setPosttime(String posttime) {
        this.posttime = posttime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
