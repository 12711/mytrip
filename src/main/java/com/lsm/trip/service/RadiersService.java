package com.lsm.trip.service;

import com.lsm.trip.dto.Radiers;

import java.util.List;

/**
 * Created by lv on 2017/4/28.
 * 攻略服务层
 */
public interface RadiersService {
    //新建攻略
    void addRadiers(Radiers radiers)throws Exception;
    //通过景点ID查询攻略
    List<Radiers> getRadiersBySid(Integer sid)throws Exception;
    //通过攻略ID查询攻略
    Radiers getRaiders(Integer rid)throws Exception;
    //修改攻略
    void updateRaiders(Radiers radiers)throws Exception;

}
