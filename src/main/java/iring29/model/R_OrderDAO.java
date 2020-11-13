package iring29.model;

import java.math.BigDecimal;
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
		String hql = "select count(order_id) from R_Order_VO";
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}

	public List<R_Order_VO> totaol_Rlist(int first, int count) {
		Query<R_Order_VO> query = sessionFactory.getCurrentSession()
				.createQuery("from R_Order_VO order by order_id", R_Order_VO.class);
		// 找第幾筆
		query.setFirstResult(first);
		// 從第幾筆開始count筆
		query.setMaxResults(count);
		return query.list();
	}

	// detail Order list
	public R_OrderList_VO Detail_OderList(BigDecimal id) {
		Query<R_OrderList_VO> query = sessionFactory.getCurrentSession()
				.createQuery("from R_OrderList_VO where id =?1", R_OrderList_VO.class);
		query.setParameter(1, id);
		return query.uniqueResult();
	}
	
	public String deleteOrder(BigDecimal r_sn) {
		R_Order_List rBean = sessionFactory.getCurrentSession().get(R_Order_List.class, r_sn);
		if(rBean != null) {
			sessionFactory.getCurrentSession().delete(rBean);
			return "刪除成功";
		}
		return "刪除失敗";
	}

}
