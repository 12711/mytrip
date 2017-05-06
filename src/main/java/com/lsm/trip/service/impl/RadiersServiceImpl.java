package com.lsm.trip.service.impl;

import com.lsm.trip.dto.Radiers;
import com.lsm.trip.mappers.RaiderMapper;
import com.lsm.trip.service.RadiersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lv on 2017/4/28.
 */
@Service("radiersService")
public class RadiersServiceImpl implements RadiersService {
    @Autowired
    RaiderMapper raiderMapper;
    @Override
    public void addRadiers(Radiers radiers) throws Exception {
           raiderMapper.insertReadiers(radiers);
    }

    @Override
    public List<Radiers> getRadiersBySid(Integer sid) throws Exception {
        return raiderMapper.getReadiers(sid);
    }

    @Override
    public Radiers getRaiders(Integer rid) throws Exception {
        return raiderMapper.getRadiersByrid(rid);
    }

    @Override
    public void updateRaiders(Radiers radiers) throws Exception {
        raiderMapper.updateRadier(radiers);
    }

    @Override
    public void deleteRadier(Integer rid) throws Exception {
        raiderMapper.deleteRadier(rid);
    }
}
