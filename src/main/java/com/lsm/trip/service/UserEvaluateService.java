package com.lsm.trip.service;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserEvaluate;

import java.util.List;

/**
 * Created by lv on 2017/4/25.
 */
public interface UserEvaluateService {
    //添加评论
    void addUserEvaluate(UserEvaluate userEvaluate)throws Exception;
    //获取评论的数量
    Integer getCount(Integer uid)throws Exception;
    //分页获取评论
    List<UserEvaluate> getEvaluateByPage(PageHelpPojo<Integer> pageHelpPojo)throws Exception;
}
