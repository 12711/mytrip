package com.lsm.trip.mappers;

import com.lsm.trip.dto.Radiers;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lv on 2017/4/28.
 * 景点攻略
 */
public interface RaiderMapper {
    //通过景点id查询攻略
    List<Radiers> getReadiers(@Param("sid") Integer sid)throws Exception;
    //为景点新建一条攻略记录
    void insertReadiers(Radiers radiers)throws Exception;
    //通过攻略ID查询单条攻略
    Radiers getRadiersByrid(@Param("rid") Integer rid)throws Exception;
}
