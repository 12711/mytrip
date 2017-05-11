/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.mappers;

import com.lsm.trip.dto.Imges;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Title: 图片
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-31 15:47
 */
public interface UserImgMapper {
    //上传图片
    void uploadImg(Imges imges);
    //通过相册id查询照片
    List<Imges> getImgesById(@Param("id") Integer id)throws Exception;
    //通过ID删除照片
    void deleteImgById(@Param("id")Integer id)throws Exception;
    //通过房子ID查询房子的图片信息
    List<Imges> getImgesByHid(@Param("hid") Integer hid)throws Exception;
}
