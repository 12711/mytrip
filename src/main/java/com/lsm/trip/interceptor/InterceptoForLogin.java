/**
 * Copyright (C) HAND Enterprise Solutions Company Ltd.
 * All Rights Reserved
 */
package com.lsm.trip.interceptor;

import com.lsm.trip.dto.User;
import com.lsm.trip.dto.UserShowInfo;
import com.mysql.jdbc.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @Title: 检查发送指定请求时是否登录
 * @Description: (描述此类的功能)
 * @author lsm
 * @date 2017-04-05 9:14
 */
public class InterceptoForLogin implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("拦截器触发....");
        String path=request.getServletPath();
        HttpSession session=request.getSession();
        session.setAttribute("thePath",path);
        //获取session中的user是否为null
        UserShowInfo user=(UserShowInfo)session.getAttribute("userInfo");
        if(user==null){
            System.out.println("你未登录请先登录.....");
            request.getSession().setAttribute("loginErrorInfo","请先登录...");
            response.sendRedirect("/user/index");
            return false;
        }
        String pathTwo=(String) session.getAttribute("thePath");
        if(!StringUtils.isNullOrEmpty(pathTwo)){
            System.out.println("-----将缓存的path清空------");
            session.setAttribute("thePath",null);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
