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

	public Article articleEdit(String title, String content, int articleId, String userid,int typeId) throws SQLException {
		return aDao.articleEdit(title, content, articleId, userid,typeId);
	}

	// 查詢文章(依照UserId)
	public List<Article> searchByUserId(String keyword) {
		return aDao.searchByUserId(keyword);
	}

	// 查詢文章(依照Title)
	public List<Article> searchByTitle(String keyword) {
		return aDao.searchByTitle(keyword);
	}
	public List<Article> searchArticles(String userid,String title, int typeId) {
		return aDao.searchArticle(userid,title,typeId);
	}
	//刪除文章
	public boolean deleteArticle (int articleId, String userid) {
		return aDao.deleteArticle(articleId, userid);
	}
	//刪除文章(後台)
	public boolean deleteArticleByAdmin (int articleId) {
		return aDao.deleteArticleByAdmin(articleId);
	}
	
}
