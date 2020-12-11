package asx54630.model;

import java.math.BigDecimal;
import java.sql.Date;

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
	
	public int DBroom(BigDecimal sn) { //查詢H_OrderList中  某某飯店的雙人房被訂了幾間
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sum(DOUBLE_ROOM) from HotelOrder where ORDER_HOTEL_ID = ?0" ;
		Query<BigDecimal> query = session.createQuery(hql, BigDecimal.class);
		query.setParameter(0, "%" + sn + "%");
		return query.uniqueResult().intValue();
	}
	
	public int QDroom(BigDecimal sn) { //查詢某某飯店的四人房被訂了幾間
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sum(QUADRUPLE_ROOM) from HotelOrder where ORDER_HOTEL_ID = ?0" ;
		Query<Long> query = session.createQuery(hql, Long.class);
		query.setParameter(0, "%" + sn + "%");
		return query.uniqueResult().intValue();
	}
	
	public int getHotelDB(BigDecimal sn) { //查詢某某飯店總共有幾間雙人房
		Session session = sessionFactory.getCurrentSession();
		String hql = "select DBROOM_COUNT from Hotel WHERE SN = ?0";
		Query<Long> query = session.createQuery(hql, Long.class);
		query.setParameter(0, "%" + sn + "%");
		return query.uniqueResult().intValue();
		
	}
	
	public int getHotelQD(BigDecimal sn) { //查詢某某飯店總共有幾間四人房
		Session session = sessionFactory.getCurrentSession();
		String hql = "select QDROOM_COUNT from Hotel WHERE SN = ?0";
		Query<Long> query = session.createQuery(hql, Long.class);
		query.setParameter(0, "%" + sn + "%");
		return query.uniqueResult().intValue();
		
	}
	
	public boolean getDB_order_date(BigDecimal sn, Date datein,Date dateout) { //查詢欲下訂之時間是否重疊
		boolean flag = true;
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM HotelOrder WHERE hotel = ?0 and ((to_date(?1,'yyyy-mm-dd') BETWEEN CHECK_IN AND CHECK_OUT) OR (to_date(?2,'yyyy-mm-dd') BETWEEN CHECK_IN AND CHECK_OUT))";
		Query<HotelOrder> query = session.createQuery(hql, HotelOrder.class);
		query.setParameter(0, "%" + sn + "%");
		query.setParameter(1, "%" + datein + "%");
		query.setParameter(2, "%" + dateout + "%");
		
		if(query != null) {
			flag = false;
		}
		return flag;
		
	}

}
