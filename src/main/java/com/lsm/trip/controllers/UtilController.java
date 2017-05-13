package com.lsm.trip.controllers;

import com.lsm.trip.triputils.Verification;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLEncoder;

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


    @RequestMapping("/down")
    public void down(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "filename",defaultValue = "") String fileName1) throws Exception{
        if(StringUtils.isBlank(fileName1)){
            fileName1="家庭互助旅游安全责任书.docx";
        }
        //模拟文件，myfile.txt为需要下载的文件
        String fileName = request.getSession().getServletContext().getRealPath("zerenshu")+"/"+fileName1;

        System.out.println("下载文件name---------"+fileName);
        String [] name=fileName.split("/");
        System.out.println("下载文件name---------"+name[1]);
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        /*//设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename="+name[1]);*/
        if(request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {
            response.setHeader("Content-Disposition","attachment;"+ "filename="+ new
                    String(name[1].getBytes("GBK"),"ISO8859-1"));
        }else{//firefox、chrome、safari、opera
            response.setHeader("Content-Disposition","attachment;"+
                    "filename="+ new String(name[1].getBytes("UTF8"), "ISO8859-1") );
        }
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }
}

