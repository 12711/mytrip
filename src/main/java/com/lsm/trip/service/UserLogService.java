/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service;

import com.lsm.trip.dto.UserLog;

import java.util.List;

/**
 * @Title: 用户日志的服务层
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-29 19:35
 */
public interface UserLogService {
    //添加新的日志
    void addLog(UserLog userLog)throws Exception;
    //修改日志
    void modifyLog(UserLog userLog)throws Exception;
    //删除日志
    void deleteLogByid(Integer id)throws Exception;
    //通过用户ID获取日志
    List<UserLog> getLogsById(Integer id) throws Exception;
    //通过id得到日志
    UserLog getLogByid(Integer id)throws Exception;
    //查询日志通过hotnum排序
    List<UserLog> getLogsOrderByHotNum();
}
