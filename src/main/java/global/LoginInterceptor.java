package global;

import org.springframework.web.servlet.HandlerInterceptor;
import rambo0021.pojo.AccountBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println(request.getRequestURI());

        // 符合請求URI 可以通過 預設signin、login頁面可以通過
        if(request.getRequestURI().contains("/admin/signin") || request.getRequestURI().contains("/admin/login")) {
            return true;
        }

        HttpSession httpSession = request.getSession();
        AccountBean loginUser = (AccountBean) httpSession.getAttribute(Constant.ADMIN_LOGIN_SESSION);
        // 檢查session AccountBean是否存在，檢查身分
        if(loginUser != null){
//            System.out.println(loginUser.getUserName());
//            System.out.println(loginUser.getIdentityBean().getName());
            if(loginUser.getIdentityBean().getId() == 1) return true;
        }

        // 其他 導回 login頁面
        request.getRequestDispatcher("/admin/signin").forward(request,response);
        return false;
    }
}
