package asx54630.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("hotelOrderDao")
public class HotelOrderDAO {

	private SessionFactory sessionFactory;	
	
	public HotelOrderDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int getSize() { //初始資料總筆數
		String hql = "select count(SN_ORDER) from HotelOrder_VO";
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}
	
	public List<HotelOrder_VO> totalHotel(int first, int count) {
		Session session = sessionFactory.getCurrentSession();
		Query<HotelOrder_VO> query = session.createQuery("from HotelOrder_VO order by SN_ORDER", HotelOrder_VO.class);
		// 找第幾筆
		query.setFirstResult(first);
		// 從第幾筆開始count筆
		query.setMaxResults(count);
		return query.list();
	}
	
	
	public HotelOrder hotelDetail(BigDecimal sn) { //查詢單筆飯店詳細資料
		Session session = sessionFactory.getCurrentSession();
		return session.get(HotelOrder.class, sn);
	}
	

	public Hotel hotelHomePage(String account) { //查詢飯店業者擁有的資料
		Session session = sessionFactory.getCurrentSession();
		return session.get(Hotel.class, account);
	}
	

	public List<HotelOrder_VO> sort(int first, int count, String orderfiled, String order){ //查詢多筆
		Session session = sessionFactory.getCurrentSession();
		String hql = "From HotelOrder_VO order by "+ orderfiled +" "+ order ;

		Query<HotelOrder_VO> query = session.createQuery(hql, HotelOrder_VO.class);
		query.setFirstResult(first);
		query.setMaxResults(count);
		List<HotelOrder_VO> list = query.list();
		return list;
	}
	
	public HotelOrder update(BigDecimal sn,String Name,String Phone,BigDecimal Dbroom,BigDecimal Qdroom,Date Checkin,Date Checkout) { //修改
		Session session = sessionFactory.getCurrentSession();
		HotelOrder result = session.get(HotelOrder.class, sn);
		if(result != null) {
			result.setCLIENT_NAME(Name);
			result.setCLIENT_PHONE(Phone);
			result.setDOUBLE_ROOM(Dbroom);
			result.setQUADRUPLE_ROOM(Qdroom);
			result.setCHECK_IN(Checkin);
			result.setCHECK_OUT(Checkout);

		}
		return result;
	}
	
	public boolean delete(BigDecimal SN_ORDER) { //刪除
		Session session = sessionFactory.getCurrentSession();
		HotelOrder result = session.get(HotelOrder.class, SN_ORDER);
		if(result != null) {
			session.delete(result);
			return true;
		}
		return false;
		
	}
	
}
