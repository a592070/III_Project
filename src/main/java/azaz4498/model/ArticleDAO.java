package azaz4498.model;

import java.io.FileInputStream;
import java.io.IOException;
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
		
		
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article Order by ART_ID",
				Article.class);
		List<Article> list = query.list();
		return list;
	}

	// 顯示當前文章(by Id)
	public List<Article> showArticleById(Integer articleId) throws SQLException {
		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_ID=?1",
				Article.class);
		query.setParameter(1, articleId);
		List<Article> list = query.list();
		return list;
	}

	// 依類型顯示文章
	public List<Article> showArticlesByType(Integer typeId) throws SQLException {

		Query<Article> query = sessionFactory.getCurrentSession()
				.createQuery("From Article where ART_TYPE_ID=?1 Order by ART_ID", Article.class);
		query.setParameter(1, typeId);
		List<Article> list = query.list();
		return list;

	}

	// 新增文章
	public void newArticle(String title, Integer typeId, String content, String userId) throws SQLException {
		Article article = new Article();
		ArticleType type = new ArticleType();
		article.setArtTitle(title);
		article.setArtContent(content);
		article.setArtUserId(userId);
		article.setArtCreTime(new java.sql.Timestamp(new java.util.Date().getTime()));
		article.setArtCommNum(0);
		article.setArtView(0);
		type.setTypeId(typeId);
		article.setArticleType(type);
		sessionFactory.getCurrentSession().save(article);
		System.out.println("New article created !");

	}

	// 刪除文章
	public boolean deleteArticle(Integer articleId, String userid) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
			sessionFactory.getCurrentSession().delete(result);
			System.out.println("文章已刪除!");
			return true;
		}

		return false;

	}

	// 刪除文章(後台)
	public boolean deleteArticleByAdmin(Integer articleId) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		if (result != null) {
			sessionFactory.getCurrentSession().delete(result);
			System.out.println("文章已刪除!");
			return true;
		}

		return false;

	}

	// 編輯文章
	public Article articleEdit(String title, String content, Integer articleId, String userid, Integer typeId)
			throws SQLException {
		Article result = sessionFactory.getCurrentSession().get(Article.class, articleId);
		String op = result.getArtUserId();
		if (result != null && userid.equals(op)) {
			ArticleType articleType = sessionFactory.getCurrentSession().get(ArticleType.class, typeId);
			result.setArtContent(content);
			result.setArtTitle(title);
			result.setArticleType(articleType);
			sessionFactory.getCurrentSession().update(result);
		}
		return result;
	}

	// 查詢文章(依照Title)
//	public List<Article> searchByTitle(String keyword) {
//		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_TITLE LIKE ?1",
//				Article.class);
//		query.setParameter(1, "%" + keyword + "%");
//		List<Article> list = query.list();
//		return list;
//	}

	// 查詢文章(依照UserId)
//	public List<Article> searchByUserId(String keyword) {
//		Query<Article> query = sessionFactory.getCurrentSession().createQuery("From Article where ART_USERID LIKE ?1",
//				Article.class);
//		query.setParameter(1, "%" + keyword + "%");
//		List<Article> list = query.list();
//		return list;
//	}

	// 搜尋文章
	public List<Article> searchArticle(String keyword, Integer articleType) {
		if (articleType != null) {
			Query<Article> query = sessionFactory.getCurrentSession().createQuery(
					"From Article where (ART_USERID LIKE ?1 OR ART_TITLE LIKE?2) AND ART_TYPE_ID LIKE ?3",
					Article.class);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");
			query.setParameter(3, articleType);
			List<Article> list = query.list();
			return list;

		} else {
			Query<Article> query = sessionFactory.getCurrentSession()
					.createQuery("From Article where ART_USERID LIKE ?1 OR ART_TITLE LIKE?2", Article.class);
			query.setParameter(1, "%" + keyword + "%");
			query.setParameter(2, "%" + keyword + "%");
			List<Article> list = query.list();
			return list;
		}

	}

	// 改變文章status
	public Boolean switchStatus(Integer id) {
		Article result = sessionFactory.getCurrentSession().get(Article.class, id);
		if (result != null) {
			String currStatus = result.getArtStatus();
			if (currStatus.equals("enabled")) {
				result.setArtStatus("disabled");
				sessionFactory.getCurrentSession().update(result);
				return true;
			} else {
				result.setArtStatus("enabled");
				sessionFactory.getCurrentSession().update(result);
				return true;
			}
		}
		return false;

	}
	//img upload
	public void imgUpload(int articleId, String filePath,String fileName) throws IOException {
		Picture picture = new Picture();
		FileInputStream fis = new FileInputStream(filePath);
		byte[] b= new byte[fis.available()];
		picture.setPicFileName(fileName);
		picture.setRefId(articleId);
		picture.setPicUrl(filePath);
		fis.read(b);
		fis.close();
		picture.setPicture(b);
		
		
	}
}