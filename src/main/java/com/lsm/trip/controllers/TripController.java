/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.controllers;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.PageResponsePojo;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.UserInfoService;
import com.lsm.trip.service.UserLogService;
import com.lsm.trip.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author lsm
 * @Title: trip的综合处理控制器
 * @Description: (描述此类的功能)
 * @date 2017-04-11 11:37
 */
@Controller
@RequestMapping("/trip")
public class TripController {
    @Autowired
    UserService userService;
    @Autowired
    UserLogService userLogService;

    @RequestMapping(value = "/getUserLogAddr", method = RequestMethod.GET)
    @ResponseBody
    public PageResponsePojo getUserLogAddr(PageHelpPojo<String> pageHelpPojo) {
        System.out.println("pagehelpPojo-->" + pageHelpPojo.getParam());
        PageResponsePojo pageResponsePojo = new PageResponsePojo();

        if ("p".equals(pageHelpPojo.getType())) {
            List<UserShowInfo> userShowInfos = null;

            try {

                userShowInfos = userService.getUserInfos(pageHelpPojo);
                for(UserShowInfo user:userShowInfos){
                    Integer hotnum=user.getHotnum();
                    Double rank=hotnum/1000.0;
                    if(rank<=0.1){
                        user.setRank("1rankd.png");
                    }else if(rank>0.1&&rank<=0.2){
                        user.setRank("2rankd.png");
                    }else if(rank>0.2&&rank<=0.3){
                        user.setRank("3rankd.png");
                    }else if(rank>0.3&&rank<=0.4){
                        user.setRank("4rankd.png");
                    }else if(rank>0.4&&rank<=0.5){
                        user.setRank("5rankd.png");
                    }else if(rank>0.5&&rank<=0.6){
                        user.setRank("6rankd.png");
                    }else if(rank>0.6&&rank<=0.7){
                        user.setRank("7rankd.png");
                    }else if(rank>0.7&&rank<=0.8){
                        user.setRank("8rankd.png");
                    }else if(rank>0.8&&rank<=0.9){
                        user.setRank("9rankd.png");
                    }else{
                        user.setRank("10rankd.png");
                    }
                }
                pageResponsePojo.setTotle( userService.getTotle(pageHelpPojo.getParam()));
                pageResponsePojo.setRows(userShowInfos);
            } catch (Exception e) {
                pageResponsePojo.setMessage(e.getMessage());
                e.printStackTrace();
            }
        }

        System.out.println("totle===="+pageResponsePojo.getTotle());
        System.out.println("row===="+pageResponsePojo.getRows().get(0));
        return pageResponsePojo;
    }

    @RequestMapping(value = "/toSearch",method = RequestMethod.GET)
    public String toSearch(@Param("type") String type, @Param("content") String content, ModelMap model){
        try {
            Integer totle=null;
            if("p".equals(type)) {
                 totle= userService.getTotle(content);
               System.out.println("totle--"+totle);
            }
            model.addAttribute("totle",totle);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test";
    }
}
