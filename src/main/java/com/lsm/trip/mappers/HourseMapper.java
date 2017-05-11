package com.lsm.trip.mappers;

import com.lsm.trip.dto.Hourse;
import org.apache.ibatis.annotations.Param;

/**
 * Created by lv on 2017/5/11.
 */
public interface HourseMapper {
     void  addHourse(Hourse hourse)throws Exception;
     void modifyHourse(Hourse hourse)throws Exception;
     Hourse getHourseByUid(@Param("hid") Integer hid)throws Exception;
}
