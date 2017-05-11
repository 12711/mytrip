/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service;

import com.lsm.trip.dto.Imges;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Title:
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-31 15:51
 */
public interface UserImgService {
    void addImges(Imges imges) throws  Exception;
    List<Imges> getImgesByAlId(Integer id) throws  Exception;
    //通过ID删除照片
    void deleteByID(Integer id)throws Exception;
    List<Imges> getImgesByHid(Integer hid) throws Exception;
}
