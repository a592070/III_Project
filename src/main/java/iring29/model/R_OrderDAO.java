package iring29.model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

public class R_OrderDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public R_OrderDAO() {

	}

	public R_OrderDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;

	}

	// Total
	public int getListSize() {
		String hql = "select count(order_id) from R_Order_View";
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}

	public List<R_Order_View> totaol_Rlist(int first, int count) {
		Query<R_Order_View> query = sessionFactory.getCurrentSession()
				.createQuery("from R_Order_View order by order_id", R_Order_View.class);
		// 找第幾筆
		query.setFirstResult(first);
		// 從第幾筆開始count筆
		query.setMaxResults(count);
		return query.list();
	}
}
