package com.lsm.trip.dto;

/**
 * Created by LSM on 2017/2/4.
 * 用户的实体类
 */
public class User {
    private Integer uid;
    private String userName;
    private String passWord;
    private String code;//用于接受用户输入的验证码
    private int count;//用户接受用户输入密码错误的次数

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", code='" + code + '\'' +
                ", count=" + count +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public User() {
    }
}
