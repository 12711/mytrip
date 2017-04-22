package com.lsm.trip.dto;

/**
 * Created by LSM on 2017/2/4.
 * 用户的详细信息
 */
public class UserInfo {
    private Integer uIID;
    private Integer uId;
    private String realName;
    private String phone;
    private String mail;
    private String address;
    private String workAddress;
    private String mypig;//头像
    private String birthday;//生日
    private String sex;//性别
    private String filexPhone;//固话
    private String qq;//qq


    public UserInfo() {
    }

    public String getMypig() {
        return mypig;
    }

    public void setMypig(String mypig) {
        this.mypig = mypig;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getFilexPhone() {
        return filexPhone;
    }

    public void setFilexPhone(String filexPhone) {
        this.filexPhone = filexPhone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Integer getuIID() {
        return uIID;
    }

    public void setuIID(Integer uIID) {
        this.uIID = uIID;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWorkAddress() {
        return workAddress;
    }

    public void setWorkAddress(String workAddress) {
        this.workAddress = workAddress;
    }
}
