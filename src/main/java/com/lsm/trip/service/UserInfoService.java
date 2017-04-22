package com.lsm.trip.service;

import com.lsm.trip.dto.UserInfo;
import com.lsm.trip.dto.UserShowInfo;

/**
 * Created by LSM on 2017/3/2.
 */
public interface UserInfoService {
    Integer addUserInfo(UserInfo userInfo) throws Exception;
    //修改用户信息
    void updateUserInfo(UserShowInfo userInfo) throws Exception;
}
