package azaz4498.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

public class ArticleTypeDAO {
	@Autowired
	private SessionFactory sessionFactory;
	

	public ArticleTypeDAO() {

	}

	// 顯示類型依類型ID
	public List<ArticleType> showArticleType(int typeId) throws SQLException {
		Query<ArticleType> query = sessionFactory.getCurrentSession().createQuery("From ArticleType Where TYPE_ID=?1", ArticleType.class);
		query.setParameter(1, typeId);
		List<ArticleType> list = query.list();
		return list;
	}
	
	public List<ArticleType> showAllType(){
		Query<ArticleType> query = sessionFactory.getCurrentSession().createQuery("From ArticleType",ArticleType.class);
		List<ArticleType> list = query.list();
		return list;
	}
}
