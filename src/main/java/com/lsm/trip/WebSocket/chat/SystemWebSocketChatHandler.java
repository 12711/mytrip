package com.lsm.trip.WebSocket.chat;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lsm.trip.dto.OrderScane;
import com.lsm.trip.dto.UserShowInfo;
import com.lsm.trip.service.OrderScaneService;
import com.lsm.trip.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.*;

/**
 * Created by lv on 2017/5/9.
 */
@Component("systemWebSocketChatHandler")
public class SystemWebSocketChatHandler implements WebSocketHandler {

    @Autowired
    private OrderScaneService orderScaneService;
    @Autowired
    private UserService userService;
    private  static  List<WebSocketSession> users;
    static {
        users =new ArrayList<>();
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        users.add(webSocketSession);
        System.out.println("当前有多少个用户登录---"+users.size());
        System.out.println("登陆后当前登录id---"+webSocketSession.getAttributes().get("uid"));

    }

    @Override
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
     System.out.println("handleMessageChat------"+webSocketMessage.getPayload());
     String messageInfoString=(String)webSocketMessage.getPayload();
     String [] messageInfo=messageInfoString.split("&&");
     Integer touid=Integer.parseInt(messageInfo[1]);
     Integer myid=Integer.parseInt(messageInfo[2]);
     UserShowInfo userShowInfo=userService.getUserInfo(myid);
     TextMessage toUserMassage=new TextMessage(messageInfo[0]+":::"+myid+":::"+userShowInfo.getUserName());
        System.out.println("当前有多少个用户登录---"+users.size());
        if((int)webSocketSession.getAttributes().get("flag")==0){
            for(WebSocketSession user:users){
                Integer touidForms=(Integer)user.getAttributes().get("uid");
                if(touidForms.equals(touid)){
                    user.sendMessage(toUserMassage);
                    webSocketSession.getAttributes().put("flag",1);
                    return;
                }
            }
        }else{
            for(WebSocketSession user:users){
                if((int)user.getAttributes().get("to")==myid&&(int)user.getAttributes().get("uid")==touid){
                    user.sendMessage(toUserMassage);
                    return;
                }
            }
        }
        for(WebSocketSession user:users){
            if(myid==((Integer) user.getAttributes().get("uid"))){
                user.sendMessage(new TextMessage("-1"));
                return;
            }
        }

    }

    @Override
    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {

    }

    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
        users.remove(webSocketSession);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    //发送给指定用户
    public void sendMessageToUser(String userName, TextMessage message) {
        for (WebSocketSession user : users) {
            System.out.println("----发送给"+user.getAttributes().get("uid")+"----"+userName);

            Integer uId=Integer.parseInt(userName);
            System.out.println(user.getAttributes().get("uid")==uId);
            if (user.getAttributes().get("uid")==uId) {
                System.out.println("----user.isOpen()---"+user.isOpen());
                try {
                    System.out.println("----user.isOpen()---"+user.isOpen());
                    if (user.isOpen()) {
                        System.out.println("----发送给li"+user.getAttributes().get("uid")+"----");

                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }
}
