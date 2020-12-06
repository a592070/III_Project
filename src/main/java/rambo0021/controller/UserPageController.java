package rambo0021.controller;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@Lazy
@SessionAttributes(names = { "" })
@RequestMapping("/user")
public class UserPageController {
	
	@GetMapping("/registrationPage")
	public String registrationPage() {
		return "rambo0021/userSingup";
	}

}
