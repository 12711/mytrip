/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service.impl;

import com.lsm.trip.dto.Imges;
import com.lsm.trip.mappers.UserImgMapper;
import com.lsm.trip.service.UserImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title:
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-31 15:52
 */
@Service("/img")
public class UserImgServieImpl implements UserImgService {
    @Autowired
    UserImgMapper userImgMapper;
    @Override
    public void addImges(Imges imges) throws Exception {
        userImgMapper.uploadImg(imges);
    }

    @Override
    public List<Imges> getImgesByAlId(Integer id) throws Exception {
        return userImgMapper.getImgesById(id);
    }

    @Override
    public void deleteByID(Integer id) throws Exception {
        userImgMapper.deleteImgById(id);
    }

    @Override
    public List<Imges> getImgesByHid(Integer hid) throws Exception {
        return userImgMapper.getImgesByHid(hid);
    }
}
