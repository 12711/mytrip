/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service;

import com.lsm.trip.dto.Album;

import java.util.List;

/**
 * @Title: 用户相册
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-30 14:52
 */
public interface AlbumService {
    //添加相册
    void addAlbum(Album album) throws Exception;
    //通过id查询相册
    Album getAlbumByAId(Integer aid);
    //通过用户ID查询相册
    List<Album> getAlbumsByUid(Integer id)throws  Exception;
    //通过相册ID查询相册
    Album getAlbumByAlId(Integer id);
    //更新相册
    void updateAlbum(Album album);
    //通过hotnum排序查询相册
    List<Album> getAlbums();
    //点赞
    void updateAlbum(Integer id)throws Exception;
}
