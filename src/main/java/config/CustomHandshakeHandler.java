package config;

import global.Constant;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;
import rambo0021.pojo.AccountBean;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.text.MessageFormat;
import java.util.*;

@Component
public class CustomHandshakeHandler extends DefaultHandshakeHandler {

    Logger logger = LogManager.getLogger(this.getClass());

    @Autowired
    private ServletContext context;

    @Override
    protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {
        ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
        HttpSession session = servletRequest.getServletRequest().getSession();

        Object stompUsers = context.getAttribute(Constant.STOMP_USERS);
//        Map<String, StompPrincipal> users = (Map<String, StompPrincipal>) (stompUsers==null ? new HashMap<String, StompPrincipal>() : stompUsers);

        Set<StompPrincipal> users = (Set<StompPrincipal>) (stompUsers==null ? new HashSet<>() : stompUsers);

        if (session != null) {
            // 如果有登入 使用username
            // 沒有登入 使用HttpSession id
            AccountBean adminSession = (AccountBean) session.getAttribute(Constant.ADMIN_LOGIN_SESSION);
            AccountBean normalSession = (AccountBean) session.getAttribute(Constant.USER_LOGIN_SESSION);

            AccountBean loginUser = null;
            if(adminSession != null || normalSession != null){
                loginUser = adminSession!=null ? adminSession : normalSession;

//                StompPrincipal storeUser = users.get("user/" + loginUser.getUserName());
//                StompPrincipal stompPrincipal = storeUser != null ? storeUser: new StompPrincipal(loginUser.getUserName());
//                users.put("user/"+stompPrincipal.getName(), stompPrincipal);

                AccountBean finalLoginUser = loginUser;
                StompPrincipal stompPrincipal = users.stream().filter(ele -> ele.getName().equals(finalLoginUser.getUserName())).findFirst().orElse(new StompPrincipal(loginUser.getUserName()));

                stompPrincipal.setGroup(StompPrincipal.GROUP_USER);
                users.add(stompPrincipal);

                context.setAttribute(Constant.STOMP_USERS, users);
                logger.info("用戶已建立連接" + stompPrincipal.getName());
                logger.info("用戶數量" + users.size());
                return stompPrincipal;
            }else{

//                StompPrincipal storeUser = users.get("guest/" + session.getId());
//                StompPrincipal stompPrincipal = storeUser != null ? storeUser: new StompPrincipal(session.getId());
//                users.put("guest/"+stompPrincipal.getName(), stompPrincipal);

                StompPrincipal stompPrincipal = users.stream().filter(ele -> ele.getName().equals(session.getId())).findFirst().orElse(new StompPrincipal(session.getId()));

                stompPrincipal.setGroup(StompPrincipal.GROUP_GUEST);
                users.add(stompPrincipal);

                context.setAttribute(Constant.STOMP_USERS, users);

                logger.info("用戶已建立連接" + stompPrincipal.getName());
                logger.info("用戶數量" + users.size());
                return stompPrincipal;
            }

//            StompPrincipal stompPrincipal = new StompPrincipal(NotifyUtil.notifyUserName(session));
//            return stompPrincipal;
        }
        return null;
    }
}
