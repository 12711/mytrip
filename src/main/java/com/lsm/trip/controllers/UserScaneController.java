/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.controllers;

import com.lsm.trip.dto.UserScane;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.UserScaneService;
import com.lsm.trip.triputils.ImgUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lsm
 * @Title:
 * @Description: (描述此类的功能)
 * @date 2017-04-06 14:09
 */
@Controller
@RequestMapping("/scane")
public class UserScaneController {
    @Autowired
    UserScaneService userScaneService;

    @RequestMapping(value = "/inter/addScaner", method = RequestMethod.POST)
    public String addUserScane(@RequestParam("sImgF") MultipartFile file, UserScane userScane, HttpServletRequest request) {
        String fileName=file.getOriginalFilename();
        String realPath=request.getServletContext().getRealPath("img");
        try {
            ImgUpload.uploadImg(fileName,realPath,file);
            UserShowInfo userShowInfo = (UserShowInfo) (request.getSession().getAttribute("userInfo"));
            userScane.setUid(userShowInfo.getUid());
            userScane.setsImg(fileName);
            userScaneService.insertScaner(userScane);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("发布景点失败");
        }

        return "writeScane";
    }

    @RequestMapping(value = "/getScane/{id}", method = RequestMethod.GET)
    public String getOneUserScane(@PathVariable("id") Integer id, ModelMap map) {
        try {
            UserScane userScane = userScaneService.getUserScaneById(id);
            map.addAttribute("userScane", userScane);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("查询景点失败...");
        }
        return "showscane";
    }

    @RequestMapping(value = "/inter/getScanes", method = RequestMethod.GET)
    public String getScanes(ModelMap map, HttpServletRequest request) {
        UserShowInfo user = (UserShowInfo) (request.getSession().getAttribute("userInfo"));

        try {
            List<UserScane> scanes=userScaneService.getUserScanesByUid(user.getUid());
            map.addAttribute("scanes",scanes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "showScanes";
    }
}
