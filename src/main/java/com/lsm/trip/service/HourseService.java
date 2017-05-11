package com.lsm.trip.service;

import com.lsm.trip.dto.Hourse;
import org.apache.ibatis.annotations.Param;

/**
 * Created by lv on 2017/5/11.
 */
public interface HourseService {
    void  addHourse(Hourse hourse)throws Exception;
    void modifyHourse(Hourse hourse)throws Exception;
    Hourse getHourseByUid(Integer uid)throws Exception;
}
