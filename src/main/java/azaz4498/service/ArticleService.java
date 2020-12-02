package azaz4498.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import azaz4498.model.Article;
import azaz4498.model.ArticleDAO;

@Transactional
public class ArticleService {
	@Autowired
	private ArticleDAO aDao;

	// 顯示文章列表
	public List<Article> showAllArticles() {
		return aDao.showAllArticles();
	}

	// 顯示當前文章(by Id)
	public List<Article> showArticleById(Integer articleId) throws SQLException {
		return aDao.showArticleById(articleId);
	}

	// 依類型顯示文章
	public List<Article> showArticlesByType(Integer typeId) throws SQLException {
		return aDao.showArticlesByType(typeId);
	}

	// 新增文章
	public Article newArticle(String title, Integer typeId, String content, String userId) throws SQLException {
		return aDao.newArticle(title, typeId, content, userId);
	}

	// 編輯文章
	public Article articleEdit(String title, String content, Integer articleId, String userid, Integer typeId)
			throws SQLException {
		return aDao.articleEdit(title, content, articleId, userid, typeId);
	}

	public List<Article> searchArticles(String keyword, Integer articleType) {
		return aDao.searchArticle(keyword, articleType);
	}

	// 刪除文章
	public boolean deleteArticle(Integer articleId, String userid) {
		return aDao.deleteArticle(articleId, userid);
	}

	// 刪除文章(後台)
	public boolean deleteArticleByAdmin(Integer articleId) {
		return aDao.deleteArticleByAdmin(articleId);
	}

	// 改變文章status(後台)
	public boolean switchStatus(Integer articleId) {
		return aDao.switchStatus(articleId);
	}

	// upload img
	
}
