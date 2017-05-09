package com.lsm.trip.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lsm.trip.WebSocket.SystemWebSocketHandler;
import com.lsm.trip.dto.OrderScane;
import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.service.OrderScaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.socket.TextMessage;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by lv on 2017/5/8.
 */
@Controller
@RequestMapping("/orderScane")
public class OrderScaneController {

    @Autowired
    SystemWebSocketHandler systemWebSocketHandler;
    @Autowired
    OrderScaneService orderScaneService;
    @RequestMapping(value = "inter/order",method = RequestMethod.POST)
    @ResponseBody
    public String orderScane(OrderScane orderScane){
        try {
            System.out.println(orderScane.getDzuid()+"|||"+orderScane.getYkuid()+"||"+orderScane.getSid());
            OrderScane orderScaneFormdb=orderScaneService.getOrderScaneBySidYkid(orderScane);
            if(orderScaneFormdb==null){
                //当数据为null时说明用户还没预约过
                orderScaneService.addOrderScane(orderScane);
                return "0";
            }else {
                //当这个预约的状态是以过期或者已完成(1 表示已过期,2 表示已完成 3.已同意  4.已拒绝)
                if(orderScaneFormdb.getStatus()==1||orderScaneFormdb.getStatus()==2){
                    orderScaneService.addOrderScane(orderScane);

                    return "0";
                }else{
                    //状态为0正在进行
                    return "1";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "1";
        }

    }
    @RequestMapping(value = "/inter/getOrderScaneByidStatus/{uid}",method = RequestMethod.GET)
    public String getOrderScaneByidStatus(@PathVariable("uid")Integer uid, ModelMap map){
        try {
            System.out.println("uid==="+uid);
            List<OrderScane> orderScane=orderScaneService.getOrderScaneByDzidStatus(uid);
            map.addAttribute("orderScanes",orderScane);
            System.out.println("uid==="+orderScane.size());
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("errorinfo","服务器出现异常");
        }finally {
            return "showOrderScane";
        }
    }

    @RequestMapping(value = "/inter/updateStatus/{orderid}/{uid}/{reslut}/{yuid}",method = RequestMethod.GET)
    public String updateStatus(@PathVariable("orderid") Integer orderid,@PathVariable("uid") Integer uid,@PathVariable("reslut") Integer result,@PathVariable("yuid") Integer method){

       System.out.println("orderid--"+orderid);
        System.out.println("uid--"+uid);
        System.out.println("result--"+result);
        System.out.println("method--"+method);
        OrderScane orderScane=new OrderScane();
        orderScane.setOrder_id(orderid);
        orderScane.setStatus(result);
        try {
            orderScaneService.updateStatus(orderScane);
            OrderScane orderScaneFormDb=orderScaneService.getOrderScaneByOid(orderid);
            ObjectMapper mapper=new ObjectMapper();
            String orderScaneString=mapper.writeValueAsString(orderScaneFormDb);
            orderScaneString+="&&{num="+2+"}";
            systemWebSocketHandler.sendMessageToUser(method+"",new TextMessage(orderScaneString));
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return "redirect:/orderScane/inter/getOrderScaneByidStatus/"+uid;
        }
    }

    @RequestMapping(value = "/inter/getOrderScaneByPage/{dzid}")
    public String getOrderScaneByPage(@PathVariable("dzid") Integer dzid, ModelMap model, HttpServletRequest request, @RequestParam(value = "pageIndex",defaultValue = "1") Integer pageIndex){
        PageHelpPojo<Integer> pageHelpPojo=new PageHelpPojo<>();
        pageHelpPojo.setPageIndex(pageIndex);
        model.addAttribute("pageIndex",pageIndex);
        pageHelpPojo.setPageSize(4);
        pageHelpPojo.setParam(dzid);
        try {
           List<OrderScane> orderScanes= orderScaneService.getOrderScaneByPage(pageHelpPojo);
            Integer count=orderScaneService.count(dzid);
            Integer totle=count%4==0?count/4:count/4+1;
           model.addAttribute("orderScanes",orderScanes);
           model.addAttribute("totle",totle);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return "showhistoryOrderScane";
        }
    }

    @RequestMapping(value = "/updateIsRead/{oid}",method = RequestMethod.POST)
    @ResponseBody
    public  String updateScaneOrder(@PathVariable("oid") Integer oid){
        OrderScane orderScane=new OrderScane();
        orderScane.setOrder_id(oid);
        orderScane.setIsReadMess(1);
        try {
            orderScaneService.updateOrderScane(orderScane);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping(value = "/inter/getOrderScaneByPageykid/{ykid}")
    public String getOrderScaneByPageykid(@PathVariable("ykid") Integer ykid, ModelMap model, HttpServletRequest request, @RequestParam(value = "pageIndex",defaultValue = "1") Integer pageIndex){
        PageHelpPojo<Integer> pageHelpPojo=new PageHelpPojo<>();
        pageHelpPojo.setPageIndex(pageIndex);
        model.addAttribute("pageIndex",pageIndex);
        pageHelpPojo.setPageSize(4);
        pageHelpPojo.setParam(ykid);
        try {
            List<OrderScane> orderScanes= orderScaneService.getOrderScaneByykId(pageHelpPojo);
            Integer count=orderScaneService.countByykid(ykid);
            Integer totle=count%4==0?count/4:count/4+1;
            model.addAttribute("orderScanes",orderScanes);
            model.addAttribute("totle",totle);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return "showMyhistoryOrderScane";
        }
    }

}
