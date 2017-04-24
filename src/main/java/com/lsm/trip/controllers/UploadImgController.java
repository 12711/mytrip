/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.controllers;

import com.lsm.trip.dto.Album;
import com.lsm.trip.dto.Imges;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.AlbumService;
import com.lsm.trip.service.UserImgService;
import com.mysql.jdbc.StringUtils;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @author lsm
 * @Title: 图片上传
 * @Description: (描述此类的功能)
 * @date 2017-03-31 10:18
 */
@Controller
@RequestMapping("/img")
public class UploadImgController {
    @Autowired
    AlbumService albumService;
    @Autowired
    UserImgService userImgService;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public String bulk(@RequestParam("uid") Integer id, HttpServletRequest request, MultipartFile file) {
        System.out.println(file.getOriginalFilename() + "------id=" + id);
        String imgName = file.getOriginalFilename();
        String realPath = request.getServletContext().getRealPath("album");
        File file1 = new File("realPath");
        String path = realPath + "\\" + imgName;
        //将图片保存到服务器
        try {
            Streams.copy(file.getInputStream(), new FileOutputStream(new File(path)), true);
            Imges imges = new Imges();
            imges.setAlId(id);
            imges.setName(imgName);
            userImgService.addImges(imges);
            //保存第一张图片到相册的封面
            Album album = albumService.getAlbumByAlId(id);
            if (album != null) {
                if (StringUtils.isNullOrEmpty(album.getCover())) {
                    album.setCover(imgName);
                    albumService.updateAlbum(album);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("上传图片失败!");
        }

        return "1";
    }

    @RequestMapping(value = "/toUploadPic", method = RequestMethod.GET)
    public String testTest(HttpSession session, ModelMap map) {
        UserShowInfo userShowInfo = (UserShowInfo) session.getAttribute("userInfo");
        List<Album> albums = null;
        try {
            albums = albumService.getAlbumsByUid(userShowInfo.getUid());
            map.put("albums", albums);
        } catch (Exception e) {
            System.out.println("获取相册失败，请稍后再试");
            e.printStackTrace();
        }
        return "imges";
    }

    @RequestMapping(value = "/showImg1/{id}", method = RequestMethod.GET)
    public String showImg1(@PathVariable("id") Integer id, @RequestParam("name") String name, ModelMap map) {
        System.out.println("name=" + name);
        List<Imges> imges = null;
        try {
            imges = userImgService.getImgesByAlId(id);
            Album album = albumService.getAlbumByAlId(id);
            map.put("imges", imges);
            map.put("name", name);
            map.put("album", album);
            map.put("alid",album.getId());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("服务器有问题");
        }
        return "showImg";
    }
   //普通查询相册
    @RequestMapping(value = "/showImg/{id}", method = RequestMethod.GET)
    public String showImg(@PathVariable("id") Integer id, ModelMap map) {
        List<Imges> imges = null;
        try {
            imges = userImgService.getImgesByAlId(id);
            map.put("imges", imges);
            Album album = albumService.getAlbumByAlId(id);
            map.put("album", album);
            map.put("name", null);
            map.put("alid",id);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("服务器有问题");
        }
        return "showImg";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String deleteImgByIds(@RequestParam("ids") String ids){
        String [] ides=ids.split(",");
        System.out.println(ides.length);
        for(String id:ides){
            System.out.println(id);
            try {
                userImgService.deleteByID(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("删除失败..."+e.getMessage());
                return "0";
            }
        }
    return "1";
    }
}
