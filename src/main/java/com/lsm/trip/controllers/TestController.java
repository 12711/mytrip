package com.lsm.trip.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by LSM on 2017/2/4.
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {

    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String testView(){
        return "showonedzcomment";
    }
    @RequestMapping(value = "/testmain",method = RequestMethod.GET)
    public String testMainView(){
        return "main";
    }
    @RequestMapping(value = "/teslog",method = RequestMethod.GET)
    public String testLog(){
        return "log";
    }

    @RequestMapping(value = "/testwritelog",method = RequestMethod.GET)
    public String testWriteLog(){
        return "writeLog";
    }

    @RequestMapping(value = "/testlogList",method = RequestMethod.GET)
    public String testLoglist(){
        return "logList";
    }
    @RequestMapping(value = "/testalbum",method = RequestMethod.GET)
    public String testalbum(){
        return "album";
    }

    @RequestMapping(value = "/test1",method = RequestMethod.GET)
    public String testTest(){
        return "showScanes";
    }

    @RequestMapping(value = "test2",method = RequestMethod.GET)
    public String testTest2(){
        return "writeScane";
    }
    @RequestMapping(value = "test3",method = RequestMethod.GET)
    public String testTest3(){
        return "TestMap";
    }
}
