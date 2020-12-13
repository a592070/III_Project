package azaz4498.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import azaz4498.model.Article;
import azaz4498.model.ArticleDAO;
import azaz4498.model.Comment;
import azaz4498.model.MultiComment;

@Transactional
public class ArticleService {
	@Autowired
	private ArticleDAO aDao;
	
	
	public Map<String, Integer> getTypeCount(){
		return aDao.getTypeCount();
	}
	
	public Integer getRecords() {
		return aDao.getRecords();
	}
	public Integer getTypeSearchRecord(Integer articleType) {
		return aDao.getTypeSearchRecords(articleType);
	}
	public Integer getSearchRecords(String keyword, Integer articleType) {
		return aDao.getSearchRecords(keyword, articleType);
	}
	//顯示最近文章
	public List<Article> showRecentArticles(){
		return aDao.getRecentPost();
	}
	//取得多層留言
	public Map<Integer, List<MultiComment>> getMultiCommentMap(List<Comment> commentList){
		return aDao.getMultiCommentMap(commentList);
	}
	//顯示文章列表(非禁用)(前台)
	public List<Article> showAvailableArticles(Integer index,Integer records){
		return aDao.showAvailableArticles(index, records);
	}
	//搜尋文章(前台)
	public List<Article> searchArticlesFrontend(String keyword, Integer articleType,Integer index,Integer records) {
		return aDao.searchArticleFrontend(keyword, articleType, index, records);
	}
	
	// 顯示文章列表
	public List<Article> showAllArticles() {
		return aDao.showAllArticles();
	}

	// 顯示當前文章(by Id)
	public Article showArticleById(Integer articleId) throws SQLException {
		return aDao.showArticleById(articleId);
	}

	// 依類型顯示文章
	public List<Article> showArticlesByType(Integer typeId,Integer index,Integer records) throws SQLException {
		return aDao.showArticlesByType(typeId, index,records);
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
	//搜尋文章
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

	// getCoverpic
	public List<String> getCoverPicList(List<Article> artList){
		return aDao.getCoverPicList(artList);
	}
	
}
