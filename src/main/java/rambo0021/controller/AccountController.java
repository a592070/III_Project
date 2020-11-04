package rambo0021.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;

@Controller
@SessionAttributes (names = "userList")
public class AccountController {
	@Autowired@Qualifier("accountService")
	private AccountService service;
	@RequestMapping(path = "/accountPage")
   public String ShowAccountList(Model m) {
	   List<AccountBean> userList = service.userList();
       m.addAttribute("userList", userList);
       return "rambo0021/account_index";
   }
}
