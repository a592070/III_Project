package asx54630.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("f_hotelOrderDao")
public class F_HotelOrderDAO {

	private SessionFactory sessionFactory;
	
	@Autowired
	public F_HotelOrderDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Integer DBroom(BigDecimal sn) { //查詢H_OrderList中  某某飯店的雙人房被訂了幾間
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sum(DOUBLE_ROOM) from HotelOrder where ORDER_HOTEL_ID = ?0" ;
		Query<BigDecimal> query = session.createQuery(hql,BigDecimal.class);
		query.setParameter(0, sn);
		return query.uniqueResult().intValue();
	}
	
	public Integer QDroom(BigDecimal sn) { //查詢某某飯店的四人房被訂了幾間
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sum(QUADRUPLE_ROOM) from HotelOrder where ORDER_HOTEL_ID = ?0" ;
		Query<BigDecimal> query = session.createQuery(hql, BigDecimal.class);
		query.setParameter(0, sn);
		return query.uniqueResult().intValue();
	}
	
	public Integer getHotelDB(BigDecimal sn) { //查詢某某飯店總共有幾間雙人房
		Session session = sessionFactory.getCurrentSession();
		String hql = "select DBROOM_COUNT from Hotel WHERE SN = ?0";
		Query<BigDecimal> query = session.createQuery(hql, BigDecimal.class);
		query.setParameter(0, sn);
		return query.uniqueResult().intValue();
		
	}
	
	public Integer getHotelQD(BigDecimal sn) { //查詢某某飯店總共有幾間四人房
		Session session = sessionFactory.getCurrentSession();
		String hql = "select QDROOM_COUNT from Hotel WHERE SN = ?0";
		Query<BigDecimal> query = session.createQuery(hql, BigDecimal.class);
		query.setParameter(0, sn);
		return query.uniqueResult().intValue();
		
	}
	
	public boolean getDB_order_date(BigDecimal sn, Date datein,Date dateout) { //查詢欲下訂之時間是否重疊
		boolean flag = true;
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT CAST(count(*) as int) FROM HotelOrder WHERE ORDER_HOTEL_ID = "+sn+" and ((to_date('"+ datein +"','yyyy-mm-dd') BETWEEN CHECK_IN AND CHECK_OUT) OR (to_date('"+dateout+"','yyyy-mm-dd') BETWEEN CHECK_IN AND CHECK_OUT))";
		Query<Integer> query = session.createQuery(hql,Integer.class);
		
		int num = (int) query.uniqueResult();
		

		if(num >= 1) {
			flag = false;
		}
		return flag;
		
	}

}
