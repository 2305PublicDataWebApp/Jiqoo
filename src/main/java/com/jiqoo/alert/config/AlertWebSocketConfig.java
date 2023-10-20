package com.jiqoo.alert.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.jiqoo.alert.controller.AlertHandler;

@Configuration
@EnableWebSocket
@EnableWebSocketMessageBroker
public class AlertWebSocketConfig implements WebSocketConfigurer {

	
    public AlertHandler alertHandler() {
        return new AlertHandler();
    }

	@Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(alertHandler(), "/alram")
                .addInterceptors(new HttpSessionHandshakeInterceptor())
                .withSockJS();
    }
}
