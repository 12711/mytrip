package com.lsm.trip.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lv on 2017/5/13.
 */
@Controller
@RequestMapping("/chat")
public class ChatController {
    @RequestMapping(value = "/tochat/{touid}",method = RequestMethod.GET)
    public String toChat(@PathVariable("touid")Integer uid, @RequestParam(name = "content",defaultValue ="" )String content, ModelMap map){

        System.out.println("---------content------------"+content);
        map.addAttribute("touid",uid);
        map.addAttribute("content",content);
       return "chat";
    }
}
