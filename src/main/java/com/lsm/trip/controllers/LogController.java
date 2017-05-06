/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.controllers;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserInfo;
import com.lsm.trip.dto.UserLog;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.UserLogService;
import com.lsm.trip.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author lsm
 * @Title: 日志的控制器
 * @Description: (描述此类的功能)
 * @date 2017-03-29 14:43
 */
@Controller
@RequestMapping("/log")
@SessionAttributes
public class LogController {
    @Autowired
    UserLogService userLogService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/inter/writelog",method = RequestMethod.GET)
    public String testWriteLog(){
        return "writeLog";
    }

    @RequestMapping(value = "/getOneLog/{id}",method = RequestMethod.GET)
    public String getOneLog(@PathVariable("id")Integer id, ModelMap map, HttpServletRequest request){
        System.out.println("====log id is==="+id);
        UserLog userLog=null;
        try {
            userLog=userLogService.getLogByid(id);
            System.out.println("getHotNum====");
           //当当前用户不是日志发表者时浏览量加一
            UserShowInfo userShowInfo1=null;
            if((((UserShowInfo)request.getSession().getAttribute("userInfo")))==null){
                userShowInfo1=new UserShowInfo();
            }else {
                userShowInfo1=((UserShowInfo)request.getSession().getAttribute("userInfo"));
            }

           if(userLog.getUid()!=userShowInfo1.getUid()){
                 userLogService.modifyLog(userLog);
            }
            UserShowInfo userShowInfo=userService.getUserInfo(userLog.getUid());
            TripController.getRankImg(userShowInfo);
            map.addAttribute("showRank",userShowInfo);
            map.put("userLog",userLog);
        } catch (Exception e) {
            System.out.println("获取日志失败");
            e.printStackTrace();
            return "forward:logList";
        }
        return "log";
    }

    @RequestMapping(value = "/newlog", method = RequestMethod.POST)
    public String newLog(String title, String log, HttpSession session) {

        System.out.println("==title==" + title);
        System.out.println("==log=" + log);
        UserLog userLog = new UserLog();
        System.out.println("userinfo---" + (UserShowInfo) session.getAttribute("userInfo"));
        userLog.setUid(((UserShowInfo) session.getAttribute("userInfo")).getUid());
        userLog.setContent(log);
        userLog.setTitle(title);
        try {
            userLogService.addLog(userLog);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("日志发表失败!");
        }

        return "writeLog";
    }

    @RequestMapping(value = "inter/logList", method = RequestMethod.GET)
    public String testLoglist(HttpSession session,ModelMap map) {

        List<UserLog> userLogs=null;
        try {
            Integer uid=((UserShowInfo) session.getAttribute("userInfo")).getUid();
            userLogs=userLogService.getLogsById(uid);
            for(int i=0;i<userLogs.size();i++){
                String content=userLogs.get(i).getContent();
                content=content.replaceAll("<p>|</p>","");
                userLogs.get(i).setContent(content);
            }
            map.put("userLogs",userLogs);
        } catch (Exception e) {
            System.out.println("查询日志失败...");
            e.printStackTrace();
        }
        return "logList";
    }

    @RequestMapping(value = "inter/deleteLog",method = RequestMethod.POST)
    @ResponseBody
    public String [] deleteLog(@RequestParam("ids") String ids){
      System.out.println("log   ids==="+ids);
      String [] repsString=new String[2];
      repsString[0]="";
      String [] idArray=ids.split(",");
      for(String idString :idArray){

          try {
              Integer idInt=Integer.parseInt(idString);
              userLogService.deleteLogByid(idInt);
              repsString[0]+=idInt+",";
          } catch (Exception e) {
              e.printStackTrace();
              repsString[1]="0";
          }
      }
      return repsString;
    }
    @RequestMapping(value = "/getLogInIndex/{uid}",method = RequestMethod.GET)
    public String getHotLogInIndex(@PathVariable("uid") Integer uid,ModelMap model,HttpServletRequest request,@RequestParam("pageIndex") Integer pageIndex){
        System.out.println("uid===="+uid);
        UserShowInfo userShowInfo=null;
        PageHelpPojo<Integer> pageHelpPojo=new PageHelpPojo<>();
        pageHelpPojo.setParam(uid);
        if(pageIndex==null||pageIndex==-1){
            pageIndex=1;
        }
        pageHelpPojo.setPageIndex(pageIndex);
        pageHelpPojo.setPageSize(4);
        try {
        List<UserLog> logs=userLogService.getLogsByUid(pageHelpPojo);
        Integer count=userLogService.countLog(pageHelpPojo);
        Integer totle=count%4==0?count/4:count/4+1;

        userShowInfo=userService.getUserInfo(uid);
        TripController.getRankImg(userShowInfo);


        for(UserLog log:logs){
            log.setContent(log.getContent().replaceAll("<p>|</p>",""));
            System.out.println("conttent===="+log.getContent());
        }

            model.addAttribute("pageIndex",pageIndex);
            model.addAttribute("logs", logs);
            model.addAttribute("userShowInfo", userShowInfo);
            model.addAttribute("totle",totle);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "showonedzlog";
    }
}
