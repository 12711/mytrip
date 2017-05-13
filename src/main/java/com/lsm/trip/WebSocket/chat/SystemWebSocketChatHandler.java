package com.lsm.trip.WebSocket.chat;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lsm.trip.dto.OrderScane;
import com.lsm.trip.service.OrderScaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lv on 2017/5/9.
 */
@Component("systemWebSocketChatHandler")
public class SystemWebSocketChatHandler implements WebSocketHandler {

    @Autowired
    private OrderScaneService orderScaneService;
    private  static  List<WebSocketSession> users;
    static {
        users =new ArrayList<>();
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {


    }

    @Override
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
     System.out.println("handleMessageChat------");
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
