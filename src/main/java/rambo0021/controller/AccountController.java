package rambo0021.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;

@Controller
public class AccountController {
	@Autowired@Qualifier("accountService")
	private AccountService service;
   public String ShowAccountList(Model m) {
	   List<AccountBean> userList = service.userList();
       m.addAttribute("userList", userList);
       return "rambo0021/account_index";
   }
}
