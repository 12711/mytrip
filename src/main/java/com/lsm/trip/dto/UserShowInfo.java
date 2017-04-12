package com.lsm.trip.dto;

/**
 * Created by LSM on 2017/2/20.
 * 用于显示用户的详细信息
 */
public class UserShowInfo {
    private String userName;
    private String passWord;
    private String realName;
    private String phone;
    private String mail;
    private String address;
    private String workAddress;
    private Integer uid;

    private String mypig;//头像
    private String birthday;//生日
    private String sex;//性别
    private String filexPhone;//固话
    private String qq;//qq

    private Integer hotnum;
    private String sign;

    private String rank;

    private String city;
    private String province;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public Integer getHotnum() {
        return hotnum;
    }

    public void setHotnum(Integer hotnum) {
        this.hotnum = hotnum;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public UserShowInfo() {
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
