/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.dto;

/**
 * @Title: 分页工具类
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-04-11 15:06
 */
public class PageHelpPojo <T>{
    private Integer pageIndex;
    private Integer pageSize;
    private T param;
    private T type;

    public T getType() {
        return type;
    }

    public void setType(T type) {
        this.type = type;
    }

    public Integer getPageIndex() {
        return (pageIndex-1)*(pageSize);
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public T getParam() {
        return param;
    }

    public void setParam(T param) {
        this.param = param;
    }
}
