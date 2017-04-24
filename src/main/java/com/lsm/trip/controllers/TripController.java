/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.controllers;

import com.lsm.trip.dto.*;
import com.lsm.trip.service.*;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    UserScaneService userScaneService;
    @Autowired
    AlbumService albumService;

    @RequestMapping(value = "/getUserLogAddr", method = RequestMethod.GET)
    @ResponseBody
    public PageResponsePojo getUserLogAddr(PageHelpPojo<String> pageHelpPojo) {
        System.out.println("pagehelpPojo-->" + pageHelpPojo.getParam());
        System.out.println("pageHelpPojo.getPageIndex()-->" + pageHelpPojo.getPageIndex());
        System.out.println("pagehelpPojo type-->" + pageHelpPojo.getType());
        PageResponsePojo pageResponsePojo = new PageResponsePojo();
        List<UserShowInfo> userShowInfos = null;
        if ("p".equals(pageHelpPojo.getType())) {
            try {
                userShowInfos = userService.getUserInfos(pageHelpPojo);
                pageResponsePojo = returnResp(pageHelpPojo, userShowInfos);
                pageResponsePojo.setTotle(userService.getTotle(pageHelpPojo.getParam()));
            } catch (Exception e) {
                pageResponsePojo.setMessage(e.getMessage());
                e.printStackTrace();
            }
        } else if ("d".equals(pageHelpPojo.getType())) {
            try {
                userShowInfos = userService.getUsersByCity(pageHelpPojo);

                pageResponsePojo = returnResp(pageHelpPojo, userShowInfos);
                pageResponsePojo.setTotle(userService.getTotleByAddr(pageHelpPojo.getParam()));
            } catch (Exception e) {
                pageResponsePojo.setMessage(e.getMessage());
                e.printStackTrace();
            }
        }

        System.out.println("totle====" + pageResponsePojo.getTotle());
        System.out.println("row====" + pageResponsePojo.getRows().size());
        return pageResponsePojo;
    }

    @RequestMapping(value = "/toSearch", method = RequestMethod.GET)
    public String toSearch(@RequestParam("type") String type, @RequestParam("content") String content, ModelMap model) {
        System.out.println("type--" + type);
        System.out.println("content--" + content);
        try {
            Integer totle = null;
            if ("p".equals(type)) {
                System.out.println("content--" + content);
                totle = userService.getTotle(content);
                System.out.println("totle--" + totle);
            } else if ("d".equals(type)) {
                System.out.println("content-d-" + content);
                totle = userService.getTotleByAddr(content);
                System.out.println("totle--d-" + totle);
            }
            model.addAttribute("totle", totle);
            model.addAttribute("content", content);
            model.addAttribute("type", type);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test";
    }

    public PageResponsePojo<UserShowInfo> returnResp(PageHelpPojo<String> pageHelpPojo, List<UserShowInfo> userShowInfos) throws Exception {
        PageResponsePojo pageResponsePojo = new PageResponsePojo();
        for (UserShowInfo user : userShowInfos) {
            getRankImg(user);
        }
        pageResponsePojo.setRows(userShowInfos);
        return pageResponsePojo;
    }

    @RequestMapping(value = "/getUserById/{id}", method = RequestMethod.GET)
    public String getUserById(@PathVariable("id") Integer id, ModelMap model, HttpServletRequest request,@RequestParam("pageIndex") Integer pageIndex) {
        try {
            UserShowInfo userShowInfo = userService.getUserInfo(id);
            getRankImg(userShowInfo);
           // List<UserScane> userScane = userScaneService.getUserScanesByUid(id);
          PageHelpPojo<Integer> pageHelpPojo=new PageHelpPojo();
          pageHelpPojo.setParam(pageIndex);
          //用户通过点击地主进去这个界面是pageIndex默认赋值为-1
            if(pageIndex==null||(-1==pageIndex)){
                pageIndex=1;
            }

            pageHelpPojo.setPageIndex(pageIndex);
            pageHelpPojo.setPageSize(3);
            pageHelpPojo.setParam(id);
            List<UserScane> userScane = userScaneService.getScanes(pageHelpPojo);
            Integer count=userScaneService.getScaneNum(pageHelpPojo);
            Integer totle=count%3==0?count/3:count/3+1;
            System.out.print("--totle--="+totle);
            model.addAttribute("pageIndex",pageIndex);
            request.getSession().setAttribute("uid",id);
            model.addAttribute("userScane", userScane);
            model.addAttribute("userShowInfo", userShowInfo);
            model.addAttribute("totle",totle);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "showonedz";
    }

    //点击主页的热门相册
    @RequestMapping(value = "/getAlbumInIndex",method = RequestMethod.GET)
    public String getHotAlbumInIndex(HttpServletRequest request,ModelMap model){
        Integer uid=(Integer) request.getSession().getAttribute("uid");
        List<Album> albums=null;
        System.out.print("热门相册-----"+uid);
        try {
            UserShowInfo userShowInfo = userService.getUserInfo(uid);
            getRankImg(userShowInfo);
            albums=albumService.getHotAlbum(uid);
            model.addAttribute("albums",albums);
            model.addAttribute("userShowInfo", userShowInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "showonedzablum";
    }

    public UserShowInfo getRankImg(UserShowInfo user) {
        Integer hotnum = user.getHotnum();
        //当用户在没有hotnum时给他赋初值为0
        if (hotnum == null) {
            hotnum = 0;
        }
        Double rank = hotnum / 1000.0;
        if (rank <= 0.1) {
            user.setRank("1rankd.png");
        } else if (rank > 0.1 && rank <= 0.2) {
            user.setRank("2rankd.png");
        } else if (rank > 0.2 && rank <= 0.3) {
            user.setRank("3rankd.png");
        } else if (rank > 0.3 && rank <= 0.4) {
            user.setRank("4rankd.png");
        } else if (rank > 0.4 && rank <= 0.5) {
            user.setRank("5rankd.png");
        } else if (rank > 0.5 && rank <= 0.6) {
            user.setRank("6rankd.png");
        } else if (rank > 0.6 && rank <= 0.7) {
            user.setRank("7rankd.png");
        } else if (rank > 0.7 && rank <= 0.8) {
            user.setRank("8rankd.png");
        } else if (rank > 0.8 && rank <= 0.9) {
            user.setRank("9rankd.png");
        } else {
            user.setRank("10rankd.png");
        }
        return user;
    }
}
