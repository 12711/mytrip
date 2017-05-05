/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.mappers;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Title: 用户日志
 * @Description: 用户对日志的操作
 * @author lsm
 * @date 2017-03-29 19:25
 */
public interface UserLogMapper {
    //新建日志
    void insertLog(UserLog userLog);
    //修改日志
    void modifyLog(UserLog userLog);
    //删除日志
    void deleteLog(@Param("id") Integer id);
    //通过ID得到日志
    UserLog getLog(@Param("id") Integer id);
    //通过用户id查询所有日志
    List<UserLog> getLogsByUserId(@Param("id") Integer id);
    //查询日志按hotnum排序
    List<UserLog> getLogsOrderByHotNum();
    //通过UID分页查询
    List<UserLog> getLogsByUid(PageHelpPojo pageHelpPojo)throws Exception;
    //查询日志的数量
    Integer countLogByUid(PageHelpPojo<Integer> pageHelpPojo)throws Exception;
}
