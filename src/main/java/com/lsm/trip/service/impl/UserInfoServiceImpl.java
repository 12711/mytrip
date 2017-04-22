package com.lsm.trip.service.impl;

import com.lsm.trip.dto.UserInfo;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.mappers.UserInfoMapper;
import com.lsm.trip.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by LSM on 2017/3/2.
 */
@Service("userInfoService")
public class UserInfoServiceImpl  implements UserInfoService{
    @Autowired
    UserInfoMapper userInfoMapper;
    @Override
    public Integer addUserInfo(UserInfo userInfo) throws Exception{
        return userInfoMapper.insertUserInfo(userInfo) ;
    }

    @Override
    public void updateUserInfo(UserShowInfo userInfo) throws Exception {
        System.out.print("-service-"+userInfo.getBirthday());
        userInfoMapper.updateUserInfo(userInfo);
    }
}
