package com.lsm.trip.service.impl;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserEvaluate;
import com.lsm.trip.mappers.UserEvaluateMapper;
import com.lsm.trip.service.UserEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lv on 2017/4/25.
 */
@Service("userEvaluateService")
public class UserEvaluateServiceImpl implements UserEvaluateService {
    @Autowired
    UserEvaluateMapper userEvaluateMapper;
    @Override
    public void addUserEvaluate(UserEvaluate userEvaluate) throws Exception {
        userEvaluateMapper.addEvaluate(userEvaluate);
    }

    @Override
    public Integer getCount(Integer uid) throws Exception {
        return userEvaluateMapper.countNum(uid);
    }

    @Override
    public List<UserEvaluate> getEvaluateByPage(PageHelpPojo<Integer> pageHelpPojo) throws Exception {
        return userEvaluateMapper.getEvaluates(pageHelpPojo);
    }
}
