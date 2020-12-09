package asx54630.model;

import java.math.BigDecimal;

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
	
	public HotelOrder DBroom(BigDecimal sn) { //查詢H_OrderList中  某某飯店的雙人房被訂了幾間
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sum(DOUBLE_ROOM) from HotelOrder where ORDER_HOTEL_ID = ?0" ;
		Query<HotelOrder> query = session.createQuery(hql, HotelOrder.class);
		query.setParameter(0, "%" + sn + "%");
		return session.get(HotelOrder.class, sn);
	}
	
	public HotelOrder QDroom(BigDecimal sn) { //查詢某某飯店的四人房被訂了幾間
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sum(QUADRUPLE_ROOM) from HotelOrder where ORDER_HOTEL_ID = ?0" ;
		Query<HotelOrder> query = session.createQuery(hql, HotelOrder.class);
		query.setParameter(0, "%" + sn + "%");
		return session.get(HotelOrder.class, sn);
	}
	
	public int getHotelDB() { //初始資料總筆數
		String hql = "select sum(DBROOM_COUNT) from Hotel WHERE SN = ";
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}

}
