package com.lsm.trip.WebSocket;

import com.lsm.trip.dto.UserShowInfo;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by lv on 2017/5/9.
 */
public class WebSocketHandshakeInterceptor implements HandshakeInterceptor {
    @Override
    public boolean beforeHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Map<String, Object> map) throws Exception {

        System.out.println("--WebSocketHandshakeInterceptor--ju" );

        ServletServerHttpRequest request= (ServletServerHttpRequest)serverHttpRequest;
          //拿到session对象获取用户
          HttpSession session=request.getServletRequest().getSession();

          if(session!=null) {
              UserShowInfo userShowInfo = (UserShowInfo) session.getAttribute("userInfo");
              System.out.println("--WebSocketHandshakeInterceptor--" + userShowInfo.getUserName());
              map.put("uid",userShowInfo.getUid());
          }else {
              System.out.println("--WebSocketHandshakeInterceptor-- session is null");
          }

        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Exception e) {

    }
}
