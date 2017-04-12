/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service.impl;

import com.lsm.trip.dto.UserLog;
import com.lsm.trip.mappers.UserLogMapper;
import com.lsm.trip.service.UserLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title: 用户日志service实现层
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-29 19:38
 */
@Service("userLogService")
public class UserLogServiceImpl implements UserLogService {
    @Autowired
    UserLogMapper userLogMapper;
    @Override
    public void addLog(UserLog userLog) throws Exception {
      userLogMapper.insertLog(userLog);
    }

    @Override
    public void modifyLog(UserLog userLog) throws Exception{

    }

    @Override
    public void deleteLogByid(Integer id) throws Exception{

    }

    @Override
    public List<UserLog> getLogsById(Integer id) throws Exception {

        return userLogMapper.getLogsByUserId(id);
    }

    @Override
    public UserLog getLogByid(Integer id) throws Exception {
        return  userLogMapper.getLog(id);
    }

    @Override
    public List<UserLog> getLogsOrderByHotNum() {
        return userLogMapper.getLogsOrderByHotNum();
    }
}
