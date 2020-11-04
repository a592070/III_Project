package azaz4498.model;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class ArticleTypeDAO {
	private Session session;

	public ArticleTypeDAO(Session session) {
		this.session = session;
	}

	public ArticleTypeDAO() {

	}

	// 顯示類型依類型ID
	public List<ArticleType> showArticleType(int typeId) throws SQLException {
		Query<ArticleType> query = session.createQuery("From ArticleType Where TYPE_ID=?1", ArticleType.class);
		query.setParameter(1, typeId);
		List<ArticleType> list = query.list();
		return list;
	}
}
