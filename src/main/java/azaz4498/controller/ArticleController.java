package azaz4498.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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
import azaz4498.model.ForumPage;
import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;
import azaz4498.service.PictureService;
import utils.PageSupport;

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
	@Autowired
	PictureService pictureService;
	@Autowired
	private ServletContext context;
	@Autowired
	private ForumPage forumPage;

	@RequestMapping(path = "/articleDetail.controller", method = RequestMethod.GET)
	public String articlePreview(Model m, @RequestParam(name = "artId") Integer artId) throws SQLException {
		List<Article> recentArticles = articleService.showRecentArticles();
		m.addAttribute("artList", articleService.showArticleById(artId));
		m.addAttribute("recentArt",recentArticles);
		return "azaz4498/articleDetail";

	}

	
	
	@RequestMapping(path = "/frontTest",produces = {
	"application/json; charset=UTF-8" })
	public String Forum() {
		return "azaz4498/forum";
	}
	@RequestMapping(path = "/Article.controller.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public String showArticles(Model m,@RequestParam(value = "currPage", defaultValue = "1")Integer currPage) {
		forumPage.setCurrentPage(currPage);
		forumPage.setTotalCount(articleService.getRecords());
		Integer records =forumPage.getPageSize();
		Integer totalPage = forumPage.getTotalPageCount();
		Integer index = (currPage-1)*records;
		List<Article> artList = articleService.showAvailableArticles(index, records);
		List<String> picList = articleService.getCoverPicList(artList);
		m.addAttribute("list",artList);
		m.addAttribute("picList", picList);
		m.addAttribute("totalPages", totalPage);
		m.addAttribute("currPage",currPage);
		System.out.println("=================");
		for (Article article : artList) {
			System.out.println(article.getArtCreTime());
		}
		System.out.println("=================");
		
		return "azaz4498/forum";
	}
	
	@RequestMapping(path = "/Article.pagincontroller.json", method = RequestMethod.GET, produces = {
		"application/json; charset=UTF-8" })
	public String ArticlePagin(Model m,@RequestParam(value = "currPage", defaultValue = "1")Integer currPage) {
	forumPage.setCurrentPage(currPage);
	forumPage.setTotalCount(articleService.getRecords());
	Integer records =forumPage.getPageSize();
	Integer totalPage = forumPage.getTotalPageCount();
	Integer index = (currPage-1)*records;
	List<Article> artList = articleService.showAvailableArticles(index, records);
	List<String> picList = articleService.getCoverPicList(artList);
	m.addAttribute("list",artList);
	m.addAttribute("picList", picList);
	m.addAttribute("totalPages", totalPage);
	m.addAttribute("currPage",currPage);
	
	return "azaz4498/articleGrid";
	}
	
	@RequestMapping(path = "/articleSearch.json", method = RequestMethod.GET, produces = {
	"application/json; charset=UTF-8" })
	public  String articleSearchFrontend(Model m,
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "articleType", defaultValue = "", required = false) Integer articleType,Integer currPage) {
		forumPage.setCurrentPage(currPage);
		forumPage.setTotalCount(articleService.getSearchRecords(keyword, articleType));
		Integer records =forumPage.getPageSize();
		Integer totalPage = forumPage.getTotalCount();
		Integer index = (currPage-1)*records;
		List<Article> artList = articleService.searchArticlesFrontend(keyword, articleType, index, records);
		List<String> picList = articleService.getCoverPicList(artList);
		m.addAttribute("list",artList);
		m.addAttribute("picList", picList);
		m.addAttribute("totalPages", totalPage);
		
		return "azaz4498/forum";
		
	}
	
	

	@RequestMapping(path = "/artTypeSearch.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> dispalyByTypeJSON(@RequestParam(name = "articleType") Integer typeId)
			throws SQLException {
		List<Article> artList = articleService.showArticlesByType(typeId);
		return artList;
	}


	@RequestMapping(path = "/editPage.controller")
	public String EditPage(@RequestParam(name = "artId") Integer articleId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticleById(articleId));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/newArticlePage.controller")
	public String newArticlePage() {

		return "azaz4498/newArticle_backend";
	}

	@RequestMapping(path = "/edit.controller", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, @RequestParam(name = "artId") Integer articleId,
			@RequestParam(name = "userid") String userid, @RequestParam(name = "typeSelect") Integer typeId, Model m)
			throws SQLException {

		articleService.articleEdit(title, content, articleId, userid, typeId);
		m.addAttribute("artBean", articleService.showArticleById(articleId));

		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/newArticle.controller", method = RequestMethod.POST)
	public String newArticleBackend(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, @RequestParam(name = "typeSelect") Integer typeId,
			Model m) throws SQLException {
		String userid = "Admin";
		Article article = articleService.newArticle(title, typeId, content, userid);
		Integer id = article.getArtId();
		m.addAttribute("artBean", articleService.showArticleById(id));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/delete.controller", method = RequestMethod.POST) // 要把方法改成前台刪除方式
	public List<Article> Delete(@RequestParam(name = "artId") Integer articleId, Model m) {
		articleService.deleteArticleByAdmin(articleId);
		List<Article> artList = articleService.showAllArticles();
		return artList;

	}

	

	

}
