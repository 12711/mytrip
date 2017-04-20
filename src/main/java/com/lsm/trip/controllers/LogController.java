/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.controllers;

import com.lsm.trip.dto.UserInfo;
import com.lsm.trip.dto.UserLog;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.UserLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
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

    @RequestMapping(value = "/inter/writelog",method = RequestMethod.GET)
    public String testWriteLog(){
        return "writeLog";
    }

    @RequestMapping(value = "/getOneLog/{id}",method = RequestMethod.GET)
    public String getOneLog(@PathVariable("id")Integer id,ModelMap map){
        System.out.println("====log id is==="+id);
        UserLog userLog=null;
        try {
            userLog=userLogService.getLogByid(id);
            System.out.println("getHotNum===="+userLog.getHotNum());
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
            map.put("userLogs",userLogs);
        } catch (Exception e) {
            System.out.println("查询日志失败...");
            e.printStackTrace();
        }
        return "logList";
    }
}
