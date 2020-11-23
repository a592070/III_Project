package asx54630.model;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository("hotelDao")
public class HotelDAO {

	private SessionFactory sessionFactory;
	
	@Autowired
	public HotelDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	public Hotel hotelDetail(BigDecimal sn) { //查詢飯店詳細資料
		Session session = sessionFactory.getCurrentSession();
		return session.get(Hotel.class, sn);
	}
	

	public Hotel hotelHomePage(String account) { //查詢飯店業者擁有的資料
		Session session = sessionFactory.getCurrentSession();
		return session.get(Hotel.class, account);
	}
	

	public List<HotelView> selectAll(String name, String region, String type){ //查詢多筆
		Session session = sessionFactory.getCurrentSession();
		Query<HotelView> query = session.createQuery("From HotelView WHERE NAME like ?0 and REGION like ?1 and TYPE like ?2", HotelView.class);
		query.setParameter(0, "%" + name + "%");
		query.setParameter(1, "%" + region + "%");
		query.setParameter(2, "%" + type + "%");
		List<HotelView> list = query.list();
		return list;
	}
	
	public List<Hotel> sort(String orderfiled ,String name, String region, String type ,String order){ //排序
		Session session = sessionFactory.getCurrentSession();
		Query<Hotel> query = session.createQuery("From Hotel WHERE NAME like ?0 and REGION like ?1 and TYPE like ?2 order by "+ orderfiled +" "+ order , Hotel.class);
		query.setParameter(0, "%" + name + "%");
		query.setParameter(1, "%" + region + "%");
		query.setParameter(2, "%" + type + "%");
		List<Hotel> list = query.list();
		return list;
	}
	

	public Hotel insert(Hotel bean) { //新增
		Session session = sessionFactory.getCurrentSession();
		Hotel result = session.get(Hotel.class, bean.getSN());
		
		if (result == null) {
			session.save(bean);
			return bean;
		}
		return null;
	}
	
	public Hotel update(BigDecimal sn,String Name,String Region,String Address,String Tel,BigDecimal Dbroom,BigDecimal Qdroom,String Description,String Opentime,String Type) { //修改
		Session session = sessionFactory.getCurrentSession();
		Hotel result = session.get(Hotel.class, sn);
		if(result != null) {
			result.setNAME(Name);
			result.setREGION(Region);
			result.setADDRESS(Address);
			result.setTEL(Tel);
			result.setDOUBLE_ROOM(Dbroom);
			result.setQUADRUPLE_ROOM(Qdroom);
			result.setDESCRIPTION(Description);
			result.setOPENTIME(Opentime);
			result.setTYPE(Type);
		}
		return result;
	}
	
	public Hotel updateStatus(BigDecimal sn,String Status) { //修改狀態
		Session session = sessionFactory.getCurrentSession();
		Hotel result = session.get(Hotel.class, sn);
		String str1 = new String("啟用");
		if(result != null) {
			if(Status.equals(str1)) {				
				result.setSTATUS("禁用");
			}else {
				result.setSTATUS("啟用");
			}
		}
		return result;
	}
	
	public boolean delete(BigDecimal sn) { //刪除
		Session session = sessionFactory.getCurrentSession();
		Hotel result = session.get(Hotel.class, sn);
		if(result != null) {
			session.delete(result);
			return true;
		}
		return false;
		
	}

}