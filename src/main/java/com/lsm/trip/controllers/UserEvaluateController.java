package com.lsm.trip.controllers;

import com.lsm.trip.dto.PageHelpPojo;
import com.lsm.trip.dto.UserEvaluate;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.UserEvaluateService;
import com.lsm.trip.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lv on 2017/4/25.
 * 对用户的评价的控制器
 */
@Controller
@RequestMapping("/evaluate")
public class UserEvaluateController {
    @Autowired
    UserEvaluateService userEvaluateService;
    @Autowired
    UserService userService;


    @RequestMapping(value = "/inter/addevaluate")
    public String addEvaluate(@RequestParam("uid")Integer uid,@RequestParam("contentComment")String content ,HttpServletRequest request, ModelMap modelMap) {
        UserEvaluate userEvaluate=new UserEvaluate();
        userEvaluate.setUid(uid);
        userEvaluate.setContent(content);
        HttpSession session = request.getSession();
        UserShowInfo user = (UserShowInfo) session.getAttribute("userInfo");
        userEvaluate.setAuthor(user.getUserName());
        try {
            userEvaluateService.addUserEvaluate(userEvaluate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("uid", userEvaluate.getUid());
        return "forward:/evaluate/getEvaluateByPage";
    }

    @RequestMapping(value = "/getEvaluateByPage", method = RequestMethod.GET)
    public String getEvaluateByPage(@RequestParam(defaultValue = "1", name = "pageIndex") Integer pageIndex, ModelMap modelMap, HttpServletRequest request) {
        System.out.print("评论的参数是:" + pageIndex);
        Integer uid = (Integer) request.getSession().getAttribute("uid");

        PageHelpPojo<Integer> pageHelpPojo = new PageHelpPojo<Integer>();
        pageHelpPojo.setPageSize(4);
        pageHelpPojo.setPageIndex(pageIndex);
        pageHelpPojo.setParam(uid);

        modelMap.addAttribute("pageIndex", pageIndex);
        try {
            Integer totle = userEvaluateService.getCount(pageHelpPojo.getParam());
            List<UserEvaluate> evaluates = userEvaluateService.getEvaluateByPage(pageHelpPojo);
            UserShowInfo userShowInfo = userService.getUserInfo(uid);
            UserShowInfo userShowInfo1 = TripController.getRankImg(userShowInfo);
            modelMap.addAttribute("totle", totle%4==0?totle/4:totle/4+1);
            modelMap.addAttribute("evaluates", evaluates);
            modelMap.addAttribute("userShowInfo", userShowInfo1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "showonedzcomment";
    }

    @RequestMapping(value = "/getEvaluateByPage/{uid}", method = RequestMethod.GET)
    public String getSelfEvaluateByPage(@RequestParam(defaultValue = "1", name = "pageIndex") Integer pageIndex, @PathVariable("uid") Integer uid, ModelMap modelMap, HttpServletRequest request) {
        PageHelpPojo<Integer> pageHelpPojo = new PageHelpPojo<Integer>();
        pageHelpPojo.setPageSize(4);
        pageHelpPojo.setPageIndex(pageIndex);
        pageHelpPojo.setParam(uid);

        modelMap.addAttribute("pageIndex", pageIndex);
        try {
            Integer totle = userEvaluateService.getCount(pageHelpPojo.getParam());
            List<UserEvaluate> evaluates = userEvaluateService.getEvaluateByPage(pageHelpPojo);
            modelMap.addAttribute("totle", totle%4==0?totle/4:totle/4+1);
            modelMap.addAttribute("evaluates", evaluates);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "showUserInfoEveluate";
    }
}
