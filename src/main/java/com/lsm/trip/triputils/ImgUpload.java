/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.triputils;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * @Title:
 * @Description: 图片上传工具方法
 * @author lsm
 * @date 2017-04-06 19:24
 */
public class ImgUpload {
  public static void uploadImg(String fileName,String realPath,MultipartFile file){
      String path=realPath+"\\"+fileName;

      try {
          Streams.copy(file.getInputStream(),new FileOutputStream(new File(path)),true);
      } catch (IOException e) {
          e.printStackTrace();
          throw new RuntimeException(e);
      }

  }
}
