package azaz4498.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import azaz4498.model.Article;
import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;

@Controller@Lazy
@SessionAttributes(names = { "artBean","typeBean" })
public class ArticleController {
	@Autowired@Qualifier("ArticleService")
	ArticleService articleService;
	@Autowired@Qualifier("ArticleTypeService")
	ArticleTypeService articleTypeService;
	
	
	@RequestMapping(path = "/ArticleHomePage.controller")
	public String ForumEntry( ) {
		
		return "azaz4498/index";

	}
	
	@RequestMapping(path = "/Article.controller.json",method = RequestMethod.GET,produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<Article> showArticles() {
		List<Article> artList = articleService.showAllArticles();
//		Map<String, Object> map = new HashMap<>();
//		map.put("list",artList);
		return artList;

	}

	@RequestMapping(path = "/searchByUserId", method = RequestMethod.GET)
	public String DisplayById(@RequestParam(name = "userid") String userid, Model m) {
		
		m.addAttribute("artBean", articleService.searchByUserId(userid));
		return "azaz4498/index";
	}
	
	@RequestMapping(path = "/titleSearch")
	public String DisplayByTitle(@RequestParam(name = "title") String title, Model m) {
		m.addAttribute("artBean",articleService.searchByTitle(title));
		return "azaz4498/index";
	}
	@RequestMapping(path = "/artTypeSearch")
	public String DisplayByType(@RequestParam(name ="articleType" )int typeId,Model m) throws SQLException {
		m.addAttribute("artBean",articleService.showArticlesByType(typeId));
		m.addAttribute("typeBean",articleTypeService.showAllType());
		return "azaz4498/index";
		
	}

}
