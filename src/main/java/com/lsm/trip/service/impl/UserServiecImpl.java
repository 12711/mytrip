package com.lsm.trip.service.impl;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.User;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.mappers.UserMapper;
import com.lsm.trip.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LSM on 2017/2/10.
 */
@Service("userService")
class UserServiecImpl implements UserService {


    @Autowired
    UserMapper userMapper;

    @Override
    public void changImg(String imgName, Integer uid) throws Exception{
      userMapper.changImg(imgName,uid);
    }
    @Override
    public User login(final User user) throws Exception{
        if(user==null){
            throw new RuntimeException("用户名密码不能为空!");
        }
        return userMapper.getUserByNamePwd(user);
    }

    @Override
    public void regist(final User user)throws Exception {
        userMapper.insertUser(user);
    }

    @Override
    public UserShowInfo getUserInfo(final Integer uid) throws Exception{
        return userMapper.getUserInfo(uid);
    }

    @Override
    public User checkUserByName(String name)throws Exception {
        return userMapper.checkUserName(name);
    }

    @Override
    public List<UserShowInfo> getUserInfos(PageHelpPojo<String> pageHelpPojo) throws Exception {
        return userMapper.userInfos(pageHelpPojo);
    }

    @Override
    public Integer getTotle(String param) throws Exception {
        return userMapper.getTotleByParam(param);
    }

    @Override
    public List<UserShowInfo> getUsersByCity(PageHelpPojo<String> pageInfo) throws Exception {
        return userMapper.getUserInfoByAddr(pageInfo);
    }

    @Override
    public Integer getTotleByAddr(String param) throws Exception {
        return userMapper.getTotleByParamAddr(param);
    }

    @Override
    public void updatePwd(User user) throws Exception {
        userMapper.updatePWD(user);
    }

    @Override
    public UserShowInfo getUserByUsername(UserShowInfo userShowInfo) throws Exception {
        return userMapper.getUserByUserName(userShowInfo);
    }
}
