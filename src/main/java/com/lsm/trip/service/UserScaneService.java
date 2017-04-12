/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service;

import com.lsm.trip.dto.UserScane;

import java.util.List;

/**
 * @Title:
 * @Description:用户景点
 * @author lsm
 * @date 2017-04-06 14:06
 */
public interface UserScaneService {
    void insertScaner(UserScane userScane)throws Exception;
    //通过Id查询景点
    UserScane getUserScaneById(Integer id)throws  Exception;
    //通过用户ID查询多个景点
    List<UserScane> getUserScanesByUid(Integer id) throws Exception;
}
