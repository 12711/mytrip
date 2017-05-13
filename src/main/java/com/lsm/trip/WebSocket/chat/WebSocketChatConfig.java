package com.lsm.trip.WebSocket.chat;

import com.lsm.trip.WebSocket.WebSocketHandshakeInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import javax.annotation.Resource;

/**
 * Created by lv on 2017/5/9.
 */
@Configuration

@EnableWebMvc
@EnableWebSocket
public class WebSocketChatConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {
    @Resource(name = "systemWebSocketChatHandler")
    WebSocketHandler systemWebSocketChatHandler;
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(systemWebSocketChatHandler,"/webSocketChatServer").addInterceptors(new WebSocketHandshakeChatInterceptor());

        registry.addHandler(systemWebSocketChatHandler, "/sockjs/webSocketChatServer").addInterceptors(new WebSocketHandshakeChatInterceptor())
                .withSockJS();
    }

    /*@Bean
    public WebSocketHandler systemWebSocketHandler(){
        return new SystemWebSocketHandler();
    }
*/
}
