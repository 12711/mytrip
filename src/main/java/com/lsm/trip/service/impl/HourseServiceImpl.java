package com.lsm.trip.service.impl;

import com.lsm.trip.dto.Hourse;
import com.lsm.trip.mappers.HourseMapper;
import com.lsm.trip.service.HourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lv on 2017/5/11.
 */
@Service("hourseService")
public class HourseServiceImpl implements HourseService{
    @Autowired
    HourseMapper hourseMapper;
    @Override
    public void addHourse(Hourse hourse) throws Exception {
        hourseMapper.addHourse(hourse);
    }

    @Override
    public void modifyHourse(Hourse hourse) throws Exception {
           hourseMapper.modifyHourse(hourse);
    }

    @Override
    public Hourse getHourseByUid(Integer uid) throws Exception {
        return hourseMapper.getHourseByUid(uid);
    }
}
