package com.lsm.trip.service;

import com.lsm.trip.dto.OrderScane;
import com.lsm.trip.dto.PageHelpPojo;
import org.aspectj.weaver.ast.Or;

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
    Integer count()throws Exception;
    List<OrderScane> getOrderScaneByPage(PageHelpPojo<Integer> pageHelpPojo)throws Exception;
    List<OrderScane> gerOrderScanes() throws Exception;
}
