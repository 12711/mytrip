/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.service.impl;

import com.lsm.trip.dto.Album;
import com.lsm.trip.mappers.UserAlbumMapper;
import com.lsm.trip.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title:
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-03-30 14:54
 */
@Service("albumService")
public class AlbumServiceImpl  implements AlbumService{
    @Autowired
    UserAlbumMapper userAlbumMapper;
    @Override
    public void addAlbum(Album album) throws Exception{
       userAlbumMapper.addAlbum(album);
    }

    @Override
    public Album getAlbumByAId(Integer aid) {
        return null;
    }

    @Override
    public List<Album> getAlbumsByUid(Integer id)throws  Exception {
        return userAlbumMapper.getAlbumsByUid(id);
    }

    @Override
    public Album getAlbumByAlId(Integer id) {
        return userAlbumMapper.getAlbumByAlId(id);
    }

    @Override
    public void updateAlbum(Album album) {
        userAlbumMapper.updateAlbum(album);
    }

    @Override
    public List<Album> getAlbums() {
        return userAlbumMapper.getAlbums();
    }

    @Override
    public void updateAlbum(Integer id) throws Exception{
        userAlbumMapper.updateHotnum(id);
    }
}
