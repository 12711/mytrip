/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.dto;

import java.util.List;

/**
 * @Title:
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-04-11 15:58
 */
public class PageResponsePojo<T> {
    private Integer totle;
    private String message;
    private List<T> rows;

    public Integer getTotle() {
        return totle;
    }

    public void setTotle(Integer totle) {
        this.totle = totle;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
