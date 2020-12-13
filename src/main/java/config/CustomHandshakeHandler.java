package config;

import global.Constant;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;
import rambo0021.pojo.AccountBean;
import utils.NotifyUtil;
import utils.StringUtil;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Map;
import java.util.UUID;

public class CustomHandshakeHandler extends DefaultHandshakeHandler {
    @Override
    protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler, Map<String, Object> attributes) {
        ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
        HttpSession session = servletRequest.getServletRequest().getSession();

        if (session != null) {
            // 如果有登入 使用username
            // 沒有登入 使用HttpSession id
//            AccountBean adminSession = (AccountBean) session.getAttribute(Constant.ADMIN_LOGIN_SESSION);
//            AccountBean normalSession = (AccountBean) session.getAttribute(Constant.USER_LOGIN_SESSION);
//
//            AccountBean loginUser = null;
//            if(adminSession != null || normalSession != null){
//                loginUser = adminSession!=null ? adminSession : normalSession;
//
//                return new StompPrincipal(loginUser.getUserName());
//            }else{
//                return new StompPrincipal(session.getId());
//            }
            return new StompPrincipal(NotifyUtil.notifyUserName(session));
        }
        return new StompPrincipal(UUID.randomUUID().toString());
    }

}
