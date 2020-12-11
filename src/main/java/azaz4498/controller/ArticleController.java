package azaz4498.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import azaz4498.model.Article;
import azaz4498.model.Comment;
import azaz4498.model.ForumPage;
import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;
import azaz4498.service.CommentService;
import azaz4498.service.PictureService;

@Controller
@Lazy
@SessionAttributes(names = { "artBean", "typeBean", "artList", "commentList", "recentArt", "recentArtPic",
		"typeCount" })
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
	CommentService commentService;
	@Autowired
	private ServletContext context;
	@Autowired
	private ForumPage forumPage;
	
	@RequestMapping(path = "/newArticle",method = RequestMethod.GET)
	public String newArticle() {
		return "azaz4498/newArticle_frontend";
	}
	
	
	@RequestMapping(path = {"/article/{artId}" ,"/typeSearch/article/{artId}"}, method = RequestMethod.GET)
	public String articlePreview(Model m, @PathVariable(name = "artId") Integer artId) throws SQLException {
		List<Article> recentArticles = articleService.showRecentArticles();
		List<Comment> commentList = commentService.showCommentsByArticle(artId);
		List<String> coverPicList = articleService.getCoverPicList(recentArticles);
		m.addAttribute("artList", articleService.showArticleById(artId));
		m.addAttribute("commentList", commentList);
		m.addAttribute("recentArt", recentArticles);
		m.addAttribute("recentArtPic", coverPicList);
		m.addAttribute("typeCount", articleService.getTypeCount());
		return "azaz4498/articleDetail";

	}

	// 文章列表
	@RequestMapping(path = "/forum_index", method = RequestMethod.GET, produces = { "application/json; charset=UTF-8" })
	public String showArticles(Model m, @RequestParam(value = "currPage", defaultValue = "1") Integer currPage) {
		forumPage.setCurrentPage(currPage);
		forumPage.setTotalCount(articleService.getRecords());
		Integer records = forumPage.getPageSize();
		Integer totalPage = forumPage.getTotalPageCount();
		Integer index = (currPage - 1) * records;
		List<Article> artList = articleService.showAvailableArticles(index, records);
		List<String> picList = articleService.getCoverPicList(artList);
		m.addAttribute("list", artList);
		m.addAttribute("picList", picList);
		m.addAttribute("totalPages", totalPage);
		m.addAttribute("currPage", currPage);

		return "azaz4498/forum";
	}

	// 換頁用
	@RequestMapping(path = "/Article.pagincontroller.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public String ArticlePagin(Model m, @RequestParam(value = "currPage", defaultValue = "1") Integer currPage,
			@RequestParam(value = "typeId", required = false) Integer articleType) throws SQLException {
		forumPage.setCurrentPage(currPage);
		if (articleType!=null) {
			forumPage.setTotalCount(articleService.getTypeSearchRecord(articleType));
			Integer records = forumPage.getPageSize();
			Integer totalPage = forumPage.getTotalPageCount();
			Integer index = (currPage - 1) * records;
			List<Article> artList = articleService.showArticlesByType(articleType, index, records);
			List<String> picList = articleService.getCoverPicList(artList);
			m.addAttribute("list", artList);
			m.addAttribute("picList", picList);
			m.addAttribute("totalPages", totalPage);
			m.addAttribute("currPage", currPage);
			return "azaz4498/articleGrid_type";
		} else {

			forumPage.setTotalCount(articleService.getRecords());
			Integer records = forumPage.getPageSize();
			Integer totalPage = forumPage.getTotalPageCount();
			Integer index = (currPage - 1) * records;
			List<Article> artList = articleService.showAvailableArticles(index, records);
			List<String> picList = articleService.getCoverPicList(artList);
			m.addAttribute("list", artList);
			m.addAttribute("picList", picList);
			m.addAttribute("totalPages", totalPage);
			m.addAttribute("currPage", currPage);

			return "azaz4498/articleGrid";
		}
	}

	// 類別顯示
	@RequestMapping(path = "/typeSearch/{articleType}", method = RequestMethod.GET)
	public String typeSearch(@PathVariable(name = "articleType") Integer typeId, Model m,
			@RequestParam(value = "currPage", defaultValue = "1") Integer currPage) throws SQLException {
		forumPage.setCurrentPage(currPage);
		forumPage.setTotalCount(articleService.getTypeSearchRecord(typeId));
		Integer records = forumPage.getPageSize();
		Integer totalPage = forumPage.getTotalPageCount();
		Integer index = (currPage - 1) * records;
		List<Article> artList = articleService.showArticlesByType(typeId, index, records);
		List<String> picList = articleService.getCoverPicList(artList);
		m.addAttribute("list", artList);
		m.addAttribute("picList", picList);
		m.addAttribute("totalPages", totalPage);
		m.addAttribute("currPage", currPage);
		return "azaz4498/forum_typeSearch";
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
