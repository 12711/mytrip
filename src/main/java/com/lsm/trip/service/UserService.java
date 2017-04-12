package com.lsm.trip.service;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.User;
import com.lsm.trip.dto.UserShowInfo;

import java.util.List;

/**
 * Created by LSM on 2017/2/10.
 */
public interface UserService {
     User login(final User user)throws Exception;
     void regist(final User user)throws Exception;
     //查询用户详细信息
     UserShowInfo getUserInfo(final Integer uid)throws Exception;
     //修改用户头像
     void changImg(String imgName,Integer uid)throws Exception;
     //检查用户名是否存在
     User checkUserByName(String name)throws Exception;
     //通过用户名模糊查询地主
     List<UserShowInfo> getUserInfos(PageHelpPojo<String> pageHelpPojo)throws Exception;
     //通过参数查询totle
     Integer getTotle(String param)throws Exception;
     //通过city查询地主
     List<UserShowInfo> getUsersByCity(PageHelpPojo<String> pageInfo)throws Exception;
     //通过city查询地主数量
     Integer getTotleByAddr(String param)throws Exception;
}
