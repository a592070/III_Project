package azaz4498.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import azaz4498.model.Article;
import azaz4498.model.Comment;
import azaz4498.model.ForumPage;
import azaz4498.model.MultiComment;
import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;
import azaz4498.service.CommentService;
import azaz4498.service.MultiCommentService;
import azaz4498.service.PictureService;
import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;

@Controller
@Lazy
@SessionAttributes(names = { "artBean", "typeBean", "artList", "commentList","multiCommentMap" ,"recentArt", "recentArtPic",
		"typeCount","userBean","userName" })
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
	MultiCommentService multiCommentService;
	@Autowired
	AccountService accountService;
	@Autowired
	private ServletContext context;
	@Autowired
	private ForumPage forumPage;
	
	//新增文章
	@RequestMapping(path = "/newArticle",method = RequestMethod.GET)
	public String newArticle(HttpSession session,Model m) {
		AccountBean account = (AccountBean) m.getAttribute("userBean");
		
			m.addAttribute("userBean",account);
			return "azaz4498/newArticle_frontend";
		
	}
	
	//文章頁面
	@RequestMapping(path = {"/article/{artId}" ,"/typeSearch/article/{artId}"}, method = RequestMethod.GET)
	public String articlePreview(Model m, @PathVariable(name = "artId") Integer artId) throws SQLException {
		AccountBean account = (AccountBean) m.getAttribute("userBean");
		Article currArticle =articleService.showArticleById(artId);
		if (currArticle==null) {
			m.addAttribute("userBean", account);
			return "azaz4498/errorPage";
		}else if ((currArticle.getArtStatus()).equals("disabled")) {
			m.addAttribute("userBean", account);
			return "azaz4498/errorPage";
		}else {
			List<Article> recentArticles = articleService.showRecentArticles();
			List<Comment> commentList = commentService.showCommentsByArticle(artId);
			List<String> coverPicList = articleService.getCoverPicList(recentArticles);
			m.addAttribute("artBean",currArticle);
			m.addAttribute("commentList", commentList);
			m.addAttribute("recentArt", recentArticles);
			m.addAttribute("recentArtPic", coverPicList);
			m.addAttribute("typeCount", articleService.getTypeCount());
			m.addAttribute("userBean", account);
			return "azaz4498/articleDetail";
		}
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
		m.addAttribute("userBean",m.getAttribute("userBean"));

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
			m.addAttribute("userBean",m.getAttribute("userBean"));
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
			m.addAttribute("userBean",m.getAttribute("userBean"));

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
		m.addAttribute("userBean",m.getAttribute("userBean"));
		return "azaz4498/forum_typeSearch";
	}
	//編輯頁面
	@RequestMapping(path = "/edit/article/{artId}")
	public String EditPage(@PathVariable(name = "artId") Integer articleId, Model m) throws SQLException {
		AccountBean account = (AccountBean) m.getAttribute("userBean");
		m.addAttribute("userBean",account);
		m.addAttribute("artBean", articleService.showArticleById(articleId));
		return "azaz4498/editPage_frontend";
	}

	
	//編輯controller
	@RequestMapping(path = "/edit.controller", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "title") String title,
			@RequestParam(name = "content") String content, @RequestParam(name = "artId") Integer articleId,
			@RequestParam(name = "userId") String userid, @RequestParam(name = "typeSelect") Integer typeId, Model m)
			throws SQLException {
		AccountBean account = (AccountBean) m.getAttribute("userBean");
		articleService.articleEdit(title, content, articleId, account.getUserName(), typeId);
		m.addAttribute("artBean", articleService.showArticleById(articleId));

		return "redirect:/article/"+articleId;
	}
	
	//文章新增後跳轉文章頁面
	@RequestMapping(path = "/newArticle.controller", method = RequestMethod.POST)
	public String newArticleBackend(@RequestParam(name = "title") String title,
			@RequestParam(name = "content") String content, 
			@RequestParam(name = "typeSelect") Integer typeId,
			@RequestParam(name = "userId") String userid,
			Model m) throws SQLException {
		AccountBean account = (AccountBean) m.getAttribute("userBean");
		m.addAttribute("userBean",account);
		Article article = articleService.newArticle(title, typeId, content, account.getUserName());
		Integer id = article.getArtId();
		m.addAttribute("artBean", articleService.showArticleById(id));
		return "redirect:/article/"+id;
	}

	@RequestMapping(path = "/delete.controller", method = RequestMethod.POST) // 要把方法改成前台刪除方式
	public List<Article> Delete(@RequestParam(name = "artId") Integer articleId, Model m) {
		articleService.deleteArticleByAdmin(articleId);
		List<Article> artList = articleService.showAllArticles();
		return artList;

	}

}
