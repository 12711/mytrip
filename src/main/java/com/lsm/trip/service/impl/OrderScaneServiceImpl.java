package com.lsm.trip.service.impl;

import com.lsm.trip.dto.OrderScane;
import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.mappers.OrderScaneMapper;
import com.lsm.trip.service.OrderScaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lv on 2017/5/8.
 */
@Service("orderScaneService")
public class OrderScaneServiceImpl implements OrderScaneService {
    @Autowired
    OrderScaneMapper orderScaneMapper;
    @Override
    public void addOrderScane(OrderScane orderScane) throws Exception {
       orderScaneMapper.addOrderScane(orderScane);
    }

    @Override
    public void updateOrderScane(OrderScane orderScane) throws Exception {
      orderScaneMapper.updateOrderScane(orderScane);
    }

    @Override
    public OrderScane getOrderScaneBySidYkid(OrderScane orderScane) throws Exception {
        return orderScaneMapper.getOrderScaneBySidYkid(orderScane);
    }

    @Override
    public List<OrderScane> getOrderScaneByDzidStatus(Integer uid) throws Exception {
        return orderScaneMapper.getOrderScaneByDzidStatus(uid);
    }

    @Override
    public void updateStatus(OrderScane orderScane) throws Exception {
        orderScaneMapper.updateOrderStatus(orderScane);
    }

    @Override
    public Integer count(Integer dzid) throws Exception {
        return orderScaneMapper.count(dzid);
    }

    @Override
    public List<OrderScane> getOrderScaneByPage(PageHelpPojo<Integer> pageHelpPojo) throws Exception {
        return orderScaneMapper.getOrderScaneByPage(pageHelpPojo);
    }

    @Override
    public List<OrderScane> gerOrderScanes() throws Exception {
        return orderScaneMapper.gerOrderScanes();
    }

    @Override
    public List<OrderScane> getOrderScaneByOidandIsread(Integer oid) throws Exception {
        return orderScaneMapper.getOrderScaneByOidandIsread(oid);
    }

    @Override
    public OrderScane getOrderScaneByOid(Integer oid) throws Exception {
        return orderScaneMapper.getOrderScaneByOid(oid);
    }

    @Override
    public void updateScaneOrder(OrderScane orderScane) throws Exception {
        orderScaneMapper.updateOrderScane(orderScane);
    }

    @Override
    public List<OrderScane> getOrderScaneByykId(PageHelpPojo pageHelpPojo) throws Exception {
        return orderScaneMapper.getOrderScaneByykId(pageHelpPojo);
    }

    @Override
    public Integer countByykid(Integer ykid) throws Exception {
        return orderScaneMapper.countByykid(ykid);
    }
}
