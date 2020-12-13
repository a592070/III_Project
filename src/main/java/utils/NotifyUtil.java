package utils;

import config.StompPrincipal;
import global.Constant;
import rambo0021.pojo.AccountBean;

import javax.servlet.http.HttpSession;

public class NotifyUtil {

    public static String notifyUserName(HttpSession session){
        // 如果有登入 使用username
        // 沒有登入 使用HttpSession id
        AccountBean adminSession = (AccountBean) session.getAttribute(Constant.ADMIN_LOGIN_SESSION);
        AccountBean normalSession = (AccountBean) session.getAttribute(Constant.USER_LOGIN_SESSION);

        AccountBean loginUser = null;
        if(adminSession != null || normalSession != null){
            loginUser = adminSession!=null ? adminSession : normalSession;

            return loginUser.getUserName();
        }else{
            return session.getId();
        }
    }
}
