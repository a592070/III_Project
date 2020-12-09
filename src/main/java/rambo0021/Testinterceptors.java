package rambo0021;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class Testinterceptors implements HandlerInterceptor {
	
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		 System.out.println("登入前攔截");
//		 System.out.println("request.getHeader('Referer')="+request.getHeader("Referer"));
//		 System.out.println("----------------------");		 
		 return true;
	 }

}
