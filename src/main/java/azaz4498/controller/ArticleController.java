package azaz4498.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import azaz4498.service.ArticleService;

@Controller
@SessionAttributes(names = { "artBean" })
public class ArticleController {
	@RequestMapping(path = "/Article.controller")
	public String showArticles(Model m) {
		ArticleService articleService = new ArticleService();
		m.addAttribute("artBean", articleService.showAllArticles());

		return "azaz4498/index";

	}

	@RequestMapping(path = "/searchByUserId",method = RequestMethod.GET)
	public String DisplayByTitle(@RequestParam(name = "userid") String userid,Model m) {
		ArticleService articleService = new ArticleService();
		
		m.addAttribute("artBean",articleService.searchByUserId(userid));
		return "index";
	}
	
}
