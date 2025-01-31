package asx54630.model;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository("f_hotelDao")
public class F_HotelDAO {

	private SessionFactory sessionFactory;
	
	@Autowired
	public F_HotelDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public int getSize() { //初始資料總筆數
		String hql = "select count(SN) from HotelView WHERE STATUS = '啟用' ";
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}
	
	public List<Hotel> totalHotel(int first, int count) {
		Session session = sessionFactory.getCurrentSession();
		Query<Hotel> query = session.createQuery("from Hotel where STATUS = '啟用' order by SN", Hotel.class);
		// 找第幾筆
		query.setFirstResult(first);
		// 從第幾筆開始count筆
		query.setMaxResults(count);
		return query.list();
	}
	
	public int howMuchData(String name, String region, String type){ //查詢資料總筆數
		Session session = sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("Select count(SN) From HotelView WHERE NAME like ?0 and REGION like ?1 and TYPE like ?2 and STATUS = '啟用'", Long.class);
		query.setParameter(0, "%" + name + "%");
		query.setParameter(1, "%" + region + "%");
		query.setParameter(2, "%" + type + "%");
		return query.uniqueResult().intValue();
	}
	
	public List<Hotel> selectAll(int first, int count, String name, String region, String type){ //查詢多筆
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Hotel WHERE NAME like ?0 and REGION like ?1 and TYPE like ?2 and STATUS = '啟用' order by SN" ;

		Query<Hotel> query = session.createQuery(hql, Hotel.class);
		query.setParameter(0, "%" + name + "%");
		query.setParameter(1, "%" + region + "%");
		query.setParameter(2, "%" + type + "%");
		query.setFirstResult(first);
		query.setMaxResults(count);
		List<Hotel> list = query.list();
		return list;
	}
	
	public Hotel hotelDetail(BigDecimal sn) { //查詢單筆飯店詳細資料
		Session session = sessionFactory.getCurrentSession();
		return session.get(Hotel.class, sn);
	}
	
	public byte[] getPic(BigDecimal H_SN) {
		Query query = sessionFactory.getCurrentSession().createQuery("select PIC from Hotel where SN = ?0");
		query.setParameter(0, H_SN);
		byte[] pic = (byte[]) query.uniqueResult();
		return pic;
	}
	
}
