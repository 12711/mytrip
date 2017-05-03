package com.lsm.trip.controllers;

import com.lsm.trip.triputils.Verification;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * Created by lv on 2017/5/3.
 */
@Controller
@RequestMapping("/code")
public class UtilController {
    @RequestMapping(value = "/getCodeImg")
    public void getCodeImg(HttpServletResponse response, HttpServletRequest request){

        System.out.println("验证码进来了.....");
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        //得带随机的验证码文字
        String code=Verification.getRandCode(5);

        HttpSession session=request.getSession();
        session.setAttribute("code",code);
        System.out.println("code=="+session.getAttribute("code"));
        //得到验证码图片
        BufferedImage codeImg= Verification.getImage(100,30,code,10);
        try {
            //将图片流化到output这个字符流中
            ImageIO.write(codeImg,"png",output);
            response.setContentType("image/png");
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping(value = "/checkCode")
    @ResponseBody
    public String test(@RequestParam("code") String code,HttpServletRequest request){
        System.out.println("dgfsafgag test-----"+code);
        HttpSession session=request.getSession();
        String codeInSession=(String) session.getAttribute("code");
        if(codeInSession.equalsIgnoreCase(code)){
            return "1";
        }else{
            return "0";
        }

    }
}
