package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(echoHandler(), "/websocket/echoHandler").addInterceptors(new SpringWebSocketHandlerInterceptor());

        registry.addHandler(echoHandler(), "/sockjs/echoHandler").addInterceptors(new SpringWebSocketHandlerInterceptor()).withSockJS();

    }

    @Bean
    public EchoHandler echoHandler(){
        return new EchoHandler();
    }

}
