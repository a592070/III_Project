package azaz4498.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

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
import azaz4498.service.PictureService;

@Controller
@Lazy
@SessionAttributes(names = { "artBean", "typeBean" })
public class BackendController {
	@Autowired
	@Qualifier("ArticleService")
	ArticleService articleService;
	@Autowired
	@Qualifier("ArticleTypeService")
	ArticleTypeService articleTypeService;
	@Autowired
	PictureService pictureService;
	@Autowired
	private ServletContext context;

	@RequestMapping(path = "/previewTest")
	public String previewPageTest() {
		return "azaz4498/articlePreview";
	}

	@RequestMapping(path = "/admin/preview.controller", method = RequestMethod.POST)
	public String articlePreview(Model m, @RequestParam(name = "artTitle") String artTitle,
			@RequestParam(name = "artContent") String artContent, @RequestParam(name = "artUserid") String artUserid,
			@RequestParam(name = "artType") String artType) {
		m.addAttribute("artTitle", artTitle);
		m.addAttribute("artContent", artContent);
		m.addAttribute("artUserid", artUserid);
		m.addAttribute("artType", artType);

		return "azaz4498/articlePreview";

	}

	@RequestMapping(path = "/admin/Forum")
	public String ForumEntry(Model m) {
		m.addAttribute("artBean", articleService.showAllArticles());
		return "azaz4498/forumBackend";
	}

	@RequestMapping(path = "/admin/Article.controller.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> showArticles() {
		List<Article> artList = articleService.showAllArticles();
		return artList;

	}

	

	@RequestMapping(path = "/admin/artTypeSearch.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> dispalyByTypeJSON(@RequestParam(name = "articleType") Integer typeId)
			throws SQLException {
		List<Article> artList = articleService.showArticlesByType(typeId);
		return artList;
	}

	@RequestMapping(path = "/admin/articleSearch.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> DisplayJSONResults(
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "articleType", defaultValue = "", required = false) Integer articleType) {
		List<Article> artList = articleService.searchArticles(keyword, articleType);
		return artList;
	}

	@RequestMapping(path = "/admin/editPage.controller")
	public String EditPage(@RequestParam(name = "artId") Integer articleId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticleById(articleId));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/admin/newArticlePage.controller")
	public String newArticlePage() {
		return "azaz4498/newArticle_backend";
	}

	@RequestMapping(path = "/admin/edit.controller", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, @RequestParam(name = "artId") Integer articleId,
			@RequestParam(name = "userid") String userid, @RequestParam(name = "typeSelect") Integer typeId, Model m)
			throws SQLException {
		articleService.articleEdit(title, content, articleId, userid, typeId);
		m.addAttribute("artBean", articleService.showArticleById(articleId));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/admin/newArticle.controller", method = RequestMethod.POST)
	public String newArticleBackend(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, @RequestParam(name = "typeSelect") Integer typeId,
			Model m) throws SQLException {
		String userid = "Admin";
		Article article = articleService.newArticle(title, typeId, content, userid);
		Integer id = article.getArtId();
		m.addAttribute("artBean", articleService.showArticleById(id));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/admin/delete.controller", method = RequestMethod.POST)
	public List<Article> Delete(@RequestParam(name = "artId") Integer articleId, Model m) {
		articleService.deleteArticleByAdmin(articleId);
		List<Article> artList = articleService.showAllArticles();
		return artList;
	}

	@RequestMapping(path = "/admin/statusChange.controller", method = RequestMethod.POST)
	public String statusChange(@RequestParam(name = "artId") Integer articleId) {
		articleService.switchStatus(articleId);

		return "redirect:/admin/Forum";
	}


}
