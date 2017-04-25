package com.lsm.trip.mappers;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserEvaluate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lv on 2017/4/25.
 */
public interface UserEvaluateMapper {
    //添加评价
    void addEvaluate(UserEvaluate userEvaluate)throws Exception;
    //查询用户的评价的数量
    Integer countNum(@Param("uid") Integer uid) throws Exception;
    //分页查询用户评价
    List<UserEvaluate> getEvaluates(PageHelpPojo<Integer> pageHelpPojo)throws Exception;
}
