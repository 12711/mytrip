package com.lsm.trip.service;

import com.lsm.trip.dto.OrderScane;
import com.lsm.trip.dto.PageHelpPojo;
import org.aspectj.weaver.ast.Or;
import org.springframework.core.annotation.Order;

import java.util.List;

/**
 * Created by lv on 2017/5/8.
 */
public interface OrderScaneService {
    void addOrderScane(OrderScane orderScane)throws Exception;
    void updateOrderScane(OrderScane orderScane)throws Exception;
    OrderScane getOrderScaneBySidYkid(OrderScane orderScane)throws Exception;
    List<OrderScane> getOrderScaneByDzidStatus(Integer uid)throws Exception;
    void updateStatus(OrderScane orderScane)throws Exception;
    Integer count(Integer dzid)throws Exception;
    List<OrderScane> getOrderScaneByPage(PageHelpPojo<Integer> pageHelpPojo)throws Exception;
    List<OrderScane> gerOrderScanes() throws Exception;
    List<OrderScane> getOrderScaneByOidandIsread(Integer oid)throws Exception;
    OrderScane getOrderScaneByOid(Integer oid)throws Exception;
    //主要用于更新是否已读
    void updateScaneOrder(OrderScane orderScane)throws Exception;
    //通过游客ID查询预约
    List<OrderScane> getOrderScaneByykId(PageHelpPojo pageHelpPojo)throws Exception;
    //通过游客ID查询预约条数
    Integer countByykid(Integer ykid)throws Exception;
}
