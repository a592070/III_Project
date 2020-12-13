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
		multiComment.setM_Date(new java.sql.Timestamp(new java.util.Date().getTime()));
		multiComment.setM_Content(content);
		multiComment.setM_UserId(userId);
		multiComment.setM_ComId(comId);
		sessionFactory.getCurrentSession().save(multiComment);
		return multiComment;
	}
	
	
}

