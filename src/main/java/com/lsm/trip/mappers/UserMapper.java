package com.lsm.trip.mappers;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.User;
import com.lsm.trip.dto.UserShowInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LSM on 2017/2/10.
 * 用户映射接口
 */
public interface UserMapper {
    //用于登录
    User getUserByNamePwd(User user)throws Exception;
    //用户注册
    void insertUser(User user)throws Exception;

    //查询用户详细信息
    UserShowInfo getUserInfo(@Param("uid") Integer uid)throws Exception;

    //修改用户的头像
    void changImg(@Param("imgName") String imgName,@Param("uid") Integer uid)throws Exception;

    //检查用户名
    User checkUserName(@Param("name") String name) throws Exception;

    //通过用户名模糊查询地主
    List<UserShowInfo> userInfos(PageHelpPojo<String> pageInfo)throws Exception;
    //通过地区查询地主
    List<UserShowInfo> getUserInfoByAddr(PageHelpPojo<String> pageInfo) throws Exception;
    //通过参数查询数据条数
    Integer getTotleByParam(@Param("param") String param)throws Exception;
    //通过地区查询数据条数
    Integer getTotleByParamAddr(@Param("param") String param)throws Exception;
}
