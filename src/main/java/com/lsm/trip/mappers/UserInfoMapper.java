package com.lsm.trip.mappers;

import com.lsm.trip.dto.UserInfo;
import org.apache.ibatis.annotations.Param;

/**
 * Created by LSM on 2017/3/2.
 */
public interface UserInfoMapper {
    Integer insertUserInfo(UserInfo userInfo) throws Exception;
    //通过ID查询用户详细信息
    UserInfo getUserInfo(@Param("id") Integer id);

}
