package rambo0021.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import rambo0021.dao.SHA2DAO;
import rambo0021.dao.VerifyRecaptcha;
import rambo0021.pojo.AccountBean;
import rambo0021.pojo.IdentityBean;
import rambo0021.serive.AccountService;

@Controller
@Lazy
@SessionAttributes(names = { "adminBean" })
@RequestMapping("/admin")
public class AdminSignController {
	@Autowired
	@Qualifier("accountService")
	private AccountService service;

	@RequestMapping(path = "/signin")
	public String signin() {

		return "rambo0021/adminSignin";
	}

	@RequestMapping(path = "/signup")
	public String signup() {

		return "rambo0021/adminSignup";
	}

	@RequestMapping(path = "/registered")
	public String registered(@RequestParam String username, @RequestParam String nickname,
			@RequestParam String password) {
		AccountBean aBean = new AccountBean();
		IdentityBean iBean = new IdentityBean();
		iBean.setId(1);
		aBean.setUserName(username);
		aBean.setNickName(nickname);
		aBean.setPassword(SHA2DAO.getSHA256(password));
		service.registered(aBean, iBean);
		return "redirect:/admin/signin";
	}

	@RequestMapping(path = "/login")
	public String login(@RequestParam String username, @RequestParam String password,
			 Model m) throws IOException {
//		boolean verify = VerifyRecaptcha.verify(recaptcha);
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		//機器人驗證，測試可以註解掉
//		if (!verify) {
//			errorMsgMap.put("LoginError", "驗證不通過");
//			m.addAttribute("ErrorMsgKey", errorMsgMap);
//			return "rambo0021/adminSignin";
//		}
        //-----------------
		String status = service.login(username, password);
		if ("登入成功".equals(status)) {
			AccountBean adminBean = service.userDetail(username);
			m.addAttribute("adminBean", adminBean);
			return "redirect:/admin/accountPage";
		}
		errorMsgMap.put("LoginError", status);
		m.addAttribute("ErrorMsgKey", errorMsgMap);
		return "rambo0021/adminSignin";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, SessionStatus sessionStatus) {
		session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/admin/signin";
	}

}
