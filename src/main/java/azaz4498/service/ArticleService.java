package azaz4498.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import azaz4498.model.Article;
import azaz4498.model.ArticleDAO;

@Service("articleService")
public class ArticleService {
	@Autowired
	private ArticleDAO aDao;

	// 顯示文章列表
	public List<Article> showAllArticles() {
		return aDao.showAllArticles();
	}

	// 顯示當前文章(by Id)
	public List<Article> showArticleById(int articleId) throws SQLException {
		return aDao.showArticleById(articleId);
	}

	// 依類型顯示文章
	public List<Article> showArticlesByType(int typeId) throws SQLException {
		return aDao.showArticlesByType(typeId);
	}

	// 新增文章
	public void newArticle(String title, int typeId, String content, String userId) throws SQLException {
		aDao.newArticle(title, typeId, content, userId);
	}

	public Article articleEdit(String title, String content, int articleId, String userid) throws SQLException {
		return aDao.articleEdit(title, content, articleId, userid);
	}

	// 查詢文章(依照UserId)
	public List<Article> searchByUserId(String keyword) {
		return aDao.searchByUserId(keyword);
	}

	// 查詢文章(依照Title)
	public List<Article> searchByTitle(String keyword) {
		return aDao.searchByTitle(keyword);
	}
}
