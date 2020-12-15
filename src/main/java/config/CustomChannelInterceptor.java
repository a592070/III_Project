package config;

import global.Constant;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.stereotype.Component;
import utils.SpringBeanUtil;

import javax.servlet.ServletContext;
import java.security.Principal;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Component
public class CustomChannelInterceptor implements ChannelInterceptor {
    Logger logger = LogManager.getLogger(this.getClass());

    @Autowired
    private ServletContext context;

    @Override
    public void afterSendCompletion(Message<?> message, MessageChannel channel, boolean sent, Exception ex) {

        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        StompCommand command = accessor.getCommand();
        if(StompCommand.DISCONNECT.equals(command)) {
            Principal user = accessor.getUser();
//            String userName = user != null ? user.getName() : "";

            if(user != null){
                String userName = user.getName();
//                logger.info(MessageFormat.format("用戶已斷開連接", userName));
                logger.info("用戶已斷開連接" + userName);

                Object stompUsers = context.getAttribute(Constant.STOMP_USERS);
                if(stompUsers != null){
//                    Map<String, StompPrincipal> users = (Map<String, StompPrincipal>) stompUsers;
//                    users.keySet().removeIf(key -> key.contains(userName));

                    Set<StompPrincipal> users = ( Set<StompPrincipal>) stompUsers;
                    users.removeIf(ele -> userName.equals(ele.getName()));

                    context.setAttribute(Constant.STOMP_USERS, users);
                }
            }
        }
    }
}
