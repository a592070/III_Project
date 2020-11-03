package azaz4498.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("articleDao")
public class ArticleDAO {
	private Session session;

	@Autowired
	public ArticleDAO(Session session) {
		this.session = session;
	}

	// 顯示文章列表
	public List<Article> showAllArticles() {
		Query<Article> query = session.createQuery("From Article Order by ART_CRE_TIME DESC", Article.class);
		List<Article> list = query.list();
		return list;
	}

	// 顯示當前文章(by Id)
	public List<Article> showArticleById(int articleId) throws SQLException {
		Query<Article> query = session.createQuery("From Article where ART_ID=?1", Article.class);
		query.setParameter(1, articleId);
		List<Article> list = query.list();
		return list;
	}

	// 依類型顯示文章
	public List<Article> showArticlesByType(int typeId) throws SQLException {
		Query<Article> query = session.createQuery("From Article where ART_TYPE_ID=?1 Order by ART_CRE_TIME DESC",
				Article.class);
		query.setParameter(1, typeId);
		List<Article> list = query.list();
		return list;
	}

	// 新增文章
	public void newArticle(String title, int typeId, String content, String userId) throws SQLException {
		Article article = new Article();
		ArticleType type = new ArticleType();
		article.setArtTitle(title);
		article.setArtContent(content);
		article.setArtUserId(userId);
		article.setArtCreTime(new java.sql.Timestamp(new java.util.Date().getTime()));
		article.setArtCommNum(0);
		article.setArtView(0);
		article.setArtPic(null);
		type.setTypeId(typeId);
		article.setArticleType(type);
		session.save(article);
		System.out.println("New article created !");

	}

	// 刪除文章
	public boolean deleteArticle(int articleId, String userid) {
		Article result = session.get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
			session.delete(result);
			System.out.println("文章已刪除!");
			return true;
		}

		return false;

	}

	// 編輯文章
	public Article articleEdit(String title, String content, int articleId, String userid) throws SQLException {
		Article result = session.get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
			Query<Article> query = session.createQuery(
					"update F_ARTICLE article set article.ART_CONTENT=?1,article.ART_TITLE=?2 where ART_ID=?3",
					Article.class);
			query.setParameter(1, content);
			query.setParameter(2, title);
			query.setParameter(3, articleId);
			query.executeUpdate();
		}
		return result;
	}

	// 查詢文章(依照Title)
	public List<Article> searchByTitle(String keyword) {
		Query<Article> query = session.createQuery("From Article where ART_TITLE LIKE ?1", Article.class);
		query.setParameter(1, "%" + keyword + "%");
		List<Article> list = query.list();
		return list;
	}

	// 查詢文章(依照UserId)
	public List<Article> searchByUserId(String keyword) {
		Query<Article> query = session.createQuery("From Article where ART_USERID LIKE ?1", Article.class);
		query.setParameter(1, "%" + keyword + "%");
		List<Article> list = query.list();
		return list;
	}
}
