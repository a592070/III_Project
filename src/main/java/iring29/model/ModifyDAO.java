package iring29.model;

import java.math.BigDecimal;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;


public class ModifyDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public ModifyDAO() {
		
	}
	
	public ModifyDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

//	@Transactional(rollbackFor = {Throwable.class})
	// modify location
	public Restaurant R_Address(String address, String transportation, BigDecimal r_sn) {
		Restaurant result = sessionFactory.getCurrentSession().get(Restaurant.class, r_sn);
		if (result != null) {
			result.setAddress(address);
			result.setTransportation(transportation);
			return result;
		}
		return result;
	}

//	@Transactional(rollbackFor = {Throwable.class})
	// modify Type
	public Restaurant R_Type(String serviceinfo, String type, BigDecimal r_sn) {
		Restaurant result = sessionFactory.getCurrentSession().get(Restaurant.class, r_sn);
		if (result != null) {
			result.setServiceinfo(serviceinfo);
			result.setType(type);
			return result;
		} 
		return result;
	}
	
//	@Transactional(rollbackFor = {Throwable.class})
	// modify Info
	public Restaurant R_Info(String opentime, String description, BigDecimal r_sn) {
		Restaurant result = sessionFactory.getCurrentSession().get(Restaurant.class, r_sn);
		if (result != null) {
			result.setOpentime(opentime);
			result.setDescription(description);
			return result;
		} 
		return result;

	}

//	@Transactional(rollbackFor = {Throwable.class})
	// modify Img
	public Restaurant R_Img(byte[] pic, BigDecimal r_sn) {
		Restaurant result = sessionFactory.getCurrentSession().get(Restaurant.class, r_sn);
		if (result != null) {
			result.setPic(pic);
			return result;
		}
		return result;
	}
		
}
