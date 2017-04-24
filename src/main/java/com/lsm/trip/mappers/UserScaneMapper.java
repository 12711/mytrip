/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.mappers;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserScane;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Title:
 * @Description: 用户景点
 * @author lsm
 * @date 2017-04-06 12:18
 */
public interface UserScaneMapper {
    void addScane(UserScane userScane)throws Exception;
    //通过用户id查询所有景点
    List<UserScane> getScanesByUid(@Param("uid") Integer id)throws Exception;
    //通过ID查询打那个景点
    UserScane getUserScane(@Param("id") Integer id)throws Exception;
    //通過用户ID查询总页数
    Integer countScane(PageHelpPojo pageHelpPojo)throws Exception;
    //通过用户ID分页查询景点
    List<UserScane> getScaneByPage(PageHelpPojo pageHelpPojo)throws Exception;
}
