package asx54630.model;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import asx54630.model.Hotel;

@Repository("hotelDao")
public class HotelDAO {

	private SessionFactory sessionFactory;
	
	@Autowired
	public HotelDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public Hotel hotelDetail(BigDecimal sn) { //查詢飯店詳細資料
		Session session = sessionFactory.getCurrentSession();
		return session.get(Hotel.class, sn);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public Hotel hotelHomePage(String account) { //查詢飯店業者擁有的資料
		Session session = sessionFactory.getCurrentSession();
		return session.get(Hotel.class, account);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<Hotel> selectAll(String name, String region, String type){ //查詢多筆
		Session session = sessionFactory.getCurrentSession();
		Query<Hotel> query = session.createQuery("From Hotel WHERE NAME like ?0 and REGION like ?1 and TYPE like ?2", Hotel.class);
		query.setParameter(0, "%" + name + "%");
		query.setParameter(1, "%" + region + "%");
		query.setParameter(2, "%" + type + "%");
		List<Hotel> list = query.list();
		return list;
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public Hotel insert(Hotel bean) { //新增
		Session session = sessionFactory.getCurrentSession();
		Hotel result = session.get(Hotel.class, bean.getSN());
		
		if (result == null) {
			session.save(bean);
			return bean;
		}
		return null;
	}

}