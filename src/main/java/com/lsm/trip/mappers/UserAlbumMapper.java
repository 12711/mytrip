/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.mappers;

import com.lsm.trip.dto.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Title: 用户相册
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-30 14:46
 */
public interface UserAlbumMapper {
    //添加相册
    void addAlbum(Album album) throws Exception;
    //通过id查询相册
    Album getAlbumByAId(@Param("id") Integer aid);
    //通过用户ID查询相册
    List<Album> getAlbumsByUid(@Param("id") Integer id);
    //通过相册id查询相册
    Album getAlbumByAlId(@Param("id") Integer id);
    //更新相册封面
    void updateAlbum(Album album) throws Exception;
    //通过hotnum排序查询相册
    List<Album> getAlbums();
    //修改相册hotnum
    void updateHotnum(@Param("id") Integer id) throws Exception;
    //查询某个用户的热门相册
    List<Album> getHotAlbumByUid(@Param("uid") Integer uid)throws Exception;
    //删除相册
    void deleteAlbum(@Param("aid") Integer aid)throws Exception;
    //更新相册标题,名字
    void updateAll(Album album)throws Exception;



}
