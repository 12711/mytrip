/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.controllers;

import com.lsm.trip.dto.Album;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.AlbumService;
import com.lsm.trip.service.impl.AlbumServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lsm
 * @Title: 相册控制器
 * @Description: (描述此类的功能)
 * @date 2017-03-30 14:57
 */
@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    AlbumService albumService;
    @RequestMapping(value = "/inter/createAlbum",method = RequestMethod.GET)
    @ResponseBody
    public String addAlbum(Album album, HttpSession session) {
        if(album.getName()==null){
            return "0:相册名为空";
        }
        UserShowInfo userShowInfo=(UserShowInfo)session.getAttribute("userInfo");
        try {
            album.setUid(userShowInfo.getUid());
            albumService.addAlbum(album);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("新建相册失败...");
            return "0:服务器异常";
        }
        return "1";
    }
    @RequestMapping(value = "/inter/getAlbums")
    public String getAlbums(HttpSession session,ModelMap map){
        UserShowInfo userShowInfo=(UserShowInfo)session.getAttribute("userInfo");
        List<Album> albums=null;
        try {
            albums=albumService.getAlbumsByUid(userShowInfo.getUid());
            map.put("albums",albums);
        } catch (Exception e) {
            System.out.println("获取相册失败，请稍后再试！");
            e.printStackTrace();
        }
        return "album";
    }

    @RequestMapping(value = "/updateAlbum/{id}",method = RequestMethod.POST)
    @ResponseBody
    public String updateHotnum(@PathVariable("id") Integer id){

        try {
            albumService.updateAlbum(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("更新album,hotnum失败");
            return "0";
        }
    }

    @RequestMapping(value = "/batchDeleteAlbum",method = RequestMethod.POST)
    @ResponseBody
    public String [] batchDeleteAlbum(@RequestParam("ids") String ids){
        System.out.print("ids=="+ids);
        String [] id=ids.split(",");
        String [] hasDelete=new String[2];
        hasDelete[0]="";
        for(String id1:id) {
            try {
                albumService.deleteAlbum(Integer.parseInt(id1));
                //封装已经删除的相册ID
                hasDelete[0]+=id1+",";
            } catch (Exception e) {
                e.printStackTrace();
                //表示删除出现异常
                hasDelete[1]+="0";
            }
        }
        return hasDelete;
    }

    @RequestMapping(value = "/updateAlbum",method = RequestMethod.POST)
    public String updateAlbum(Album album){
      System.out.println("album.name---"+album.getName());
        try {
            albumService.updateAlbumAll(album);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:inter/getAlbums";
    }
}
