package azaz4498.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import azaz4498.model.Article;
import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;

@Controller
@Lazy
@SessionAttributes(names = { "artBean", "typeBean" })
public class ArticleController {
	@Autowired
	@Qualifier("ArticleService")
	ArticleService articleService;
	@Autowired
	@Qualifier("ArticleTypeService")
	ArticleTypeService articleTypeService;

	@RequestMapping(path = "/Forum")
	public String ForumEntry(Model m) {
		m.addAttribute("artBean", articleService.showAllArticles());
		return "azaz4498/F_index";

	}

	@RequestMapping(path = "/Article.controller.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> showArticles() {
		List<Article> artList = articleService.showAllArticles();
//		Map<String, Object> map = new HashMap<>();
//		map.put("list",artList);
		return artList;

	}

	@RequestMapping(path = "/searchByUserId", method = RequestMethod.GET)
	public String DisplayById(@RequestParam(name = "userid") String userid, Model m) {

		m.addAttribute("artBean", articleService.searchByUserId(userid));
		return "azaz4498/F_index";
	}

	@RequestMapping(path = "/titleSearch")
	public String DisplayByTitle(@RequestParam(name = "title") String title, Model m) {
		m.addAttribute("artBean", articleService.searchByTitle(title));
		return "azaz4498/F_index";
	}

	@RequestMapping(path = "/artTypeSearch")
	public String DisplayByType(@RequestParam(name = "articleType") int typeId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticlesByType(typeId));
		m.addAttribute("typeBean", articleTypeService.showAllType());
		return "azaz4498/F_index";

	}

	@RequestMapping(path = "/articleSearch")
	public String DisplayResults(@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			Model m) {

		m.addAttribute("artBean", articleService.searchArticles(keyword));

		return "azaz4498/F_index";

	}

	@RequestMapping(path = "/editPage.controller")
	public String EditPage(@RequestParam(name = "artId") int articleId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticleById(articleId));

		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/edit.controller", method = RequestMethod.POST)
	public ModelAndView Edit(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, @RequestParam(name = "artId") int articleId,
			@RequestParam(name = "userid") String userid, @RequestParam(name = "typeSelect") int typeId, Model m,
			RedirectAttributes rdattr) throws SQLException {

		articleService.articleEdit(title, content, articleId, userid, typeId);
		ModelAndView mv = new ModelAndView("redirect:/Forum");

		return mv;
	}

	@RequestMapping(path = "/delete.controller", method = RequestMethod.POST)
	public ModelAndView Delete(@RequestParam(name = "artId") int articleId, Model m) {
		articleService.deleteArticleByAdmin(articleId);
		ModelAndView mv = new ModelAndView("redirect:/Forum");

		return mv;

	}

	@RequestMapping(path = "/insertJson")
	public void JsonInsert() throws SQLException, JsonProcessingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(new File("C:/Lab2Workspace/_tainan.json"));
		java.util.List<String> titles = node.findValuesAsText("art_title");
		java.util.List<String> types = node.findValuesAsText("art_type");
		java.util.List<String> users = node.findValuesAsText("art_userid");
		for (int i = 0; i < titles.size(); i++) {
			String title = titles.get(i);
			String userId = users.get(i);
			String content = "測試文章暫不提供內文";
			int typeId = 0;
			String type = types.get(i);
			switch (type) {
			case "遊記":
				typeId = 1;
				break;
			case "住宿":
				typeId = 2;
				break;
			case "飲食":
				typeId = 3;
				break;
			case "景點":
				typeId = 4;
				break;
			case "交通":
				typeId = 5;
				break;
			case "行程":
				typeId = 6;
				break;
			case "購物":
				typeId = 7;
				break;
			case "其他":
				typeId = 0;
				break;

			default:
				typeId = 0;
				break;
			}
			articleService.newArticle(title, typeId, content, userId);
			System.out.println("新建文章成功");
		}

	}
}
