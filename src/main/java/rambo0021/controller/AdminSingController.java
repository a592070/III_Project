package rambo0021.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String login() {
		
		return "rambo0021/adminSingup";
	}

}
