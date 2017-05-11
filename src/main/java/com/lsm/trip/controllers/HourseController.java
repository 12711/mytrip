package com.lsm.trip.controllers;

import com.lsm.trip.dto.Hourse;
import com.lsm.trip.dto.Imges;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.HourseService;
import com.lsm.trip.service.UserImgService;
import com.lsm.trip.triputils.ImgUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lv on 2017/5/11.
 */
@Controller
@RequestMapping(value = "/hourse")
public class HourseController {
    @Autowired
    HourseService hourseService;
    @Autowired
    UserImgService userImgService;
    @RequestMapping(value = "/inter/checkHasHourse",method = RequestMethod.GET)
    @ResponseBody
    public String checkHasHourse(HttpServletRequest request){
        HttpSession session=request.getSession();
        UserShowInfo userShowInfo=(UserShowInfo)session.getAttribute("userInfo");
        try {
           Hourse hourse=hourseService.getHourseByUid(userShowInfo.getUid());
            if(hourse==null){
                return "1";
            }else {
                return "2";
            }


        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }

    }

    @RequestMapping(value = "/inter/addhourse",method = RequestMethod.POST)
    public String addHourse(Hourse hourse, HttpServletRequest request, ModelMap map){

        System.out.println("--------------hourse====="+hourse.getContent());
        try {
            HttpSession session=request.getSession();
            UserShowInfo userShowInfo=(UserShowInfo)session.getAttribute("userInfo");
            hourse.setUid(userShowInfo.getUid());
            hourseService.addHourse(hourse);
            return "redirect:/hourse/inter/toShowHourse";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/user/index";
        }

    }
    @RequestMapping(value = "/inter/toShowHourse",method = RequestMethod.GET)
    public String toShowHourse(HttpServletRequest request,ModelMap map){
        HttpSession session=request.getSession();
        UserShowInfo userShowInfo=(UserShowInfo)session.getAttribute("userInfo");
        try {
            Hourse hourse=hourseService.getHourseByUid(userShowInfo.getUid());
            List<Imges> imges=userImgService.getImgesByHid(hourse.getHid());
            TripController.getRankImg(userShowInfo);
            map.addAttribute("hourse",hourse);
            System.out.println("---hid----"+hourse.getHid());
            map.addAttribute("showRank",userShowInfo);
            map.addAttribute("imges",imges);
            return "showHourse";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/user/index";
        }
    }

    @RequestMapping(value = "/inter/toAddHourseImg",method = RequestMethod.GET)
    public String toAddHourseImg(@RequestParam("hid")Integer hid,ModelMap map){
        System.out.println("/inter/toAddHourseImg-----"+hid);
        map.addAttribute("hid",hid);
        return "hourserimg";
    }

    //上传住房照片
    @RequestMapping(value = "/addHourseImg",method = RequestMethod.POST)
    @ResponseBody
    public String addHourseImg(@RequestParam("uid") Integer id, HttpServletRequest request, MultipartFile file){
        String imgName = file.getOriginalFilename();
        String realPath = request.getServletContext().getRealPath("hourse");
        try {
            ImgUpload.uploadImg(imgName, realPath, file);
            Imges imges=new Imges();
            imges.setH_id(id);
            imges.setName(imgName);
            userImgService.addImges(imges);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException();
        }
        return "1";
    }
}
