package global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getRequestURI().contains("/admin/login")) {
            System.out.println("/login.do");
            return true;
        }

        HttpSession httpSession = request.getSession();
        if(httpSession.getAttribute("userinfo") != null){
            System.out.println("userinfo not null");
            return true;
        }

        request.getRequestDispatcher("/admin/login").forward(request,response);
        return false;
    }
}
