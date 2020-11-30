package iring29.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
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
		String hql = "select count(order_id) from R_OrderList_VO";
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}

	public List<R_OrderList_VO> totaol_Rlist(int first, int count, String orderField, String order) {
		String hql = "from R_OrderList_VO order by " + orderField + " " + order;
		Query<R_OrderList_VO> query = sessionFactory.getCurrentSession()
				.createQuery(hql, R_OrderList_VO.class);
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
	
	//update order
	public R_Order_List updateOrder(BigDecimal id, String cus_name, String cus_phone, Timestamp ts, BigDecimal customer_num) {
		R_Order_List result = sessionFactory.getCurrentSession().get(R_Order_List.class, id);
		if(result != null) {
			result.setCus_name(cus_name);
			result.setCus_phone(cus_phone);
			result.setBookt_time(ts);
			result.setCustomer_num(customer_num);
			return result;
		}
		return result;
	}
	
	//delete order
	public String deleteOrder(BigDecimal id) {
		R_Order_List rBean = sessionFactory.getCurrentSession().get(R_Order_List.class, id);
		if(rBean != null) {
			sessionFactory.getCurrentSession().delete(rBean);
			return "訂單刪除成功";
		}
		return "訂單刪除失敗";
	}

}
