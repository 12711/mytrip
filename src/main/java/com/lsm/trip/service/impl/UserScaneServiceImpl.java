/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service.impl;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserScane;
import com.lsm.trip.mappers.UserScaneMapper;
import com.lsm.trip.service.UserScaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title:
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-04-06 14:07
 */
@Service("UserScaneService")
public class UserScaneServiceImpl implements UserScaneService {
    @Autowired
    UserScaneMapper userScaneMapper;
    @Override
    public void insertScaner(UserScane userScane) throws Exception {
        userScaneMapper.addScane(userScane);
    }

    @Override
    public UserScane getUserScaneById(Integer id) throws Exception {
        return userScaneMapper.getUserScane(id);
    }

    @Override
    public List<UserScane> getUserScanesByUid(Integer id) throws Exception {
        return userScaneMapper.getScanesByUid(id);
    }

    @Override
    public Integer getScaneNum(PageHelpPojo<Integer> pageHelpPojo) throws Exception {
        return userScaneMapper.countScane(pageHelpPojo);
    }

    @Override
    public List<UserScane> getScanes(PageHelpPojo<Integer> pageHelpPojo) throws Exception {
        return userScaneMapper.getScaneByPage(pageHelpPojo);
    }

    @Override
    public void batchDeleteScane(Integer sid) throws Exception {
        userScaneMapper.batchDeleteScane(sid);
    }
}
