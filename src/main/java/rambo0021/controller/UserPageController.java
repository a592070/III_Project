package rambo0021.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;
import utils.StringUtil;

@Controller
@Lazy
@SessionAttributes(names = { "reqURL","userBean" })
@RequestMapping("/user")
public class UserPageController {
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	@Qualifier("accountService")
	private AccountService service;
	
	
	@RequestMapping("/registrationPage")
	public String registrationPage() {
	  
		return "rambo0021/userSingup";
	}
	
	@RequestMapping("/singinPage")
	public String singinPage(HttpServletRequest req,Model m) {
		
		 System.out.println("登入前攔截");
		 String reqURL = req.getHeader("Referer");
		 System.out.println("reqURL333="+reqURL);
		 if(reqURL==null ) {
			
			 System.out.println("req.getContextPath()"+req.getContextPath());
			 reqURL=req.getRequestURL().toString().replace("user/singinPage", "FunTaiwan");
		 }else if(reqURL.contains("/user/registrationPage")) {
			 System.out.println("前頁註冊");
			 reqURL=reqURL.toString().replace("user/registrationPage", "FunTaiwan");
		 }
		 System.out.println("reqURL="+reqURL);
		m.addAttribute("reqURL", reqURL);
		return "rambo0021/userSingin";
	}
	@RequestMapping("/userProfilePage")
	public String userProfilePage(@ModelAttribute("userBean") String username,Model m) {
		AccountBean aBean = service.userDetail(username);		
		m.addAttribute("aBean", aBean);
		return "rambo0021/userProfile";
	}

}
