package azaz4498.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

@Lazy
public class ArticleDAO {
	@Autowired
	private SessionFactory sessionFactory;

	// 顯示文章列表
	public List<Article> showAllArticles() {
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article Order by ART_CRE_TIME DESC",
				Article.class);
		List<Article> list = query.list();
		return list;
	}

	// 顯示當前文章(by Id)
	public List<Article> showArticleById(int articleId) throws SQLException {
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_ID=?1",
				Article.class);
		query.setParameter(1, articleId);
		List<Article> list = query.list();
		return list;
	}

	// 依類型顯示文章
	public List<Article> showArticlesByType(int typeId) throws SQLException {
		if (typeId == 0) {
			Query<Article> query = sessionFactory.getCurrentSession()
					.createQuery("From Article  Order by ART_CRE_TIME DESC", Article.class);
			List<Article> list = query.list();
			return list;
		} else {
			Query<Article> query = sessionFactory.getCurrentSession()
					.createQuery("From Article where ART_TYPE_ID=?1 Order by ART_CRE_TIME DESC", Article.class);
			query.setParameter(1, typeId);
			List<Article> list = query.list();
			return list;

		}

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
		article.setArtPicUrl(null);
		type.setTypeId(typeId);
		article.setArticleType(type);
		sessionFactory.getCurrentSession().save(article);
		System.out.println("New article created !");

	}

	// 刪除文章
	public boolean deleteArticle(int articleId, String userid) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
			sessionFactory.getCurrentSession().delete(result);
			System.out.println("文章已刪除!");
			return true;
		}

		return false;

	}
	//刪除文章(後台)
	public boolean deleteArticleByAdmin(int articleId) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		if (result != null ) {
			sessionFactory.getCurrentSession().delete(result);
			System.out.println("文章已刪除!");
			return true;
		}

		return false;

	}

	// 編輯文章
	public Article articleEdit(String title, String content, int articleId, String userid,int typeId) throws SQLException {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
//			Query query = sessionFactory.getCurrentSession()
//					.createQuery("update  Article  a set a.artContent=?1, a.artTitle=?2  where  a.artId=?3");
			ArticleType articleType = sessionFactory.getCurrentSession().get(ArticleType.class, typeId);
			result.setArtContent(content);
			result.setArtTitle(title);
			result.setArticleType(articleType);
			sessionFactory.getCurrentSession().update(result);
//			query.setParameter(1, content);
//			query.setParameter(2, title);
//			query.setParameter(3, articleId);
//			query.executeUpdate();
		}
		return result;
	}

	// 查詢文章(依照Title)
	public List<Article> searchByTitle(String keyword) {
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_TITLE LIKE ?1",
				Article.class);
		query.setParameter(1, "%" + keyword + "%");
		List<Article> list = query.list();
		return list;
	}

	// 查詢文章(依照UserId)
	public List<Article> searchByUserId(String keyword) {
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_USERID LIKE ?1",
				Article.class);
		query.setParameter(1, "%" + keyword + "%");
		List<Article> list = query.list();
		return list;
	}
	
	public List<Article> searchArticle(String keyword){
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_USERID LIKE ?1 OR ART_TITLE LIKE?2",Article.class);
		query.setParameter(1, "%" + keyword + "%");
		query.setParameter(2, "%" + keyword + "%");
//		query.setParameter(2, "%" + title + "%");
//		query.setParameter(3, "%" + type + "%");
		List<Article> list = query.list();
		return list;
	}
}