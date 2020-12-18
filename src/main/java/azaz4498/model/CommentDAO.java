package azaz4498.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class CommentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	

	

	public CommentDAO() {

	}

	// 依文章顯示評論
	public List<Comment> showCommentsByArticle(int articleId) throws SQLException {
		
		Query<Comment> query =  sessionFactory.getCurrentSession().createQuery("From Comment where COM_ART_ID=?1 Order by COM_DATE DESC",
				Comment.class);
		query.setParameter(1, articleId);
		List<Comment> list = query.list();
		return list;
	}

	// 新增評論
	public Comment newComment(String content, int articleId, String userid) throws SQLException {
		Comment comment = new Comment();
		Article article = new Article();
		Article article2 =  sessionFactory.getCurrentSession().get(Article.class, articleId);
		int commNum = article2.getArtCommNum();
		article2.setArtCommNum(commNum + 1);
		comment.setComDate(new java.sql.Timestamp(new java.util.Date().getTime()));
		comment.setComContent(content);
		comment.setComUserId(userid);
		article.setArtId(articleId);
		comment.setArticle(article);
		 sessionFactory.getCurrentSession().save(comment);
		 sessionFactory.getCurrentSession().save(article2);
		 return comment;
	}

	// 刪除評論
	public boolean deleteComment(int commentId, String userid) {
		Comment result =  sessionFactory.getCurrentSession().get(Comment.class, commentId);
		String op = result.getComUserId();
		if (result != null && op.equals(userid)) {
			Article article = result.getArticle();
			int articleId = article.getArtId();
			Article article2 =  sessionFactory.getCurrentSession().get(Article.class, articleId);
			int commNum = article2.getArtCommNum();
			article2.setArtCommNum(commNum - 1);
			result.getArticle().getComments().remove(result);
			result.setArticle(null);
			 sessionFactory.getCurrentSession().save(article2);
			 sessionFactory.getCurrentSession().delete(result);
			return true;
		}
		return false;
	}

	// 編輯評論
	public Comment commentEdit(String content, int commentId, String userid) throws SQLException {
		Comment result =  sessionFactory.getCurrentSession().get(Comment.class, commentId);
		String op = result.getComUserId();
		if (result != null && userid.equals(op)) {
			result.setComContent(content);
			sessionFactory.getCurrentSession().update(result);
			
		}
		return result;

	}

}