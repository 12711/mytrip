package com.lsm.trip.controllers;

import com.lsm.trip.dto.User;
import com.lsm.trip.dto.UserInfo;
import com.lsm.trip.dto.UserLog;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.AlbumService;
import com.lsm.trip.service.UserInfoService;
import com.lsm.trip.service.UserLogService;
import com.lsm.trip.service.UserService;
import com.mysql.jdbc.StringUtils;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by LSM on 2017/2/10.
 * User的控制器
 */
@Controller
@RequestMapping(value = "/user")
@SessionAttributes({"userInfo"})
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    UserLogService userLogService;
    @Autowired
    AlbumService albumService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String toIndex(HttpServletRequest request, ModelMap map) {
        String info = (String) request.getSession().getAttribute("loginErrorInfo");
        request.getSession().setAttribute("loginErrorInfo",null);
        if (!StringUtils.isNullOrEmpty(info)) {
            map.addAttribute("loginErrorInfoFR", info);
        }
        map.addAttribute("album",albumService.getAlbums());
        return "main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    @ResponseBody
    public String login(User user, Model model) throws Exception {
        System.out.println("user==" + user);
        User result = userService.login(user);
        if (result == null) {
            //登录失败
            return "0";
        } else {
            //登录成功
            UserShowInfo userShowInfo = userService.getUserInfo(result.getUid());
            System.out.print("pro===="+userShowInfo.getProvince());
            model.addAttribute("userInfo", userShowInfo);
            return "1";
        }

    }


    /*用户查看详细信息*/
    @RequestMapping(value = "/inter/showUserInfo", method = RequestMethod.GET)
    public String showUserInfo() {
        return "showUserInfo";
    }

    /*修改头像*/
    @RequestMapping(value = "/inter/changeImg", method = RequestMethod.POST)
    public String changImg(@RequestParam("pig") MultipartFile file, HttpServletRequest request, Model model) {
        System.out.println("file" + file.getName());
        String realDir = request.getServletContext().getRealPath("img");
        String realName1 = file.getOriginalFilename();
        String realName = null;
        try {
            realName = new String(realName1.getBytes("GBK"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            model.addAttribute("errorInfo", "修改失败!");
            e.printStackTrace();
        }
        UserShowInfo user = null;
        if (file != null) {
            try {
                //将图片保存到服务器
                Streams.copy(file.getInputStream(), new FileOutputStream(new File(realDir + "\\" + realName)), true);
                //将图片名保存到数据库
                HttpSession session = request.getSession();
                user = (UserShowInfo) session.getAttribute("userInfo");
                System.out.println("get user" + user.getUid());
                //将图片插入到指定的记录
                try {
                    userService.changImg(realName, user.getUid());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                user.setMypig(realName);
                session.setAttribute("userInfo", user);

            } catch (IOException e) {
                System.out.println("上传失败");
                e.printStackTrace();
            }
        }
        return "redirect:showUserInfo";
    }

    /*跳转注册页面*/
    @RequestMapping(value = "/toregist", method = RequestMethod.GET)
    public String toRegist() {
        return "regist";
    }

    /*注册*/
    @RequestMapping(value = "/regist", method = RequestMethod.POST)
    public String regist(UserShowInfo userShowInfo, ModelMap model) {
        System.out.println(userShowInfo.getUserName() + ":" + userShowInfo.getPassWord() + ":" + userShowInfo.getSex());

        User user = new User();
        user.setUserName(userShowInfo.getUserName());
        user.setPassWord(userShowInfo.getPassWord());
        try {
            userService.regist(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

      /*获取用户id以便于插入一条心的userinfo记录*/
        Integer uid = user.getUid();
        UserInfo userInfo = new UserInfo();
        userInfo.setuId(uid);
        userInfo.setPhone(userShowInfo.getPhone());
        userInfo.setSex(userShowInfo.getSex());
        try {
            userInfoService.addUserInfo(userInfo);
            return "redirect:index";
        } catch (Exception e) {
            e.printStackTrace();
            model.put("errInfo", "服务器神游中...");
            return "regist";
        }

    }

    /*注册时检查用户名是否存在*/
    @RequestMapping(value = "/checkUserName/{name}", method = RequestMethod.GET)
    @ResponseBody
    public String checkUserName(@PathVariable("name") String name) {
        System.out.println("name=" + name);
        User user = null;
        try {
            user = userService.checkUserByName(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (user == null) {
            return "1";
        } else {
            return "0";
        }
    }

    /*注销用户*/
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, ModelMap modelMap) {
        HttpSession session = request.getSession();
        session.removeAttribute("userInfo");
        modelMap.remove("userInfo");
        return "redirect:index";
    }

    //实时刷新热门日志
    @RequestMapping(value = "/getHotLog", method = RequestMethod.GET)
    @ResponseBody
    public List<UserLog> userLogList() {
        List<UserLog> userLogList = userLogService.getLogsOrderByHotNum();

        return userLogList;
    }

    //修改用户信息
    @RequestMapping(value = "/inter/updateUserInfo",method = RequestMethod.POST)
    public String updateInfo(UserShowInfo userShowInfo,ModelMap model,HttpServletRequest request){
        HttpSession session=request.getSession();
        Integer uid=((UserShowInfo)session.getAttribute("userInfo")).getUid();

        System.out.print("==uid="+uid);
        System.out.print("==UserShowInfo="+userShowInfo.getBirthday());
        try {
            userShowInfo.setUid(uid);
            userInfoService.updateUserInfo(userShowInfo);
            UserShowInfo userShowInfoAfterUpdate = userService.getUserInfo(uid);
            model.addAttribute("userInfo", userShowInfoAfterUpdate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "showUserInfo";
    }
    //更新用户账号密码
    @RequestMapping(value = "/inter/updateuser",method = RequestMethod.POST)
    @ResponseBody
    public String updateUser(User user,HttpServletRequest request,ModelMap modelMap){
         HttpSession session=request.getSession();
         UserShowInfo userShowInfo=(UserShowInfo) session.getAttribute("userInfo");
         user.setUid(userShowInfo.getUid());
        try {
            userService.updatePwd(user);
            session.removeAttribute("userInfo");
            modelMap.remove("userInfo");
            return "1";
        } catch (Exception e) {
            e.printStackTrace();

        }
        return "0";
    }

}
