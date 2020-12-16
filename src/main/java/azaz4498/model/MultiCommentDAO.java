package azaz4498.model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

@Lazy
public class MultiCommentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public MultiCommentDAO() {
		
	}
	//獲取multi評論
	public List<MultiComment> getMultiCommentsByComId(int commentId) {
		Query<MultiComment> query = sessionFactory.getCurrentSession().createQuery("From MultiComment where MULTI_COM_COM_ID=?1 Order by MULTI_COM_DATE DESC",MultiComment.class);
		query.setParameter(1, commentId);
		List<MultiComment> multiComList = query.list();
		return multiComList;
	}
	//新增multi評論
	public MultiComment newMultiComment (String content, int comId,String userId) {
		MultiComment multiComment = new MultiComment();
		Comment comment = sessionFactory.getCurrentSession().get(Comment.class, comId);
		multiComment.setM_Date(new java.sql.Timestamp(new java.util.Date().getTime()));
		multiComment.setComment(comment);
		multiComment.setM_Content(content);
		multiComment.setM_UserId(userId);
		multiComment.setM_ComId(comId);
		sessionFactory.getCurrentSession().save(multiComment);
		return multiComment;
	}
	//刪除multi評論
	public boolean deleteMultiComment(int id, String userId) {
		MultiComment result =sessionFactory.getCurrentSession().get(MultiComment.class, id);
		String op = result.getM_UserId();
		if (result!=null && op.equals(userId)) {
			sessionFactory.getCurrentSession().delete(result);
			return true;
		}else {
			return false;
		}
		
		
	}
	//編輯
	public MultiComment editMultiComment(String content, int id,String userId) {
		MultiComment result = sessionFactory.getCurrentSession().get(MultiComment.class, id);
		String op =result.getM_UserId();
		if (result!=null && userId.equals(op)) {
			result.setM_Content(content);
			sessionFactory.getCurrentSession().save(result);
		}
		
		return result;
		
	}
	
	
}

