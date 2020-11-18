package rambo0021.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import rambo0021.dao.SHA2DAO;
import rambo0021.pojo.AccountBean;
import rambo0021.pojo.IdentityBean;
import rambo0021.serive.AccountService;

@Controller
@Lazy
@SessionAttributes(names = { } )
@RequestMapping("/admin")
public class AdminSingController {
	@Autowired
	@Qualifier("accountService")
	private AccountService service;
	
	@RequestMapping(path = "/singin")
	public String singin() {
		
		return "rambo0021/adminSingin";
	}
	
	@RequestMapping(path = "/singup")
	public String singup() {
		
		return "rambo0021/adminSingup";
	}
	@RequestMapping(path = "/registered")
    public String registered(@RequestParam String username,@RequestParam String nickname,@RequestParam String password) {
		AccountBean aBean = new AccountBean();
		IdentityBean iBean = new IdentityBean();
		iBean.setId(1);
		aBean.setUserName(username);
		aBean.setNickName(nickname);
		aBean.setPassword(SHA2DAO.getSHA256(password));
		service.registered(aBean,iBean);
		return "redirect:/admin/singin";
	}
	@RequestMapping(path = "/login")
	 public String login(@RequestParam String username,@RequestParam String password,Model m) {
	   boolean status =	service.login(username,password);
	   if (status) {
		   return "redirect:/admin/accountPage";
	   }
	   Map<String, String> errorMsgMap = new HashMap<String, String>();
	   errorMsgMap.put("LoginError", "帳號或密碼錯誤");
	   m.addAttribute("ErrorMsgKey", errorMsgMap);
//	   return "redirect:/admin/singin";
	   return "rambo0021/adminSingin";
	}
}
